# Comparatif : logiciels de facturation gratuits à automatiser pour les artisans

> Étude du 2026-10-15. Objectif : choisir **un** logiciel de facturation gratuit, agréé par l'État (Plateforme Agréée), autour duquel construire des automatisations n8n à vendre aux artisans.
> Sources : surtout des comparatifs et pages d'éditeurs, souvent contradictoires sur les prix. Tout ce qui est marqué **à vérifier** doit être testé sur un vrai compte avant de s'engager.

---

## L'idée

1. L'artisan utilise un logiciel de facturation **gratuit** et conforme (émission et réception des factures électroniques).
2. Nicolas installe le logiciel et construit autour des automatisations n8n (acomptes, relances, factures fournisseurs par chantier, envoi au comptable).
3. L'artisan ne paie pas le logiciel, il paie l'installation et le temps gagné.

**Critère éliminatoire :** une API accessible sur l'offre gratuite. Sans API, n8n ne peut pas piloter le logiciel.

---

## Tableau comparatif

| Logiciel | Gratuit ? | Plateforme Agréée | API publique | Utilisable depuis n8n | Verdict |
|---|---|---|---|---|---|
| **Abby** | Seulement en micro-entreprise sans TVA et sans acomptes. Avec TVA : 15 €/mois minimum | Oui | Oui, documentée (docs.abby.fr), clé API créée dans le compte | Oui (HTTP Request + clé) | **Finaliste affaibli** : pas gratuit pour un artisan type |
| **Qonto Facturation** | Oui, même sans compte bancaire Qonto | Oui (depuis le 18/12/2025) | Oui, très documentée (docs.qonto.com) : devis, factures clients, Factur-X, webhooks | Oui | **Finaliste**, mais accès API sans compte bancaire Qonto non confirmé (à vérifier) |
| **Tiime** | Oui (fonctions premium à environ 18 €/mois) | Oui | Non : API réservée aux éditeurs de logiciels, sur demande | Seulement via le connecteur officiel Make | Plan B si on accepte Make au lieu de n8n |
| **Indy** | Oui (palier à 0 €) | Oui | Non, ni Zapier ni Make | Non | Écarté |
| **Shine Facture** | Oui | Oui (depuis mai 2026) | Aucune trouvée | Non | Écarté (sauf surprise) |
| **Henrri** | Oui | **Non** selon plusieurs sources | Aucune trouvée | Non | Écarté |
| **Axonaut** | Non (35 à 70 €/mois selon les sources) | Oui | Non vérifié | Non vérifié | Hors sujet (payant) |

---

## Les deux finalistes en détail

### Abby

- **Pour :** pensé pour les indépendants, API documentée en français, SDK officiel, intégration Make officielle, modèle Airtable vers Abby publié par l'éditeur (preuve qu'ils encouragent l'automatisation).
- **Contre :** les sources se contredisent sur le palier qui donne accès à l'API. Si l'API est payante, l'artisan paie un abonnement en plus de ton service.
- **À vérifier :** créer un compte gratuit, aller dans « Intégrations » et voir si la création d'une clé API est possible.

**Page tarifs officielle lue le 2026-10-15** (abby.fr/tarifs) :

| Offre | Prix HT/mois | Ce qui compte pour un artisan |
|---|---|---|
| Basique | 0 € | Devis et factures illimités, facturation électronique. **Pas de factures d'acompte** (déduit de la page) |
| Start | 9 € | + factures d'acompte (déduit), envoi des factures par e-mail, paiement par carte |
| Pro | 15 € | + relances d'impayés, signature électronique (2 par mois), connexion bancaire |
| Business | 33 € | + signature illimitée, multi-utilisateurs, stocks |

