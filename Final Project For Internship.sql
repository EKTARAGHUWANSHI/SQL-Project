CREATE TABLE customer_sales_data (
customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(50),
    phone_number VARCHAR(20),
    product_purchased VARCHAR(100),
    category VARCHAR(50),
    unit_price NUMERIC,
    quantity INT,
    gross_sales NUMERIC,
    discount_Percent NUMERIC,
    discount_amount NUMERIC,
    net_sales_after_discount NUMERIC,
    order_date DATE,
    payment_method VARCHAR(50)
	);


Truncate customer_sales_data;



CREATE TABLE Digital_Sales_Data (

    Date Int,
	Product_Name VARCHAR(100),
	Country VARCHAR(10),
    Campaign_Source VARCHAR(100),
    Total_View INT,
    Total_Click INT,
    Click_Thro DECIMAL(5,2),
    Total_Purc INT,
    Purchase_Rate DECIMAL(5,2),
    Conversion_Rate DECIMAL(5,2),
    Viewed_Orders INT,
    Add_to_Cart INT,
    Abandoned_Cart INT,
    Revenue DECIMAL(10,2),
    Avg_Order_Value DECIMAL(10,2)

);




CREATE TABLE Customer_Sales_Data2 (

    Date DATE,
    Product_Name VARCHAR(100),
    Country VARCHAR(100),

    Campaign_Source VARCHAR(100),
    Total_View INT,
    Total_Click INT,
    Click_Thro DECIMAL(5,2),
    Total_Purc INT,
    Purchase_Rate DECIMAL(5,2),
    Conversion_Rate DECIMAL(5,2),
    Viewed_Orders INT,
    Add_to_Cart INT,
    Abandoned_Cart INT,
    Revenue DECIMAL(10,2),
    Avg_Order_Value DECIMAL(10,2)

);





Select * From Customer_Sales_Data2;

COPY Customer_Sales_Data2(
    Date,
	Product_Name,
	Country,
    Campaign_Source,
    Total_View,
    Total_Click,
    Click_Thro,
    Total_Purc,
    Purchase_Rate,
    Conversion_Rate,
    Viewed_Orders,
    Add_to_Cart,
    Abandoned_Cart,
    Revenue,
    Avg_Order_Value

)

FROM 'C:\Program Files\PostgreSQL\18\data\Digital_Sales_Data.csv'

DELIMITER ','

CSV HEADER;



-- ============================================================
--   E-COMMERCE ANALYTICS — 20 PostgreSQL QUESTIONS & SOLUTIONS
-- ============================================================


-- ============================================================
-- Q1. CREATE TABLE & INSERT (Basic)
-- Table banao aur data insert karo
-- ============================================================

CREATE TABLE ecommerce_analytics (
    id               SERIAL PRIMARY KEY,
    sale_date        DATE NOT NULL,
    product_name     VARCHAR(100) NOT NULL,
    country          VARCHAR(50),
    campaign_source  VARCHAR(50),
    total_views      INT,
    total_clicks     INT,
    ctr              NUMERIC(5,2),          -- Click-Through Rate (%)
    total_purchases  INT,
    purchase_freq    NUMERIC(4,1),
    conversion_rate  NUMERIC(5,2),          -- (%)
    viewed_only      INT,
    add_to_cart      INT,
    abandoned_cart   INT,
    revenue          NUMERIC(12,2),
    avg_order_value  NUMERIC(8,2)
);

-- Sample inserts (first 75 rows)

INSERT INTO Customer_Sales_Data2 (
    Date,
    Product_Name,
    Country,
    Campaign_Source,
    Total_View,
    Total_Click,
    Click_Thro,
    Total_Purc,
    Purchase_Rate,
    Conversion_Rate,
    Viewed_Orders,
    Add_to_Cart,
    Abandoned_Cart,
    Revenue,
    Avg_Order_Value
)

VALUES

