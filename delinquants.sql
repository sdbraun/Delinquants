
-- Je veux connaître tous les champs possibles pour certaines colonnes. 

select distinct ethnicite
from delinquants;

select distinct emplacement
from delinquants;

select distinct religion
from delinquants;

select distinct province
from delinquants;

select distinct infraction
from delinquants; 

select distinct securiteetablissement
from delinquants;

select distinct typesurveillance
from delinquants;


-- Je fais des tests de commandes ici

select * 
from delinquants
where age <= 25 and GroupeEthnique = "autochtone" and genre = "homme"; 

select province
from delinquants
where province IN ("Quebec", "Ontario");

select religion
from delinquants
where religion = "wicca" and genre = "femme";

select *
from delinquants
order by province, age asc; 

select genre, age
from delinquants
where genre = "femme"
having age > 40
order by genre, age asc;


-- J'inscris diverses commandes pour faire des statistiques de mes différentes colonnes. J'inscrirai ensuite les informations recueillies dans des graphiques

select ROUND(AVG(age))
from delinquants;
-- âge moyen des délinquants 

select ROUND(AVG(age)), genre  
from delinquants
where genre = "femme";
-- âge moyen des femmes 

select ROUND(AVG(age)), genre
from delinquants
where genre = "homme";
-- âge moyen des hommes

select ROUND(AVG(age)), genre, incarceration
from delinquants
where genre = "femme" and incarceration = "incarcere";
-- âge moyen pour les hommes et femmes incarcerés (j'ai testé pour les deux sexes) 


select COUNT(dureepeine)
from delinquants
where dureepeine != 0; 
-- Nombre de délinquants avec une durée de peine déterminée 

select ROUND(AVG(dureepeine))
from delinquants;
-- durée moyenne ceux avec peine de durée déterminée 

select ROUND(AVG(dureepeine)), genre, groupeethnique 
from delinquants
where genre = "homme" and groupeethnique = "non autochtone";
-- durée moyenne selon le genre et l'origine ethnique (diverses combinaisons testées)



select COUNT(groupeethnique), groupeethnique, 
from delinquants
group by groupeethnique;
-- l'origine ethnique de chaque délinquants

select COUNT(groupeethnique), groupeethnique, genre 
from delinquants
where groupeethnique = "non autochtone" and genre = "femme";
-- Le nombre de délinquants selon l'origine ethnique et le genre (j'ai testé diverses combinaisons)

select COUNT(groupeethnique), groupeethnique, genre, incarceration
from delinquants
where groupeethnique = "autochtone" and genre = "homme" and incarceration = "incarcere";
-- Le nombre de délinquants incarcérés selon l'origine ethnique et le genre (j'ai testé diverses combinaisons)

select COUNT(groupeethnique), groupeethnique, incarceration
from delinquants
where groupeethnique = "autochtone" and incarceration = "incarcere";
-- le nombre de délinquants autochtones incarcérés et sous surveillance 



select COUNT(genre)
from delinquants
where genre = "femme"; 
-- combien de délinquants sont des femmes 

select COUNT(genre)
from delinquants
where genre = "homme"; 
-- combien de délinquants sont des hommes 

select COUNT(genre), incarceration
from delinquants
where genre = "homme" and incarceration = "incarcere";
-- le nombre de femmes et d'hommes incarcérés et sous surveillance (j'ai testé les diverses combinaisons)


select MAX(age)
from delinquants;
-- le délinquant le plus vieux est âgé de 94 ans

select MAX(age), incarceration
from delinquants
where incarceration = "incarcere";
-- le délinquant incarceré le plus vieux est âgé de 87 ans

select MIN(age)
from delinquants;
-- le délinquant le plus jeune est âgé de 18 ans

select MIN(age), incarceration
from delinquants
where incarceration = "incarcere";
-- le délinquant incarcéré le plus jeune est âgé de 18 ans 

select MAX(age), genre
from delinquants
where genre = "femme";
-- la femme la plus âgée

select MIN(age), genre
from delinquants
where genre = "femme";
-- la femme la plus jeune

select MAX(age), genre
from delinquants
where genre = "homme";
-- l'homme le plus âgé

select MIN(age), genre
from delinquants
where genre = "homme";
-- l'homme le plus jeune 

