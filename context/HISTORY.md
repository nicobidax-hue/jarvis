# Workspace History

> Journal chronologique de toutes les sessions et décisions importantes.
> Le plus récent en haut. Mis à jour automatiquement par Claude.
>
> **Comment ça marche :** Quand je lance la commande `/update` après une session importante, ou quand je raconte un changement significatif, Claude ajoute une entrée ici automatiquement. Je n'ai pas à écrire ce fichier manuellement.

---

## 2026-10-09

### Prochaine session
- 12/10 à 9h30 : appeler la DRH de la mairie de Villepreux
- Central Pose : appeler l'agence de Plaisir pour avoir un nom, puis envoyer la candidature spontanée
- Continuer la prospection BTP (3 à 5 entreprises par jour)
- 15/10 : relances TMD et Bessière ; 16/10 : relances Guy Hoquet, Fed Group, AGSE, Domaliance
- Site Atelier Facette (quand Nicolas le souhaite) : chercher des photos de chantiers, trouver le réglage des notifications email de Netlify, aperçu des pages sur l'accueil, plus tard dépôt GitHub dédié au site

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
