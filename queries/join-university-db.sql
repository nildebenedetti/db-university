/*
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
*/

SELECT `s`.`name`,
		`s`.`surname`,
        `s`.`registration_number`AS `student_id_number`,
        `d`.`name`
FROM `students`AS `s`
	JOIN `degrees` AS d
		ON `s`.`degree_id`= `d`.`id`
WHERE `d`.`name` = "Corso di Laurea in Economia"
ORDER BY `student_id_number`;

/*
2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
*/

select deg.name,
		deg.level,
        dep.name,
        deg.email
from degrees deg
	join departments dep
		on deg.department_id = dep.id
where dep.name = "Dipartimento di Neuroscienze" and
		deg.level = "magistrale";
        
/*
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
*/

select 	CONCAT(
	t.name,
    ' ',
    t.surname
    ) as docente,
    c.*
from courses c
	join course_teacher ct
		on c.id = ct.course_id
	join teachers t
		on t.id = ct.teacher_id
where ct.teacher_id = 44;

/*
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome
*/

select CONCAT(
		s.surname,
        ' ',
        s.name
        )
         as student_fullname,
         d.*,
         dep.*
from students s
	join degrees d
		on s.degree_id = d.id
	join departments dep
		on dep.id = d.department_id
where 1
order by s.surname, s.name asc;

/*
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
*/

select d.name as degree,
		c.name as course,
        c.period,
        CONCAT(t.name, ' ', t.surname) as teacher_fullname
from degrees d
	join courses c
		on d.id = c.degree_id
	join course_teacher ct 
		on c.id = ct.course_id
	join teachers t
		on t.id = ct.teacher_id
where 1;

/*
6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)
*/

select CONCAT(
		t.surname,
		' ',
        t.name
        ) as teacher_fullname,
        t.email,
        dep.name as department
from teachers t
	join course_teacher ct
		on ct.teacher_id = t.id
    join courses c
		on c.id = ct.course_id
	join degrees deg
		on deg.id = c.degree_id
    join departments dep
		on dep.id = deg.department_id
where dep.name = "Dipartimento di Matematica";

/*
7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
per ogni esame, stampando anche il voto massimo. Successivamente,
filtrare i tentativi con voto minimo 18.
*/

select CONCAT(
		s.surname,
        ' ',
        s.name
        ) as student_fullname,
        c.name as course,
        COUNT(*) as n_attempts,
        MAX(es.vote) as best_grade
from students s
	join exam_student es
		on s.id = es.student_id
	join exams e
		on es.exam_id = e.id
	join courses c
		on e.course_id = c.id
group by s.id, c.id
having es.grade >= 18
order by s.surname, s.name asc;


