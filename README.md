# n8n_to_render — déploiement en 1 clic (CA/FR)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/makdoud0304/n8n_to_render)

Ce dépôt permet de déployer **n8n** sur **Render** avec :
- un **service Web** Docker,
- une **base PostgreSQL** gérée par Render (plan *free*),
- (optionnel) un **disque persistant** monté sur `/home/node/.n8n`.

> **Région** : Render n’a pas (encore) de région Canada → on utilise **`oregon`** (latence correcte pour le Québec).  
> **Fuseau/locale** : `America/Toronto`, `fr`.

## Déploiement (1‑clic)
1. Clique sur le bouton **Deploy to Render** ci‑dessus.
2. Branche : **main**. Laisse Render créer **n8n** (Web) + **n8n-db** (Postgres).
3. Une fois en ligne, va dans **n8n → Environment** :
   - copie l’**URL publique** (lien violet en haut),
   - ajoute `WEBHOOK_URL` = cette URL (ex. `https://n8n-xxxxx.onrender.com/`).

## Option Disque persistant
Si ton plan le permet, ajoute un **Disk** et monte‑le sur `/home/node/.n8n` (1–2 GB suffisent) pour persister des fichiers locaux. (La base Postgres conserve déjà les données principales.)

## Variables importantes (déjà dans `render.yaml`)
- `N8N_BASIC_AUTH_ACTIVE=true`, `N8N_BASIC_AUTH_USER=admin`, `N8N_BASIC_AUTH_PASSWORD` (auto‑générée)  
- `N8N_ENCRYPTION_KEY` auto‑générée (garde‑la pour toute restauration)  
- `GENERIC_TIMEZONE=America/Toronto`, `N8N_DEFAULT_LOCALE=fr`

## Dépannage
- Le bouton ouvre un autre repo ? → Vérifie l’URL du bouton (doit pointer vers **makdoud0304/n8n_to_render**).
- Render n’affiche pas la config ? → `render.yaml` doit être **à la racine** et s’appeler **exactement** `render.yaml`.
- Repo privé ? → Render → **Account → Linked Repositories** : autorise explicitement `makdoud0304/n8n_to_render` (ou rends le repo public pendant le déploiement).
