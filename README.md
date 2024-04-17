### ----------- US Household Income Analysis Project -----------
This repository contains the code and documentation for a data analysis project focused on analyzing US household income data. The project involves extracting, transforming, and loading (ETL) data using SQL, cleaning the dataset by handling duplicates and missing values, performing exploratory data analysis (EDA) using SQL, and visualizing insights using Tableau.

# Overview
The goal of this project is to analyze US household income data to derive insights and trends. The project uses SQL for data manipulation tasks, including ETL processes, data cleaning, and initial analysis. Tableau is used for visualizing the cleaned dataset and presenting key findings.

# Data Source
The dataset used in this project contains information on US household income. It includes various attributes such as income statistics, demographic information, and geographical data.
https://www.census.gov/

# Tools and Technologies Used
SQL: Used for data extraction, transformation, cleaning, and initial analysis.
Tableau: Used for data visualization and creating interactive dashboards.
GitHub: Repository hosting and version control for project code and documentation.

# Project Structure
CLEAN_DATA/: Directory containing the dataset after the cleaning process.
RAW_DATA/: Directory containing the dataset used in the analysis.
scripts/: SQL scripts for data cleaning, analysis, and EDA.
tableau/: Tableau workbook and visualization files. https://public.tableau.com/app/profile/ruby.ghabboun/viz/USAHouseholdIncome/Story1
README.md: Project overview and instructions.

# Key Steps
1.Data Extraction: The dataset was extracted from (https://www.census.gov/).
Data Cleaning: Duplicate records and missing values were handled using SQL queries. Generated missing values were based on [similarities in the data set & in some cases averages].

2.Exploratory Data Analysis (EDA):
SQL Queries where used to perform data cleaning and exploratory data analysis,  results will be at the bottom of this readme file.

3.Visualization with Tableau: The cleaned dataset was visualized using Tableau to create interactive visualizations and dashboards.
https://public.tableau.com/app/profile/ruby.ghabboun/viz/USAHouseholdIncome/Story1

# Usage
To replicate this analysis:

Clone this repository: git clone (git@github.com:rubyghabboun/US_household_income.git) or (https://github.com/rubyghabboun/US_household_income.git)
Set up your SQL environment and database.
Run the SQL scripts in the scripts/ directory to execute the data cleaning and analysis tasks.
Open the Tableau workbook in the tableau/ directory to explore the visualizations.

# Results
# mean = avarage income / median = most reported income.
Top 5 States by Average income
District of Columbia: $90,668.4 (Mean), $93,759.6 (Median)
Connecticut: $89,732.8 (Mean), $121,240.4 (Median)
New Jersey: $89,565.4 (Mean), $126,972.7 (Median)
Maryland: $88,444.2 (Mean), $114,969.2 (Median)
Massachusetts: $85,645.7 (Mean), $119,074.4 

Top 5 States by highest most reported income Income:
New Jersey: $126,972.7 (Median)
Wyoming: $126,316.7 (Median)
Alaska: $122,295.7 (Median)
Connecticut: $121,240.4 (Median)
Massachusetts: $119,074.4 (Median)

Bottom 4 States by Average Income:
Puerto Rico: $27,841.7 (Mean), $22,522.4 (Median)
Mississippi: $49,385.6 (Mean), $57,964.7 (Median)
Arkansas: $52,213.9 (Mean), $52,536.1 (Median)
West Virginia: $52,292.0 (Mean), $63,566.3 (Median)
Alabama: $54,023.8 (Mean), $63,252.2 (Median)

Highest Income Cities:
Delta Junction, Alaska: $242,857.0 (Mean), $300,000.0 (Median)
Short Hills, New Jersey: $216,503.0 (Mean), $300,000.0 (Median)
Narberth, Pennsylvania: $194,426.0 (Mean), $224,616.0 (Median)
Chevy Chase, Maryland: $194,157.5 (Mean), $259,355.5 (Median)
Darien, Connecticut: $192,882.0 (Mean), $300,000.0 (Median)

Lowest Income Cities:
Center, Colorado: $10,946.0 (Mean), $6,808.0 (Median)
Estancia, New Mexico: $11,375.0 (Mean), $300,000.0 (Median)
Corsica, South Dakota: $13,534.0 (Mean), $7,282.0 (Median)
Mount Olivet, Kentucky: $13,882.0 (Mean), $300,000.0 (Median)
Fordville, North Dakota: $13,982.0 (Mean), $8,188.0 (Median).

Largest States by Total Area and Percentage of Land/Water:

Texas: Total Area - 181,206,869,469 sq. units, Land Percentage - 95.59%
California: Total Area - 94,321,769,310 sq. units, Land Percentage - 95.90%
Missouri, Minnesota, Michigan, Illinois, Kansas, Oklahoma, Iowa, Wisconsin.

Smallest States by Total Area and Percentage of Land/Water:
District of Columbia, Rhode Island, Delaware, Puerto Rico, Wyoming, Connecticut, hawaii.