('2024-11-23', 'Wireless Earbuds', 'India', 'SEO Organic', 41048, 2826, 6.88, 369, 1.5, 13.06, 2353, 1485, 1116, 19610.51, 35.43),
('2024-08-04', 'Running Shoes', 'India', 'Google Ads', 33657, 2578, 7.66, 645, 3.1, 25.02, 1730, 1378, 733, 335356.14, 167.72),
('2024-10-06', 'Sunglasses', 'Germany', 'Email Campaign', 41463, 882, 2.13, 125, 3.4, 14.17, 670, 267, 142, 21904.50, 51.54),
('2024-06-21', 'Wireless Earbuds', 'USA', 'Email Campaign', 17676, 1823, 10.31, 443, 3.1, 24.30, 1358, 913, 470, 193649.03, 141.01),
('2024-07-12', 'Wireless Earbuds', 'Singapore', 'Instagram Ads', 52400, 5777, 11.02, 681, 3.5, 11.79, 5003, 3389, 2708, 163412.76, 68.56),
('2024-05-28', 'Wireless Earbuds', 'Germany', 'Google Ads', 54823, 3373, 6.15, 632, 3.2, 18.74, 2368, 965, 333, 206264.58, 101.99),
('2024-04-17', 'Desk Lamp', 'Australia', 'SEO Organic', 14358, 1534, 10.68, 401, 1.6, 26.14, 1008, 568, 167, 79321.01, 123.63),
('2024-05-18', 'Travel Pillow', 'Singapore', 'Facebook Ads', 47504, 1408, 2.96, 187, 3.9, 13.28, 1060, 597, 410, 56827.06, 77.92),
('2024-04-18', 'Travel Pillow', 'Brazil', 'SEO Organic', 46245, 2665, 5.76, 804, 2.7, 30.17, 1392, 950, 146, 167694.30, 77.25),
('2024-05-06', 'Bluetooth Speaker', 'Singapore', 'YouTube Ads', 39438, 5576, 14.14, 1155, 4.1, 20.71, 3604, 2637, 1482, 315100.17, 66.54),
('2024-03-11', 'Water Bottle', 'France', 'Google Ads', 11175, 447, 4.00, 61, 3.2, 13.65, 299, 169, 108, 30287.23, 155.16),
('2024-07-16', 'Sunglasses', 'Brazil', 'Email Campaign', 74352, 5606, 7.54, 1413, 4.0, 25.21, 4170, 2806, 1393, 1042059.24, 184.37),
('2024-12-15', 'Travel Pillow', 'Singapore', 'Instagram Ads', 49587, 1904, 3.84, 395, 2.5, 20.75, 1277, 398, 3, 236160.62, 239.15),
('2024-05-14', 'Water Bottle', 'UK', 'YouTube Ads', 18947, 1600, 8.44, 510, 3.2, 31.87, 779, 611, 101, 83101.44, 50.92),
('2024-03-23', 'Water Bottle', 'Singapore', 'Google Ads', 47487, 4951, 10.43, 286, 1.4, 5.78, 4294, 1545, 1259, 28536.51, 71.27),
('2024-05-03', 'Travel Pillow', 'Brazil', 'Google Ads', 16226, 2314, 14.26, 185, 4.4, 7.99, 1857, 442, 257, 36768.38, 45.17),
('2024-08-31', 'Water Bottle', 'UK', 'Instagram Ads', 74163, 8415, 11.35, 1287, 4.3, 15.29, 5582, 4276, 2989, 980199.79, 177.12),
('2024-06-08', 'Sunglasses', 'Canada', 'Email Campaign', 72839, 8853, 12.15, 937, 1.9, 10.58, 7785, 3706, 2769, 35499.18, 19.94),
('2024-10-10', 'Smartwatch', 'Brazil', 'Facebook Ads', 5942, 190, 3.20, 54, 3.2, 28.42, 122, 58, 4, 39358.66, 227.77),
('2024-06-18', 'Wireless Earbuds', 'Singapore', 'Facebook Ads', 41500, 4806, 11.58, 678, 2.9, 14.11, 3388, 2614, 1936, 141763.02, 72.10),
('2024-08-30', 'Face Serum', 'UAE', 'Facebook Ads', 17363, 744, 4.28, 205, 2.5, 27.55, 431, 310, 105, 63934.38, 124.75),
('2024-01-28', 'Desk Lamp', 'USA', 'Google Ads', 57772, 7120, 12.32, 1745, 3.8, 24.51, 5152, 2763, 1018, 397992.62, 60.02),
('2024-10-01', 'Backpack', 'UK', 'Email Campaign', 29050, 1721, 5.92, 559, 1.9, 32.48, 1124, 785, 226, 217613.67, 204.89),
('2024-10-08', 'Wireless Earbuds', 'India', 'SEO Organic', 75855, 1758, 2.32, 182, 4.2, 10.35, 1455, 352, 170, 84473.84, 110.51),
('2024-09-03', 'Smartwatch', 'UAE', 'Google Ads', 26579, 2083, 7.84, 106, 4.4, 5.09, 1842, 1037, 931, 38258.79, 82.03),
('2024-12-22', 'Bluetooth Speaker', 'Singapore', 'SEO Organic', 68788, 3911, 5.69, 583, 2.0, 14.91, 3269, 1769, 1186, 219091.40, 187.90),
('2024-02-01', 'Bluetooth Speaker', 'Canada', 'Google Ads', 11572, 1427, 12.33, 315, 2.8, 22.07, 841, 476, 161, 25022.34, 28.37),
('2024-09-17', 'Wireless Earbuds', 'UK', 'Google Ads', 13907, 1660, 11.94, 524, 1.8, 31.57, 1075, 979, 455, 140414.18, 148.87),
('2024-10-23', 'Gaming Mouse', 'India', 'YouTube Ads', 15745, 2031, 12.90, 698, 3.0, 34.37, 1172, 965, 267, 131922.00, 63.00),
('2024-06-09', 'Smartwatch', 'Australia', 'Email Campaign', 22154, 3194, 14.42, 819, 2.0, 25.64, 2052, 967, 148, 28157.22, 17.19),
('2024-11-14', 'Gaming Mouse', 'USA', 'Google Ads', 75468, 5001, 6.63, 1286, 1.9, 25.71, 2760, 2000, 714, 542434.80, 222.00),
('2024-05-05', 'Protein Powder', 'Australia', 'Facebook Ads', 62433, 8078, 12.94, 2628, 3.5, 32.53, 4198, 4794, 2166, 154894.32, 16.84),
('2024-10-10', 'Yoga Mat', 'USA', 'Facebook Ads', 39664, 1738, 4.38, 195, 3.6, 11.22, 1464, 473, 278, 57009.42, 81.21),
('2024-04-17', 'Bluetooth Speaker', 'Canada', 'Facebook Ads', 39600, 4932, 12.45, 1246, 1.9, 25.26, 2757, 1350, 104, 86859.91, 36.69),
('2024-08-04', 'Resistance Bands', 'Australia', 'Google Ads', 5464, 450, 8.24, 55, 3.2, 12.22, 362, 96, 41, 33297.44, 189.19),
('2024-10-09', 'Bluetooth Speaker', 'UAE', 'YouTube Ads', 6267, 239, 3.81, 20, 4.3, 8.37, 175, 135, 115, 4302.58, 50.03),
('2024-01-19', 'Resistance Bands', 'Canada', 'YouTube Ads', 77420, 3974, 5.13, 1078, 1.4, 27.13, 2581, 1824, 746, 341471.59, 226.26),
('2024-01-21', 'Travel Pillow', 'Canada', 'Facebook Ads', 37706, 1596, 4.23, 260, 3.7, 16.29, 1128, 895, 635, 183867.06, 191.13),
('2024-05-01', 'Resistance Bands', 'UK', 'Facebook Ads', 59040, 1383, 2.34, 160, 3.6, 11.57, 1053, 581, 421, 117233.28, 203.53),
('2024-05-07', 'Yoga Mat', 'UK', 'SEO Organic', 19168, 1949, 10.17, 136, 4.0, 6.98, 1700, 544, 408, 112553.60, 206.90),
('2024-08-23', 'Protein Powder', 'Australia', 'Facebook Ads', 34219, 877, 2.56, 141, 2.4, 16.08, 665, 176, 35, 81967.25, 242.22),
('2024-05-22', 'Protein Powder', 'Singapore', 'Email Campaign', 75282, 6930, 9.21, 459, 1.4, 6.62, 5937, 1190, 731, 97315.34, 151.44),
('2024-05-15', 'Running Shoes', 'USA', 'YouTube Ads', 61959, 4070, 6.57, 845, 2.5, 20.76, 2702, 1081, 236, 222911.00, 105.52),
('2024-10-22', 'Smartwatch', 'Australia', 'Google Ads', 62154, 1256, 2.02, 328, 4.2, 26.11, 791, 679, 351, 253574.83, 184.07),
('2024-12-09', 'Smartwatch', 'Canada', 'Email Campaign', 14171, 1643, 11.59, 553, 2.2, 33.66, 930, 892, 339, 260693.05, 214.28),
('2024-06-02', 'Water Bottle', 'Australia', 'SEO Organic', 58528, 3842, 6.56, 1016, 3.4, 26.44, 2259, 1276, 260, 207540.35, 60.08),
('2024-12-06', 'Sunglasses', 'UK', 'YouTube Ads', 79593, 6521, 8.19, 1157, 2.9, 17.74, 5364, 2401, 1244, 276543.83, 82.42),
('2024-08-08', 'Face Serum', 'Brazil', 'YouTube Ads', 47237, 4753, 10.06, 1141, 2.5, 24.01, 3394, 2187, 1046, 359985.50, 126.20),
('2024-03-27', 'Desk Lamp', 'USA', 'Instagram Ads', 72561, 6942, 9.57, 729, 3.9, 10.50, 5732, 3484, 2755, 250050.64, 87.95),
('2024-04-11', 'Laptop Bag', 'India', 'Google Ads', 37092, 4633, 12.49, 1482, 4.0, 31.99, 3077, 2414, 932, 666247.92, 112.39),
('2024-11-18', 'Gaming Mouse', 'Germany', 'SEO Organic', 55328, 5155, 9.32, 1075, 1.9, 20.85, 4069, 2903, 1828, 391097.90, 191.48),
('2024-02-24', 'Face Serum', 'UAE', 'Facebook Ads', 28053, 3854, 13.74, 1252, 2.6, 32.49, 2032, 1762, 510, 750681.67, 230.61),
('2024-03-03', 'Backpack', 'UK', 'Email Campaign', 74616, 10649, 14.27, 2970, 2.1, 27.89, 5867, 5479, 2509, 1288127.61, 206.53),
('2024-09-15', 'Sunglasses', 'Singapore', 'Email Campaign', 25861, 3563, 13.78, 1150, 2.6, 32.28, 2160, 2010, 860, 492901.50, 164.85),
('2024-09-23', 'Backpack', 'Germany', 'Instagram Ads', 62654, 1887, 3.01, 386, 1.8, 20.46, 1330, 713, 327, 156232.73, 224.86),
('2024-02-11', 'Laptop Bag', 'UK', 'Facebook Ads', 55205, 6788, 12.30, 651, 3.5, 9.59, 6006, 2350, 1699, 252435.02, 110.79),
('2024-10-04', 'Backpack', 'UAE', 'Google Ads', 32110, 4083, 12.72, 1001, 4.2, 24.52, 2484, 2425, 1424, 82360.28, 19.59),
('2024-10-21', 'Sunglasses', 'France', 'Google Ads', 51105, 3468, 6.79, 971, 4.0, 28.00, 2068, 2073, 1102, 740562.28, 190.67),
('2024-10-06', 'Face Serum', 'Brazil', 'Facebook Ads', 68993, 4974, 7.21, 806, 2.5, 16.20, 4139, 2398, 1592, 189389.85, 93.99),
('2024-12-13', 'Face Serum', 'UAE', 'SEO Organic', 26632, 3974, 14.92, 1155, 4.2, 29.06, 2182, 2248, 1093, 103520.34, 21.34),
('2024-07-20', 'Gaming Mouse', 'Brazil', 'SEO Organic', 8552, 342, 4.00, 99, 2.5, 28.95, 184, 122, 23, 6637.95, 26.82),
('2024-07-13', 'Protein Powder', 'Germany', 'Email Campaign', 47840, 3720, 7.78, 962, 2.0, 25.86, 2327, 1478, 516, 406348.80, 211.20),
('2024-08-28', 'Running Shoes', 'Singapore', 'Google Ads', 50870, 2853, 5.61, 807, 1.2, 28.29, 2005, 1579, 772, 21585.64, 22.29),
('2024-05-06', 'Smartwatch', 'India', 'YouTube Ads', 24973, 1476, 5.91, 137, 2.7, 9.28, 1281, 714, 577, 87932.63, 237.72),
('2024-08-26', 'Bluetooth Speaker', 'Australia', 'Instagram Ads', 26992, 3020, 11.19, 772, 4.4, 25.56, 2131, 1107, 335, 821040.53, 241.71),
('2024-02-25', 'Gaming Mouse', 'India', 'Instagram Ads', 54192, 4332, 7.99, 622, 1.3, 14.36, 3003, 2323, 1701, 131316.64, 162.40),
('2024-02-22', 'Bluetooth Speaker', 'Australia', 'SEO Organic', 20866, 2735, 13.11, 937, 1.1, 34.26, 1253, 1375, 438, 175693.12, 170.46),
('2024-02-05', 'Water Bottle', 'Canada', 'Google Ads', 60057, 7937, 13.22, 2403, 1.4, 30.28, 4793, 4286, 1883, 609660.32, 181.22),
('2024-08-10', 'Laptop Bag', 'Singapore', 'SEO Organic', 40400, 5853, 14.49, 1947, 4.2, 33.26, 2916, 2899, 952, 959699.66, 117.36),
('2024-10-30', 'Yoga Mat', 'Canada', 'Facebook Ads', 16359, 1469, 8.98, 303, 1.9, 20.63, 929, 691, 388, 54144.58, 94.05),
('2024-09-10', 'Resistance Bands', 'Canada', 'Facebook Ads', 68904, 4853, 7.04, 968, 3.8, 19.95, 3537, 1540, 572, 816163.39, 221.88),
('2024-12-25', 'Travel Pillow', 'Australia', 'YouTube Ads', 6330, 655, 10.35, 80, 1.3, 12.21, 471, 330, 250, 15128.88, 145.47),
('2024-05-03', 'Bluetooth Speaker', 'France', 'SEO Organic', 69332, 8728, 12.59, 506, 1.3, 5.80, 7769, 3818, 3312, 116805.55, 177.57),
('2024-06-05', 'Desk Lamp', 'Brazil', 'Instagram Ads', 67031, 10038, 14.98, 1909, 2.5, 19.02, 6602, 4618, 2709, 466177.80, 97.68),
('2024-08-20', 'Yoga Mat', 'Australia', 'Instagram Ads', 35217, 1692, 4.80, 453, 1.7, 26.77, 1178, 1001, 548, 183638.05, 238.46);



