# Note de cadrage — Plateforme interne de présence locale & réseaux sociaux

Nov 15, 2026 · @Marvin · Version 0.1 — document de travail

## Synthèse

LEDLC construit en interne une plateforme qui centralise la présence en ligne de ses 41 magasins : fiches, avis, publications, commentaires, messages et statistiques, depuis un seul outil. Le premier périmètre couvre **Google Business Profile** et **Meta (Facebook + Instagram)**, avec une couverture fonctionnelle complète sur ces deux écosystèmes. Les autres canaux (Apple Plans, Bing, TripAdvisor, store locator…) viendront dans des lots suivants.

Le projet reprend le modèle des plateformes du marché (PinMeTo, Partoo, Uberall), mais il est branché directement sur le référentiel magasins de LEDLC et reste maîtrisé en interne. Le principal risque n'est pas technique : il tient à l'obtention des accès API et à leur maintenance dans le temps, car Google et Meta retirent régulièrement des fonctions.

## Contexte et enjeux

Avec 41 magasins, chacun a sa fiche Google et souvent sa page Facebook ou son compte Instagram. Les avoir à jour, répondre aux avis et animer ces canaux un par un est impossible à tenir à la main.

- **Visibilité locale** : pour un commerce de proximité, la fiche Google est souvent le premier point de contact (horaires, itinéraire, appel). Un horaire faux, un jour férié par exemple, se traduit directement en client perdu.
- **E-réputation** : un avis sans réponse, surtout négatif, pèse sur la note et sur l'image de l'enseigne. Aujourd'hui, ni le délai ni le taux de réponse ne sont mesurés de façon consolidée.
- **Animation** : publier une offre ou un événement sur 41 fiches et pages demande aujourd'hui autant de manipulations que de magasins.
- **Pilotage** : les statistiques sont dispersées entre les consoles Google et Meta, et il n'existe pas de vue comparative entre magasins.
- **Cohérence SI** : les informations magasins existent déjà dans le SI. Elles doivent être la source unique, et non ressaisies dans chaque plateforme.

Le sujet relève du Pôle Digital (usage, contenus, animation) et de la direction Transformation, Organisation et SI (outil, intégrations, données).

## Objectifs et indicateurs de succès

L'outil doit permettre de piloter les 41 magasins sur Google et Meta sans ouvrir aucune autre console. Les cibles ci-dessous sont des propositions à valider avec le Pôle Digital, après une mesure de la situation de départ.

| Objectif | Indicateur | Cible proposée |
| --- | --- | --- |
| Fiches fiables | Part des fiches Google conformes au référentiel (horaires, coordonnées, attributs) | 100 %, écarts corrigés sous 24 h |
| Réactivité sur les avis | Taux de réponse aux avis Google et Facebook | ≥ 95 % |
| Réactivité sur les avis | Délai moyen de réponse | < 48 h (< 24 h pour les avis ≤ 2 étoiles) |
| Réputation | Note moyenne Google du réseau | Mesure initiale, puis progression suivie par magasin |
| Réactivité sur les messages | Délai de première réponse Messenger / Instagram | < 24 h (fenêtre de réponse Meta) |
| Animation | Publications par magasin et par mois | À définir avec le Pôle Digital |
| Productivité | Temps passé sur la gestion de la présence locale | Mesure avant/après |
| Adoption | Responsables de magasin actifs dans l'outil chaque mois | ≥ 80 % |

## Benchmark PinMeTo / Partoo / Uberall

Les trois solutions couvrent le même socle : fiches, avis, publications locales, messagerie, analytics et store locator. Elles se distinguent par leur canal d'origine et par leurs modules avancés, et aucune ne publie ses tarifs.

