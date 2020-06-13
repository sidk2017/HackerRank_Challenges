/*
Used 4 seperate tables having company_code and count of its code
and then join and order by 
*/

select c.company_code, c.founder, l.c, s.c, m.c, e.c
from 
(select company_code, count(distinct(lead_manager_code)) as c from lead_manager group by company_code) l,
(select company_code, count(distinct(senior_manager_code)) as c from senior_manager group by company_code) s,
(select company_code, count(distinct(manager_code)) as c from manager group by company_code) m,
(select company_code, count(distinct(employee_code)) as c from employee group by company_code) e,
company c
where 
c.company_code=l.company_code and 
c.company_code=s.company_code and
c.company_code=m.company_code and
c.company_code=e.company_code
order by c.company_code, c.founder
;