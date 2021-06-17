# Résumé

Handshake est une plateforme de mise en relation entre bénévoles et personnes en situation de handicap, ayant besoin d’une aide spécifique.

## Description

### 1. Présentation détaillée
En anglais, HANDSHAKE signifie la poignée de main, symbole de cette rencontre solidaire. HAND est un rappel à la main que l’on tend pour venir en aide à quelqu’un et évoque implicitement la notion de hand(icap).

- Le public visé concernera par exemple des personnes présentant des troubles cognitifs (autisme, dyslexie…) ou des troubles sensoriels (sourd, muet, aveugle…).  
- Chaque bénévole bénéficiera d'une formation gratuite en amont afin d'accompagner au mieux les publics cibles (articles, vidéos, renvois vers des liens spécialisés…).
- Les utilisateurs pourront poster une annonce détaillant le type d’accompagnement souhaité/proposé, ainsi que les diverses informations liées à leur profil.

Nous souhaitons que cette plateforme favorise l’entraide et le rapprochement, tout en favorisant le développement d’une communauté solidaire et bienveillante.

### 2. Parcours utilisateur
Les visiteurs peuvent naviguer sur la page d’accueil et sur des pages d’informations générales liées aux services proposés par la plateforme. Nous distinguons 3 types d’acteurs.

- <mark>Le bénévole</mark> : Si un particulier propose ses services, il doit créer un compte (prénom et email), qui sera authentifié par un lien reçu après l’inscription. De son espace personnel, il pourra détailler sa présentation (disponibilités…), gérer son compte utilisateur (joindre des documents, photos...), consulter des contenus spécifiques…
- <mark>Le demandeur</mark> : Il devra aussi créer un compte pour poster sa demande d’aide. Il aura alors accès à un espace plus complet pour se présenter et exposer son besoin.
- <mark>Les administrateurs du site</mark> : Ils pourront gérer le site en back-office (consultation, modification, suppression, modération…).

Les utilisateurs une fois connectés pourront échanger via l’envoi de message privé. Celui qui sollicite de l’aide peut contacter un bénévole et vice-versa. Ils peuvent aussi échanger avec les administrateurs du site.

### 3. Concrètement et techniquement
Cette plateforme sera développée via Ruby on rails 5.2.6 et hébergée sur Heroku.

#### 3. 1. Base de données
Nous utiliserons Postgresql. Pour le moment, nous imaginons :

- Des models User Bénévole / Demandeur / Admin
- Un model Annonce
- Un model Participation qui permet de faire la jointure entre le bénévole, le demandeur et l’annonce
- Un model Catégorie (selon le type d’handicaps…)
- Un model Message privé
- …

#### 3. 2. Front-end
Le site sera épuré, ergonomique et responsive. Certains critères d’accessibilité (police, couleurs/contrastes tamisés…) seront privilégiés.

On utilisera les langages HTML, CSS et Javascript (en veillant à contrôler le niveau de dynamisme du site).

- Une page d’accueil, d’où les utilisateurs pourront s’inscrire, se connecter ou se déconnecter, puis être redirigé en fonction de leur recherche
- Des pages d’informations diverses : présentation, articles, contact, (in)formations (renvois vers des liens extérieurs…)
- Des pages d’annonces qui listent les demandes d’aides et les propositions de services
- Un espace personnel pour les bénévoles / les demandeurs / les admins
- Les pages des différents formulaires
- Une page dédiée aux discussions privées
- …

#### 3. 3. Back-end
- Une interface administrateurs
- Devise
- Mailer
- Active storage
- Moteur de recherche
- API de géolocalisation
- …

Autres fonctionnalités supplémentaires à envisager :

- Réservation en ligne d’un créneau de formation en amont de la rencontre
- Système d’évaluation du degré de complexité estimé de l’aide, afin de se positionner en toute connaissance de cause. Ex : ⭐⭐⭐ Un peu d’expérience est recommandée / ⭐ C’est à la portée de tous même sans expérience : Aide d’une personne aveugle vs Gestion d’autisme sévère par exemple
- Système de dons pour financer les formations…
- …

### 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine
- Un front-end sobre
- Une base de données fonctionnelle
- Les formulaires de connexion
- La gestion automatique de certains emails : inscription, création/suppression d'annonce…
- La possibilité de créer et poster ses annonces
- La possibilité de consulter les pages de profil et les annonces

### 5. La version que l'on présentera aux jurys
- La finalisation de l’ergonomie des pages de front
- Un complément de pages d’informations afin d’alimenter le contenu
- La possibilité d’envoyer des messages privés
- Une recherche multicritère : catégories, lieux…
- La géolocalisation
- …

### 6.Equipe
- Wiem
- Hareish
- Célia
- Nelly
- Flora

### 7. Notre mentor
- Day Sy  🤩
