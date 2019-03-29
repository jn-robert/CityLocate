CREATE TABLE location(
 id INT AUTO_INCREMENT ,
 titre VARCHAR(20),
 lien VARCHAR(100),
 latitude FLOAT(10,7),
 longitude FLOAT(10,7),
 PRIMARY KEY(id)
);

CREATE TABLE user(
 id INT AUTO_INCREMENT,
 pseudo VARCHAR(20),
 mdp VARCHAR(20),
 PRIMARY KEY(id)
);

CREATE TABLE score(
 id INT AUTO_INCREMENT,
 nbScore FLOAT(10,2),
 pseudo VARCHAR(20),
 PRIMARY KEY(id)
);


INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Iut Belfort', 'http://actu.univ-fcomte.fr/sites/default/files/batiment-iut-90-0111.jpg', '47.6437703', '6.8384994');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'La Poudrière', 'https://www.jds.fr/medias/image/la-poudriere-rockhatry-belfort-7378-600-600-F.jpg', '47.6373541', '6.863235');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Gare de Belfort', 'http://christophe.lachenal.free.fr/Images/belfort_gare01.jpg', '47.6482631', '6.789449');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Pathé Belfort', 'https://s3-media2.fl.yelpcdn.com/bphoto/xkTvoHx73jr_5RrjzaZZPg/o.jpg', '47.6301481', '6.8599163');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Marché Fréry', 'https://cdn.radiofrance.fr/s3/cruiser-production/2015/02/7f378111-aacf-11e4-99ec-005056a87fa3/860_bandeau-marche-frery.jpg', '47.6406143', '6.8600855');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'La Maison du Peuple', 'http://mw2.google.com/mw-panoramio/photos/medium/37864991.jpg', '47.6414955', '6.8496956');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Gymnase le phare', 'https://sport.belfort.fr/fileadmin/_processed_/9/d/csm_le_phare_ffc58ae2c8.jpg', '47.6387845', '6.8494154');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'GE', 'https://cdn.radiofrance.fr/s3/cruiser-production/2014/06/a342b726-fad1-11e3-a580-005056a87fa3/870x489_gebelfort.jpg', '47.6510764', '6.8396309');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Stade Serzian', 'http://178.33.229.10/plesk-site-preview/www.rcstrasbourgalsace.fr/178.33.229.10/wp-content/uploads/2016/05/bandeau_sports_stade_serzian.jpg', '47.6539297', '6.8564977');
INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'Patinoire', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Patinoire_Belfort_Int%C3%A9rieur.JPG/1200px-Patinoire_Belfort_Int%C3%A9rieur.JPG', '47.6315812', '6.8335837');
INSERT INTO `user` (`id`, `pseudo`, `mdp`) VALUES (NULL, 'test', 'test'), (NULL, 'admin', 'admin');




