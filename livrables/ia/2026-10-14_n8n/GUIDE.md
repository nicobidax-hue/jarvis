# n8n en local avec Docker

Installé pendant la séance IA 3 (14/10/2026).

## Les 4 mots à retenir

| Mot | Ce que c'est | Comparaison bâtiment |
|-----|--------------|----------------------|
| **Image** | Le modèle de n8n, prêt à l'emploi, téléchargé une fois | Le plan et le kit de matériaux |
| **Conteneur** | Une copie de l'image qui tourne, isolée du reste du PC | La maison construite à partir du plan |
| **Volume** | Le dossier où n8n garde tes données, séparé du conteneur | Le garde-meuble : on peut démolir et reconstruire la maison, les meubles restent |
| **docker-compose.yml** | La fiche qui décrit comment lancer le conteneur | Le cahier des charges du chantier |

Conséquence pratique : supprimer ou mettre à jour le conteneur ne fait **pas** perdre les workflows, ils sont dans le volume `n8n_data`.

## Utilisation au quotidien

1. Lancer **Docker Desktop** (attendre que la baleine indique « Engine running »)
2. Dans un terminal, depuis ce dossier :

| Action | Commande |
|--------|----------|
| Démarrer n8n | `docker compose up -d` |
| Voir s'il tourne | `docker compose ps` |
| Lire ses messages (en cas de problème) | `docker compose logs -f` (Ctrl+C pour sortir) |
| Arrêter n8n | `docker compose down` |
| Mettre à jour n8n | `docker compose pull` puis `docker compose up -d` |

3. Ouvrir **http://localhost:5678** dans le navigateur

## Avast et les certificats (piège rencontré le 14/10)

Le Bouclier Courrier d'Avast intercepte les connexions vers les serveurs de mail et présente son propre certificat à la place de celui de Google. Windows lui fait confiance, le conteneur n8n (un Linux isolé) non : erreur « unable to verify the first certificate ».

Solution retenue : le certificat **public** d'Avast est copié dans `certs/avast-root.pem` et donné à n8n (`NODE_EXTRA_CA_CERTS` dans `docker-compose.yml`). Dans n8n, le compte SMTP Gmail utilise le **port 587, SSL/TLS désactivé** (la connexion est quand même chiffrée, via STARTTLS). Le port 465 ne marche pas : Avast y présente une racine « Untrusted ».

Si Avast est réinstallé ou change de certificat, réexporter le certificat « Avast Web/Mail Shield Root » depuis Windows. Le même problème se rencontre dans les PME équipées d'un antivirus ou d'un proxy qui inspecte le trafic.

## Brancher Gmail en OAuth (séance IA 5, 15/10)

Pour **lire** des mails, n8n passe par OAuth plutôt que par un mot de passe d'application : un badge limité à certains droits, révocable, au lieu d'un double complet des clés.

| Élément OAuth | Ce que c'est | Sur un chantier |
|---|---|---|
| Client ID + secret | La carte d'identité de n8n auprès de Google | La carte pro présentée au gardien |
| Écran de consentement | La page où l'on autorise n8n | Le propriétaire qui signe l'autorisation |
| Scopes | Les droits accordés | Les portes que le badge ouvre |
| URI de redirection | L'adresse où Google renvoie n8n après l'accord | Le bureau où le gardien dépose le badge |
| Jeton | L'accès lui-même, temporaire et révocable | Le badge nominatif |

Procédure suivie (projet Google Cloud `n8n-local`, sans facturation ni essai gratuit) :

