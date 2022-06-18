select c.customer_id ,c."name" ,case when sum(c2.price) is null then 0 else sum(c2.price*(1-ct.discount)) end total_spending
from customer c 
left outer join car_transaction ct
on c.customer_id =ct.customer_id 
left outer join cars c2 
on ct.car_id =c2.car_id 
group by c.customer_id ,c."name" 
;
