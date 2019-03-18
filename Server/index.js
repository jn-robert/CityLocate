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

let listener = socket.listen(server, {log: false});


let position = [];
let tab;
let distance = 1;


function start(socket) {
    socket.on('Start', function () {
        con.query('SELECT * FROM location', (err, rows) => {
            if (err) throw err;

            tab = rows;
            socket.emit('Partie', {
                tab: rows
            });
        })
    });

    socket.on('clicMap', (data) => {
        console.log(data.latitude);
        console.log(data.longitude);
    });

    socket.on('End', function () {
       calculScore();
    });


}

function calculScore() {
    for (let x = 0; x < tab.length; x++){
    }
}

listener.sockets.on('connection', function (socket) {
    start(socket);
});
server.listen(8888);