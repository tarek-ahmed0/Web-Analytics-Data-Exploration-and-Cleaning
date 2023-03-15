-- Data Ingestion 
-- Create Database To Import CSV File In It.
CREATE DATABASE Web_analytics;

-- Performing Data Cleaning.
-- Rename Our Table Name Into Simple Name Without Spaces.
ALTER TABLE web_analytics.`Full Data After Cleaning`
RENAME TO web_analytics.FullData;

--  Remove Special Character From The First Column Name.
ALTER TABLE web_analytics.FullData
RENAME COLUMN `ï»¿Source / Medium` TO `Source/ Medium`;

-- Duplicate The Month Column
ALTER TABLE web_analytics.FullData
ADD COLUMN `Month Name` VARCHAR(255);

UPDATE web_analytics.FullData
SET `Month Name` = `Month`;

-- Convert Month Num Into It's Name 
UPDATE web_analytics.FullData
SET `Month Name` = (
	CASE
		WHEN Month = 1 THEN "Jan"
        WHEN Month = 2 THEN "Feb"
        WHEN Month = 3 THEN "Mar"
        WHEN Month = 4 THEN "Apr"
        WHEN Month = 5 THEN "May"
        WHEN Month = 6 THEN "Jun"
        WHEN Month = 7 THEN "Jul"
        WHEN Month = 8 THEN "Aug"
        WHEN Month = 9 THEN "Sep"
        WHEN Month = 10 THEN "Oct"
        WHEN Month = 11 THEN "Nov"
        
        ELSE "Dec"
    END
);

-- Move Month Name Column Position
ALTER TABLE web_analytics.FullData
MODIFY COLUMN `Month Name` VARCHAR(255) AFTER Month;

-- Perform Data Exploration ( EDA )
-- Calc Total Users Per Each Source / Medium.
SELECT `Source / Medium`, SUM(Users) FROM web_analytics.FullData
GROUP BY `Source / Medium`;

-- Calc New Users Per Each Source / Medium.
SELECT `Source / Medium`, SUM(`New Users`) FROM web_analytics.FullData
GROUP BY `Source / Medium`;

-- Calc Sessions Per Each Source / Medium.
SELECT `Source / Medium`, SUM(Sessions) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Pageviews Per Each Source / Medium.
SELECT `Source / Medium`, SUM(Pageviews) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Transactions Per Each Source / Medium.
SELECT `Source / Medium`, SUM(Transactions) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Revenue Per Each Source / Medium.
SELECT `Source / Medium`, SUM(Revenue) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Quantity Sold Per Each Source / Medium.
SELECT `Source / Medium`, SUM(`Quantity Sold`) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Avg Bounce Rate Per Each Source / Medium.
SELECT `Source / Medium`, AVG(`Bounce Rate`) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Avg Session Duration Per Each Source / Medium.
SELECT `Source / Medium`, AVG(`Avg. Session Duration`) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Calc Avg Conversion Rate Per Each Source / Medium.
SELECT `Source / Medium`, AVG(`Conversion Rate (%)`) FROM web_analytics.FullData
GROUP BY `Source / Medium`; 

-- Find Min & Max of Quantity Sold For Each Source / Medium (A).
-- Month of Min Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MIN(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "A" 
);
-- Month of Max Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MAX(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "A" 
);

-- Find Min & Max of Quantity Sold For Each Source / Medium (B).
-- Month of Min Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MIN(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "B" 
);
-- Month of Max Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MAX(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "B" 
);

-- Find Min & Max of Quantity Sold For Each Source / Medium (C).
-- Month of Min Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MIN(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "C" 
);
-- Month of Max Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MAX(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "C" 
);

-- Find Min & Max of Quantity Sold For Each Source / Medium (AA).
-- Month of Min Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MIN(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "AA" 
);
-- Month of Max Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MAX(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "AA" 
);

-- Find Min & Max of Quantity Sold For Each Source / Medium (BB).
-- Month of Min Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MIN(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "BB" 
);
-- Month of Max Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MAX(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "BB" 
);

-- Find Min & Max of Quantity Sold For Each Source / Medium (CC).
-- Month of Min Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MIN(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "CC" 
);
-- Month of Max Value 
SELECT `Source / Medium`, `Month Name`, `Quantity Sold`
FROM web_analytics.FullData
WHERE `Quantity Sold` = (
	SELECT MAX(`Quantity Sold`)
    FROM web_analytics.FullData
	WHERE `Source / Medium` = "CC" 
);