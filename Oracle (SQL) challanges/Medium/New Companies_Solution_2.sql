/*
Used 4 individual tables and then join, group by and order by 
*/

select c.company_code, c.founder,
count(distinct l.lead_manager_code) , 
count(distinct s.senior_manager_code),
count(distinct m.manager_code),
count(distinct e.employee_code)
from company c, lead_manager l, senior_manager s, manager m, employee e
where 
c.company_code=l.company_code and 
c.company_code=s.company_code and
c.company_code=m.company_code and
c.company_code=e.company_code
group by c.company_code, c.founder
order by c.company_code, c.founder
;