# Jeu-de-dame
## TP iOS N°2
Le but est de réaliser une application iPad (mode paysage uniquement) permettant de jouer au jeu de dames.
L’application aura donc un seul écran avec quelques informations (bouton start, indication de la couleur qui doit jouer, nombre de tour) et principalement le plateau de jeu.
Le composant graphique UICollectionView est donc tout indiqué pour l’affichage du plateau. Apple propose un guide (que vous prendrez le temps de lire) sur les concepts et l’utilisation de ce composant. Un étendu des fonctionnalités de ce composant est visible dans l’application Photos de l’iPad (“pinch” avec deux doigt sur un album).
Un élément de la grille pourra donc avoir plusieurs état : fond clair / pion blanc, fond clair / pion noir, fond foncé / pion blanc...
L’attribut cornerRadius de la classe UILayer (une UIView est composée d’un UILayer) facilitera le dessin d’un cercle rempli. Pour le fond, vous pourrez utiliser une UIImageView et des images de bois que vous intégrerez au projet.
Rappel: le fonctionnement du composant CollectionView étant très proche de celui de la UITableView (projet “master / details”), réouvrir un projet de ce type et y placer des points d’arrêts dans le code du master peut aider à la comprehension des mécanisme “dataSource/delegate”.
Vous avez un accès illimité à la documentation qui vous permettra de trouver comment réaliser cette application. Attention tout de même à ne pas partir d’un exemple (car ceci n’est pas recommandé par Apple).
