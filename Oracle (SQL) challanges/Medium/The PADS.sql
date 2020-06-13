/*
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
*/
select name || decode (occupation,
                       'Professor' , '(P)',
                       'Doctor' , '(D)',
                       'Singer' , '(S)',
                       'Actor' , '(A)'
                      ) as r
from occupations order by name;
select 'There are a total of ' || count(occupation), lower(occupation) ||'s.' as o
from occupations
group by occupation
order by count(occupation), lower(occupation);  