- **Micro-entreprise avec TVA : pas d'offre gratuite**, on commence à Pro (15 €/mois). Le gratuit ne concerne que les micro-entreprises en franchise de TVA.
- Pas encore disponibles (« Bientôt ») : export FEC pour l'expert-comptable, récupération des factures fournisseurs par e-mail.
- API : n'apparaît dans aucune offre, seulement en pied de page. « Automatisation / intégrations » est en bêta.
- Factures de situation et multi-taux de TVA : non mentionnés.
- **Conclusion :** Abby n'est réellement gratuit que pour un micro-entrepreneur sans TVA et sans acomptes. Pour un artisan type (TVA, acomptes), il faut compter 15 €/mois.

**Page Qonto Facturation gratuite lue le 2026-10-15** (qonto.com/fr/invoicing/free-software) :

- « 100 % gratuit, sans condition », « ni carte bancaire ni compte bancaire », devis et factures illimités
- **Réception des factures fournisseurs incluse** (« Vos factures fournisseurs arrivent automatiquement dans Qonto »)
- Relances « en un clic » (manuelles), relances automatiques non mentionnées
- Non mentionnés : factures d'acompte, TVA à 10 % et 5,5 %, factures de situation, export comptable, API sur l'offre gratuite (les « 2 000 intégrations » sont présentées avec le compte pro payant)

### Qonto Facturation

- **Pour :** l'API la plus solide du lot (devis, factures, avoirs, Factur-X, **webhooks** pour réagir en temps réel, environnement de test « sandbox »). Grande marque, rassurante pour un artisan. Un serveur MCP non officiel existe déjà (`qontoctl`), utile plus tard pour un assistant IA.
- **Contre :** les relances et factures récurrentes sont payantes. **C'est en fait une opportunité** : les relances deviennent une automatisation que tu fournis. Risque : Qonto est d'abord une banque et peut pousser l'artisan vers un compte payant.
- **À vérifier :** un compte « facturation seule » (sans compte bancaire) donne-t-il accès à l'API ? À tester en créant un compte, sinon question au support.

---

## Test du sandbox Qonto (2026-10-15)

