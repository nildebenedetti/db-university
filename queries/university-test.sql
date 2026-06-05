/*
1. selezionare. gli studenti nati nel 1990
*/

SELECT *
FROM `students`
WHERE YEAR(`students`.`date_of_birth`) = 1990;

/*
2. selezionre tutti i corsi che valgono più di 10 cfu
*/
SELECT *
FROM `courses`
WHERE `courses`.`cfu`> 10;

/*
3. selezionre tutti gli studenti che hanno più di 30 anni
*/

SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `students`.`date_of_birth`, CURDATE()) > 30;

/*
4. selezionre tutti i corsi del primo semestre del primo anno
 di un qualsiasi corso di laurea
*/

SELECT *
FROM `courses`
WHERE `courses`.`year` = 1 AND `courses`.`period`= "I semestre";

/*
5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020
*/

SELECT *
FROM `exams`
WHERE `exams`.`date` = '2020-06-20' AND 
		`exams`.`hour` > '14:00:00';
        
/*
6. Selezionare tutti i corsi di laurea magistrale
*/

SELECT *
FROM `degrees`
WHERE `degrees`.`level` = "magistrale";

/*
7. Da quanti dipartimenti è composta l'università? 
*/

SELECT COUNT(*) as `departments_count`
FROM `departments`
WHERE 1;

/*
8. Quanti sono gli insegnanti che non hanno un numero di telefono?
*/

SELECT *
FROM `teachers`
WHERE `teachers`.`phone` IS NULL;




