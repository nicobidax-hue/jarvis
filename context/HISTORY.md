# Workspace History

> Journal chronologique de toutes les sessions et décisions importantes.
> Le plus récent en haut. Mis à jour automatiquement par Claude.
>
> **Comment ça marche :** Quand je lance la commande `/update` après une session importante, ou quand je raconte un changement significatif, Claude ajoute une entrée ici automatiquement. Je n'ai pas à écrire ce fichier manuellement.

---

## Points ouverts (repris des sessions du 08/10 au 12/10)

> Le détail de ces sessions est archivé dans `context/archives/HISTORY_2026-10-08_au_12.md` (non lu par `/prime`).

- Site Atelier Facette : trouver le réglage des notifications email des demandes dans Netlify ; choisir l'hébergement au lancement (OVH ou GitHub + Netlify avec domaine acheté à part) ; vraies photos (paysage, 2000 px minimum), téléphone et email, avis réels ; plus tard, dépôt GitHub dédié au site
- `/mails` : configurer Remote Control et tester la notification téléphone ; désabonnements restants (« Gérer les abonnements » de Gmail) ; réglages SportEasy (couper les mails de forum)
- Idée : une commande `/matin` qui enchaîne `/mails`, `/emploi suivi` et `/morning` avec un résumé unique
- CV : `livrables/taff/2026-10-08_cv-cibles/cv-support-informatique_doublon.docx` toujours à trier
- Clés d'API : sauvegarde dans un gestionnaire de mots de passe à confirmer par Nicolas

## 2026-10-14

