# ReseauAIO

Plateforme interne de présence locale et réseaux sociaux : fiches Google Business Profile, avis, publications, commentaires, messagerie et statistiques des magasins, depuis un seul outil.

Le cadrage du projet est dans [`docs/cadrage.md`](docs/cadrage.md).

## Prérequis

- PHP 8.3+ (extensions `pdo_mysql`, `intl`, `mbstring`)
- Composer 2
- Node 22+
- MySQL 8 ou MariaDB 10.11+

## Installation

```bash
git clone <url-du-depot> reseau-aio && cd reseau-aio
cp .env.example .env    # puis renseigner DB_* (base `reseau_aio` par défaut)
composer setup          # dépendances, clé, migrations, build du front
```

Créer un premier utilisateur (l'inscription publique est désactivée) :

```bash
php artisan tinker --execute="App\Models\User::factory()->create(['name' => 'Admin', 'email' => 'admin@example.com', 'password' => 'changer-moi'])"
```

## Développement

```bash
composer dev    # serveur, file d'attente, logs et Vite
composer test   # Pint + PHPStan + tests
```
