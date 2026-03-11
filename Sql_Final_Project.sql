create database project;

use project;

select * from sale_pipeline;

select * from products;

select * from accounts;

select * from sales_teams;

/*-----------------------------------------------------------------*/

-- CREATING VIEWS

CREATE VIEW opportunity_metrics AS
SELECT 
    opportunity_id,
    sales_agent,
    product,
    account,
    deal_stage,
    close_value,
    DATEDIFF(close_date, engage_date)as days_to_close,
    case
     when deal_stage = 'Won' then'Won'
       when deal_stage = 'Lost'then 'Lost'
       else 'Open'
    end as deal_status
from sale_pipeline;
select  * from opportunity_metrics;

/*-----------------------------------------------------------------*/

CREATE VIEW sales_agent_performance AS
SELECT 
    sales_agent,
    COUNT(opportunity_id) AS total_opportunities,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
    (SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) / COUNT(opportunity_id)) * 100 AS win_rate,
    SUM(CASE WHEN deal_stage = 'Won' THEN close_value ELSE 0 END) AS total_revenue,
    AVG(CASE WHEN deal_stage = 'Won' THEN close_value END) AS avg_deal_size,
    AVG(DATEDIFF(close_date, engage_date)) AS avg_days_to_close
FROM sale_pipeline
GROUP BY sales_agent;
select * from sales_agent_performance;

/*-----------------------------------------------------------------*/

-- Product Performance View
CREATE VIEW product_performance AS
SELECT 
    product,
    SUM(CASE WHEN deal_stage = 'Won' THEN close_value ELSE 0 END) AS total_revenue,
    (SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) / COUNT(opportunity_id)) * 100 AS win_rate,
    AVG(CASE WHEN deal_stage = 'Won' THEN close_value END) AS avg_deal_size
FROM sale_pipeline
GROUP BY product;
select * from  product_performance;

/*-----------------------------------------------------------------*/

CREATE VIEW regional_performance AS
SELECT 
    st.regional_office,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_value ELSE 0 END) AS total_revenue,
    (SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) / COUNT(sp.opportunity_id)) * 100 AS win_rate,
    COUNT(DISTINCT st.sales_agent) AS active_agents
FROM sale_pipeline sp
JOIN sales_teams st ON sp.sales_agent = st.sales_agent
GROUP BY st.regional_office;
select * from  regional_performance;

select avg(close_value) as cv
from sale_pipeline; 

/*-----------------------------------------------------------------*/

-- KPI Engineering

/* You must define and calculate:
Total Pipeline Value
Closed Revenue
Win Rate %
Average Deal Size
Average Sales Cycle Length
Revenue by Region
Revenue by Sector
Revenue by Product Series
Manager Performance
Top 5 Sales Agents
Open vs Closed Opportunities 
Stage-wise Drop-off %         */



-- Total Pipeline Value
select sum(close_value) as Total_Pipeline_Value
from sale_pipeline;

/*-----------------------------------------------------------------*/

-- Closed Revenue
select sum(revenue) as Total_Revenue
from accounts;



/*-----------------------------------------------------------------*/

-- Win RATE %
select ((select count(deal_stage) as won
				from sale_pipeline
				where deal_stage='Won')/count(deal_stage)) *100 as Won_Percent
from sale_pipeline;

/*-----------------------------------------------------------------*/

-- Average Deal Size
select avg(close_value)  as Avg_deal_size
from sale_pipeline
where close_value is not null;

/*-----------------------------------------------------------------*/

-- Average Sales Cycle Length
SELECT 
    AVG(DATEDIFF(close_date, engage_date)) AS avg_sales_cycle_length
FROM sale_pipeline;

/*-----------------------------------------------------------------*/

-- Revenue by Office Location
select office_location , sum(revenue) as Total_Revenue
from accounts
group by  office_location
order by sum(revenue) desc;

/*-----------------------------------------------------------------*/

-- -- Revenue by Region
select st.Regional_office , sum(sp.close_value) as Total_Revenue
from sale_pipeline as sp
left join sales_teams as st
on st.sales_agent = sp.sales_agent
group by st.regional_office;

/*-----------------------------------------------------------------*/

-- Revenue by Sector
select ac.sector , sum(sp.close_value) as Total_revenue
from accounts as ac
left join sale_pipeline as sp
on sp.account =ac.account
group by ac.sector
order by sum(sp.close_value) desc;

/*-----------------------------------------------------------------*/

-- Revenue by Product Series
select product , sum(close_value) as Total_sale
from sale_pipeline
group by product
order by sum(close_value) desc;

/*-----------------------------------------------------------------*/

-- Manager Performance
select m.manager , sum(sp.close_value) as TOTAL_REVENUE
from sales_teams as m
left join sale_pipeline as sp
on sp.sales_agent = m.sales_agent
group by m.manager
order by sum(sp.close_value) desc;

/*-----------------------------------------------------------------*/

-- Top 5 Sales Agents
select sales_agent , count(deal_stage) as Total_deal_won , sum(close_value) as Total_sale
from sale_pipeline
where deal_stage ='won'
group by sales_agent
order by sum(close_value) desc
limit 5;

/*-----------------------------------------------------------------*/

-- Open vs Closed Opportunities 
select count(deal_stage) as Closed_opportunity , (select count(deal_stage) from sale_pipeline where deal_stage='Engaging' or deal_stage= 'Prospecting') as Open_opportunity
from sale_pipeline
where deal_stage='won' or deal_stage = 'lost';

/*-----------------------------------------------------------------*/

SELECT DISTINCT series
FROM products;