Select * From Customer_Sales_Data2;
-- ============================================================
-- Q2. SELECT with WHERE (Basic)
-- India ke sirf woh records jahan revenue > 100000
-- ============================================================

SELECT product_name, campaign_source, revenue, conversion_rate
FROM   Customer_Sales_Data2
WHERE  country = 'India'
  AND  revenue > 100000
ORDER BY revenue DESC;


-- ============================================================
-- Q3. AGGREGATE — Total revenue per product (Basic)
-- Har product ki total revenue kitni hai?
-- ============================================================

SELECT   product_name,
         COUNT(*)                  AS total_records,
         SUM(revenue)              AS total_revenue,
         ROUND(AVG(revenue), 2)    AS avg_revenue
FROM     Customer_Sales_Data2
GROUP BY product_name
ORDER BY total_revenue DESC;


-- ============================================================
-- Q4. GROUP BY + HAVING (Basic-Medium)
-- Woh products jinka average conversion rate > 20%
-- ============================================================

SELECT   product_name,
         ROUND(AVG(conversion_rate), 2) AS avg_conversion
FROM     Customer_Sales_Data2
GROUP BY product_name
HAVING   AVG(conversion_rate) > 20
ORDER BY avg_conversion DESC;


-- ============================================================
-- Q5. DATE FUNCTIONS — Monthly revenue trend (Medium)
-- Har month mein total revenue
-- ============================================================

