# Tifosi - Conception d'une base de données MySQL

## Présentation du projet

Dans le cadre de ma formation de Développeur Web, ce projet consiste à concevoir une base de données relationnelle MySQL pour le restaurant de Street-Food italien **Tifosi**.

L'objectif est de permettre la gestion des données concernant :
- les focaccias ;
- les ingrédients ;
- les marques ;
- les boissons ;
- les menus ;
- les clients ;
- les achats.

## Technologies utilisées

- MySQL 8.0
- SQL
- Git / GitHub

## Modèle de données

La base de données repose sur plusieurs relations :

- Une marque possède plusieurs boissons.
- Une focaccia est composée de plusieurs ingrédients.
- Un ingrédient peut être utilisé dans plusieurs focaccias.
- Un menu contient des boissons.
- Un client peut effectuer plusieurs achats.

La relation entre les focaccias et les ingrédients est gérée par une table associative :

`focaccia_ingredient`

Cette table permet également de stocker la quantité de chaque ingrédient utilisée.

## Structure du projet

tifosi/
│
├── sql/
│ ├── 01_create_database.sql
│ ├── 02_insert_data.sql
│ ├── 03_insert_ingredient.sql
│ ├── 04_insert_focaccia.sql
│ ├── 05_insert_focaccia_ingredient.sql
│ └── 06_test_queries.sql
│
└── README.md

## Installation de la base de données

Les scripts SQL doivent être exécutés dans l'ordre suivant :

### 1 - Création de la base et des tables

01_create_database.sql
Création :
- de la base `tifosi`
- des tables
- des contraintes d'intégrité
- de l'utilisateur MySQL dédié

### 2 - Insertion des données

02_insert_data.sql
Insertion des marques et boissons.

03_insert_ingredient.sql
Insertion des ingrédients.

04_insert_focaccia.sql
Insertion des focaccias et de leurs prix.

05_insert_focaccia_ingredient.sql
Création des associations entre les focaccias et les ingrédients avec leurs quantités.

### 3 - Vérification

Contient les requêtes SQL permettant de vérifier le bon fonctionnement de la base.

## Données présentes dans la base

La base contient :

- 4 marques
- 12 boissons
- 25 ingrédients
- 8 focaccias
- 70 associations entre focaccias et ingrédients

## Requêtes de validation réalisées

Les tests SQL permettent notamment de vérifier :

- la liste des focaccias par ordre alphabétique ;
- le nombre total d'ingrédients ;
- le prix moyen des focaccias ;
- les boissons avec leur marque ;
- les ingrédients d'une focaccia donnée ;
- le nombre d'ingrédients par focaccia ;
- la focaccia ayant le plus d'ingrédients ;
- les focaccias contenant de l'ail ;
- les ingrédients inutilisés ;
- les focaccias sans champignons.

## Compétences mises en œuvre

Ce projet m'a permis de mettre en pratique :

- la conception d'une base de données relationnelle ;
- la création de tables SQL ;
- l'utilisation des clés primaires et étrangères ;
- les contraintes d'intégrité ;
- les relations plusieurs-à-plusieurs ;
- les requêtes SQL avec jointures ;
- les fonctions d'agrégation (`COUNT`, `AVG`) ;
- le versionnement avec Git et GitHub.