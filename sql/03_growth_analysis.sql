/* Growth Analysis
Business questions: monthly growth and growth drivers.

Practice: CTEs, LAG, window functions, percentage change.
*/

-- MoM : first explore previous month details
select
format(order_date, 'MMM/yyyy') as 'Month-year',
sum(total_amount),
LAG(SUM(total_amount)) OVER (
    ORDER BY YEAR(order_date), MONTH(order_date)
) AS previous_month_revenue
from orders
where status = 'Completed'
group by
year(order_date), month(order_date),
format(order_date, 'MMM/yyyy');


/* Learning about LAG:
LAG = Previous | OVER = Where | ORDER BY = Which order !!!!!

syntax: LAG(value) OVER ( ORDER BY something )
*/


-- MoM % Growth:
with previous_month_details as(

select
format(order_date , 'MMM/yyyy') as 'Month-year',
year(order_date) as order_year,
month(order_date) as order_month,
sum(total_amount) as current_revenue,

lag(sum(total_amount))
over(order by year(order_date), month(order_date)) as prev_month_rev

from orders
where status = 'Completed'

group by
year(order_date),
month(order_date),
format(order_date , 'MMM/yyyy')

)

select [month-year], [current_revenue], [prev_month_rev],
(([current_revenue] - [prev_month_rev]) / [prev_month_rev]) * 100 as 'MoM % Growth'
from previous_month_details;


-- Customer wise monthly tracks:
select c.customer_id,
format(o.order_date, 'MMM/yyyy') as 'Month-year',
month(o.order_date) as 'order_month',
year(o.order_date) as 'order_year',
sum(o.total_amount) as 'total_amnt',
lag(sum(o.total_amount)) over (
    partition by c.customer_id
    order by year(o.order_date), month(o.order_date)
) as 'pre_month_detail'
from customers c
left join orders o on c.customer_id = o.customer_id
where o.status = 'Completed'
group by c.customer_id, month(o.order_date),
year(o.order_date), format(o.order_date, 'MMM/yyyy')
order by c.customer_id, year(o.order_date), month(o.order_date);


-- MoM % : customer wise
with prev_month as
(
select c.customer_id,
format(o.order_date, 'MMM/yyyy') as 'Month-year',
month(o.order_date) as 'order_month',
year(o.order_date) as 'order_year',
sum(o.total_amount) as 'total_amnt',
lag(sum(o.total_amount)) over (
    partition by c.customer_id
    order by year(o.order_date), month(o.order_date)
) as 'pre_month_detail'
from customers c
left join orders o on c.customer_id = o.customer_id
where o.status = 'Completed'
group by c.customer_id, month(o.order_date),
year(o.order_date), format(o.order_date, 'MMM/yyyy')
)

select customer_id, [Month-year], total_amnt, pre_month_detail,
((total_amnt - pre_month_detail) * 100.0) / NULLIF(pre_month_detail, 0) as 'MoM %'
from prev_month
order by customer_id, order_year, order_month;
