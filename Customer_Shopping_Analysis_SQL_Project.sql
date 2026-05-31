/*
================================================
  PROJECT: Customer Shopping Behavior Analysis
  TOOL: PostgreSQL
  STEP 2: Data Analysis (SQL Queries)
  AUTHOR: Mehwish Nisha Khan
================================================
*/

-- ================================================
-- VIEWING THE DATASET
-- ================================================

SELECT * FROM customers;

-- ================================================
-- BUSINESS ANALYSIS: 10 KEY BUSINESS QUESTIONS
-- ================================================

-- Q1. Which product category contributes the most to overall revenue?
SELECT category,
       ROUND(SUM(total_amount)::numeric, 2) AS total_revenue
FROM customers
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;
-- FINDING: Clothing contributes the most to overall revenue with 113,996,791.04

-- ------------------------------------------------

-- Q2. Which shopping mall is the top performing location in terms of total sales?
SELECT shopping_mall,
       ROUND(SUM(total_amount)::numeric, 2) AS sales
FROM customers
GROUP BY shopping_mall
ORDER BY sales DESC
LIMIT 1;
-- FINDING: Mall of Istanbul is the top performing mall with total sales of 50,872,481.68

-- ------------------------------------------------

-- Q3. What is the most preferred payment method among customers?
SELECT payment_method,
       COUNT(*) AS total_transactions
FROM customers
GROUP BY payment_method
ORDER BY total_transactions DESC;
-- FINDING: Cash is the most preferred payment method, followed by Credit Card and Debit Card

-- ------------------------------------------------

-- Q4. Which gender segment drives higher purchasing power and what is their average spending?
SELECT gender,
       ROUND(SUM(total_amount)::numeric, 2) AS total_purchase,
       ROUND(AVG(total_amount)::numeric, 2) AS average_spending
FROM customers
GROUP BY gender
ORDER BY total_purchase DESC;
-- FINDING: Females have the highest purchasing power however
--          their average spending of 2525.25 is slightly lower than males

-- ------------------------------------------------

-- Q5. Which age group represents the most valuable customer segment based on total and average spending?
SELECT age_group,
       ROUND(SUM(total_amount)::numeric, 2) AS total_spending,
       ROUND(AVG(total_amount)::numeric, 2) AS average_spending
FROM customers
GROUP BY age_group
ORDER BY total_spending DESC, average_spending;
-- FINDING: Middle Aged customers represent the most valuable customer segment

-- ------------------------------------------------

-- Q6. What is the top purchasing category for each gender?
SELECT gender, category, total_purchases
FROM (
    SELECT gender,
           category,
           COUNT(*) AS total_purchases,
           RANK() OVER (PARTITION BY gender ORDER BY COUNT(*) DESC) AS rank
    FROM customers
    GROUP BY gender, category
) ranked
WHERE rank = 1;
-- FINDING: Clothing is the top purchasing category for both Male and Female customers

-- ------------------------------------------------

-- Q7. Which shopping mall attracts the highest number of young adult customers?
SELECT shopping_mall,
       number_of_customers
FROM (
    SELECT shopping_mall,
           age_group,
           COUNT(*) AS number_of_customers
    FROM customers
    GROUP BY shopping_mall, age_group
    ORDER BY number_of_customers DESC
) AS subquery
WHERE age_group = 'Young Adult'
ORDER BY number_of_customers DESC;
-- FINDING: Mall of Istanbul attracts the highest number of Young Adult customers with 2,382

-- ------------------------------------------------

-- Q8. How do shopping malls rank against each other in terms of total revenue?
SELECT shopping_mall,
       ROUND(SUM(total_amount)::numeric, 2) AS total_revenue,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS revenue_rank
FROM customers
GROUP BY shopping_mall;
-- FINDING: Mall of Istanbul ranks 1st, followed closely by Kanyon Mall in 2nd place

-- ------------------------------------------------

-- Q9. What is the running total of revenue generated day by day?
WITH daily_revenue AS (
    SELECT invoice_date,
           ROUND(SUM(total_amount)::numeric, 2) AS total_revenue
    FROM customers
    GROUP BY invoice_date
)
SELECT invoice_date,
       total_revenue,
       ROUND(SUM(total_revenue) OVER (ORDER BY invoice_date)::numeric, 2) AS running_total
FROM daily_revenue
ORDER BY invoice_date;
-- FINDING: Running total shows consistent revenue growth day by day

-- ------------------------------------------------

-- Q10. Who is the top spending customer in each age group?
SELECT customer_id,
       age_group,
       total_spent
FROM (
    SELECT customer_id,
           age_group,
           ROUND(SUM(total_amount)::numeric, 2) AS total_spent,
           ROW_NUMBER() OVER (PARTITION BY age_group ORDER BY SUM(total_amount) DESC) AS rank
    FROM customers
    GROUP BY customer_id, age_group
) ranked
WHERE rank = 1
ORDER BY total_spent DESC;
-- FINDING: ROW_NUMBER() was used instead of RANK() because multiple customers
--          had similar revenue within the same age group.
--          This ensures exactly one top customer is returned per age group.

/*
================================================
  END OF SQL ANALYSIS
================================================
*/