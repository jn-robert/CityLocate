CREATE TABLE location(
 id INT AUTO_INCREMENT ,
 titre VARCHAR(20),
 lien VARCHAR(100),
 latitude INT,
 longitude INT,
 PRIMARY KEY(id)
);

INSERT INTO `location` (`id`, `titre`, `lien`, `latitude`, `longitude`) VALUES (NULL, 'La Poudrière', 'https://www.jds.fr/medias/image/la-poudriere-rockhatry-belfort-7378-600-600-F.jpg', '47.6373541', '6.863235');