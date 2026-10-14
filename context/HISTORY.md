# Workspace History

> Journal chronologique de toutes les sessions et décisions importantes.
> Le plus récent en haut. Mis à jour automatiquement par Claude.
>
> **Comment ça marche :** Quand je lance la commande `/update` après une session importante, ou quand je raconte un changement significatif, Claude ajoute une entrée ici automatiquement. Je n'ai pas à écrire ce fichier manuellement.

---

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
- Résultat utile pour l'emploi : 4 entreprises absentes de la liste de prospection du 09/10, dont Sols Jeux Entretien (Auteuil-le-Roi) et Qualitec (Louveciennes), sièges sur place. Central Pose : siège à Brie-Comte-Robert, les décisions RH s'y prennent sans doute
- Document de parcours mis à jour (4 séances sur 24)

### Rangement des livrables : nouveau dossier `ia/`
- Incohérence repérée par Nicolas : les projets IA étaient rangés dans `applications/`. Nouveau dossier `livrables/ia/` (parcours IA, prompts, workflows n8n, démos clients), où ont été déplacés `2026-10-13_trieur-devis` et `2026-10-14_n8n`. `applications/` garde les scripts sans IA (`adapter-docx`, `envoi-candidatures`, `api-france-travail`), `sites-web/` ne change pas. Les chemins plus bas dans cet historique sont les anciens
- n8n arrêté avant le déplacement puis relancé depuis le nouveau dossier (`docker compose up -d`) : même volume de données, workflows conservés. Leçon : un dossier monté dans un conteneur ne se déplace pas pendant que le conteneur tourne
- README, CLAUDE.md et CONTEXT.md mis à jour

### Séance IA 3 faite : n8n installé avec Docker, premier workflow publié
- Choix de Nicolas : **n8n avec Docker** plutôt qu'avec Node.js, parce que c'est la méthode standard pour déployer chez un client. WSL installé par Nicolas en mode administrateur, puis redémarrage
- **Disque C: plein (0 Go libre)**, cause de l'échec de Docker. Supprimés avec l'accord de Nicolas : 8 copies d'une ISO Debian, 3 ISO Windows Server, 37 vieux installateurs (environ 50 Go). Gardés : GNS3, les machines virtuelles VirtualBox (40 Go, à trier un jour), 3 fichiers `Gmail.zip` à vérifier par Nicolas (exports de mails ?). Environ 42 Go libres ensuite. Le fichier d'échange de Windows grossit quand Docker tourne : surveiller l'espace (alerte sous 15 à 20 Go)
- **Piège Avast** : le Bouclier Courrier intercepte les connexions SMTP avec son propre certificat, accepté par Windows mais refusé par le conteneur. Certificat public d'Avast exporté dans `certs/avast-root.pem` et donné à n8n (`NODE_EXTRA_CA_CERTS`). Gmail SMTP dans n8n : port 587, SSL/TLS désactivé (STARTTLS). Le port 465 ne marche pas (racine « Untrusted » d'Avast). Leçon pour le freelance : antivirus et proxys d'entreprise font pareil chez les PME
- Autres pièges : mot de passe d'application collé avec ses espaces ou en double ; SSL/TLS activé sur le port 587
- **Premier workflow « bonjour »** (Schedule Trigger à 8 h, passé à **10 h** par Nicolas pour être sûr que le PC soit allumé, Edit Fields avec une expression de date en français, Send Email) testé, mail reçu, publié. Signature n8n retirée (option « Append n8n Attribution ») et objet corrigé, puis **republié** : avec Publish, une modification reste un brouillon tant qu'on ne republie pas. Docker Desktop démarre avec Windows
- Notions vues : image, conteneur, volume (garde-meuble), `docker-compose.yml`, expressions `{{ }}`, `$now`, `$json`, identifiants chiffrés séparés du workflow, SSL/TLS implicite ou STARTTLS, versions publiées d'un workflow, licence fair-code
- Livrable : `livrables/applications/2026-10-14_n8n/` (`docker-compose.yml`, `GUIDE.md`). Document de parcours mis à jour (3 séances sur 24), question « n8n ou Make » close
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
- **Séance 2 faite (après-midi) : écrire un prompt qui marche.** Les 6 briques (rôle, contexte, tâche, règles, format, exemples). Exercice : prompt du trieur de demandes de devis Atelier Facette, écrit par Nicolas en 3 versions, chacune testée sur 5 demandes pièges (bon client, hors zone, fuite urgente, demande vague, pub avec injection de prompt) : 1 bon résultat sur 5 en v1, 3 sur 5 en v3. v4 mise au propre par Claude dans `livrables/applications/2026-10-13_trieur-devis/`. Enseignements : l'ordre des étapes est de la logique (sécurité d'abord), vérifier les données réellement disponibles (le formulaire n'avait pas d'e-mail), l'IA prépare et Nicolas décide, sauf exception justifiée et bornée (réponse hors zone envoyée automatiquement avec un texte fixe, seulement si le code postal est sûr). Idées de Nicolas retenues : fichier de prix comme seule source des prix, refus de la sous-traitance seule, envoi automatique hors zone
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

