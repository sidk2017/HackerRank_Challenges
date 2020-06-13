/*
Used Connect by & level keyword to find the level of particulat node in the Hierarchy tree
and then decode on that basis of level.
*/

select a.n,decode (a.l, '1', 'Root', '4', 'Leaf', 'Inner') as r
from (
    select level as l, n,p from BST
    start with p is null
    connect by prior n = p
    order by level) a
order by a.n;
