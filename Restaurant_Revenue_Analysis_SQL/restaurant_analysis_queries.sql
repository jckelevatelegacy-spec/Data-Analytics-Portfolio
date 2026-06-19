/* ==========================================
01 REVENUE BY CITY
========================================== */

SELECT
    r.city,
    ROUND(SUM(o.revenue_usd),2) AS total_revenue
FROM
    orders o JOIN restaurants r ON o.r_id = r.r_id
WHERE
    o.revenue_usd IS NOT NULL
GROUP BY
    r.city
ORDER BY
    total_revenue DESC
LIMIT 10;

/* ==========================================
02 REVENUE BY WEEKDAY
========================================== */

SELECT
    weekday,
    ROUND(SUM(revenue_usd),2) AS total_revenue
FROM
    orders
WHERE
    revenue_usd IS NOT NULL
GROUP BY
    weekday
ORDER BY
    total_revenue DESC;

/* ==========================================
03 RATING VS REVENUE
========================================== */

SELECT
    r.rating,
    ROUND(AVG(o.revenue_usd),2) AS avg_revenue,
    COUNT(*) AS total_orders
FROM
    orders o JOIN restaurants r ON o.r_id = r.r_id
WHERE
    o.revenue_usd IS NOT NULL
    AND r.rating IS NOT NULL
GROUP BY
    r.rating
ORDER BY
    r.rating DESC;

/* ==========================================
04 MARKET SATURATION
========================================== */

SELECT
    city,
    COUNT(*) AS restaurant_count
FROM
    restaurants
GROUP BY
    city
ORDER BY
    restaurant_count DESC
LIMIT 10;