|  | [Partoo](https://www.lafabriquedunet.fr/logiciel/partoo) | [Uberall](https://uberall.com/en) | [PinMeTo](https://www.pinmeto.com/products/local-social-media-management/) |
| --- | --- | --- | --- |
| Origine | Paris, 2014 | Berlin | Malmö (Suède), 2013 |
| Point fort | Diffusion des fiches, puis avis et messagerie | Plateforme de données de localisation, avec réseau d'annuaires très large | Publication locale multi-réseaux |
| Fiches / diffusion | Google, Apple Plans, Waze, annuaires | 150+ annuaires, dont Google, Apple Plans, Yelp, moteurs IA | 100+ réseaux |
| Avis | Google, Facebook, Tripadvisor en natif ; réponses IA et automatiques | Lecture, réponse, analyse ; assistant IA | Suivi, alertes, réponse, analyse de sentiment |
| Collecte d'avis | Review Booster : SMS, QR code par établissement, API | Oui | Demandes d'avis |
| Publications | Google, Facebook, Instagram | Local social, y compris posts Apple Plans | Facebook, Instagram, LinkedIn, Google ; envoi en masse, champs dynamiques, assistant IA |
| Messagerie | Messagerie multicanale + agent IA « Jim » | Messenger, site web, pages locales ; historique par client | Conversations sur 100+ réseaux |
| Analytics | Statistiques ; reporting jugé perfectible par les utilisateurs | Score de performance, estimation du CA, part de voix IA | Insights, mots-clés, suivi des concurrents |
| Modules en plus | Store locator, pages locales, benchmark concurrentiel, app mobile | Store locator, pages locales SEO, social ads, GEO Studio (visibilité IA), agent UB-I | Store locator, pages locales, PLACES AI |
| Modèle commercial | Sur devis, dégressif ; engagement 12 mois reconduit | Sur devis ; offre d'entrée à partir de 25 établissements | Sur devis |

**Ce qu'on retient pour LEDLC.** Le cœur commun (fiches, avis, publications, messagerie, analytics) est entièrement réalisable avec les API Google et Meta. Ce qui ne se reproduit pas en interne, c'est la diffusion vers des dizaines d'annuaires, qui repose sur des accords commerciaux. Les tendances 2026 à intégrer dès la conception sont l'IA partout (réponses, rédaction, synthèses) et la visibilité dans les moteurs de réponse IA.

## Ce que permettent les API Google et Meta, et leurs limites

Les API couvrent l'essentiel de ce que font les solutions du marché sur ces deux canaux. Trois manques structurants sont à connaître dès maintenant : Google n'a plus ni messagerie ni Q&R par API, et Meta a retiré une partie des métriques d'audience.

| Canal / API | Ce qui est possible | Limites et points d'attention |
| --- | --- | --- |
| Google — Account Management + Business Information | Lister les comptes et établissements ; lire et modifier les fiches (horaires, horaires exceptionnels, coordonnées, catégories, attributs, description, liens) | Accès à demander à Google, avec quotas ; pas d'environnement de test (sandbox) |
| Google — Reviews | Lister les avis, lire note et texte, répondre, supprimer une réponse ; motif de refus d'une réponse exposé depuis 2026 | Uniquement pour les établissements vérifiés ; 50 avis par page |
| Google — Local Posts | Posts « actualité », événement, offre, alerte ; posts récurrents ; suppression | Les médias doivent être à une URL publique ; posts « produit » impossibles par API ; un post peut être rejeté par modération |
| Google — Performance | Métriques quotidiennes par fiche (vues Recherche/Maps, appels, itinéraires, clics site…) ; mots-clés de recherche | Pas de statistiques par post ; historique limité côté Google, d'où la nécessité de stocker nous-mêmes |
| Google — Notifications, Verifications, Place Actions | Alertes en temps réel (nouvel avis, modification de fiche par Google) ; vérification ; liens d'action (réservation, commande) | — |
| Google — fonctions arrêtées | — | Q&R fermées par API depuis le 3 novembre 2025 ; messagerie (Business Messages) arrêtée en 2024 (selon nos connaissances, à confirmer) |
| Facebook — Pages API | Publier (texte, photo, vidéo, lien), programmer, lire et répondre aux commentaires, masquer ou supprimer | Jetons de page à gérer ; rôle « créer du contenu » requis sur chaque page |
| Facebook — Messenger API | Boîte de réception, réponses, webhooks en temps réel | Règles de messagerie Meta (fenêtre de réponse standard de 24 h, à vérifier) |
| Facebook — Insights | Statistiques de page et de publication (vues, engagement…) | Nombreuses métriques retirées : abonnés et impressions (nov. 2025), portée unique et autres (15 juin 2026) ; pages de moins de 100 mentions J'aime sans insights ; données mises à jour toutes les 24 h |
| Facebook — Avis (recommandations) | Lecture historiquement possible | Plusieurs champs d'avis signalés comme retirés par les connecteurs du marché : à vérifier en lot 0 |
| Instagram — API (connexion via Facebook) | Publier (image, carrousel, reel), lire et répondre aux commentaires, mentions, recherche de hashtags, insights compte et média, messages via la plateforme Messenger | Comptes Pro (Business/Creator) reliés à une page Facebook ; 100 publications API par 24 h et par compte ; images JPEG uniquement |

**Choix recommandé pour Instagram** : la connexion via Facebook (Facebook Login for Business), car c'est la seule qui donne les insights du compte, les mentions et la recherche de hashtags.

**Accès à obtenir** (à lancer dès le lot 0, c'est le délai le plus incertain) :

- Google : projet Google Cloud + formulaire de demande d'accès à l'API Business Profile, puis attribution des quotas.
- Meta : application Meta de type Business, Business Manager LEDLC vérifié, permissions pages et Instagram. Pour un outil réservé aux comptes de LEDLC, l'accès standard devrait suffire et éviter une revue d'application complète. Point à confirmer.

## Périmètre

Le premier périmètre couvre tout ce que Google et Meta permettent, pour les 41 magasins et la page de marque. L'outil est pensé dès le départ pour accueillir d'autres canaux.

**Dans le périmètre (lots 1 à 3)**

- Canaux : Google Business Profile, pages Facebook (marque + pages locales), comptes Instagram professionnels.
- Établissements : les 41 magasins. Les sites de production, le futur Hub logistique et les nouvelles ouvertures sont à intégrer s'ils ont une fiche Google.
- Fonctions : référentiel et synchronisation des fiches, avis, publications, commentaires, messagerie, analytics, IA, administration (détaillé plus bas).
- Utilisateurs : siège (Pôle Digital, direction), responsables de secteur, responsables de magasin.

**Hors périmètre initial (lot 4 et au-delà)**

- Apple Business Connect, Bing Places, Waze, TomTom et annuaires. API réservées aux partenaires ou inexistantes : mise à jour manuelle ou par fichier en attendant.
- TripAdvisor, LinkedIn, TikTok.
- Store locator et pages locales SEO sur le site e-commerce, à articuler avec le projet de plateforme e-commerce.
- Publicité locale (social ads), veille concurrentielle, visibilité dans les moteurs de réponse IA.
- Gestion de la communication RH ou corporate sur les réseaux sociaux (hors présence locale).

## Périmètre fonctionnel détaillé par module

L'outil compte huit modules qui reprennent l'ensemble des fonctions des solutions du marché sur Google et Meta. Le lot indiqué entre crochets est une proposition de phasage.

### M1 — Référentiel et fiches établissements

- Fiche maître par magasin : nom, adresse, GPS, téléphone, site, catégories, description, attributs, services, liens de réservation ou de commande, photos (logo, couverture, intérieur, produits). \[L1\]
- Horaires normaux, horaires exceptionnels (jours fériés, inventaires, travaux) et fermetures temporaires, saisis une fois et poussés partout ; modèles d'horaires réutilisables par groupe de magasins. \[L1\]
- Alimentation depuis le référentiel magasins du SI (source unique), avec les champs « marketing » complétés dans l'outil. \[L1\]
- Synchronisation vers Google et vers les pages Facebook ; journal de chaque envoi et de son résultat. \[L1-L2\]
- Contrôle des écarts : détection des modifications faites par Google ou par des internautes, puis comparaison avec le référentiel et restauration automatique ou validée. \[L1\]
- Score de complétude par fiche et liste des actions manquantes (photos, attributs, description). \[L1\]
- Modifications en masse (un champ sur N magasins) et import/export Excel. \[L1\]
- Création et vérification de nouvelles fiches pour les ouvertures. \[L3\]
- Gestion des photos : médiathèque par magasin, publication et suivi des photos ajoutées par les clients. \[L3\]

### M2 — Avis

- Collecte en continu des avis Google (et Facebook si l'API le permet encore) ; alertes en temps réel. \[L1\]
- Boîte de réception unifiée : filtres par magasin, secteur, note, canal, statut (à traiter, en cours, répondu), mots-clés, période. \[L1\]
- Réponse depuis l'outil ; bibliothèque de modèles avec variables (prénom, magasin) ; signature par magasin. \[L1\]
- Circuit de validation : brouillon rédigé par le magasin ou par l'IA, puis validation par le siège pour les avis sensibles (≤ 2 étoiles, mots-clés à risque). \[L1\]
- Affectation, escalade et délais cibles avec relances automatiques (avis sans réponse depuis X heures). \[L1\]
- Signalement des avis frauduleux ou hors charte, avec suivi du traitement. \[L1\]
- Suggestions de réponse par IA, adaptées au ton de la marque, toujours relues par un humain avant publication. \[L3\]
- Analyse sémantique : thèmes récurrents (accueil, prix, fraîcheur, attente, propreté…), sentiment, évolution par magasin. \[L3\]
- Collecte d'avis : QR codes et NFC par magasin (à relier au projet plaques NFC/QR existant), liens courts, campagnes SMS ou e-mail aux clients fidélité qui ont donné leur consentement. \[L3\]
- Widget d'avis à afficher sur le site et sur les écrans en magasin. \[L4\]

### M3 — Publications

- Éditeur unique : texte, photos, vidéos, bouton d'action, avec aperçu par canal. Google : actualité, offre (code, dates, conditions), événement, alerte. Facebook : post, photo, vidéo, lien. Instagram : image, carrousel, reel. \[L1-L2\]
- Ciblage multi-sites : tous les magasins, un secteur, une liste ou un groupe enregistré ; variables dynamiques (ville, magasin, horaires, adresse). \[L1\]
- Programmation, posts récurrents, calendrier éditorial (vue mois/semaine par magasin et par canal). \[L1-L2\]
- Circuit de validation : brouillon, validation, programmé, publié ou rejeté. Les contenus du siège sont « poussés », ceux des magasins validés. \[L1\]
- Bibliothèque de contenus : visuels validés, modèles de posts, campagnes nationales déclinables. \[L2\]
- Suivi du statut réel après publication (en ligne ou rejeté par Google, avec le motif) et republication. \[L1\]
- Assistant IA : rédaction, reformulation par canal, adaptation locale, hashtags. \[L3\]

### M4 — Commentaires et messages

- Boîte de réception unifiée : messages Messenger et Instagram, commentaires Facebook et Instagram, mentions Instagram. \[L2\]
- Fil de conversation par client avec l'historique complet ; recherche. \[L2\]
- Réponse, masquage, suppression de commentaires ; modération automatique par mots-clés (insultes, spam). \[L2\]
- Affectation à un magasin ou à une personne, statuts, notes internes, réponses enregistrées, délai de première réponse, alerte avant expiration de la fenêtre de réponse Meta. \[L2\]
- Réponses automatiques (horaires, adresse, hors heures d'ouverture) et suggestions IA. \[L3\]
- Google : plus de messagerie ni de Q&R par API. Le module affiche uniquement les avis Google. \[—\]

### M5 — Analytics et reporting

- Google par fiche et par jour : vues Recherche et Maps (mobile/ordinateur), appels, itinéraires, clics vers le site, actions ; mots-clés de recherche mensuels. \[L1\]
- Meta : abonnés, vues, engagement par post, performance des contenus, volume de messages, selon les métriques encore disponibles. \[L2\]
- Réputation : note moyenne, volume d'avis, répartition des notes, taux et délai de réponse, thèmes. \[L1\]
- Activité des équipes : réponses par personne et par magasin, délais, publications. \[L2\]
- Tableaux de bord réseau, secteur et magasin ; classement des magasins ; comparaison de périodes. \[L1-L2\]
- Historisation dans notre propre base, pour ne plus dépendre de la durée de conservation ni des suppressions de métriques chez Google et Meta. \[L1\]
- Rapports automatiques par e-mail (hebdomadaire magasin, mensuel CODIR), exports, connexion à l'outil BI. \[L2-L3\]
- Résumé IA mensuel par magasin : ce qui a changé, ce que disent les clients, les actions suggérées. \[L3\]

### M6 — IA transverse

- Un seul service IA réutilisé par tous les modules : réponses aux avis et messages, rédaction de posts, analyse des thèmes, résumés. \[L3\]
- Charte éditoriale paramétrable (ton, mots interdits, formules de politesse) et garde-fous (validation humaine obligatoire au départ). \[L3\]

### M7 — Alertes et notifications

- Règles paramétrables : avis négatif, message en attente, écart sur une fiche, post rejeté, jeton expiré, chute d'une métrique. \[L1-L2\]
- Canaux : e-mail, Teams, notifications mobiles (application web installable). \[L1-L3\]

### M8 — Administration

- Utilisateurs, rôles, périmètres (magasin, secteur, réseau), groupes de magasins. \[L1\]
- Connexions aux plateformes : ajout de comptes Google et Meta, état des jetons, renouvellement, rattachement fiche/page/magasin. \[L1\]
- Journal d'audit de toutes les actions (qui a publié, répondu, modifié quoi). \[L1\]
- Supervision technique : quotas API consommés, erreurs de synchronisation, files d'attente. \[L1\]

## Utilisateurs, rôles et droits

Cinq rôles suffisent, chacun limité à un périmètre de magasins. Une décision structurante reste à prendre : qui répond aux avis, le siège, le magasin ou un modèle mixte.

| Rôle | Qui | Périmètre | Droits principaux |
| --- | --- | --- | --- |
| Administrateur | Équipe SI | Tout | Connexions aux plateformes, utilisateurs, paramétrage, supervision |
| Responsable digital | Pôle Digital | Réseau | Tout le fonctionnel : fiches, campagnes, validation, modèles, charte IA, rapports |
| Responsable de secteur | Responsables de secteur | Ses magasins | Lecture, réponses, validation de premier niveau, rapports de secteur |
| Responsable de magasin | Directeurs ou responsables de magasin | Son magasin | Avis, messages et commentaires de son magasin ; propositions de posts et de photos ; horaires exceptionnels soumis à validation |
| Lecteur | Direction, CODIR | Réseau | Tableaux de bord et rapports |

- Authentification unique avec l'annuaire d'entreprise (SSO), via les comptes gérés par le groupe.
- Interface utilisable sur mobile : les responsables de magasin répondront depuis leur téléphone ou leur PDA.

## Architecture cible et intégrations SI

L'architecture proposée repose sur un socle commun et un connecteur par plateforme. Ajouter Apple, Bing ou TripAdvisor plus tard reviendra à écrire un connecteur, sans toucher au reste.

| Composant | Rôle |
| --- | --- |
| Référentiel magasins (SI existant) | Source des données de base : identifiant, adresse, coordonnées, horaires. Synchronisé vers l'outil |
| Base centrale | Établissements, rattachements fiche/page/compte, avis, messages, posts, métriques historisées, journal d'audit |
| Connecteurs | Un par plateforme (Google, Meta) : authentification, appels API, gestion des quotas et des erreurs, normalisation des données dans le modèle commun |
| Réception temps réel | Webhooks Meta (messages, commentaires) et notifications Google (avis, modifications de fiche) |
| Planificateur et file de tâches | Publications programmées, collecte quotidienne des métriques, contrôles d'écarts, relances, rejeux en cas d'erreur |
| Stockage médias | Photos et vidéos, exposées par une URL publique (exigence de Google pour les posts) |
| Service IA | Appels à un modèle de langage pour les suggestions et les analyses ; charte et garde-fous centralisés |
| API interne + interface web | Interface adaptée au mobile pour tous les rôles ; API pour l'outil BI et les intégrations futures |
| Coffre à secrets | Jetons OAuth Google et Meta, clés d'API, avec rotation |

**Intégrations avec le SI LEDLC**

- Référentiel magasins : source unique des données de base, en lien avec la reprise des référentiels en cours.
- Base fidélité : sollicitation d'avis après achat, uniquement pour les clients qui ont donné leur consentement.
- Plaques NFC/QR en magasin : liens de dépôt d'avis générés et suivis par l'outil.
- Site e-commerce : store locator et pages locales alimentés par le même référentiel (lot 4).
- Outil BI : export des métriques pour le reporting CODIR.
- Annuaire et SSO : comptes utilisateurs gérés par le groupe.

**Hébergement** : à définir avec le groupe NATUP, qui gère l'infrastructure et la cybersécurité de LEDLC. Choix entre l'infrastructure du groupe et un cloud hébergé dans l'UE, validé par le RSSI groupe.

## Données, RGPD et sécurité

L'outil traite des données personnelles de clients (nom, photo de profil, contenu des avis et des messages) : il faut l'inscrire au registre des traitements avant la mise en production.

- **Registre et base légale** : traitement « gestion de la relation client sur les plateformes en ligne », fondé sur l'intérêt légitime. Pour les sollicitations d'avis par SMS ou e-mail, le consentement de la base fidélité est obligatoire.
- **Conservation** : durée à fixer (par exemple 3 ans pour les messages, à valider) ; les métriques agrégées ne sont pas personnelles.
- **IA** : fournisseur avec contrat de traitement des données (DPA), sans réutilisation des données pour l'entraînement, hébergement UE si possible ; envoyer le minimum nécessaire au modèle.
- **Accès** : rôles et périmètres stricts, SSO, journal d'audit complet.
- **Secrets** : jetons OAuth chiffrés dans un coffre, jamais en clair dans le code ou la base ; comptes de service dédiés ; propriété des comptes Google et Meta au nom de LEDLC, pas d'un individu.
- **Validation cybersécurité** : revue de l'architecture et des flux par le RSSI groupe avant l'ouverture aux magasins.

## Phasage et planning

Le projet se découpe en cinq lots, du socle Google aux extensions. Chaque lot se termine par une mise en production et un point de décision. Les durées sont indicatives et seront recalées après le lot 0.

| Lot | Contenu | Durée indicative | Condition de passage |
| --- | --- | --- | --- |
| 0 — Préparation | Demandes d'accès API Google et Meta ; inventaire des 41 fiches Google (vérifiées ? propriétaires ?) et des pages et comptes existants ; regroupement des accès sous des comptes LEDLC ; RGPD ; choix techniques et hébergement ; maquettes | 4 à 6 semaines | Accès API obtenus, inventaire propre |
| 1 — Socle + Google | M1 fiches et synchronisation, M2 avis (boîte de réception, réponses, validation), M3 posts Google, M5 analytics Google, M7 alertes, M8 administration. Pilote sur 3 à 5 magasins, puis généralisation | 10 à 14 semaines | Pilote concluant, indicateurs de départ mesurés |
| 2 — Meta | Pages Facebook et Instagram, publications multi-canal, calendrier, M4 commentaires et messagerie, analytics Meta, rapports automatiques | 8 à 12 semaines | Boîte de réception utilisée par les magasins |
| 3 — Intelligence | M6 IA (réponses, rédaction, résumés), analyse sémantique, collecte d'avis (QR/NFC, SMS/e-mail fidélité), réponses automatiques, application mobile | 6 à 10 semaines | Gains mesurés sur les délais et le volume d'avis |
| 4 — Extensions | Apple, Bing, TripAdvisor, store locator et pages locales, LinkedIn/TikTok, veille concurrentielle | Au cas par cas | Arbitrage CODIR |

Une mise en service de la partie Google se situe donc raisonnablement 4 à 5 mois après le lancement, en dépendant surtout du délai d'obtention des accès API.

## Organisation et gouvernance

Le projet suit un mode produit : le Pôle Digital définit les besoins et les priorités, l'équipe SI construit et maintient l'outil. La répartition ci-dessous est une proposition à confirmer.

| Rôle | Proposition |
| --- | --- |
| Sponsor | Directeur Commercial (rattachement du Pôle Digital), à confirmer |
| Chef de produit (MOA) | Pôle Digital : besoins, priorités, recette, charte éditoriale |
| Pilotage projet (MOE) | Direction Transformation, Organisation et SI |
| Développement | Développeur de l'équipe SI, avec un appui possible en prestation sur les pics de charge |
| Données de référence | Responsable référentiels de l'équipe SI |
| Sécurité et hébergement | RSSI et infrastructure groupe NATUP |
| Utilisateurs pilotes | 3 à 5 responsables de magasin et un responsable de secteur |

- Rituels : point projet toutes les deux semaines avec le Pôle Digital, démonstration à chaque fin de lot, suivi dans le portefeuille de projets.
- Accompagnement : guide d'utilisation court, charte de réponse aux avis, formation des responsables de magasin par vagues.
- Run : support de premier niveau par le Pôle Digital, maintenance et veille sur les évolutions des API par l'équipe SI.

## Charge, coûts et comparaison faire / acheter

Première estimation, à affiner après le lot 0 : environ 130 à 200 jours-homme de développement pour les lots 1 à 3, plus 15 à 25 jours par an de maintenance pour suivre les évolutions des API.

| Poste | Estimation | Commentaire |
| --- | --- | --- |
| Lot 0 — Préparation | 10 à 15 j | Surtout coordination, accès, inventaire, maquettes |
| Lot 1 — Socle + Google | 50 à 75 j | Socle commun inclus (droits, audit, file de tâches, interface) |
| Lot 2 — Meta | 40 à 60 j | Messagerie et webhooks : le plus complexe |
| Lot 3 — Intelligence | 30 à 50 j | Dépend du niveau d'automatisation visé |
| Maintenance annuelle | 15 à 25 j/an | Changements d'API, nouvelles fonctions, support |
| Coûts récurrents | Faibles | Hébergement, appels IA, SMS pour la collecte d'avis ; API Google et Meta gratuites |

**Faire ou acheter.** Aucune des trois solutions ne publie ses tarifs, et la facturation se fait par établissement. Pour décider sur des chiffres réels, il est recommandé de demander en parallèle un devis pour 41 établissements à Partoo, Uberall et PinMeTo, à périmètre équivalent (fiches, avis, posts, messagerie, analytics).

| Critère | Outil interne | Solution du marché |
| --- | --- | --- |
| Intégration au SI (référentiel, fidélité, BI) | Native | Par API ou import, selon l'éditeur |
| Couverture des canaux | Google + Meta, puis au cas par cas | Très large dès le départ (annuaires, Apple, Waze…) |
| Adaptation aux processus LEDLC | Totale | Paramétrage dans le cadre de l'outil |
| Maintenance des API | À notre charge | Absorbée par l'éditeur |
| Dépendance | À une personne clé en interne | À un éditeur, contrat de 12 mois reconduit |
| Délai de mise en service | 4 à 5 mois pour Google | Quelques semaines |

## Risques

Les deux risques majeurs sont externes (accès et évolution des API) et humains (dépendance à un développeur, adoption par les magasins).

| Risque | Probabilité | Impact | Parade |
| --- | --- | --- | --- |
| Accès API Google ou Meta refusé ou retardé | Moyenne | Fort | Demandes dès le lot 0, dossiers soignés, comptes LEDLC vérifiés ; repli possible sur une solution du marché |
| Suppression de fonctions ou de métriques par Google ou Meta | Forte | Moyen | Architecture par connecteurs, historisation interne, veille des changelogs, budget de maintenance annuel |
| Dépendance à un seul développeur | Forte | Fort | Documentation, revue de code, socle technique standard, appui en prestation |
| Faible adoption par les magasins | Moyenne | Fort | Pilote, interface mobile simple, formation, indicateurs de réactivité suivis par secteur |
| Dérive de périmètre (« on pousse le truc ») | Forte | Moyen | Lots fermés, arbitrage du chef de produit, backlog priorisé |
| Fiches Google suspendues après des modifications massives | Faible | Fort | Modifications progressives, respect des règles Google, journal et retour arrière |
| Réponse IA inadaptée publiée | Moyenne | Moyen | Validation humaine obligatoire au départ, charte, mots interdits |
| Non-conformité RGPD | Faible | Fort | Registre, DPA, durées de conservation, consentement fidélité |
| Jetons expirés ou comptes rattachés à une personne | Moyenne | Moyen | Comptes de service LEDLC, supervision et alertes d'expiration |

## Décisions attendues et prochaines étapes

Quatre décisions conditionnent le lancement. Les premières actions peuvent démarrer tout de suite, car elles servent quelle que soit l'option retenue.

**Décisions**

1. Valider le principe d'un outil interne, sous réserve de la comparaison avec les devis des éditeurs.
2. Confirmer le sponsor et le chef de produit côté Pôle Digital.
3. Choisir le modèle de réponse aux avis et messages : siège, magasin ou mixte.
4. Valider le périmètre et le phasage des lots 0 à 3.

**Prochaines étapes**

- [ ] Inventorier les 41 fiches Google : vérifiées ou non, propriétaire, compte de rattachement
- [ ] Inventorier les pages Facebook et comptes Instagram existants et leurs administrateurs
- [ ] Créer le projet Google Cloud et déposer la demande d'accès à l'API Business Profile
- [ ] Vérifier le Business Manager LEDLC et créer l'application Meta
- [ ] Demander un devis à Partoo, Uberall et PinMeTo pour 41 établissements
- [ ] Mesurer la situation de départ : note moyenne, taux et délai de réponse aux avis
- [ ] Présenter l'architecture et les flux au RSSI groupe
- [ ] Présenter la note de cadrage au CODIR

## Sources

Consultées le 15 novembre 2026.

- [Partoo — fiche Le Petit Digital](https://www.leptidigital.fr/logiciels/partoo/)
- [Partoo — analyse La Fabrique du Net](https://www.lafabriquedunet.fr/logiciel/partoo) et [comparatif Partoo / Guest Suite](https://www.lafabriquedunet.fr/logiciels/comparateur/partoo-vs-guest-suite)
- [Uberall — site officiel](https://uberall.com/en), [module Messages](https://uberall.com/en-gb/products/messages), [comparaison Uberall / SOCi](https://uberall.com/en-us/compare/uberall-soci-comparison)
- [Uberall — offres sur G2](https://www.g2.com/compare/thryv-vs-uberall-2024-01-10) et [fiche European Purpose](https://europeanpurpose.com/tool/uberall)
- [PinMeTo — publication locale](https://www.pinmeto.com/products/local-social-media-management/) et [présentation SoftwareSuggest](https://www.softwaresuggest.com/pinmeto)
- [API Google Business Profile en 2026 — Slashpost](https://slashpost.ai/blogs/google-business-profile/google-business-profile-api-documentation-2026) et [guide Upload-Post](https://www.upload-post.com/google-business-profile-api/)
- [Fin de l'API Q&R Google — PPC Land](https://ppc.land/google-discontinues-business-profile-q-a-api-effective-november-3/)
- [Meta — Page Insights (documentation)](https://developers.facebook.com/docs/graph-api/reference/v23.0/insights), [métriques retirées en juin 2026 — Coupler](https://docs.coupler.io/sources/category/social-media/facebook-page-insights/data-overview/meta-facebook-insights-deprecated-metrics-june-2026), [retraits de novembre 2025 — Supermetrics](https://docs.supermetrics.com/docs/facebook-insights-field-changes-november-13-2025)
- [API Instagram en 2026 — Phyllo](https://www.getphyllo.com/post/instagram-api-guide) et [fiche Vorp Labs](https://vorplabs.com/agent-tools/instagram-api)