## 2026-10-12

### Prochaine session
- Confirmer l'appel à la DRH de la mairie de Villepreux (prévu le 12/10 à 9h30) et y évoquer l'offre Indeed « Agent du Guichet Unique » (CDD, alors qu'on la croyait réservée aux titulaires)
- Répondre à la convocation SportEasy du mercredi 14/10
- Affiner plus tard : désabonnements restants (via « Gérer les abonnements » de Gmail), réglages SportEasy (couper les mails de forum), configurer Remote Control et tester la notification téléphone de `/mails`
- TMD Sécurité : le message de Frédéric Letifi (08/10) était un accusé de réception. Relance le 15/10 en citant son nom
- 15/10 : relances TMD et Bessière ; 16/10 : relances Fed Group et AGSE ; 19/10 : relances Sol pro, MO Ingénierie, O'TOMAT (rappels dans l'agenda)
- Central Pose : appeler l'agence de Plaisir puis envoyer la candidature spontanée (toujours en attente)
- Routine du matin conseillée : `/mails` (ou `/mails 3d` le lundi), puis `/emploi suivi` chaque jour, `/emploi` complet lundi, mercredi et vendredi, `/morning` en option. Idée retenue pour plus tard : une commande `/matin` qui enchaîne le tout avec un résumé unique
- API France Travail : retrouver l'API « Offres d'emploi » dans le catalogue francetravail.io (chercher « offre » ou « recherche », ou écrire au support), l'ajouter à l'application « jarvis », puis tester `chercher-offres.ps1`

### Premier lancement de `/emploi` : 3 candidatures déposées
- Suivi : refus de Guy Hoquet (12/10) et de Domaliance (09/10, CV conservé). Message de TMD Sécurité (Frédéric Letifi) reçu sur Indeed le 08/10 : simple accusé de réception (vérifié par Nicolas)
- Recherche Indeed (environ 30 offres analysées, recherche web sans résultat récent) : 3 retenues, préparées (CV + lettre adaptés, fiche `offre.md`) et **déposées sur Indeed par Nicolas le 12/10** : Sol pro (assistant administratif, Trappes, très petite entreprise de sols, le meilleur match), MO Ingénierie (assistant polyvalent BE + bâtiment, Guyancourt, salaire bas 1 700 à 1 800 €), O'TOMAT (assistant commercial, Noisy-le-Roi). Relance commune le 19/10
- 5 offres écartées avec la raison dans le suivi, FRANKLAB (Le Perray, ~25 min) ajoutée aux pistes
- Nouvel outil `livrables/applications/2026-10-12_adapter-docx/adapter-docx.ps1` : copie un modèle Word, remplace des paragraphes entiers depuis un JSON sans casser la mise en page, exporte le PDF. Piège rencontré : les espaces insécables avant « : » dans les modèles empêchaient la correspondance, l'outil les gère désormais
- Enseignement : Nicolas a validé l'« envoi » des 3 offres, mais un dépôt Indeed ne peut être fait que par lui. Claude ne peut envoyer lui-même que les candidatures par mail

