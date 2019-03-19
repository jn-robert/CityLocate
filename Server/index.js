const express = require('express');
const path = require('path');
const app = express();
const server = require('http').Server(app);
const mysql = require('mysql');
const socket = require("socket.io");
const con = mysql.createConnection({
    host: 'localhost',
    database: 'cityLocate',
    user: 'root',
    port: '3306',
    password: '',
});

con.connect((err) => {
    if (err) {
        console.log('Error connecting to Db');
        return;
    }
    console.log('Connection established');
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../Client/Home.html'));
});

app.get('/add', (req, res) => {
    res.sendFile(path.join(__dirname, '../Client/Add.html'));
});

let listener = socket.listen(server, {log: false});

let tab;
let coordServ = [];
let coordRecu = [];
let score = 0;
let D = 0.001;
let temp = 0;

function start(socket) {

    socket.on('Start', function () {
        con.query('SELECT * FROM location', (err, rows) => {
            if (err) throw err;

            tab = rows;
            tab = shuffle(tab);

            if (tab.length > 10) {
                let tmpTab = [];
                for (let x = 0; x < 10; x++) {
                    tmpTab.push(tab[x]);
                }
                tab = tmpTab;
            }

            getCoordBdd();

            socket.emit('Partie', {
                tab: tab
            });
        })
    });

    socket.on('clicMap', (data) => {
        let coord = [];
        coord.push(data.latitude);
        coord.push(data.longitude);
        coordRecu.push(coord);
        calculScore();
        temp = data.temp;
    });

    socket.on('End', function () {

    });

    socket.on('Login', (data) => {
        let dataUser = [];
        con.query('SELECT * FROM user', (err, rows) => {
            if (err) throw err;
            dataUser = rows;

            for (let x = 0; x < dataUser.length; x++) {
                if (data.dataUser[0] === dataUser[x].pseudo && data.dataUser[1] === dataUser[x].mdp) {
                    socket.emit('LoginVerif', {
                        token: data.dataUser[2]
                    });
                    break
                }
                else if (x + 1 === dataUser.length) {
                    socket.emit('BadLogin', {
                        token: data.dataUser[2]
                    });
                }
            }
        });
    });

    socket.on('NewData', (data) => {
        let sql = "INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL,";
        let valueSql = " '"+data.newPlace[0]+"','"+data.newPlace[1]+"','"+data.newPlace[2]+"','"+data.newPlace[3]+"'";
        let cmd = sql + valueSql + ");";
        con.query(cmd, function (err, rows) {
            if (err) throw err;
        });
    });


}

function calculScore() {
    score = 0;
    let coef = 0;

    if (temp < 2) {
        coef = 4;
    }
    else if (temp < 5) {
        coef = 2
    }

    for (let x = 0; x < coordRecu.length; x++) {
        let distance = 0;
        distance = Math.sqrt(Math.pow((coordServ[x][0] - coordRecu[x][0]), 2) + Math.pow((coordServ[x][1] - coordRecu[x][1]), 2));
        if (distance < D) {
            score += 5 * coef;
        }
        else if (distance < D * 2) {
            score += 3 * coef;
        }
        else if (distance < D * 3) {
            score += coef;
        }
    }
    console.log(score);
}

function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }

    return array;
}

function getCoordBdd() {
    coordServ = [];
    coordRecu = [];
    for (let x = 0; x < tab.length; x++) {
        let coord = [];
        coord.push(tab[x].latitude);
        coord.push(tab[x].longitude);
        coordServ.push(coord);
    }
}

listener.sockets.on('connection', function (socket) {
    start(socket);
});

server.listen(8888);