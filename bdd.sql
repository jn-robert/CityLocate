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
INSERT INTO `user` (`id`, `pseudo`, `mdp`) VALUES (NULL, 'test', 'test'), (NULL, 'admin', 'admin');




