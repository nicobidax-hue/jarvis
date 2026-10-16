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

## 2026-10-16

### Prochaine session
- 19/10 : Sol pro, MO Ingénierie, O'TOMAT ; 20/10 : mairie de Villepreux (2e relance, par téléphone), DLSI, Telstar (offre retirée de HelloWork, demander si le poste est pourvu), Airwell ; 21/10 : FAB Group, Sovitrat, Equipages, Eberspächer ; 22/10 : Central Pose, Bessière (2e et dernière, offre fermée : clôturer si rien), Valorem, Robert Half, AGSE ; 23/10 : Saudade, XEFI, Hilti, LHH (un rappel commun dans l'agenda) ; 30/10 : clôture de Fed Group si toujours rien
- Fed Group : le message Indeed de relance (texte prêt dans la session) n'a pas été envoyé, seulement l'appel
- **Abonnement Claude via Google Play annulé au 2 novembre** (mail du 15/10, en même temps que la clôture du profil de paiement Google). À vérifier par Nicolas : voulu ou non, et se réabonner (par exemple sur claude.ai) avant le 2/11 si besoin
- Robert Half : demander à être positionné aussi sur les postes d'approvisionneur (Coignières) et d'assistant de gestion (alerte HelloWork du 16/10), plutôt que de repostuler
- Equans publie un poste d'assistant contrat Facility Management à Guyancourt : à proposer à Nicolas (Equans écarté le 15/10 pour un autre poste)
- Toujours en attente : séance IA 7 (finir le workflow HelloWork), régénération de la clé Gemini passée dans la conversation le 15/10

### `/mails`
- 44 mails sur 24 h, 17 pubs lues, 2 mails IA rangés (Mistral, Notion dans IA/Outils). Aucun mail d'employeur demandant une réponse
- Telstar : HelloWork signale l'offre retirée (« avez-vous été recruté ? »), sans réponse de Telstar. Valorem : CV consulté le 15/10. Robert Half : accusé de réception et espace candidat activé
- Qonto relance le parcours payant « création de micro-entreprise » : à ignorer (piège déjà noté le 15/10)
- Notification téléphone non envoyée : Remote Control inactif

