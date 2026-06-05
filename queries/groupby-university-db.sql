/*
1. Contare quanti iscritti ci sono stati ogni anno
*/
select   YEAR(s.enrolment_date) as year,
		COUNT(*) as freshmen
from students s
group by YEAR(s.enrolment_date);

/*
2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
*/

select t.office_address as building_address,
COUNT(*) as teacher_offices
from teachers t
group by t.office_address;

/*
3. Calcolare la media dei voti di ogni appello d'esame
*/

select  c.name as course,
		e.id as exam_id,
		e.date as exam_date,
		avg(es.vote) as average_grade
from exam_student es
	join exams e
		on es.exam_id = e.id
	join courses c
		on e.course_id = c.id
group by e.id
order by exam_date desc;


/*
4. Contare quanti corsi di laurea ci sono per ogni dipartimento
*/

select dep.name,
		count(d.id) as degree_number
from degrees d
	left join departments dep
		on d.department_id = dep.id
group by dep.id, dep.name;
	

    