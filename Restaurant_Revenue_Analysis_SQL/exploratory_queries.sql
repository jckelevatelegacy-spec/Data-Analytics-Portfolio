exploratory_queries.sql
/* ==========================================
DATA VALIDATION
========================================== */

SELECT 
	COUNT(*) AS total_orders
FROM 
	orders;

SELECT 
	COUNT(*) AS total_restaurants
FROM 
	restaurants;

SELECT 
	COUNT(DISTINCT r_id)
FROM 
	orders;

SELECT 
	COUNT(DISTINCT r_id)
FROM 
	restaurants;

/* ==========================================
TOP RESTAURANTS BY REVENUE
========================================== */

SELECT
    r.name,
    r.city,
    SUM(o.revenue_usd) AS total_revenue
FROM 
	orders o JOIN restaurants r ON o.r_id = r.r_id
WHERE 
	o.revenue_usd IS NOT NULL
GROUP BY
    r.name,
    r.city
ORDER BY
    total_revenue DESC
LIMIT 10;

/* ==========================================
CUISINE EXPLORATION
========================================== */

SELECT
    r.cuisine,
    SUM(o.revenue_usd) AS total_revenue
FROM 
	orders o JOIN restaurants r ON o.r_id = r.r_id
WHERE 
	o.revenue_usd IS NOT NULL
GROUP BY 
	r.cuisine
ORDER BY 
	total_revenue DESC
LIMIT 10;

/* ==========================================
REVENUE CONCENTRATION
========================================== */

WITH restaurant_revenue AS (
	SELECT
        	o.r_id,
        	MAX(r.name) AS restaurant_name,
        	MAX(r.city) AS city,
        	SUM(o.revenue_usd) AS total_revenue
	FROM 
		orders o JOIN restaurants r ON o.r_id = r.r_id
	WHERE 
		o.revenue_usd IS NOT NULL
	GROUP BY 
		o.r_id
	)
SELECT
	restaurant_name,
	city,
	ROUND(total_revenue,2) AS total_revenue,
	ROUND(
        100 * total_revenue /
        SUM(total_revenue) OVER (), 4) AS revenue_share_percent
FROM 
	restaurant_revenue
ORDER BY 
	total_revenue DESC
LIMIT 20;