### Assistant `/emploi` : recherche d'emploi de bout en bout
- Commande `.claude/commands/emploi.md` créée à partir du cahier des charges de Nicolas : suivi des candidatures en cours (réponses dans Gmail, relances dues avec 2 relances maximum, entretiens), recherche de nouvelles offres (Indeed, France Travail, HelloWork, APEC, prospection BTP) dans 15 communes à moins de 20 min, préparation de 3 à 5 candidatures (CV et lettre adaptés depuis les modèles existants via Word, mail, fiche de l'offre), récapitulatif numéroté
- Décision : pas d'envoi automatique. Claude prépare tout, **rien ne part sans « go » + numéros**. Raisons : petit bassin d'employeurs local, risque d'erreur en son nom, candidatures de masse peu efficaces. Pas de dépôt automatique sur Indeed ou France Travail (pas d'outil, robots interdits) : Claude donne le lien, Nicolas clique
- Envoi des pièces jointes impossible via le connecteur Gmail (PDF de 300 Ko) : script `livrables/applications/2026-10-12_envoi-candidatures/envoyer-candidature.ps1` (Gmail SMTP, mode `-Test`, refuse les repères entre crochets). Validation en deux étapes activée sur le compte Google, mot de passe d'application dans `.env`. **Test d'envoi à soi-même réussi**. Le script n'est pas pré-autorisé : Claude Code demande la permission à chaque envoi (deuxième sécurité)
- API France Travail : application « jarvis » créée sur francetravail.io, identifiants dans `.env`, script `livrables/applications/2026-10-12_api-france-travail/chercher-offres.ps1` prêt (OAuth2, Villepreux code INSEE 78674, rayon 15 km). **Bloqué** : `invalid_client`, aucune API autorisée sur l'application, et l'API « Offres d'emploi » introuvable dans le catalogue actuel
- Enseignement : un rappel Google Agenda créé sans `timeZone` est enregistré en UTC (2 h de décalage en été). Consigne ajoutée dans `/mails` et `/emploi`

### Routine `/mails` : tri automatique de Gmail
- Commande `.claude/commands/mails.md` créée à partir du cahier des charges de Nicolas : lecture des mails des dernières 24 h (`/mails 3d` le lundi), pubs marquées comme lues, suivi des candidatures mis à jour, rappels Google Agenda, brouillons de réponse. Règles : ne rien supprimer, ne répondre à personne, en cas de doute ne rien faire et le signaler. Autonomie totale via `allowed-tools` (l'envoi et la suppression ne sont pas autorisés, donc bloqués par l'outil)
- Sortie WhatsApp écartée (pas de connecteur) au profit d'une notification téléphone via Remote Control, qui ne part pas quand Nicolas est devant l'écran
- Premier test : 17 mails, 12 pubs et notifications lues, rien d'urgent. Règles validées ensuite : commentaires de forum SportEasy, rapports automatiques (Voltalis) et alertes emploi hors critères traités comme des pubs ; convocations SportEasy gardées
- Libellés Gmail **IA/Formation** (newsletter de Yass, Communauté IA Skool) et **IA/Outils** (Claude, n8n, Notion, Perplexity) créés : 39 mails rangés hors de la boîte de réception, laissés non lus. La routine range désormais les nouveaux mails IA
- Boîte de réception de 14 500 conversations (13 900 non lus) : tri complet trop lourd via Claude (un appel par mail). Grand ménage fait par Nicolas dans Gmail avec des recherches groupées (Promotions, non lus de plus de 6 mois, expéditeurs de bruit). Listes d'expéditeurs de bruit et d'expéditeurs à toujours garder ajoutées dans la commande
- Désabonnement de SeLoger fait. Opodo « Maria » : billets pris pour son ex, rien de suspect. Pas de workflow n8n à sauvegarder

### Contexte
- CONTEXT.md, rubrique « Mes projets en cours » : ajout d'Atelier Facette et du statut juridique (déjà lancés), retirés des « projets prévus plus tard »
- CONTEXT.md, rubrique « Mes outils » : ajout de la routine `/mails` et des libellés IA