SELECT   TO_CHAR(date, 'YYYY-MM')  AS month,
         SUM(revenue)                   AS monthly_revenue,
         SUM(Purchase_Rate)           AS monthly_purchases
FROM     Customer_Sales_Data2
GROUP BY TO_CHAR(date, 'YYYY-MM')
ORDER BY month;


-- ============================================================
-- Q6. WINDOW FUNCTION — Rank products by revenue (Medium)
-- Har country ke andar product ka revenue rank
-- ============================================================

SELECT  country,
        product_name,
        SUM(revenue)                                          AS total_revenue,
        RANK() OVER (PARTITION BY country
                     ORDER BY SUM(revenue) DESC)             AS revenue_rank
FROM Customer_Sales_Data2
GROUP BY country, product_name
ORDER BY country, revenue_rank;


-- ============================================================
-- Q7. CTE — Top campaign source per country (Medium)
-- Har country mein sabse zyada revenue lane wala campaign
-- ============================================================

WITH campaign_revenue AS (
    SELECT  country,
            campaign_source,
            SUM(revenue) AS total_revenue,
            RANK() OVER (PARTITION BY country
                         ORDER BY SUM(revenue) DESC) AS rnk
    FROM Customer_Sales_Data2
    GROUP BY country, campaign_source
)
SELECT country, campaign_source, total_revenue
FROM   campaign_revenue
WHERE  rnk = 1
ORDER BY country;


