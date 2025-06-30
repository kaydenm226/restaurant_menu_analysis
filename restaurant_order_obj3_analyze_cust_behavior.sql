-- Analyze customer behavior
use restaurant_db;


select * from menu_items;
select * from order_details;

-- 1. Combine the menu_items and order_details tables into a single table.
-- list transaction tables first over a look up table
select *
from
	order_details od
		left join menu_items mi
			on mi.menu_item_id = od.item_id
;            

/* 2. What were the least and most ordered items? What categories were they in? 
least ordered - chicken taco, 123, Mexican
most ordered - hamburger, 622, American
*/
select 
		item_name
	  , category
      , count(order_details_id) as num_purchases
from
	order_details od
		left join menu_items mi
			on mi.menu_item_id = od.item_id
group by
		item_name, category
order by
	num_purchases desc
;


/* 3. What were the top 5 orders that spent the most money?
(440, 2075, 1957, 330, 2675)
*/
select 
		od.order_id
	  , sum(mi.price) as total_spent
from
	order_details od
		left join menu_items mi
			on mi.menu_item_id = od.item_id
group by
	od.order_id
order by
	total_spent desc
limit 5
;

/* 4. View the details of the highest spend order. What insights can you gather from the results? (440)
What did they order? How much from each category?
*/
select 
	 category
	, count(item_id) as num_items	
from
	order_details od
		left join menu_items mi
			on mi.menu_item_id = od.item_id
where
	order_id = 440

group by
	category
;


/* 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?
The highest spending customer tend to order Italian the most
*/
select 
	  order_id
    , category
	, count(item_id) as num_items	
from
	order_details od
		left join menu_items mi
			on mi.menu_item_id = od.item_id
where
	order_id in (440, 2075, 1957, 330, 2675)

group by
	order_id, category
;

