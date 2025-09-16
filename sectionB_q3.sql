-- Section B - Question 3
-- Q3. Find dealers who have more than 3 transactions flagged with either:
-- a. customer_nid_duplicate_flag = 1
-- b. or same_phone_multiple_buyers_flag = 1
-- Return: dealer_id, fraud_count, total_transactions

SELECT t1.dealer_id, COUNT(*) AS fraud_count,
    (SELECT COUNT(*) 
     FROM dealer_transaction_data AS t2 
     WHERE t2.dealer_id = t1.dealer_id) AS total_transactions
FROM dealer_transaction_data AS t1
WHERE customer_nid_duplicate_flag = 1 
   OR same_phone_multiple_buyers_flag = 1
GROUP BY dealer_id
HAVING fraud_count > 3
ORDER BY fraud_count DESC;

/*
| dealer_id  | fraud_count | total_transactions |
|------------|-------------|--------------------|
| DEALER_13  |     9       |         33         |
| DEALER_16  |     8       |         22         |
| DEALER_15  |     7       |         29         |
| DEALER_12  |     7       |         12         |
| DEALER_11  |     7       |         25         |
| DEALER_14  |     5       |         19         |
| DEALER_19  |     5       |         19         |
| DEALER_3   |     5       |         18         |
| DEALER_18  |     5       |         20         |
| DEALER_4   |     5       |         23         |
| DEALER_2   |     5       |         21         |
| DEALER_5   |     4       |         18         |
| DEALER_6   |     4       |         13         |
| DEALER_9   |     4       |         20         |
*/

