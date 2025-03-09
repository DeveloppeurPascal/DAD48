# 20220415 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* mise à niveau .gitignore pour ne plus ignorer les éléments graphiques et sonores du jeu (tout avoir sur le dépôt en dehors des certificats de signature)
* mise à niveau du projet de Delphi 10.4.2 vers 11.1 (automatique, mais quand même)
* mise à niveau des SDK+bibliothèques utilisées pour les compilations Android du jeu
* ajout de la cible MacOS ARM apparue en 11.0 Alexandria
* mise à jour des informations de version pour toutes les plateformes
* ajout de ITSAppUsesNonExemptEncryption=false sur les cibles macOS de production
* ajout des fichiers manquants pour le déploiement sur la nouvelle plateforme macOS ARM
* correction : masquage de la disquette (sauvegarde de l'écran de fin de partie) sur iOS
* mise à jour des crédits du jeu (copyright sons, musique)
* remplacement de "Olf Software" par "Gamolf" dans les source, écrans et dossiers de stockage
* correction : désactivation de la spécificité macOS pour les graphismes de sprites remplacés par des blocs de couleur suite à un bogue d'affichage FMX
* sur Mac Intel, on reste avec les blocs de couleur, ne sachant pas si Metal est disponible
* sur Mac ARM, forcément récent, on passe par la librairie Metal pour l'affichage
* sur iOS on passe aussi par la librairie Metal pour l'affichage
* création des icones du jeu
* mise en place des icones du jeu
* mise en place des splash screen du jeu
* ajout d'une option "déplacement continu" booléenne (par défaut à true si interface tactile à true) dans les paramètres de configuration du jeu
* traitement du déplacement continu : les touches du clavier sont utilisées pour des déplacements case par case, les boutons flèches activés sur interfaces tactiles sont gérés soit en case par case soit (par défaut) en continu jusqu'à ce qu'ils soient relachés

* compiler et déployer la version Windows 32 (Itch) à jour
* compiler et déployer la version Windows 64 (Microsoft + Itch) à jour
* compiler et déployer la version Mac Intel (Itch) à jour
* compiler et déployer la version Mac ARM (Itch) à jour
* compiler et déployer la version Android 32 (Itch + Amazon) à jour
* compiler et déployer la version Android 64 (Play Store) à jour

* créer fiche projet chez Google
* soumettre projet Android chez Google

* créer fiche projet chez Amazon
* soumettre projet Android chez Amazon

* créer fiche projet chez Apple
* compiler et déployer la version Mac ARM (Apple) à jour
