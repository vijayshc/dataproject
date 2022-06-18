select * from (
	select 
	manufacturer_name
	,sales_num as sales_number
	,sales as sales
	,dense_rank () over(order by sales desc,sales_num desc) top_rank
	from
	(
		select c.manufacturer_name ,sum(c.price *(1-ct.discount)) sales_num ,count(*) sales
		from car_transaction ct 
		left outer join cars c  
		on ct.car_id =c.car_id 
		where extract(month from transaction_dttm) =extract(month from current_date)
		and extract(year from transaction_dttm) =extract(year from current_date)
		group by 1
	) t1
)t2
where top_rank <=3
;
