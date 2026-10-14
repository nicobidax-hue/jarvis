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

## Bon à savoir

- n8n n'est accessible que depuis ce PC (`127.0.0.1` dans le fichier). Pour recevoir des données d'Internet (webhooks, séance 7), il faudra un tunnel ou un serveur.
- Les workflows ne tournent que si le PC est allumé et Docker lancé. Pour un client, on installera n8n sur un serveur, avec le même fichier.
- Les identifiants enregistrés dans n8n (Gmail, clés API) restent dans le volume, jamais dans ce dossier ni dans Git.
- Licence : n8n est gratuit pour un usage interne et pour construire des workflows pour des clients. Revendre l'accès à n8n lui-même est encadré (à voir en séance 19).
