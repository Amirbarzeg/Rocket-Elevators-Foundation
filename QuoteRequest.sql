SELECT count(id) AS TotalQuoteRequest FROM fact_quotes;

SELECT DATE_TRUNC('month', "Creation") AS month, COUNT(id) AS QuoteRequest
FROM fact_quotes
GROUP BY DATE_TRUNC('month',"Creation");