select MAX(age), groupeethnique 
from delinquants
where groupeethnique = "autochtone";
-- la personne autochtone la plus âgée

select MAX(age), groupeethnique 
from delinquants
where groupeethnique = "non autochtone";
-- la personne non autochtone la plus âgée 

select MIN(age), groupeethnique 
from delinquants
where groupeethnique = "autochtone";
-- la personne autochtone la moins âgée 

select MIN(age), groupeethnique 
from delinquants
where groupeethnique = "non autochtone";
-- la personne non autochtone la moins âgée


-- Je fais ci-dessous des statistiques pour les groupes d'âges des délinquants incarcérés
 
select COUNT(age), incarceration 
from delinquants 
where age <= 29 and incarceration = "incarcere";

select COUNT(age), incarceration 
from delinquants 
where age BETWEEN 30 and 39 and incarceration = "incarcere";

select COUNT(age), incarceration 
from delinquants 
where age BETWEEN 40 and 49 and incarceration = "incarcere";

select COUNT(age), incarceration  
from delinquants 
where age BETWEEN 50 and 59 and incarceration = "incarcere";

select COUNT(age), incarceration 
from delinquants 
where age BETWEEN 60 and 69 and incarceration = "incarcere";

select COUNT(age), incarceration 
from delinquants 
where age BETWEEN 70 and 79 and incarceration = "incarcere";

select COUNT(age), incarceration  
from delinquants 
where age BETWEEN 80 and 89 and incarceration = "incarcere";

select COUNT(age), incarceration  
from delinquants 
where age >= 90 and incarceration = "incarcere";


select COUNT(incarceration), incarceration
from delinquants 
group by incarceration;
-- combien sont incarcérés et combien sont sous surveillance

select COUNT(incarceration), genre 
from delinquants 
where incarceration = "incarcere" and genre = "femme";
-- combien de femmes sont incarcérées
 
select COUNT(incarceration), genre 
from delinquants 
where incarceration = "surveillance" and genre = "femme";
-- combien de femmes sont sous surveillance 

select COUNT(incarceration), genre 
from delinquants 
where incarceration = "incarcere" and genre = "homme";
-- combien d'hommes sont incarcérés
 
select COUNT(incarceration), genre 
from delinquants 
where incarceration = "surveillance" and genre = "homme";
-- combien d'hommes sont sous surveillance 


select COUNT(typesurveillance), typesurveillance, incarceration
from delinquants
where incarceration = "surveillance"
group by typesurveillance;
-- types de surveillance pour les délinquants en surveillance 



select COUNT(jurisdiction), jurisdiction
from delinquants
group by jurisdiction;
-- combien de délinquants sont sous administration fédérale ou provinciale


select COUNT(typepeine)
from delinquants
where typepeine = "indeterminee";
-- nombre de personnes avec peine de durée indéterminée (on sait déjà plus haut combien ont une durée déterminée)


-- Je fais ci-dessous des statistiques sur les niveaux de sécurité des établissements 

select COUNT(securiteetablissement), securiteetablissement
from delinquants
group by securiteetablissement;
-- le nombre de délinquants associés à chaque niveau de sécurité d'établissement 

select COUNT(securiteetablissement), groupeethnique, incarceration 
from delinquants
where groupeethnique = "autochtone" and securiteetablissement = "maximale" and incarceration = "incarcere";
-- Niveau de sécurité des établissements fédéraux pour chaque délinquant incarcéré selon le groupe ethnique 


select COUNT(securiteetablissement), genre, incarceration
from delinquants
where genre = "femme" and securiteetablissement = "niv. multiples" and incarceration = "incarcere";
-- Niveau de sécurité des établissements fédéraux pour chaque délinquant incarcéré selon le genre 


select COUNT(province), province
from delinquants
group by province;
-- Le nombre de délinquants associés dans chaque province 

select COUNT(ethnicite), ethnicite
from delinquants
group by ethnicite;
-- la nationalité de chaque délinquants. Je note que 350 délinquants n'ont pas déclaré leur nationalité (ce n'est pas obligatoire)