### `/emploi` complet : 4 candidatures envoyées
- Sources : Indeed (une dizaine de recherches) et surtout HelloWork (recherches « assistant », « administratif », « logistique » sur 15 km, dernière semaine). HelloWork reste la source la plus riche
- **4 candidatures envoyées par Nicolas le 16/10**, toutes confirmées par un accusé de réception : Saudade Distribution (assistant commercial sédentaire, CDD de remplacement, Les Loges-en-Josas, **portugais apprécié**, envoyée par mail à Bruno Gabriel), XEFI (assistant commercial, CDI, Les Clayes-sous-Bois, entreprise informatique, publiée le matin même), Hilti France (gestionnaire administratif parc, CDI, siège de Bois-d'Arcy, intitulé interne « Car fleet Specialist »), LHH Recruitment Solutions (assistant administratif de projet, intérim longue durée chez un industriel, Versailles, 30 à 35 k€)
- Modèles utilisés avec `adapter-docx.ps1` : O'TOMAT pour XEFI, Eberspächer pour Saudade, Airwell pour Hilti, Talysio pour LHH. Fichiers nommés sans le nom de l'entreprise (`cv-nicolas-bideau`, `lettre-motivation`), comme le veut la règle de `/emploi`
- Piège confirmé : un sous-titre de CV de plus de 100 caractères environ passe sur 2 lignes avec un mot orphelin. Les 4 sous-titres ont été raccourcis puis vérifiés sur le PDF
- Points d'attention notés dans chaque `offre.md` : Sage Gestion Commerciale demandé chez Saudade (jamais utilisé), 3 ans d'assistant demandés chez LHH, prospection téléphonique chez XEFI. Formulaire LHH : salaire souhaité conseillé à 30 000 à 35 000 € (fourchette de l'offre) plutôt que 25 000 à 30 000 €. Espace candidat LHH créé par Nicolas le jour même
- Fed Group : offre fermée ou expirée sur Indeed (comme celle de Bessière), appel à Laure Evain le 16/10 sans réponse, compté comme 2e relance. Conseil : une offre fermée n'est pas un refus, et Fed Supply est un cabinet qui place d'autres assistants ADV. AGSE : statut Indeed « Candidature consultée »
- Écartées : DOGA (trilingue anglais et espagnol), ENVEA (anglais, 4 ans d'ADV export), ATEQ (responsable logistique aux Clayes, anglais professionnel et CACES), RATP Cap (en réalité à Châtenay-Malabry), CAP Intérim (réservé RQTH). Pistes ajoutées : CPAM des Yvelines à Poissy (4 CDD de gestionnaire administratif dès novembre), Robert Half approvisionneur à Coignières
- Total au 16/10 : 26 candidatures, 4 refus, 22 en cours

### Arguments de vente de l'IA (recherche et PDF)
- PDF de 9 pages pour Nicolas (document de travail, pas une plaquette client), cibles artisans/TPE du bâtiment et PME : `livrables/ia/2026-10-16_arguments-vente-ia/` (HTML source + PDF généré avec Edge, Python absent du PC)
- Chiffres clés retenus : 40 % des TPE-PME utilisent l'IA mais 30 % dans le bâtiment et 11 % pour automatiser (France Num 2026) ; facturation électronique priorité n° 1 (39 %) devant l'IA (18 %) ; un tiers seulement des entreprises utilisatrices voient un gain concret (Banque de France, sept. 2026, via la presse) ; 10 h de gestion par semaine pour un artisan et 2,1 h gagnées avec l'IA (Asterès, 2024) ; retard de paiement de 14,6 jours pour les moins de 3 salariés (Observatoire des délais de paiement) ; IA Booster France 2030 jusqu'à 80 % pris en charge, guichet annoncé jusqu'au 31/12/2026
- Fil rouge : vendre du temps, de la trésorerie et la mise en conformité, pas « de l'IA ». Contenu : 7 arguments, arguments par cible, 10 objections et réponses, ce qu'il ne faut pas promettre, 2 pitchs de 30 secondes, questions de découverte, démos à préparer
- À vérifier avant de citer à un client : sanctions de la facturation électronique (15 € par facture, plafond 15 000 €, sources d'éditeurs), conditions 2026 d'IA Booster. Aucune étude indépendante trouvée sur l'effet des relances automatiques ou de la rapidité de réponse aux devis : mesurer chez les premiers clients

## 2026-10-15

### Prochaine session
- 16/10 : relance Fed Group (seule, AGSE reportée) ; 19/10 : Sol pro, MO Ingénierie, O'TOMAT ; 20/10 : mairie de Villepreux (2e relance, par téléphone), DLSI, Telstar, Airwell ; 21/10 : FAB Group, Sovitrat, Equipages, Eberspächer ; 22/10 : Central Pose, Bessière (2e et dernière), Valorem, Robert Half, AGSE
- Toujours en attente : espace candidat DLSI, visibilité du profil HelloWork, confirmation du compte candidat Eiffage (inutile depuis le refus)
- Robert Half demande Excel avancé (tableaux croisés dynamiques, RechercheV) : à réviser avant un éventuel entretien
- AGSE : si entretien, préparer une courte présentation en anglais (parcours, Batidax, motivation)
- Pistes non ouvertes : alertes Indeed IVS France (ADV, 31 000 €) et La Foncière du Parc (gestion locative), lieu inconnu
- Qonto : confirmer à l'ouverture d'un compte réel (avec le SIRET de Nicolas) que la facture d'acompte et la facture de situation sont dans l'offre gratuite
- Séances IA : début de séance 7, finir le workflow HelloWork (nettoyage après l'IA : retours à la ligne, contrat et lieu restés dans certains intitulés ; doublons ; filtre par poste et département), puis séance 7 (webhooks), puis branchement de n8n sur l'API Qonto
- Connexion Gmail de n8n en mode Test : à refaire vers le 22/10 (expiration tous les 7 jours)
- Disque C: tombé à 23 Go le 15/10 (Visual Studio avait téléchargé 6 Go de modules Android et MAUI). Ménage fait le soir même : machines VirtualBox (40 Go) et Visual Studio (environ 25 Go) supprimés par Nicolas, **88 Go libres**. Dossier `VirtualBox VMs` (restes, 45 Mo) envoyé à la corbeille par Claude. Les 3 `Gmail.zip` annoncés vides par erreur (arrondi à 0,0 Go) contiennent des photos du 30/10/2024 : vérifiés puis supprimés par Nicolas. Après la désinstallation de Visual Studio, Claude a supprimé les 6 Go de modules laissés par son installateur dans `Temp` (avec l'accord de Nicolas) : **104 Go libres**. Déplacer les programmes sur le disque externe de 1 To déconseillé (réinstallation obligatoire, disque USB lent, débranchement risqué pour n8n) : le disque externe sert aux ISO, aux machines virtuelles et aux sauvegardes. Claude et le workspace Jarvis pèsent moins de 0,2 Go

### Séance IA 6 faite : l'IA lit les alertes HelloWork
- Choix du fournisseur : Mistral choisi d'abord (argument « IA française » pour les PME), mais son offre gratuite ne donne plus accès à l'API (clés grisées, plans à 15 ou 24 €, sources tierces en retard). Repli sur **Gemini** : clé créée dans AI Studio sur le projet `n8n-local`, sans facturation, rangée dans `.env` (`GEMINI_API_KEY`) et dans n8n. Leçon : les offres gratuites changent, tester avant de promettre 0 € à un client
- Modèles : `gemini-2.5-flash` conseillé par Claude mais fermé aux nouveaux comptes (404), `gemini-3-flash-preview` surchargé (503). Vérifié par un appel direct avec la clé : **`gemini-3.5-flash-lite`** retenu. Règle : pas de modèle « preview » dans un workflow autonome
- Données : offre gratuite = données utilisées par Google, donc seulement des données publiques. Nicolas avait mis son âge et son adresse dans le contexte du prompt, retirés (moindre privilège appliqué aux données)
- Workflow « Séance 6 - Offres HelloWork par l'IA » (copie de la séance 5) : Gmail sans Simplify, Edit Fields « nettoyeur » (regex écrites par Nicolas, 17 096 → 2 318 caractères, -86 % de tokens), Basic LLM Chain (message système + message utilisateur) avec Structured Output Parser, Split Out. Filter et Edit Fields de la séance 5 retirés : le filtre sur l'objet jetait des offres utiles
- Prompt écrit par Nicolas brique par brique : rôle (recopier fidèlement, pas « rechercher et trier »), contexte (2 blocs : alerte et « Quand on a vu ces offres »), tâche, règles (rien d'inventé, « non indiqué » pour salaire et département absents, intitulé nettoyé de H/F, contrat et lieu, option A retenue pour « Rambouillet - Montrouge »), exemples, protection contre l'injection. Leçon : deux règles qui se contredisent laissent l'IA trancher seule
- Erreurs comprises : `$` manquant, regex entre guillemets, `.length()` avec parenthèses, `.length` placé avant `.replace`, nœud IA branché sur l'ancien nœud, prompt en mode Fixed (sortie vide, repéré grâce au nombre de tokens trop bas)
- Résultat : **25 offres extraites de 2 alertes** (11 + 14, recomptées à la main dans Gmail), contre 2 avec l'objet seul. Environ 840 tokens par alerte. Cas pièges réussis : intitulés simples, département non indiqué, salaire mensuel, tiret dans un titre. Ratés : « CDD - Correspondant Administratif » (contrat en début d'intitulé gardé), « … - Arbres et Paysages - 91 » (lieu gardé), « Groupe OSMAIA Super recruteur » (règle et exemple ajoutés par Nicolas : badge retiré, mais retour à la ligne resté dans « Groupe\nOSMAIA »). Leçons : l'IA n'est pas déterministe et suit mal certaines règles, donc contrôler sur plusieurs exécutions ; ce qu'un `replace` fait à coup sûr (retours à la ligne) se fait dans un nœud après l'IA, pas dans le prompt. Doublon repéré : Valorem Partners Les Ulis dans les 2 alertes
- **Clé Gemini collée par erreur dans `.env.exemple`** (fichier versionné) : repérée dans le diff avant le commit et retirée, jamais commitée. Elle est passée dans la conversation avec Claude : régénération proposée à Nicolas
- Mis à jour : document de parcours (6 séances sur 24), `livrables/ia/2026-10-14_n8n/GUIDE.md`, `.env.exemple`. Rythme : Nicolas a demandé de ralentir en cours de séance, avancer une étape à la fois

### Séance IA 5 faite : Gmail dans n8n (OAuth)
- Notion : mot de passe d'application (double complet des clés) ou OAuth (client ID et secret, écran de consentement, scopes, URI de redirection, jeton). Même schéma pour l'API Qonto
- Projet Google Cloud `n8n-local` créé sans facturation (essai gratuit de 300 $ ignoré), API Gmail activée, écran de consentement en mode Test, Nicolas en utilisateur test, client Application Web redirigé vers `http://localhost:5678/rest/oauth2-credential/callback`. La console ne se chargeait pas dans le navigateur habituel : réglé en fenêtre privée
- Consentement granulaire : 2 droits cochés sur 6 (libellés, consulter et envoyer), sans l'accès total avec suppression définitive. Leçon : le moindre privilège, argument de confiance face à un client
- Workflow « Séance 5 - Alertes HelloWork » : Get many messages plutôt que le déclencheur « On message received » (on construit sur des données existantes, puis on change le déclencheur), recherche par adresse exacte (`notification@emails.hellowork.com`, les 3 autres adresses HelloWork servent à autre chose), Filter en OR avec Ignore Case (3 alertes gardées sur 4), Edit Fields : date lisible depuis `internalDate`, entreprise et poste extraits de l'objet
- Erreurs faites et comprises par Nicolas : `.replace` avec un seul argument (résultat `undefined`), retour à la ligne tapé dans le champ (`\n`), espaces restés après la coupe. Notions : `split`, `[0]` et `[1]`, `replace`, `trim`, regex `/^une? /`. Le champ `poste` écrit seul par Nicolas
- Limite trouvée : l'objet ne montre que la première des 3 à 14 offres d'une alerte, d'où des offres perdues et des doublons. Point de départ de la séance 6 et argument de vente (lire le contenu, pas seulement l'objet)
- n8n (version avec Publish) enregistre tout seul, plus de bouton Save. Procédure et expressions notées dans `livrables/ia/2026-10-14_n8n/GUIDE.md`, document de parcours mis à jour (5 séances sur 24)

### Offre IA : facturation électronique et sandbox Qonto
- Idée de Nicolas : ne pas faire de facturation électronique soi-même, mais automatiser autour d'un logiciel gratuit et agréé, puis vendre le service aux artisans
- Comparatif de 7 logiciels. Qonto favori. Abby n'est gratuit qu'en micro-entreprise sans TVA (15 €/mois pour un artisan type). Indy, Shine et Tiime n'ont pas d'API publique, Henrri n'est pas agréé
- Sans SIRET, aucun compte réel, même le portail développeur l'exige. App sandbox créée avec le SIRET d'AS Résine Pro Tech. Autorisations limitées à la facturation, `organization.read` écartée (solde, IBAN, transactions)
- Test dans le sandbox : client particulier, facture d'acompte, TVA 10 % et 5,5 %, « Partial invoice » pour les situations. Première facture d'acompte créée
- Automatisations repérées : acompte de 30 % calculé et réparti selon la TVA du devis (le formulaire n'a qu'un seul taux), relances (payantes chez Qonto). Qonto a déjà un assistant IA de création de factures, à ne pas vendre
- Piège : le parcours « Création de micro-entreprise » de Qonto est payant et immatricule l'entreprise, à ne pas confondre avec la facturation gratuite
- Point clos : l'accord du gérant d'AS Résine Pro Tech n'est pas nécessaire, le SIRET ne sert qu'au compte de test (décision de Nicolas)
- Chat Qonto interrogé par Nicolas sur l'acompte et la « Partial invoice » dans l'offre gratuite : pas de réponse claire. Pages publiques lues ensuite : acompte et situation « en illimité » sur la page bâtiment, très probablement dans l'offre gratuite (non écrit en toutes lettres) ; relance manuelle « en un clic » gratuite, relance automatique décrite comme un add-on payant par une autre page Qonto et un site tiers. Argument pour l'offre : les relances automatiques via n8n et l'API restent une vraie valeur ajoutée à 0 € pour l'artisan

### `/morning`
- Baromètre France Num 2026 : 40 % des TPE-PME utilisent l'IA (53 % des PME), seulement 19 % paient, et l'IA arrive dernière des priorités numériques (18 %) loin derrière la facturation électronique (39 %). Idée retenue pour la phase 3 du parcours IA : une offre d'automatisation autour des factures (tri, classement, relances)
- PLF 2027 déposé le 1er octobre, en commission des finances : rien de visible sur la franchise de TVA des micro-entrepreneurs, article 293 B toujours abrogé au 1er janvier 2027. Le conseil d'attendre le vote de décembre avant de choisir le statut tient toujours

### `/emploi` complet : 3 candidatures, 1 relance, 1 refus
- Suivi : **message d'AGSE sur Indeed** (question sur le niveau d'anglais), répondu par Nicolas le 15/10 (plus à l'aise à l'écrit, niveau scolaire amélioré, envie de progresser) ; relance AGSE reportée au 22/10. **Refus d'Eiffage** (poste pourvu). Accusés de réception de FAB Group, Sovitrat, Equipages et Eiffage. Guy Hoquet clôturé, rappel du 16/10 supprimé
- **Loxam Rental** (commercial sédentaire) : candidature Indeed du 14/10 à 11h25, sans doute involontaire, pendant la candidature Equipages. **Piège : Indeed peut aussi cocher d'avance des offres suggérées**, comme HelloWork. Ajoutée au suivi sans relance
- Bessière : pas de numéro trouvé, **relancée via la messagerie Indeed** le 15/10 avec la question « brut ou net ? »
- **Central Pose** : candidature spontanée **envoyée par mail** à info@centralpose.fr (seule adresse publique), avec demande de transmission au responsable d'agence, lettre redatée
- **Valorem Partners** (assistant SAV, Plaisir, intérim de 3 mois en vue d'un CDI, 32 500 €, le meilleur match du jour) et **Robert Half** (ADV pour un industriel, Coignières, intérim) déposées par Nicolas sur HelloWork et le site Robert Half
- Dossiers prêts mais **non retenus par Nicolas** : Equans / Bouygues E&S (assistant technique génie civil, Guyancourt) et Talysio (assistant achat, Guyancourt), notés en pistes
- Pistes ajoutées : Lynx RH (ADV, Trappes), DPD (CDD administratif, Trappes), Keolis (ADV, Le Chesnay), MEDIVIE (assistant commercial, Coignières). Une douzaine d'offres écartées (trop loin, terrain, anglais au cœur du poste)
- Agenda nettoyé : Domaliance et Eiffage retirés des rappels, un rappel commun le 22/10
- Total au 15/10 : 22 candidatures, 4 refus, 18 en cours

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