-- ============================================================
-- Q8. SUBQUERY — Products with above-average CTR (Medium)
-- Jinki CTR overall average se zyada ho
-- ============================================================

SELECT 
Product_Name,
Click_Thro

FROM Customer_Sales_Data2

WHERE Click_Thro > (

    SELECT AVG(Click_Thro)
    FROM Customer_Sales_Data2

);




-- ============================================================
-- Q9. CASE WHEN — Performance category banana (Medium)
-- Conversion rate ke basis pe label assign karo
-- ============================================================

SELECT  product_name,
        country,
        conversion_rate,
        CASE
            WHEN conversion_rate >= 30 THEN 'Excellent'
            WHEN conversion_rate >= 20 THEN 'Good'
            WHEN conversion_rate >= 10 THEN 'Average'
            ELSE                             'Poor'
        END AS performance_label,
        revenue
FROM Customer_Sales_Data2
ORDER BY conversion_rate DESC;


-- ============================================================
-- Q10. Abandoned Cart Rate — Derived metric (Medium)
-- Abandoned cart rate = abandoned / add_to_cart * 100
-- ============================================================

SELECT  product_name,
        country,
        add_to_cart,
        abandoned_cart,
        ROUND(
            (abandoned_cart::NUMERIC / NULLIF(add_to_cart, 0)) * 100,
        2) AS abandoned_cart_rate_pct