## 2026-10-09

### Prochaine session
- 12/10 à 9h30 : appeler la DRH de la mairie de Villepreux
- Central Pose : appeler l'agence de Plaisir pour avoir un nom, puis envoyer la candidature spontanée
- Continuer la prospection BTP (3 à 5 entreprises par jour)
- 15/10 : relances TMD et Bessière ; 16/10 : relances Guy Hoquet, Fed Group, AGSE, Domaliance
- Statut : dire depuis quand Nicolas est inscrit à France Travail (droit à l'ACRE), réunion d'information de la Chambre de métiers des Yvelines, devis d'assurance décennale
- Site Atelier Facette (quand Nicolas le souhaite) : chercher des photos de chantiers, trouver le réglage des notifications email de Netlify, aperçu des pages sur l'accueil, plus tard dépôt GitHub dédié au site

### Rénovation : comparatif des statuts juridiques
- Comparatif micro-entreprise, EI au réel, EURL et SASU avec les chiffres 2026 (plafond prestations 83 600 €, cotisations 21,2 %, franchise de TVA 37 500 €, ACRE ramenée à 25 % au 1er juillet 2026) dans `livrables/batiment/2026-10-09_statuts-juridiques/comparatif-statuts.md`
- Analyse : la micro-entreprise colle le mieux au démarrage (emploi salarié en parallèle, petit chiffre d'affaires, clients particuliers sans TVA). Point faible : les matériaux, à facturer séparément de la pose. Décision laissée à Nicolas
- Nicolas ne touche pas d'ARE : ni cumul ni ARCE. ACRE possible s'il est inscrit à France Travail depuis 6 mois sur les 18 derniers mois (à confirmer)

### Rénovation : site en ligne de test sur Netlify
- Site déployé par glisser-déposer (Netlify Drop) : **https://atelier-facette.netlify.app** (sans www), passé en public pour les tests, toujours bloqué pour Google
- Formulaire de devis relié à Netlify Forms : 3 champs photo (un fichier par champ, 8 Mo au total, vérifié avant envoi), piège anti-robots, page `merci.html`. Détection activée puis redéploiement : envoi testé avec succès depuis le téléphone
- Enseignements : les sites Netlify Drop sont privés par défaut ; la détection des formulaires ne s'applique qu'au déploiement suivant son activation ; le nom du dossier déposé n'a aucune importance
- Réglage des notifications email des demandes introuvable dans la nouvelle interface Netlify, à chercher (les demandes restent visibles dans Forms)
- Choix d'hébergement au lancement encore ouvert : OVH (domaine, emails pro, FTP) ou GitHub + Netlify avec domaine acheté à part

### Rénovation : site vitrine Atelier Facette (option A, site codé)
- Choix de l'option A (site statique codé, hébergement gratuit) plutôt qu'un créateur de site ou WordPress : coût quasi nul, fidèle à la maquette, et objectif de formation de Nicolas
- Site construit dans `livrables/sites-web/2026-10-09_site-renovation/site/` à partir de la maquette Claude Design : polices hébergées sur le site (RGPD), pas de cookies, animations désactivables, bloqué pour Google pendant les tests, page mentions légales à trous
- Passage d'une page unique à 7 pages séparées à la demande de Nicolas (bandeau et pied de page communs, page en cours soulignée, fondu entre les pages). Version une page sauvegardée dans `index-une-page_sauvegarde.html`
- `GUIDE.md` écrit pour apprendre : structure, rôle HTML / CSS / JavaScript, modifier un texte. Premier exercice fait par Nicolas (modification du surtitre)
- Reste à faire : vraies photos (paysage, 2000 px minimum), téléphone et email, délai de devis, nombre d'applicateurs formés, avis réels, mise en ligne de test, formulaire branché

### Rénovation : logo Atelier Facette
- Prompts Gemini (Nano Banana) rédigés et affinés en plusieurs tours : pierre irrégulière (effet "fissuré" écarté), puis exploration "joyau" (émeraude, brillant, hexagone). Brillant écarté (cliché bijouterie, proche du logo Sketch)
- Émeraude et hexagone redessinés en vectoriel et comparés en situation (`comparaison-logos_v1.html`). **Hexagone retenu** : le plus lisible en petit
- Fichiers finaux dans `livrables/batiment/2026-10-09_logo-atelier-facette/final/` : photo de profil, icône, logos horizontal et empilé (clair et sombre), en SVG et PNG. Texte en Fraunces intégré mais pas vectorisé (pas de Python sur le PC)
- Nouveau logo intégré dans la maquette Claude Design et dans le site

### Rénovation : nom de l'activité et maquette du site
- Nom retenu : **Atelier Facette** (provisoire, susceptible de changer). Écartés : Atelier Minéral (déjà utilisé par une entreprise de sols à Paris, domaines pris, trop axé résine) et une quinzaine d'autres noms déjà pris par des entreprises du bâtiment ou dont le domaine était réservé
- Maquette de site vitrine créée avec Claude Design à partir d'un prompt rédigé par Claude, puis corrigée : ambiance minérale chaleureuse (blanc cassé, sable, anthracite, terracotta), rénovation mise en avant avec la résine en signature, effets discrets
- Prompts et lien dans `livrables/sites-web/2026-10-09_site-renovation/`
- Avant la mise en ligne : choisir le titre (conseil : "Rénovation intérieure, finitions sur mesure."), vraies photos, avis réels, coordonnées, statut et assurance décennale

### Recherche d'emploi : 4 candidatures envoyées et prospection BTP
- Recherche Indeed autour de Villepreux (administratif, ADV, logistique, support, assistant travaux)
- Envoyées le 09/10 : Guy Hoquet Villepreux (assistant commercial), Fed Group (assistant ADV, Buc), AGSE (assistant administratif, Buc), Domaliance (assistant plannings, Le Chesnay). Total : 7 candidatures en cours
- Fed Group : appels à Laure Evain à 12h et 14h sans réponse. Pas d'autre appel, la candidature Indeed suffit, relance le 16/10
- Écartées : Vessel Europe et CRMA (anglais courant indispensable), TS Biotech (chinois exigé), Euretudes (annonce clôturée, lettre réutilisable)
- Nouveaux CV : bâtiment (assistant travaux), ADV et administratif, commercial, plannings
- Prospection BTP : 15 entreprises de 20 salariés et plus repérées via l'API de l'Annuaire des entreprises. Central Pose (sols, Plaisir) en tête, CV et lettre prêts
- Enseignement : les postes de bureau dans le bâtiment passent souvent par des candidatures spontanées plutôt que par des annonces

### Outils
- Connecteur Canva autorisé. Gemini indisponible en France (prompts à copier à la main)
- Rappels Google Agenda créés pour toutes les relances
- Réglage `"language": "french"` ajouté dans les paramètres généraux de Claude Code. L'interface de l'extension VS Code reste en anglais (pas de traduction prévue)

## 2026-10-08

### Prochaine session (prévue le 2026-10-09)
- Commencer par la recherche d'emploi : piste « postes de bureau dans des entreprises du bâtiment » autour de Villepreux, et suivi des 3 candidatures en cours (voir `livrables/taff/suivi-candidatures.md`)

### Langues : fiches de vocabulaire multilingues
- Méthode choisie par Nicolas : fiches de vocabulaire par thème en 4 langues (FR, EN, ES, PT), complétées par de la conversation avec Claude. Temps disponible : 1 h ou plus par jour
- Portugais : variante brésilienne retenue, les différences avec le portugais du Portugal sont signalées dans la colonne « Pièges »
- Création de `livrables/langues/2026-10-08_fiches-vocabulaire/fiches-vocabulaire_v1.xlsx` : 4 onglets (Entretien d'embauche, Bâtiment et rénovation, IA et tech, Voyage et quotidien), 30 mots chacun, avec pièges/faux amis, phrase d'exemple en anglais et colonne « Acquis »
- CONTEXT.md mis à jour : portugais brésilien, méthode et rythme d'apprentissage
- Version LibreOffice `fiches-vocabulaire_v2.ods` : lignes colorées en alternance (bleu, rose, jaune), filtres, en-tête figé et répété à l'impression. Nicolas utilise LibreOffice pour ses tableurs (ajouté dans CONTEXT.md : tableurs produits au format .ods)

### Recherche d'offres et candidature TMD Sécurité
- Première recherche Indeed autour de Villepreux. Pistes retenues : TMD Sécurité (assistant administratif, Bois-d'Arcy, CDI dès janvier 2027, priorité), Bessière (assistant logistique, Méré), support EDI via Michael Page (Plaisir, plus difficile)
- Enseignement : les postes de bureau dans des entreprises du bâtiment valorisent le mieux le profil de Nicolas, piste à creuser
- Candidature TMD Sécurité préparée dans `livrables/taff/2026-10-08_candidature-tmd-securite/` : CV adapté (titre, profil, parkings mis en avant) et lettre de motivation, en .docx et .pdf
- CV v2 plus attractif (`cv-nicolas-bideau_tmd-securite_v2`) : bandeau de chiffres clés, Batidax en tête dans « Expérience en gestion d'entreprise », accroche « 6 ans de gestion d'entreprise dans le bâtiment », postes anciens réduits à une ligne. La v1 est conservée
- Mise en cohérence : CONTEXT.md corrigé de « 15 ans » à 12 ans d'expérience dans le bâtiment (comme les CV), relances clients chez Batidax confirmées par Nicolas
- Candidature Bessière (assistant logistique, Méré) préparée dans `livrables/taff/2026-10-08_candidature-bessiere/` : CV au design v2 recentré sur la logistique et le planning de pose, et lettre de motivation. **Envoyée le 2026-10-08**, relance prévue le 2026-10-15 (rappels Google Agenda pour TMD à 9h30 et Bessière à 10h00)


- Offres de la mairie de Villepreux analysées : aucune ne colle (guichet unique réservé aux titulaires, agent polyvalent bâtiment = terrain). Choix d'une candidature spontanée pour un poste administratif aux services techniques, préparée dans `livrables/taff/2026-10-08_candidature-spontanee-mairie-villepreux/` (CV, lettre au Maire, texte du mail pour la DRH). **Envoyée par mail le 2026-10-08** (mairie fermée, pas d'appel préalable), appel de suivi à la DRH prévu le 2026-10-12
- **Candidature TMD Sécurité envoyée le 2026-10-08**, relance prévue le 2026-10-15. Création de `livrables/taff/suivi-candidatures.md` pour suivre les envois et les pistes

### Compléments des CV ciblés
- Les 8 CV (.docx et .pdf) ont été enrichis avec des chiffres clés : CA Batidax d'environ 100 000 €/an, 2 à 3 sous-traitants, équipe de 3 à 6 personnes et 2 à 3 chantiers en parallèle chez AS Résine Pro Tech, environ 10 personnes formées par semaine pendant un an, 2 à 7 palettes/jour et 10 à 12 références chez Alperel (glaces artisanales)
- Niveaux de langues : espagnol courant, anglais intermédiaire, portugais scolaire
- Formulations corrigées pour rester exactes : « négociation » devient « interface avec les fournisseurs », « suivi comptable » devient « suivi de la rentabilité, en lien avec l'expert-comptable »
- Le fichier doublon n'a pas été modifié
- CONTEXT.md mis à jour avec ces chiffres, les niveaux de langues, les outils maîtrisés et l'emplacement des CV

### Sauvegarde sur GitHub
- Dépôt privé créé : https://github.com/nicobidax-hue/jarvis (branche `main` suivie sur `origin`)
- Connexion GitHub enregistrée sur le PC, Claude peut désormais pousser les commits
- `.env` vérifié non versionné avant le premier push

### Rangement des CV dans les livrables
- Les 8 CV ciblés (.docx + .pdf) ont été copiés de `Bureau\CV 2026` vers `livrables/taff/2026-10-08_cv-cibles/` et renommés selon la convention (ex. `cv-administratif-adv_moderne.pdf`)
- Les originaux sont restés sur le Bureau. La version de référence est désormais celle du workspace
- `cv-support-informatique_doublon.docx` correspond à « Support informatique (1).docx », une version en trop sans PDF, à trier

### Sortie du workspace de OneDrive
- Workspace copié de `OneDrive\Bureau\jarvis\jarvis-starter-kit` vers `C:\Users\nicob\jarvis\` pour que `.env` ne soit plus synchronisé dans le cloud Microsoft
- Sauvegarde désormais assurée par Git (dépôt initialisé, premier commit sans `.env`), dépôt GitHub privé à venir
- Historique des conversations Claude Code copié vers le nouvel emplacement (mémoire Claude Code vide, rien à migrer)
- `.claude/settings.local.json` ajouté au `.gitignore` (réglages propres à la machine)
- Clés d'API à sauvegarder à part dans un gestionnaire de mots de passe
- Ajout de `livrables/langues/` (anglais, espagnol, portugais), oublié dans l'organisation initiale

### Organisation des livrables et gestion des clés d'API
- Création de `livrables/` avec 6 sous-dossiers thématiques : `sites-web/`, `applications/`, `youtube/`, `reseaux/`, `batiment/`, `taff/` (noms sans accents pour éviter les soucis avec scripts, Git et synchro), chacun avec un README
- Règle d'or documentée (livrables/README.md et CLAUDE.md) : inputs dans `context/import/`, outputs dans `livrables/`
- Convention de nommage : un dossier par projet `AAAA-MM-JJ_nom-du-projet/`, minuscules, tirets, sans accents, versions `_v1`/`_v2`/`_final`
- Création de `.env` (clés privées, à ne jamais commiter), `.env.exemple` (modèle public) et `.gitignore` (secrets, builds, éditeurs, logs, temporaires), testé dans un dépôt Git temporaire
- Point d'attention : le workspace est sur OneDrive, donc `.env` est synchronisé dans le cloud Microsoft (réglé dans l'entrée suivante)
- Les 8 CV ciblés restent dans `Bureau\CV 2026` (créés avant cette organisation)

### Ajout du parcours professionnel
- Recherche des CV existants : version la plus récente sur le Bureau (CV Bideau Nicolas, 11/05/2026), CV Indeed obsolète (s'arrête à 2008)
- Parcours ajouté dans CONTEXT.md : ancien gérant de Batidax (2013-2019), responsable chantier/formateur chez AS Résine Pro Tech (2022-2026), logistique, informatique (BTS développement, bases de données)
- Analyse du CV pour l'objectif poste de bureau, puis création de 8 CV ciblés dans `Bureau\CV 2026` (Administratif/ADV, Support informatique, Logistique/stocks, Bâtiment, chacun en version sobre et moderne, .docx + .pdf)
- À compléter par Nicolas : niveaux de langues, chiffres clés (taille d'équipe, chantiers, stocks), vérification des missions reformulées

### Installation initiale du Jarvis
- Workspace personnalisé pour Nicolas, basé à Villepreux (Yvelines)
- Profil principal : mix, en recherche d'emploi avec deux activités en développement (rénovation intérieure et freelance IA)
- Activité : rénovation intérieure pour particuliers (spécialité sols résine et béton ciré, sans statut pour l'instant) et projet freelance IA en phase de formation
- Objectifs court terme identifiés : poste de bureau à moins de 20 min cet hiver, statut ouvert et 5 chantiers résine/béton ciré avant l'été 2027, première mission d'automatisation IA d'ici 3 à 6 mois
- Vision long terme : vivre du freelance (rénovation, IA, contenu Instagram/TikTok), devenir une référence IA pour les PME locales, parler couramment anglais, espagnol et portugais
- Projets actifs au démarrage : apprentissage de l'IA, langues (anglais, espagnol, portugais), recherche d'emploi
- Domaine d'aide prioritaire : recherche d'emploi (en premier), apprentissage de l'IA, apprentissage des langues
- Style de communication choisi : mélange, direct et efficace ou détaillé et pédagogique selon le contexte
