-- Data Cleaning

select * from layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values 
-- 4. Remove any column if that's not necessary


-- 1.Removing Duplicates

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT *
from layoffs;

SELECT *
from layoffs_staging;

-- There's no unique id or something unique to identify the duplicates so we have to do it manually.

WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging)
SELECT * FROM duplicate_cte 
WHERE row_num >1;

select * FROM layoffs_staging
where company = 'Casper';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

select * from layoffs_staging2
where row_num>1;

DELETE from layoffs_staging2
where row_num>1;

-- Standardizing Data

SELECT company,TRIM(company)
from layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT *
FROM layoffs_staging2
where industry LIKE 'Crypto%';


UPDATE layoffs_staging2
SET industry = 'Crypto'
where industry LIKE 'Crypto%';

SELECT DISTINCT country,TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
order by 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' from country)
where country LIKE 'United States%';

-- Changing date type from string to timestamp
SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoffs_staging2; 

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- 3. Null values 

select DISTINCT * from layoffs_staging2
where industry = ''
OR industry IS NULL;

UPDATE layoffs_staging2
SET industry = null
where industry='';

select *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL or t1.industry ='')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
where (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

select * from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2
DROP column row_num;

select * from layoffs_staging2;
