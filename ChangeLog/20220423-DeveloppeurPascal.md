# 20220423 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* test jeu pour revoir état des erreurs visuelles (Mac
* désactivation de Metal
* désactivation de l'affichage en blocs de couleurs pour Mac intel (hors Metal)
* remplacer les FillRect par des DrawBitmap pour que ça fonctionne sur toutes les plateformes
=> ne passe pas non plus (provient probablement de la récupération du TRectangle.Fill)
* Tester la librairie SKIA pour voir s'il y a un impact sur les défauts visuels constatés et la vitesse : https://github.com/skia4delphi/skia4delphi
* installation Skia4Delphi sur la VM
* activation de Skia sur le projet
* ajout de Skia en remplacement du moteur graphique de FireMonkey sur les TCanvas
* tests du programme sur les différentes plateformes
* Bogue sous Windows : un cadre  apparaît sur l'écran des crédits lors du premier affichage (contour du TVertScrollbox), probablement lié au resize et stretch des différents éléments de l'écran (qui ne serait pas appliqué à tout d'un coup)
* modification du dessin de l'icone (retrait zone grise transparente et de la pièce)
* modification de la valeur par défaut de l'option de configuration "InterfaceTactileOnOff" pour prendre en charge les appareils tactiles qui ne seraient pas de l'iOS ou de l'Android
* adapter les PNG des icones en retirant la couche Alpha en applatissant les images depuis Photoshop
* création du bouton "doigt" et de son image
* ajout de l'option "InterfaceTactileOnOff" dans l'écran de configuration du jeu
* mise à jour du texte des "crédits du jeu"
* le zoom / dézoom en phase de jeu se déclenche dès qu'on appuit sur les boutons (onMouseDown à la place de onClick)

* compilation de déploiement du projet pour Windows 32 => Itch, Gumroad
* compilation de déploiement du projet pour Windows 64 => Itch, Gumroad
* compilation de déploiement du projet pour Mac Intel => Itch, Gumroad
* compilation de déploiement du projet pour Mac ARM => Itch, Gumroad
* compilation de déploiement du projet pour Android 32 => Itch, Gumroad, Amazon Appstore
* compilation de déploiement du projet pour Android => Google Play
* compilation de déploiement du projet pour iOS => Apple App Store
* compilation de déploiement du projet pour Mac ARM+Intel => Apple Mac App Store
* soumettre la nouvelle version des installeurs sur Google Play
* soumettre la nouvelle version des installeurs sur Amazon Appstore
* soumettre la nouvelle version des installeurs sur Apple

-----

infos version du 23 avril 2022 pour les stores :

* Changement de la librairie graphique devant améliorer la qualité et la vitesse d'affichage.
* Nouvelle option dans les paramètres pour activer / masquer les boutons de déplacement du joueur sur les appareils tactiles. Si vous utilisez un clavier bluetooth vous devriez pouvoir jouer avec et masquer les boutons à l'écran.
* Diverses modifications techniques.
