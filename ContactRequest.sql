SELECT count(id) AS TotalContactRequest FROM fact_contacts;

SELECT DATE_TRUNC('month', "CreationDate"), COUNT(id) AS ContactRequest
FROM fact_contacts
GROUP BY DATE_TRUNC('month',"CreationDate");