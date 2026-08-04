USE tifosi;


-- =====================================================
-- Requête 1 : Afficher la liste des noms des focaccias
-- par ordre alphabétique croissant
-- =====================================================

SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;



-- =====================================================
-- Requête 2 : Afficher le nombre total d'ingrédients
-- =====================================================

SELECT COUNT(*) AS nombre_ingredients
FROM ingredient;



-- =====================================================
-- Requête 3 : Afficher le prix moyen des focaccias
-- =====================================================

SELECT AVG(prix) AS prix_moyen
FROM focaccia;



-- =====================================================
-- Requête 4 : Afficher la liste des boissons
-- avec leur marque
-- triée par nom de boisson
-- =====================================================

SELECT 
    boisson.nom_boisson,
    marque.nom_marque
FROM boisson
JOIN marque
ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom_boisson;



-- =====================================================
-- Requête 5 : Afficher la liste des ingrédients
-- pour une Raclaccia
-- =====================================================

SELECT 
    ingredient.nom_ingredient,
    focaccia_ingredient.quantite
FROM focaccia
JOIN focaccia_ingredient
ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient
ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE focaccia.nom_focaccia = 'Raclaccia';



-- =====================================================
-- Requête 6 : Afficher le nom et le nombre
-- d'ingrédients pour chaque focaccia
-- =====================================================

SELECT
    focaccia.nom_focaccia,
    COUNT(focaccia_ingredient.id_ingredient) AS nombre_ingredients
FROM focaccia
JOIN focaccia_ingredient
ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.id_focaccia;



-- =====================================================
-- Requête 7 : Afficher la focaccia qui possède
-- le plus d'ingrédients
-- =====================================================

SELECT
    focaccia.nom_focaccia,
    COUNT(focaccia_ingredient.id_ingredient) AS nombre_ingredients
FROM focaccia
JOIN focaccia_ingredient
ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.id_focaccia
ORDER BY nombre_ingredients DESC
LIMIT 1;



-- =====================================================
-- Requête 8 : Afficher les focaccias contenant de l'ail
-- =====================================================

SELECT DISTINCT
    focaccia.nom_focaccia
FROM focaccia
JOIN focaccia_ingredient
ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient
ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Ail';



-- =====================================================
-- Requête 9 : Afficher les ingrédients inutilisés
-- =====================================================

SELECT ingredient.nom_ingredient
FROM ingredient
LEFT JOIN focaccia_ingredient
ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE focaccia_ingredient.id_ingredient IS NULL;



-- =====================================================
-- Requête 10 : Afficher les focaccias
-- qui n'ont pas de champignons
-- =====================================================

SELECT focaccia.nom_focaccia
FROM focaccia
WHERE focaccia.id_focaccia NOT IN
(
    SELECT focaccia_ingredient.id_focaccia
    FROM focaccia_ingredient
    JOIN ingredient
    ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
    WHERE ingredient.nom_ingredient = 'Champignon'
);