FROM Customer_Sales_Data2
ORDER BY abandoned_cart_rate_pct DESC
LIMIT 15;


-- ============================================================
-- Q11. WINDOW — Running total revenue per product (Medium)
-- Product ke across cumulative revenue (date-wise)
-- ============================================================

SELECT Date,
        product_name,
        revenue,
        SUM(revenue) OVER (
            PARTITION BY product_name
            ORDER BY Date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_revenue
FROM Customer_Sales_Data2
ORDER BY Product_Name, Date;


-- ============================================================
-- Q12. NTILE — Divide records into revenue quartiles (Medium)
-- Revenue ke hisab se 4 equal buckets
-- ============================================================

SELECT  Product_Name,
        country,
        revenue,
        NTILE(4) OVER (ORDER BY revenue) AS revenue_quartile
FROM Customer_Sales_Data2 
ORDER BY revenue_quartile, revenue DESC;


-- ============================================================
-- Q13. SELF JOIN — Compare same product across countries (Medium-High)
-- Ek hi product ke India vs USA revenue comparison
-- ============================================================

SELECT  a.Product_Name,
        a.revenue   AS india_revenue,
        b.revenue   AS usa_revenue,
        (b.revenue - a.revenue) AS diff_usa_minus_india
FROM    Customer_Sales_Data2 a
JOIN    Customer_Sales_Data2 b
    ON  a.product_name = b.product_name
   AND  a.country      = 'India'
   AND  b.country      = 'USA'
ORDER BY ABS(b.revenue - a.revenue) DESC;


-- ============================================================
-- Q14. PIVOT using CROSSTAB / CASE (Medium-High)
-- Campaign source ke according revenue pivot — row per product
-- ============================================================

SELECT
    product_name,
    ROUND(SUM(CASE WHEN campaign_source = 'Google Ads'     THEN revenue ELSE 0 END), 2) AS google_ads_rev,
    ROUND(SUM(CASE WHEN campaign_source = 'Facebook Ads'   THEN revenue ELSE 0 END), 2) AS facebook_ads_rev,
    ROUND(SUM(CASE WHEN campaign_source = 'Instagram Ads'  THEN revenue ELSE 0 END), 2) AS instagram_ads_rev,
    ROUND(SUM(CASE WHEN campaign_source = 'Email Campaign' THEN revenue ELSE 0 END), 2) AS email_campaign_rev,
    ROUND(SUM(CASE WHEN campaign_source = 'YouTube Ads'    THEN revenue ELSE 0 END), 2) AS youtube_ads_rev,
    ROUND(SUM(CASE WHEN campaign_source = 'SEO Organic'    THEN revenue ELSE 0 END), 2) AS seo_organic_rev
FROM Customer_Sales_Data2
GROUP BY Product_Name
ORDER BY Product_Name;


-- ============================================================
-- Q15. LAG/LEAD — Month-over-month revenue change (High)
-- Pichle month se is month kitna zyada/kam revenue aaya
-- ============================================================

WITH monthly AS (
    SELECT  TO_CHAR(Date, 'YYYY-MM') AS month,
            SUM(revenue)                  AS total_rev
    FROM Customer_Sales_Data2
    GROUP BY TO_CHAR(Date, 'YYYY-MM')
)
SELECT  month,
        total_rev,
        LAG(total_rev)  OVER (ORDER BY month)                       AS prev_month_rev,
        ROUND(total_rev - LAG(total_rev) OVER (ORDER BY month), 2)  AS mom_change,
        ROUND(
            (total_rev - LAG(total_rev) OVER (ORDER BY month))
            / NULLIF(LAG(total_rev) OVER (ORDER BY month), 0) * 100
        , 2)                                                         AS mom_change_pct
FROM    monthly
ORDER BY month;


-- ============================================================
-- Q16. PERCENT_RANK — Revenue percentile of each record (High)
-- Har record ka revenue overall kitne % records se zyada hai
-- ============================================================

 SELECT 
 Product_Name,
 Revenue,

 ROUND(
 CAST(
  PERCENT_RANK() OVER (
  ORDER BY Revenue
            ) * 100
            AS NUMERIC
        ),
        2
    ) AS Revenue_Percentile

FROM Customer_Sales_Data2;



-- ============================================================
-- Q17. CTE + Window — Top 3 products per country by revenue (High)
-- ============================================================

WITH ranked AS (
    SELECT  country,
            product_name,
            SUM(revenue)                                        AS total_revenue,
            DENSE_RANK() OVER (
                PARTITION BY country
                ORDER BY SUM(revenue) DESC
            )                                                   AS dr
    FROM    ecommerce_analytics
    GROUP BY country, product_name
)
SELECT country, product_name, total_revenue, dr AS rank
FROM   ranked
WHERE  dr <= 3
ORDER BY country, dr;


-- ============================================================
-- Q18. CREATE VIEW — High-performing campaigns (High)
-- Reusable view for conversion rate > 25% AND revenue > 200000
-- ============================================================

CREATE OR REPLACE VIEW vw_high_performers AS
SELECT  Date,
        product_name,
        country,
        campaign_source,
        conversion_rate,
        revenue,
        avg_order_value
FROM Customer_Sales_Data2
WHERE conversion_rate > 25
  AND revenue > 200000;

-- View use karna:
SELECT * FROM vw_high_performers ORDER BY revenue DESC;


-- ============================================================
-- Q19. RECURSIVE CTE — Cumulative purchase milestone (High)
-- Har product ke liye cumulative purchase 1000 kab cross hoga
-- (simulation: row-by-row cumulative sum until > 1000)
-- ============================================================

WITH RECURSIVE purchase_milestone AS (
    -- Base case: pehla record har product ka
    SELECT  product_name,
            total_purchases,
            total_purchases   AS cumulative_purchases,
            1                 AS step,
            sale_date
    FROM    ecommerce_analytics e1
    WHERE   sale_date = (SELECT MIN(sale_date) FROM ecommerce_analytics e2
                         WHERE e2.product_name = e1.product_name)

    UNION ALL

    SELECT  e.product_name,
            e.total_purchases,
            pm.cumulative_purchases + e.total_purchases,
            pm.step + 1,
            e.sale_date
    FROM    purchase_milestone pm
    JOIN    ecommerce_analytics e
        ON  e.product_name = pm.product_name
       AND  e.sale_date    = (
               SELECT MIN(sale_date)
               FROM   ecommerce_analytics
               WHERE  product_name = pm.product_name
                 AND  sale_date    > pm.sale_date
           )
    WHERE   pm.cumulative_purchases < 1000
)
SELECT  product_name,
        sale_date,
        cumulative_purchases,
        step
FROM    purchase_milestone
ORDER BY product_name, step;


-- ============================================================
-- Q20. MATERIALIZED VIEW + INDEX — Performance optimization (High)
-- Frequently query hone wale aggregation ko cache karo
-- ============================================================

-- Step 1: Create Materialized View

CREATE MATERIALIZED VIEW product_revenue_summary AS

SELECT 
    Product_Name,
    SUM(Revenue) AS Total_Revenue,
    AVG(Revenue) AS Avg_Revenue,
    COUNT(*) AS Total_Orders

FROM Customer_Sales_Data2

GROUP BY Product_Name;



-- Step 2: Create Index

CREATE INDEX idx_product_name

ON product_revenue_summary(Product_Name);



-- Step 3: Fetch Data

SELECT *
FROM product_revenue_summary;



-- Step 4: Refresh Materialized View

REFRESH MATERIALIZED VIEW product_revenue_summary;


-- ============================================================
-- BONUS: Useful Indexes on main table
-- ============================================================
CREATE INDEX idx_ea_country      ON Customer_Sales_Data2(country);
CREATE INDEX idx_ea_product      ON Customer_Sales_Data2(product_name);
CREATE INDEX idx_ea_campaign     ON Customer_Sales_Data2(campaign_source);
CREATE INDEX idx_ea_Date         ON Customer_Sales_Data2(Date);
CREATE INDEX idx_ea_revenue      ON Customer_Sales_Data2(revenue DESC);



Select * From Customer_Sales_Data2;

-- ============================================================
-- END OF FILE
-- ============================================================