/*
Solution:- 2
Here we used WITH clause to create a temprorary table which have all the requred data that we need to used many times in diff. queries.
*/

with occupations_row as (
    select 
    occupation, 
    name, 
    row_number() over (partition by occupation order by name) as r
    from occupations )

select d1.name,p1.name, s1.name,a1.name
from
(select * from occupations_row where occupation='Professor' ) p1 
LEFT JOIN
(select * from occupations_row where occupation='Doctor' ) d1 on  p1.r=d1.r 
LEFT JOIN
(select * from occupations_row where occupation='Singer' ) s1  on  p1.r=s1.r 
LEFT JOIN
(select * from occupations_row where occupation='Actor' ) a1 on  p1.r=a1.r 
order by p1.name;

