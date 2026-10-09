# Guide du site Atelier Facette

> Pour comprendre comment le site est construit et apprendre à le faire évoluer.

## 1. Voir le site

Double-clique sur `index.html` : il s'ouvre dans ton navigateur, directement depuis ton PC. Pas besoin d'Internet ni de serveur.

Pour voir la version téléphone sur l'ordinateur : dans Firefox, `Ctrl+Maj+M` (mode "vue adaptative"), puis choisis un modèle de téléphone en haut.

## 2. Comment c'est rangé

```
site/
├── index.html            Accueil : titre, diaporama, chiffres clés
├── beton-cire-resine.html Spécialité : avantages, nuancier, pièces
├── services.html         Les 6 services
├── realisations.html     Avant / après et avis clients
├── methode.html          Les 5 étapes et les questions fréquentes
├── a-propos.html         Parcours, chiffres clés, zone d'intervention
├── contact.html          Coordonnées et formulaire de devis
├── mentions-legales.html Page obligatoire, à compléter après l'ouverture du statut
├── robots.txt            Demande à Google de ne pas référencer le site (phase de test)
├── css/style.css         L'apparence : couleurs, polices, tailles, mise en page, animations
├── js/main.js            Les interactions : menu, diaporama, nuancier, avant/après, formulaire
├── fonts/                Les polices, hébergées sur le site
└── images/               Les photos, les teintes du nuancier, le logo
```

Un site web, c'est toujours ces trois couches :

| Fichier | Rôle | Comparaison chantier |
|---|---|---|
| HTML | Le contenu et la structure | Le gros œuvre : murs, pièces, portes |
| CSS | L'apparence | Les finitions : enduits, couleurs, béton ciré |
| JavaScript | Ce qui bouge et réagit | L'électricité : interrupteurs, automatismes |

**Bon à savoir :** le bandeau du haut (menu) et le pied de page sont recopiés dans chacune des 7 pages. Pour changer un lien du menu ou le téléphone du pied de page, il faut le faire partout. Le plus simple : `Ctrl+Maj+H` dans VS Code (remplacer dans tous les fichiers). Plus tard, on pourra utiliser un outil qui assemble les pages automatiquement pour éviter ces doublons.

## 3. Modifier un texte

1. Ouvre `index.html` dans VS Code
2. `Ctrl+F` et tape un bout du texte à changer
3. Modifie-le entre les balises, par exemple entre `<p>` et `</p>`
4. Enregistre (`Ctrl+S`) et recharge la page dans le navigateur (`F5`)

Ne touche pas aux balises elles-mêmes (`<p class="intro">`, `</div>`...). Si la page s'affiche bizarrement après une modification, `Ctrl+Z` dans VS Code pour annuler.

## 4. Ce qu'il reste à compléter

Cherche **"À COMPLÉTER"** (`Ctrl+Maj+F` dans VS Code) : chaque endroit est signalé dans le code.

- Téléphone et email
- Délai d'envoi du devis
- Nombre d'applicateurs formés
- Vraies photos : diaporama (format paysage, 2000 px de large minimum), avant/après de chantiers, portrait
- Avis clients réels, ou supprimer la section
- Mentions légales (après l'ouverture du statut)

## 5. Choix techniques (et pourquoi)

- **Site "statique"** : de simples fichiers, sans base de données ni WordPress. Rapide, gratuit à héberger, rien à mettre à jour, très peu de failles de sécurité.
- **Polices hébergées sur le site** plutôt que chargées chez Google : en Europe, appeler Google Fonts transmet l'adresse IP des visiteurs à Google, ce qui pose un problème vis-à-vis du RGPD.
- **Pas de cookies ni de statistiques** : pas de bandeau cookies à afficher.
- **Animations respectueuses** : elles se coupent si la personne a demandé à réduire les animations sur son téléphone ou son ordinateur.
- **Accessibilité** : vrais boutons, textes alternatifs sur les images, lien "Aller au contenu", contrastes vérifiés.

## 6. Prochaines étapes

1. **Mise en ligne de test** sur un hébergeur gratuit (Netlify ou Cloudflare Pages), à une adresse provisoire, invisible de Google
2. **Formulaire de devis** : le relier à un service gratuit d'envoi d'emails (Web3Forms ou Formspree) pour recevoir les demandes dans ta boîte mail
3. **Au lancement** (après statut et assurance décennale) : nom de domaine atelierfacette.fr, retirer le blocage Google (ligne `noindex` dans `index.html` et `robots.txt`), compléter les mentions légales
