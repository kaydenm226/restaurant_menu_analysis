-- OBJECTIVE 2: Explore the orders table

-- 1. View the order_details table.
select * from order_details;


-- 2. What is the date range of the table? min date (2023-01-01), max date (2023-03-31)
select
	  min(order_date)
	, max(order_date)
from 
	order_details
;

-- 3. How many orders were made within this date range? 5370 orders
select count(distinct order_id) as num_of_orders
from
	order_details
;

-- 4. How many items were ordered within this date range? 12234
select count(*) as num_of_orders
from
	order_details
;

-- 5. Which orders had the most number of items? 
select order_id
	 , count(item_id) as num_items
from
	order_details
group by
	order_id
order by
	num_items desc
;

-- 6. How many order had more than 12 items? 20
with items as (select order_id, count(item_id) as number_of_items
					from order_details
					group by order_id
					order by count(item_id) desc) 
select count(*)
from items
where number_of_items > 12    
;                


