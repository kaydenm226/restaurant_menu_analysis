-- OBJECTIVE 1: Explore the items table

use restaurant_db;

select * from menu_items;


-- 1. Find the number of items on the menu. 32 items
select count(*) from menu_items;


 -- 2. What are the least and most expensive items on the menu?  least- edamame, most- shrimp scampi
select * 
from menu_items
order by price;

select * 
from menu_items
order by price desc;
			
  
-- 3. How many Italian dishes are on the menu? 9 Italian dishes
select count(*) as num_of_italian_dishes
from   menu_items
where  category = 'Italian'
 ;
 
-- 4. What are the least and most expensive Italian dishes on the menu? least- spaghetti, most- shrimp scampi
select *			
from  menu_items
where category = 'Italian'
order by price
;
	
select *			
from   menu_items
where category = 'Italian'
order by price desc
;

-- 5. How many dishes are in each category? American- 6, Asian- 8, Mexican- 9, Italian- 9
select category
	 , count(menu_item_id) as num_of_dishes
from menu_items
group by category
;

-- What is the average dish price within each category? American- 10.06, Asian- 13.47, Mexican- 11.80, Italian- 16.75
select category
	 , avg(price) as avg_price
from menu_items
group by category
;
