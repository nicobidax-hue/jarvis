# livrables/

> Tout ce que Claude produit pour Nicolas est rangé ici.

---

## La règle d'or

| Type | Emplacement | Exemples |
|------|-------------|----------|
| **Inputs** (ce que je fournis) | `context/import/` | PDFs, exports, captures d'écran, anciens CV, notes |
| **Outputs** (ce que Claude produit pour moi) | `livrables/` | CV, sites, scripts, scripts vidéo, devis, posts |

Un document fourni ne va jamais dans `livrables/`. Un document produit ne va jamais dans `context/import/`.

---

## Organisation

| Dossier | Contenu |
|---------|---------|
| `sites-web/` | Sites internet (vitrine, landing pages, portfolio) |
| `applications/` | Outils, scripts, automatisations |
| `youtube/` | Briefs vidéo, scripts, hooks, calendrier éditorial |
| `reseaux/` | Livrables Instagram et TikTok |
| `batiment/` | Livrables pour la branche rénovation (résine, béton ciré) |
| `taff/` | Livrables pour la recherche d'emploi |

Les noms de dossiers sont volontairement sans accents, pour éviter les problèmes avec les scripts, Git et la synchronisation.

Si un livrable touche plusieurs thèmes, le ranger dans le thème de son **usage principal**.

---

## Convention de nommage des projets

Chaque projet a son propre sous-dossier :

```
AAAA-MM-JJ_nom-du-projet/
```

- **Date** : date de création du projet (format ISO, pour que le tri alphabétique soit chronologique)
- **Nom** : en minuscules, mots séparés par des tirets, sans accents ni espaces
- **Court et explicite** : on doit comprendre le contenu sans ouvrir le dossier

Exemples :

```
livrables/taff/2026-10-08_cv-cibles-2026/
livrables/batiment/2026-11-02_devis-beton-cire-cuisine/
livrables/sites-web/2026-12-01_site-vitrine-resine/
livrables/applications/2027-01-15_automatisation-relance-devis/
```

### Fichiers à l'intérieur d'un projet

- Même règle : minuscules, tirets, sans accents ni espaces
- Versions successives : suffixe `_v1`, `_v2`, etc. (ex. `cv-administratif_v2.pdf`)
- Version finale validée : suffixe `_final` (ex. `devis-dupont_final.pdf`)
- Un `README.md` dans le projet si besoin d'expliquer le contexte ou comment l'utiliser
