Create Database Project;
Use Project;

select * from international_debt;

# Find the number of distinct countries
select count(distinct country_code) as total_distinct_countries 
from international_debt;

# Finding out the distinct debt indicators
select distinct(indicator_name) 
from international_debt;

# Totaling the amount of debt owed by the country
select round(sum(debt)/1000000,2) as total_debt     # presented unit in million and rounded to 2 decimals
from international_debt;

# Country with the Highest Debt
select country_name,sum(debt) as total_debt 
from international_debt 
group by country_name 
order by sum(debt) desc 
limit 1;

# Average amount of Debt acorss indicators
select indicator_name, 
		indicator_code as debt_indicator, 
        avg(debt) as average_debt 
from international_debt 
group by indicator_code 
order by average_debt desc 
limit 10;

# The highest amount of principal repayments
SELECT country_name, indicator_name
FROM international_debt
WHERE debt= (SELECT MAX(debt)
 FROM international_debt
 WHERE indicator_code ='DT.AMT.DLXF.CD'
 GROUP BY country_name, indicator_code 
 ORDER BY MAX(debt) DESC
 LIMIT 1);
 
# The  most common debt indicator
select indicator_code, count(indicator_code) as indicator_count 
from international_debt
group by indicator_code
order by indicator_count desc
limit 1;

# Other Viable debt issues and conclusion.
SELECT country_name, indicator_code, MAX(debt) as maximum_debt
FROM international_debt
GROUP by country_name, indicator_code
ORDER BY maximum_debt DESC
LIMIT 10;