1. console.cloud.google.com, nouveau projet, puis **API et services**, **Bibliothèque**, **Gmail API**, **Activer**
2. **Écran de consentement OAuth**, **Commencer** : nom de l'application, cible **Externe**, coordonnées
3. **Audience**, **Utilisateurs test** : ajouter son adresse Gmail (sinon erreur `access_denied`)
4. **Clients**, **Créer un client**, type **Application Web**, URI de redirection : `http://localhost:5678/rest/oauth2-credential/callback` (une lettre de travers donne `redirect_uri_mismatch`). Télécharger le JSON tout de suite : le secret n'est plus affiché ensuite. Le ranger hors du workspace
5. Dans n8n : credential **Gmail OAuth2 API**, coller l'ID et le secret, **Sign in with Google**, passer l'avertissement « application non validée » (c'est la nôtre)
6. Consentement granulaire : seulement **libellés** et **Consulter, rédiger et envoyer des e-mails** (pas l'accès total avec suppression définitive). Un droit manquant plus tard donnera une erreur 403, il suffira de reconnecter en le cochant

Pièges :
- En mode Test, la connexion **expire tous les 7 jours** : rouvrir le credential et refaire **Sign in with Google**
- La console Google ne se chargeait pas dans le navigateur habituel (une extension) : fenêtre privée
- Le bandeau « essai gratuit 300 $ » est inutile : l'API Gmail est gratuite, aucune carte à donner

Workflow d'exercice « Séance 5 - Alertes HelloWork » : Gmail **Get many** (Search : `from:notification@emails.hellowork.com newer_than:7d`), **Filter** (objet contient ADV, Assistant ou Administra, en OR, Ignore Case), **Edit Fields** :

```
date       {{ DateTime.fromMillis(Number($json.internalDate)).setZone('Europe/Paris').toFormat('dd/MM/yyyy HH:mm') }}
entreprise {{ $json.Subject.split(' recrute ')[0].replace('Nicolas, ', '') }}
poste      {{ $json.Subject.split(' recrute ')[1].replace(/^une? /, '').trim() }}
```

Limite : l'objet ne montre que la première des 3 à 14 offres d'une alerte, et deux alertes peuvent avoir le même objet (doublons). Lire le corps du mail, ce sera la séance 6 (IA).

## Ajouter l'IA : Gemini (séance IA 6, 15/10)

Fournisseur : **Google Gemini**, offre gratuite. Clé créée sur aistudio.google.com/apikey dans le projet `n8n-local` (sans facturation : refuser « Set up billing »). Clé rangée dans `.env` (`GEMINI_API_KEY`) et dans le credential n8n **Google Gemini(PaLM) Api**. Contrepartie du gratuit : Google peut utiliser les données envoyées, donc uniquement des données publiques (jamais celles d'un client).

Pièges rencontrés :
- **Mistral** : son offre gratuite ne donne plus accès à l'API (clés grisées, plans payants à 15 ou 24 €)
- **Modèles** : `gemini-2.5-flash` et `-lite` fermés aux nouveaux comptes (erreur 404), `gemini-3-flash-preview` surchargé (erreur 503). Modèle retenu : **`gemini-3.5-flash-lite`**. Jamais de modèle « preview » dans un workflow qui tourne seul
- **Prompt en mode Fixed** : `{{ $json.texte }}` envoyé tel quel, l'IA ne reçoit pas le mail (sortie vide). Le champ doit être en **Expression** (texte vert). Indice : un nombre de tokens trop bas
- Un nœud amont modifié (Simplify désactivé) casse les nœuds aval : `Subject` devient `subject`

Workflow « Séance 6 - Offres HelloWork par l'IA » :

1. **Gmail Get many**, **Simplify désactivé** (sinon pas de corps du mail), Limit 2 pendant les tests
2. **Edit Fields « nettoyeur »** : retirer les liens avant d'envoyer à l'IA (17 096 → 2 318 caractères, environ 86 % de tokens en moins)
   ```
   subject  {{ $json.subject }}
   texte    {{ $json.text.replace(/\[https?:[^\]]*\]/g, '').replace(/https?:\S+/g, '').replace(/\n{2,}/g, '\n') }}
   gain     {{ $json.text.length }} → {{ …même chaîne que texte… .length }}
   ```
   Dans une chaîne de méthodes, `.length` (propriété, sans parenthèses) se met toujours en dernier : il transforme le texte en nombre
3. **Basic LLM Chain** : message **System** (rôle, contexte, tâche, règles, exemples) et **User Message** en mode Expression (`Voici le texte de l'alerte : {{ $json.texte }}`), **Require Specific Output Format** activé
   - Chat Model : **Google Gemini Chat Model**, `gemini-3.5-flash-lite`
   - Output Parser : **Structured Output Parser**, exemple JSON `{"offres":[{"poste","entreprise","ville","departement","contrat","salaire","bloc"}]}`
4. **Split Out** sur `output.offres` : une ligne par offre

Résultat : 25 offres extraites de 2 alertes (11 + 14, vérifié à la main), au lieu de 2 avec l'objet. Environ 840 tokens par alerte. Règle ajoutée ensuite dans le message système : retirer les retours à la ligne et les badges HelloWork (« Super recruteur ») du nom de l'entreprise, avec l'exemple « Groupe OSMAIA ». Le badge est parti, pas le retour à la ligne.

Ratés restants : « CDD - Correspondant Administratif » et « … - Arbres et Paysages - 91 » gardent contrat ou lieu, « Groupe\nOSMAIA » garde son retour à la ligne. L'IA n'est pas déterministe : contrôler sur plusieurs exécutions, et faire dans un nœud après l'IA ce qu'un `replace` fait à coup sûr.

À faire : nettoyage après l'IA, doublons d'une alerte à l'autre, filtre par poste et par département.

## Bon à savoir

- n8n n'est accessible que depuis ce PC (`127.0.0.1` dans le fichier). Pour recevoir des données d'Internet (webhooks, séance 7), il faudra un tunnel ou un serveur.
- Les workflows ne tournent que si le PC est allumé et Docker lancé. Pour un client, on installera n8n sur un serveur, avec le même fichier.
- Les identifiants enregistrés dans n8n (Gmail, clés API) restent dans le volume, jamais dans ce dossier ni dans Git.
- Licence : n8n est gratuit pour un usage interne et pour construire des workflows pour des clients. Revendre l'accès à n8n lui-même est encadré (à voir en séance 19).