### Prochaine session
- 15/10 : relance Bessière ; 16/10 : Fed Group et AGSE ; 19/10 : Sol pro, MO Ingénierie, O'TOMAT ; 20/10 : mairie de Villepreux (2e relance, par téléphone), DLSI, Telstar, Airwell ; 21/10 : FAB Group, Eiffage, Sovitrat, Equipages, Eberspächer (un seul rappel dans l'agenda)
- Central Pose : **appel abandonné** (décision du 14/10), la candidature spontanée part sans nom de contact au prochain `/emploi`
- Toujours en attente : espace candidat DLSI, visibilité du profil HelloWork, alertes mail France Travail
- Prochaine séance IA : séance 5, brancher Gmail dans n8n (lire les mails d'un libellé et les filtrer)
- Trieur de devis : mise à jour **reportée après les pages résine** (décision du 14/10), pour ne modifier le prompt qu'une fois. Ordre retenu : contenu technique des gammes fourni par Nicolas, page résine, formulaire (types de résine, `typesAvecSupport`), puis trieur mis à jour par Nicolas (gammes, champ `support` facultatif, règle « demande complète », proposition de visite une fois la demande complète) et fichier de prix par gamme
- Sovitrat : prévoir de pouvoir se présenter et décrire Batidax en espagnol si un entretien est proposé

### Séance IA 4 faite : les API sans jargon
- Notions : une API comme un comptoir de fournisseur (URL, paramètres `clé=valeur` après `?` et séparés par `&`, clé, réponse en JSON), objets `{ }` et listes `[ ]`, notation `siege.libelle_commune` et `[0]`, pagination (`per_page` 25 au maximum, `total_results`, `total_pages`), codes à traduire avec la documentation (NAF 43.33Z, tranches d'effectif INSEE : 12 = 20 à 49, 21 = 50 à 99, 22 = 100 à 199, NN = non renseigné), entreprise (SIREN) et établissements (SIRET)
- Exercice à la main dans le navigateur, puis workflow n8n « Séance 4 - API Annuaire » : déclencheur manuel, HTTP Request (GET), Split Out sur `results`, Edit Fields (entreprise, ville du siège, code effectif, adresse locale)
- Défi réussi seul : entreprises de revêtement de sols des Yvelines de 20 à 199 salariés, 6 trouvées. Erreurs corrigées par Nicolas : `yvelines` au lieu de `78`, séparateur point au lieu de virgule, `per_page` à 1. Leçons : l'API attend des codes exacts, les paramètres s'additionnent (ET), dépanner en remontant la chaîne nœud par nœud, la vue Table d'un paquet non découpé n'affiche que la première fiche
- Résultat utile pour l'emploi : 4 entreprises absentes de la liste de prospection du 09/10, dont Sols Jeux Entretien (Auteuil-le-Roi) et Qualitec (Louveciennes), sièges sur place, **ajoutées à la prospection BTP** (n° 16 et 17). Groupe Habitat (Le Perray, siège à Châteaudun) et Les Parqueteurs de France (La Celle-Saint-Cloud, siège à Argenteuil) écartées par Nicolas. Central Pose : siège à Brie-Comte-Robert, les décisions RH s'y prennent sans doute
- Document de parcours mis à jour (4 séances sur 24)

### Rangement des livrables : nouveau dossier `ia/`
- Incohérence repérée par Nicolas : les projets IA étaient rangés dans `applications/`. Nouveau dossier `livrables/ia/` (parcours IA, prompts, workflows n8n, démos clients), où ont été déplacés `2026-10-13_trieur-devis` et `2026-10-14_n8n`. `applications/` garde les scripts sans IA (`adapter-docx`, `envoi-candidatures`, `api-france-travail`), `sites-web/` ne change pas. Les chemins cités dans cet historique ont été mis à jour
- n8n arrêté avant le déplacement puis relancé depuis le nouveau dossier (`docker compose up -d`) : même volume de données, workflows conservés. Leçon : un dossier monté dans un conteneur ne se déplace pas pendant que le conteneur tourne
- README, CLAUDE.md et CONTEXT.md mis à jour

### Séance IA 3 faite : n8n installé avec Docker, premier workflow publié
- Choix de Nicolas : **n8n avec Docker** plutôt qu'avec Node.js, parce que c'est la méthode standard pour déployer chez un client. WSL installé par Nicolas en mode administrateur, puis redémarrage
- **Disque C: plein (0 Go libre)**, cause de l'échec de Docker. Supprimés avec l'accord de Nicolas : 8 copies d'une ISO Debian, 3 ISO Windows Server, 37 vieux installateurs (environ 50 Go). Gardés : GNS3, les machines virtuelles VirtualBox (40 Go, à trier un jour), 3 fichiers `Gmail.zip` à vérifier par Nicolas (exports de mails ?). Environ 42 Go libres ensuite. Le fichier d'échange de Windows grossit quand Docker tourne : surveiller l'espace (alerte sous 15 à 20 Go)
- **Piège Avast** : le Bouclier Courrier intercepte les connexions SMTP avec son propre certificat, accepté par Windows mais refusé par le conteneur. Certificat public d'Avast exporté dans `certs/avast-root.pem` et donné à n8n (`NODE_EXTRA_CA_CERTS`). Gmail SMTP dans n8n : port 587, SSL/TLS désactivé (STARTTLS). Le port 465 ne marche pas (racine « Untrusted » d'Avast). Leçon pour le freelance : antivirus et proxys d'entreprise font pareil chez les PME
- Autres pièges : mot de passe d'application collé avec ses espaces ou en double ; SSL/TLS activé sur le port 587
- **Premier workflow « bonjour »** (Schedule Trigger à 8 h, passé à **10 h** par Nicolas pour être sûr que le PC soit allumé, Edit Fields avec une expression de date en français, Send Email) testé, mail reçu, publié. Signature n8n retirée (option « Append n8n Attribution ») et objet corrigé, puis **republié** : avec Publish, une modification reste un brouillon tant qu'on ne republie pas. Docker Desktop démarre avec Windows
- Notions vues : image, conteneur, volume (garde-meuble), `docker-compose.yml`, expressions `{{ }}`, `$now`, `$json`, identifiants chiffrés séparés du workflow, SSL/TLS implicite ou STARTTLS, versions publiées d'un workflow, licence fair-code
- Livrable : `livrables/ia/2026-10-14_n8n/` (`docker-compose.yml`, `GUIDE.md`). Document de parcours mis à jour (3 séances sur 24), question « n8n ou Make » close
- Prochaine séance IA : séance 4, les API sans jargon (API de l'Annuaire des entreprises depuis n8n)

### `/morning` : première veille
- Projet de budget 2027 en débat : plafonds de la micro-entreprise figés jusqu'en 2028, mais la franchise de TVA (article 293 B du CGI) doit être réécrite au 1er janvier 2027, et la FFB demande un seuil plus bas pour le BTP. Conseil : poser la question à la réunion de la Chambre de métiers et ne pas trancher le statut avant le vote du budget (décembre)
- Baromètre Coface : 60 % des entreprises françaises n'ont pas de règles pour l'IA, et Gartner prévoit plus de 40 % de projets d'IA agentique annulés d'ici fin 2027. Argument pour l'offre IA de Nicolas : des automatisations simples, encadrées, avec validation humaine
- Recherches web (n8n, actualité IA datée) peu fructueuses : sources souvent anciennes ou secondaires

### `/emploi` complet : 5 nouvelles candidatures
- Suivi : aucune réponse d'employeur depuis le 13/10 (seulement des accusés de réception et des alertes d'offres)
- Sources : les alertes HelloWork dans Gmail ont été la source la plus riche, devant Indeed
- 5 candidatures préparées avec `adapter-docx.ps1` (modèle Telstar pour l'ADV, modèle DLSI pour le BTP) et **déposées par Nicolas le 14/10** : FAB Group (ADV planification pour un client IRVE, Montigny, le meilleur match), Eiffage Énergie Systèmes (assistant administratif travaux, Vélizy, à la limite des 20 min), Sovitrat (ADV pour un client espagnol de l'alimentaire, Guyancourt, profil linguistique exactement demandé), Equipages (ADV chez un intégrateur informatique, Voisins, anglais professionnel au téléphone demandé), Eberspächer (assistant commercial back office, CDD, Élancourt). Relances le 21/10
- 7 offres écartées, 2 pistes ajoutées (Adsearch à Montigny, Talents ADV & Supply à Buc)
- Pièges rencontrés : `adapter-docx.ps1` attend un chemin de sortie **relatif** (il le colle au dossier courant) ; un sous-titre de CV plus long que l'original passe sur 2 lignes, à vérifier sur le PDF
- Total au 14/10 : 18 candidatures, 3 refus, 15 en cours

### Site Atelier Facette : champ « Support actuel » et visite
- **Exercice fait par Nicolas** dans `main.js` : exemple « Sol en résine » réécrit (garage de 25 m², chape fissurée). Leçon : un objet JavaScript (clé exacte = option de la liste, valeur = texte), la virgule entre les paires, le piège de l'apostrophe droite dans un texte entre `'...'` (utiliser `’` ou `\'`), la console F12 pour lire les erreurs
- Champ facultatif « Support actuel » ajouté, affiché seulement pour Sol en résine, Béton ciré et Sols (liste `typesAvecSupport` dans `main.js`), désactivé quand il est caché pour ne pas être envoyé. Choix arrêtés par Nicolas : Chape / dalle béton en bon état, Chape / dalle béton fissurée, Carrelage, Parquet / plancher bois, PVC / moquette, Je ne sais pas (placo et béton de mur retirés, « / » plutôt que « ou »). Piège CSS : `.f{display:flex}` l'emportait sur l'attribut `hidden`, corrigé par `.f[hidden]{display:none}`
- Visite avant devis : décision de Nicolas, une phrase sur la page Contact annonce une visite gratuite une fois la demande complète ; la prise de rendez-vous se fera dans le trieur, pour éviter les visites pour rien
- Mentions légales : liste des données collectées complétée (type de travaux, surface, support)
- Site redéployé sur Netlify le 14/10 par Nicolas

### Organisation des sessions
- Conseil retenu : une session par sujet plutôt qu'une par jour (le matin, `/prime`, `/mails`, `/emploi` ; puis une nouvelle session pour le site, une séance IA ou les langues). Raison : chaque message relit toute la conversation, donc une longue session consomme plus et finit résumée automatiquement. Changer de sujet : « sauvegarde tout », puis `/clear` et `/prime`
- Consommation visible avec `/usage` dans Claude Code, ou sur claude.ai dans Paramètres, puis Utilisation
- Idée pour plus tard : archiver les anciennes entrées de HISTORY.md pour alléger `/prime`

### Divers
- HISTORY.md allégé : entrées du 08/10 au 12/10 déplacées telles quelles dans `context/archives/HISTORY_2026-10-08_au_12.md`, points encore ouverts repris dans un bloc « Points ouverts » en haut du fichier, dossier `archives/` ajouté dans CLAUDE.md
- Trieur de devis : numérotation des étapes de la v3 corrigée par Nicolas (commit du 13/10, absent de l'historique jusqu'ici)
- CONTEXT.md : nombre de candidatures mis à jour

## 2026-10-13

### Prochaine session
- Créer des alertes mail dans l'espace France Travail (assistant administratif, ADV, logistique, autour de Villepreux) : `/emploi` les lira dans Gmail comme les alertes Indeed
- Finaliser l'espace candidat DLSI (disponibilités, CV) et, si souhaité, confirmer la visibilité du profil HelloWork
- 15/10 : relance Bessière ; 16/10 : Fed Group et AGSE ; 19/10 : Sol pro, MO Ingénierie, O'TOMAT ; 20/10 : mairie de Villepreux (2e relance, par téléphone), DLSI, Telstar, Airwell
- Prochain `/emploi recherche` : alertes Indeed Culligan (relation client, Versailles) et Groupe ECS (exploitant transport), pistes Proxiserve, Citya, Storengy, Jungheinrich, PRETTRE ; emploi public (portails des mairies) pas encore exploré
- Central Pose : appel et candidature spontanée toujours en attente
### `/emploi suivi` et relance de la mairie de Villepreux
- Aucune nouvelle réponse des employeurs. Les 3 mails Indeed du 12/10 sont de simples confirmations de dépôt (Sol pro, MO Ingénierie, O'TOMAT)
- DRH de la mairie de Villepreux injoignable (12/10 et 13/10) : mail de suivi envoyé le 13/10 en réponse à la candidature du 08/10, avec la question sur l'offre « Agent du Guichet Unique » (annonce marquée à la fois « Fonctionnaire » et « CDD » : ouverte aux contractuels ?). Ancien brouillon supprimé, rappel du 20/10 créé dans l'agenda
- Mairie des Clayes-sous-Bois, « Technicien informatique, référent progiciels » : offre clôturée le 06/09/2026 et dépubliée, piste abandonnée par Nicolas. Le portail de recrutement de la mairie (lesclayessousbois.nous-recrutons.fr) est désormais suivi par `/emploi`

### Apprentissage de l'IA : comprendre ses propres agents
- Leçon sur l'anatomie d'un agent à partir de `/mails` et `/emploi` : modèle, instructions (commandes), outils (locaux, connecteurs MCP, web), boucle d'agent, mémoire par fichiers, garde-fous (règle écrite + `allowed-tools` + validation humaine), scripts pour les tâches mécaniques. Précision : un outil absent de `allowed-tools` n'est pas bloqué, il demande une permission
- Lecture commentée de `mails.md` (moindre privilège, porte de sortie « en cas de doute », itérations, idempotence, modèle de sortie)
- **Première modification de prompt faite par Nicolas** dans `mails.md` : les alertes Indeed (`donotreply@match.indeed.com`) sont citées dans « Pour info » puis marquées comme lues, les mails Indeed sur ses candidatures restent Important. Méthode retenue : une règle doit s'appuyer sur un critère qui distingue vraiment les cas (l'adresse exacte, pas le mot « indeed ») et répondre à : quels mails, quoi faire, et si l'information manque
- Lecture commentée de `emploi.md` : modularité (parties A à D choisies par l'argument), point d'arrêt et protocole « go » + numéros, double sécurité (PowerShell hors `allowed-tools`), ancrage dans des sources (« ne rien inventer »), entonnoir de tri, suivi des candidatures comme machine à états (un petit CRM)
- **Deuxième modification de prompt par Nicolas** dans `emploi.md` : en A1, recherche des réponses aussi par intitulé du poste et par la plateforme indiquée dans le Statut (exemples d'expéditeurs Indeed, HelloWork, DLSI, L'industrie recrute), un accusé de réception n'est pas une réponse ; en D, statut « Déposée sur <nom du site> ». Méthode retenue : un principe général + quelques exemples plutôt qu'une liste exhaustive. Petit réflexe à prendre : pas de ligne vide entre deux puces
- **Parcours de formation IA créé** (document partagé, lisible sur PC et téléphone : https://claude.ai/code/artifact/da149d5d-e515-4484-8b93-05a3bfe1c55f) : 24 séances d'environ 1 h (notion, exercice, livrable), 3 phases avec une porte chacune (workflow construit seul, 3 démos, première mission signée), rythme souple d'au moins 2 séances par semaine. Choix de Nicolas : outils gratuits, n8n en local (déjà téléchargé, installation ensemble en séance 3), Skool en complément quand c'est utile. Séance 1 (anatomie d'un agent) faite ce jour. Pour lancer une séance : « séance IA »
- **Séance 2 faite (après-midi) : écrire un prompt qui marche.** Les 6 briques (rôle, contexte, tâche, règles, format, exemples). Exercice : prompt du trieur de demandes de devis Atelier Facette, écrit par Nicolas en 3 versions, chacune testée sur 5 demandes pièges (bon client, hors zone, fuite urgente, demande vague, pub avec injection de prompt) : 1 bon résultat sur 5 en v1, 3 sur 5 en v3. v4 mise au propre par Claude dans `livrables/ia/2026-10-13_trieur-devis/`. Enseignements : l'ordre des étapes est de la logique (sécurité d'abord), vérifier les données réellement disponibles (le formulaire n'avait pas d'e-mail), l'IA prépare et Nicolas décide, sauf exception justifiée et bornée (réponse hors zone envoyée automatiquement avec un texte fixe, seulement si le code postal est sûr). Idées de Nicolas retenues : fichier de prix comme seule source des prix, refus de la sous-traitance seule, envoi automatique hors zone
- Prochaine séance IA : séance 3, installer n8n ensemble (déjà téléchargé)

### Site Atelier Facette : formulaire et espacements
- Formulaire de devis : champs **e-mail** (obligatoire) et **code postal** (obligatoire, 5 chiffres) ajoutés, mentions légales (RGPD) mises à jour. La bordure entre colonnes passe d'un comptage de positions (`nth-child`) à une classe explicite `g`, plus solide quand on ajoute un champ
- Espacements : écart réduit entre le menu et le début de chaque page (`main > .sec:first-child` et accueil), pied de page resserré (grand nom à 72 px). Sur téléphone, 120 px gardés sous le pied de page pour la barre d'appel
- Champ e-mail vérifié en ligne par Nicolas. Site redéployé sur Netlify le 13/10 avec tous les changements
- Convocation SportEasy du 14/10 : répondu par Nicolas le 13/10
- Champ « Message » : exemple grisé adapté au type de travaux choisi (`js/main.js`, bloc `const exemples`), jamais envoyé. Pas encore redéployé
- **À faire le 14/10 :** exercice de Nicolas (modifier lui-même un exemple dans `main.js`, test en local en ouvrant `contact.html`), puis ajout d'un champ conditionnel « Support actuel » (chape béton, carrelage, parquet ou plancher bois, PVC ou moquette, placo, béton, je ne sais pas), affiché surtout pour les sols, facultatif. Décision de Nicolas : la visite avant devis est importante pour éviter les surprises, à intégrer (champ de disponibilités ou étape du trieur), puis redéploiement sur Netlify
- À développer sur le site (demande de Nicolas) : l'offre résine, aujourd'hui trop généraliste. Gammes à présenter : peinture de sol, autolissant (2 à 5 mm), semi-lisse (sol antidérapant), moquette de pierre, résine décorative, etc. Contenu technique à fournir par Nicolas (usage, support, épaisseur, rendu, photos). Impacts : page `beton-cire-resine.html`, choix du formulaire, trieur de devis, fichier de prix
- Idée pour plus tard : une base de données pour Atelier Facette (demandes de devis et leur statut, fichier de prix, puis clients et chantiers). Piste conseillée pour démarrer : Google Sheets ou Notion, à relier au trieur en phase 2 du parcours IA

### `/emploi` complet : refus de TMD et 3 nouvelles candidatures
- **Refus de TMD Sécurité** le 13/10 (mail Indeed), rappel de relance du 15/10 supprimé
- Recherche Indeed + HelloWork (environ 40 offres vues). HelloWork, filtré sur 15 km autour de Villepreux et la dernière semaine, a été bien plus riche que la recherche web sur France Travail
- 3 candidatures préparées avec `adapter-docx.ps1` (CV et lettre d'une page chacun) et **déposées par Nicolas le 13/10** : DLSI (assistant BTP, intérim pour une entreprise du bâtiment, Trappes, devis + planification + suivi de chantiers, le meilleur match), Telstar (assistant ADV et approvisionnement, CDI, Trappes), Airwell (assistant services généraux, CDI, Montigny-le-Bretonneux, via L'industrie recrute avec création d'un profil UIMM). Accusés de réception reçus pour les trois, relances le 20/10 dans l'agenda
- 5 offres écartées (expérience ou diplôme exigé, anglais impératif, ancienneté, offre clôturée), 5 pistes ajoutées (Proxiserve, Citya, Storengy, Jungheinrich, PRETTRE)
- Piège repéré : après une candidature HelloWork, la page « postuler à plusieurs offres » pré-coche d'autres annonces (ex. poste de terrain à Rambouillet). Tout décocher avant de quitter
- Total au 13/10 : 13 candidatures, 3 refus, 10 en cours

### API France Travail : cause du blocage trouvée
- Trouvé par Nicolas sur data.gouv.fr : l'API « Offres d'emploi » n'est plus exposée sur francetravail.io, à la suite d'usages automatisés massifs par des solutions d'IA. Accès **restreint**, sur demande via le formulaire de contact (particuliers éligibles). Cela explique l'`invalid_client` et l'absence de l'API dans le catalogue
- Demande d'accès envoyée par Nicolas le 13/10 (usage personnel, une requête par jour, pas de rediffusion). **Réponse le jour même** (ticket INC2756918) : API suspendue à titre conservatoire, nouveau cadre d'accès en préparation, pas de date, demande conservée
- `/emploi` mis à jour : alertes mail Indeed et France Travail ajoutées aux sources, ainsi que l'emploi public (choisirleservicepublic.gouv.fr, portails des mairies) ; statut de l'API noté
- CONTEXT.md : statut de l'API mis à jour
