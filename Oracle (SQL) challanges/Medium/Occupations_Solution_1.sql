/*
used inline view for particular occupation and then Left joined with view having maximum records
like professer has maximum records from other occupation in the occupations table, so used that as left table.
*/

select d1.name, p1.name, s1.name, a1.name 
from 
(select p.*, rownum as r from (select name from occupations where occupation='Professor' order by name) p ) p1
LEFT JOIN
(select a.*, rownum as r from (select name from occupations where occupation='Actor' order by name) a) a1 on p1.r=a1.r
LEFT JOIN
(select s.*, rownum as r from (select name from occupations where occupation='Singer' order by name) s) s1 on p1.r=s1.r
LEFT JOIN
(select d.*, rownum as r from (select name from occupations where occupation='Doctor' order by name) d )d1 on p1.r=d1.r
;
