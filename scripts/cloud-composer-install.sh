#!/usr/bin/env bash
# Installe les dépendances Composer dans l'environnement cloud de Claude Code.
#
# Pourquoi : dans cet environnement, les archives (zipball) GitHub sont bloquées,
# seul `git clone` des dépôts publics passe. On force donc Composer à installer
# depuis les sources git. phpstan/phpstan n'est publié qu'en archive : on le
# clone en superficiel et on le sert via un dépôt "path" dans un composer.json
# local (composer.sandbox.json, ignoré par git). composer.json et composer.lock
# versionnés ne sont pas modifiés.
#
# Inutile en local ou en CI : un simple `composer install` suffit.
set -euo pipefail

cd "$(dirname "$0")/.."
APP_DIR="$(pwd)"

PHPSTAN_VERSION="$(php -r '$l=json_decode(file_get_contents("composer.lock"),true); foreach($l["packages-dev"] as $p) if($p["name"]==="phpstan/phpstan") echo $p["version"];')"
PHPSTAN_DIR="${TMPDIR:-/tmp}/phpstan-${PHPSTAN_VERSION}"

composer config -g use-github-api false
composer config -g github-protocols https

if [ ! -f "${PHPSTAN_DIR}/composer.json" ]; then
    rm -rf "${PHPSTAN_DIR}"
    git -c advice.detachedHead=false clone -q --depth 1 --branch "${PHPSTAN_VERSION}" \
        https://github.com/phpstan/phpstan.git "${PHPSTAN_DIR}"
fi

PHPSTAN_DIR="${PHPSTAN_DIR}" PHPSTAN_VERSION="${PHPSTAN_VERSION}" php -r '
$j = json_decode(file_get_contents("composer.json"), true);
$j["repositories"] = [[
    "type" => "path",
    "url" => getenv("PHPSTAN_DIR"),
    "options" => ["symlink" => false, "versions" => ["phpstan/phpstan" => getenv("PHPSTAN_VERSION")]],
]];
file_put_contents("composer.sandbox.json", json_encode($j, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE)."\n");
'
cp composer.lock composer.sandbox.lock

export COMPOSER=composer.sandbox.json COMPOSER_NO_INTERACTION=1 COMPOSER_MAX_PARALLEL_HTTP=4
composer update phpstan/phpstan --prefer-source --no-scripts
composer install --prefer-source

echo "Dépendances installées dans ${APP_DIR}/vendor"
