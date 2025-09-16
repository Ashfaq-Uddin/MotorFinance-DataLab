-- Section A - Question 1
-- Title: Q1. Create a file to showing the top 5 upazilas with the highest proportion of customers who
-- paid less than 50% of their EMIs.
-- Dataset: tractor_credit_data.csv

SELECT upazila, ROUND(SUM(CASE WHEN emi_paid_months * 100.0 / total_emi_months < 50 THEN 1 ELSE 0 END) / COUNT(*), 3) AS low_emi_ratio
FROM tractor_credit_data
WHERE total_emi_months > 0
GROUP BY upazila
ORDER BY low_emi_ratio DESC
LIMIT 5;

-- Output:
-- +-------------+----------------+
-- | upazila     | low_emi_ratio  |
-- +-------------+----------------+
-- | Muradnagar  | 0.625          |
-- | Sadar       | 0.571          |
-- | Rupsha      | 0.567          |
-- | Gafargaon   | 0.533          |
-- | Banaripara  | 0.500          |
-- +-------------+----------------+