App « automatisation artisans » créée sur le Developer Portal (cas d'usage « Offer Qonto features to your customers »), redirection vers n8n (`http://localhost:5678/rest/oauth2-credential/callback`), identifiants dans `.env` (`QONTO_SANDBOX_*`, staging token vérifié par un appel réel).

Scopes retenus (aucun accès à l'argent) : `offline_access`, `attachment.read`, `client.read`, `client.write`, `client_invoice.write`, `client_invoices.read`, `membership.read`, `product.read`, `supplier_invoice.read`, `webhook`. Écarté volontairement : `organization.read` (sensible : solde, IBAN, transactions).

Résultats dans l'application web du sandbox (Accounts receivable) :

| Critère artisan | Résultat |
|---|---|
| Client particulier (sans SIREN) | ✅ Accepté |
| Facture d'acompte | ✅ Type « Deposit invoice ». Acompte saisi **en montant** (EUR), pas en pourcentage du devis |
| TVA 10 % et 5,5 % | ✅ Taux proposés : 0, 2,1, 5,5, 8,5, 10, 20 % et « Other » |
| Facture de situation | ⚠️ Type « Partial invoice » (une partie du total d'un projet en cours). Pas vu de cumul d'avancement ni de retenue de garantie |
| Mentions légales | ✅ Pénalités de retard et indemnité de 40 € ajoutées automatiquement, facture en français |
| Assistant IA intégré | Qonto propose déjà « Create my client invoices from a file » : à ne pas vendre comme une valeur ajoutée |

Pistes d'automatisation repérées pendant le test :
- **Acompte calculé automatiquement** : 30 % du devis signé, réparti selon les taux de TVA du devis (le formulaire n'a qu'une ligne et un seul taux, alors qu'un chantier peut mélanger 10 % et 5,5 %)
- **Relances automatiques** (payantes chez Qonto)

**Réserve importante :** le sandbox simule un compte Qonto complet. Il reste à vérifier que l'acompte et la « Partial invoice » sont bien dans l'offre **gratuite** de Qonto Facturation.

---

## Critères propres aux artisans (à vérifier sur les finalistes)

Ces points font la différence avec un logiciel pensé pour les freelances du conseil :

- **Factures d'acompte** liées au devis signé (acompte de 30 % à la commande)
- **Taux de TVA réduits** de la rénovation (10 % et 5,5 %) sur une même facture
- **Factures de situation** (avancement de chantier) et retenue de garantie, pour les chantiers longs
- **Signature électronique des devis** (souvent payante)
- **Export vers l'expert-comptable**
- **Programme partenaires** ou d'apporteurs d'affaires (commission, clients envoyés)

---

## Prochaines étapes proposées

1. **Tests réels (30 min) :** créer un compte gratuit Abby et un compte Qonto Facturation, vérifier l'accès à l'API et les critères artisans ci-dessus.
   - **Blocage constaté le 2026-10-15 :** les inscriptions demandent un SIREN ou un SIRET, que Nicolas n'a pas encore. Attention aussi au parcours « Création de micro-entreprise » de Qonto (payant, et immatricule l'entreprise), à ne pas confondre avec la facturation gratuite.
   - **Contournement :** le **Developer Portal de Qonto** (developers.qonto.com) permet de s'inscrire avec une simple adresse e-mail (validation en 48 h environ), puis donne accès à un **environnement de test (sandbox)** : une fausse entreprise avec ses données, une application web et l'API. Idéal pour apprendre et construire les démos sans SIRET. Les appels API en sandbox demandent un en-tête supplémentaire `X-Qonto-Staging-Token`.
   - **Contournement impossible (confirmé par le chat Qonto le 2026-10-15) :** le Developer Portal exige lui aussi un SIRET. Tests réels reportés à l'ouverture du statut, ou chez un artisan du réseau qui a déjà un SIRET.
2. **Choix d'un seul logiciel**, installé pour Atelier Facette (premier client, futur cas concret).
3. **Séance IA :** premier appel à l'API du logiciel retenu depuis n8n (même méthode que la séance 4 avec l'Annuaire des entreprises), puis première automatisation (ex. relance des factures impayées avec validation humaine).
4. **Phase 3 du parcours :** démo, page de l'offre, 3 ou 4 artisans du réseau interrogés pour valider le besoin et le prix.

---

## Sources

- [Abby, documentation API](https://docs.abby.fr/)
- [Abby, authentification API](https://docs.abby.fr/api/authentification)
- [Abby, avis et test (comparatif-facture-electronique.fr)](https://www.comparatif-facture-electronique.fr/abby-avis-test/)
- [Abby, tarifs (guidefacturation.com)](https://guidefacturation.com/logiciels/abby/)
- [Qonto, documentation API : synchroniser les factures clients](https://docs.qonto.com/get-started/business-api/use-cases/sync-client-invoices)
- [Qonto, documentation API : créer un devis](https://docs.qonto.com/api-reference/business-api/endpoints/quotes/create-a-quote)
- [Qonto, logiciel de facturation gratuit](https://qonto.com/fr/invoicing/free-software)
- [Qonto Facturation sans compte pro (open-espace.fr)](https://open-espace.fr/qonto-facturation-gratuite-et-illimitee-peut-on-lutiliser-sans-ouvrir-de-compte-pro/)
- [Tiime, « Proposez-vous une API ? »](https://support.tiime.fr/fr/articles/26240-proposez-vous-une-api)
- [Tiime, intégration Make](https://www.make.com/en/integrations/tiime-apps)
- [Indy, facturation (meetergo)](https://meetergo.com/fr/blog/indy-facturation)
- [Shine, facturation électronique](https://shine.fr/facturation-electronique)
- [Henrri, avis (comparatif-facture-electronique.fr)](https://www.comparatif-facture-electronique.fr/henrri-facturation-electronique-avis/)
- [Plateformes agréées gratuites (ma-facture-electronique.org)](https://ma-facture-electronique.org/plateforme-agreee/gratuite-possible/)
