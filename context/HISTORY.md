# Workspace History

> Journal chronologique de toutes les sessions et décisions importantes.
> Le plus récent en haut. Mis à jour automatiquement par Claude.
>
> **Comment ça marche :** Quand je lance la commande `/update` après une session importante, ou quand je raconte un changement significatif, Claude ajoute une entrée ici automatiquement. Je n'ai pas à écrire ce fichier manuellement.

---

## 2026-10-08

### Recherche d'offres et candidature TMD Sécurité
- Première recherche Indeed autour de Villepreux. Pistes retenues : TMD Sécurité (assistant administratif, Bois-d'Arcy, CDI dès janvier 2027, priorité), Bessière (assistant logistique, Méré), support EDI via Michael Page (Plaisir, plus difficile)
- Enseignement : les postes de bureau dans des entreprises du bâtiment valorisent le mieux le profil de Nicolas, piste à creuser
- Candidature TMD Sécurité préparée dans `livrables/taff/2026-10-08_candidature-tmd-securite/` : CV adapté (titre, profil, parkings mis en avant) et lettre de motivation, en .docx et .pdf
- CV v2 plus attractif (`cv-nicolas-bideau_tmd-securite_v2`) : bandeau de chiffres clés, Batidax en tête dans « Expérience en gestion d'entreprise », accroche « 6 ans de gestion d'entreprise dans le bâtiment », postes anciens réduits à une ligne. La v1 est conservée
- Mise en cohérence : CONTEXT.md corrigé de « 15 ans » à 12 ans d'expérience dans le bâtiment (comme les CV), relances clients chez Batidax confirmées par Nicolas
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