select COUNT(religion), religion
from delinquants
group by religion;
-- la religion de chaque délinquants. Je note que 1460 délinquants n'ont pas déclaré la religion qu'ils pratiquent et 620 ont inscrtit "non déclarée" (ce n'est pas une information obligatoire)

select COUNT(emplacement), emplacement
from delinquants
group by emplacement;
-- type d'installation où la gestion de chaque délinquant est effectuée

select COUNT(emplacement), emplacement, genre 
from delinquants
where genre = "femme"
group by emplacement;
-- type d'installation selon les femmes

select COUNT(emplacement), emplacement, genre 
from delinquants
where genre = "homme"
group by emplacement;
-- type d'installation selon les hommes

select COUNT(emplacement), emplacement, groupeethnique
from delinquants
where groupeethnique = "autochtone"
group by emplacement;
-- type d'installation selon les personnes autchotones


select COUNT(besoindynamique), besoindynamique, incarceration, genre 
from delinquants
where incarceration = "incarcere" and genre = "femme"
group by besoindynamique;
-- bsoin d'intervention pour chaque délinquant selon le genre

select COUNT(besoindynamique), besoindynamique, incarceration, groupeethnique  
from delinquants
where incarceration = "incarcere" and groupeethnique = "non autochtone"
group by besoindynamique;
-- bsoin d'intervention pour chaque délinquant selon le groupe ethnique 


select COUNT(securitedelinquant), securitedelinquant, genre, incarceration  
from delinquants
where genre = "femme" and incarceration = "incarcere"
group by securitedelinquant;
-- cote de sécurité pour chaque délinquant selon le genre 

select COUNT(securitedelinquant), securitedelinquant, groupeethnique, incarceration 
from delinquants
where groupeethnique = "non autochtone" and incarceration = "incarcere"
group by securitedelinquant;
-- cote de sécurité pour chaque délinquant selon le groupe ethnique 

select COUNT(securitedelinquant), securitedelinquant, ethnicite
from delinquants
where ethnicite = "noir"
group by securitedelinquant;
-- cote de sécurité selon la nationalité (j'ai essayé plusieurs nationalités)


select risquestatique, COUNT(risquestatique)
from delinquants
group by risquestatique;
-- le niveau de risque de chaque délinquant

select risquestatique, COUNT(risquestatique), genre, incarceration
from delinquants
where genre = "homme" and incarceration = "incarcere"
group by risquestatique;
-- le niveau de risque selon le genre

select risquestatique, COUNT(risquestatique), groupeethnique, incarceration 
from delinquants
where groupeethnique = "non autochtone" and incarceration = "incarcere"
group by risquestatique;
-- le niveau de risque selon le groupeethnique

select COUNT(potentielreinsertion), potentielreinsertion
from delinquants
group by potentielreinsertion;
-- le niveau de potentialité de réinsertion sociale pour chaque délinquant

select COUNT(potentielreinsertion), potentielreinsertion, genre, incarceration 
from delinquants
where genre = "homme" and incarceration = "incarcere"
group by potentielreinsertion;
-- la possibilité de réinsertion sociale selon le genre

select COUNT(potentielreinsertion), potentielreinsertion, groupeethnique, incarceration 
from delinquants
where groupeethnique = "non autochtone" and incarceration = "incarcere"
group by potentielreinsertion;
-- la possibilité de réinsertion sociale selon le groupeethnique

select COUNT(niveaumotivation), niveaumotivation, genre, incarceration  
from delinquants
where genre = "homme" and incarceration = "incarcere"
group by niveaumotivation;
-- niveau de motivation de chaque délinquant selon son genre par rapport à son plan correctionnel

select COUNT(niveaumotivation), niveaumotivation, groupeethnique, incarceration 
from delinquants
where groupeethnique = "non autochtone" and incarceration = "incarcere"
group by niveaumotivation;
-- niveau de motivation de chaque délinquant selon le groupe ethnique 


select COUNT(infraction), infraction
from delinquants
group by infraction;
-- type d'infraction commise pour chaque délinquant

select COUNT(infraction), infraction, genre
from delinquants
where genre = "femme"
group by infraction;
-- type d'infraction selon le genre

select COUNT(infraction), infraction, groupeethnique
from delinquants
where groupeethnique = "autochtone"
group by infraction;
-- type d'infraction selon le groupe ethnique 
