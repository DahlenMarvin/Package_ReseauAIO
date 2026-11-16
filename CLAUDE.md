# ReseauAIO — Plateforme interne de présence locale & réseaux sociaux

Outil interne LEDLC pour piloter la présence en ligne des 41 magasins
(fiches, avis, publications, commentaires, messages, statistiques) sur
**Google Business Profile** et **Meta (Facebook + Instagram)**.

- Cahier des charges : [`docs/cadrage.md`](docs/cadrage.md). À relire avant toute nouvelle fonctionnalité ; les lots (L0 à L4) et les modules (M1 à M8) y sont définis.
- Objectif à terme : extraire le cœur métier en **package Laravel** installable dans l'application interne existante. Le code métier doit donc rester découplé de l'application hôte (voir « Architecture »).

## Stack

- PHP 8.3, Laravel 13, Livewire 4 + Flux UI, Tailwind 4, Fortify (auth).
- Base : **MySQL / MariaDB** (CI : MySQL 8.4). Les tests tournent par défaut en SQLite mémoire (`phpunit.xml`) ; la CI les rejoue sur MySQL.
- Qualité : PHPUnit, Pint, Larastan (niveau 7). `composer test` lance les trois.
- Langue : interface et documentation en **français** ; code (classes, méthodes, variables) en anglais.

## Commandes

- `composer test` : Pint + PHPStan + tests (à faire passer avant chaque commit).
- `composer lint` : formate le code.
- `npm run build` : compile le front. Les polices sont servies localement via Fontsource (pas de CDN).
- Environnement cloud Claude : `scripts/cloud-composer-install.sh` au lieu de `composer install` (les archives GitHub y sont bloquées).

## Architecture (règles à respecter)

- **Connecteurs par plateforme** : chaque plateforme (Google, Meta, puis Apple, Bing…) est un driver derrière une interface commune. Rien en dehors du connecteur ne connaît l'API d'une plateforme.
- **Client HTTP Laravel** (`Http::`) pour appeler les API Google et Meta, pas de SDK : on peut ainsi tout simuler avec `Http::fake()`. Aucun test n'appelle une vraie API (Google n'a pas de sandbox).
- **Historiser** les données collectées (avis, métriques) dans notre base : Google et Meta suppriment régulièrement des métriques.
- **Référentiel magasins** : source unique = SI LEDLC. Accès via une interface (contrat) pour pouvoir brancher la vraie source plus tard.
- **Secrets** : jetons OAuth chiffrés (cast `encrypted`), jamais en clair ni dans les logs.
- **Traitements asynchrones** (synchro, publication, collecte) dans des jobs en file d'attente, idempotents et rejouables.
- **Journal d'audit** pour toute action utilisateur qui modifie une plateforme externe.
- **RGPD** : les données clients (avis, messages) sont personnelles ; envoyer le minimum aux services IA.

@AGENTS.md
