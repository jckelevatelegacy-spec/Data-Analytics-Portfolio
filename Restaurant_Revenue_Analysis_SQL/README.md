# Restaurant Revenue Analysis Using PostgreSQL

## Project Overview

This project explores restaurant sales performance using PostgreSQL and SQL. The objective was to build a relational database from multiple datasets, analyze revenue trends, and identify business insights related to geography, customer behavior, restaurant ratings, and market competition.

This project expands upon a previously created Tableau dashboard by incorporating database management and SQL analysis techniques.

## Business Questions

1. Which cities generate the most revenue?

2. Which weekdays generate the most revenue?

3. Do higher-rated restaurants perform better?

4. Which cities have the highest restaurant competition?

## Dataset Information

The project utilizes two datasets:

### Orders Table

Contains transactional information including:

* Order date
* Sales quantity
* Revenue (USD)
* User ID
* Restaurant ID

### Restaurants Table

Contains restaurant information including:

* Restaurant name
* City
* Rating
* Cuisine
* Address

The datasets were joined using the `r_id` field.

## Tools Used

* PostgreSQL
* pgAdmin 4
* SQL
* GitHub

## SQL Skills Demonstrated

* Database creation
* Data importing
* Data validation
* Table joins
* Aggregations
* Exploratory analysis
* Data quality investigation
* Business analysis

## Key Findings

* Revenue generation varied significantly across cities.
* Customer ordering behavior changed throughout the week.
* Restaurant ratings influenced performance metrics.
* Market competition varied considerably between cities.

## Data Challenges Encountered

* CSV import issues required troubleshooting.
* Cuisine categories contained multiple values within a single field.
* Data validation was necessary before performing analysis.
* Exploratory analyses were conducted before narrowing project scope.

