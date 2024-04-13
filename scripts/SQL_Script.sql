# load tables
SELECT *
FROM ushouseholdincome_statistics
;
SELECT *
FROM ushouseholdincome
;

# change column name
alter table ushouseholdincome_statistics rename column`ï»¿id` to `id`;

##------------------------- WORKING ON ushouseholdincome TABLE -------------------------##

# finding duplicates 
SELECT count(id), id
FROM ushouseholdincome
group by id
having count(id)  > 1;

# no duplicates found here 
SELECT count(id), id
FROM ushouseholdincome_statistics
group by id
having count(id)  <> 1;

# removing duplicated rows
# step one find rows with dup.
select * 
from(
select  id, row_id,
row_number() over(partition by id) AS row_numb
FROM ushouseholdincome) AS tabkl
where row_numb > 1;

# step two find row ids and delete
delete from ushouseholdincome
where row_id in (
    select row_id
    from(
            select  id, row_id,
            row_number() over(partition by id) AS row_numb
            FROM ushouseholdincome) AS tabkl
where row_numb > 1);

## search for typos in state name and other columns
select State_Name, count(state_name)
from ushouseholdincome
group by state_name;

# checking type column typos and found Borough (right) and Boroughs (wrong)
select type, count(type)
from ushouseholdincome
group by type;



# fix borough
update ushouseholdincome
set type = 'Borough'
where type = 'Boroughs';

# fix georia must be georgia, Alabama one is lowercase.
update ushouseholdincome
set state_name = 'Georgia'
where state_name = 'georia';

update ushouseholdincome
set state_name = 'Alabama'
where state_name = 'alabama';

# check if state names and their abreviations are correct
# all state names and atate ab are = so no errors
select *
from(
select count(State_Name) AS r , count(state_ab) AS b
from ushouseholdincome
group by state_name, state_ab) as tbb
where r <> b
;

# identify missing values and nulls. then do the same for all columns if possible
SELECT *
FROM ushouseholdincome
WHERE place = ''; 

#attempt to generate the missing values by comparing others in same county ( all other columns are good)
select county, place
from ushouseholdincome
where county = 'Autauga County';

# now update table with the right data for missing place
update ushouseholdincome
set place = 'Autaugaville'
where place = '';

## confirm we dont have an area with 0 land and 0 water and check for nulls ( ALL GOOD )
select aland,
awater
from ushouseholdincome
where 
(aland = 0 or aland ='' or aland is null)
and
(awater = 0 or awater ='' or awater is null);

##------------------------- WORKING ON ushouseholdincome TABLE -------------------------##

select *
from ushouseholdincome_statistics;

SELECT STATE_NAME,  COUNT(STATE_NAME)
from ushouseholdincome_statistics
group by state_name;

# check for 0 , missing, or nulls ( found some data but will decide to drop after exploratory data analysis
select *
from ushouseholdincome_statistics
where 
(mean = 0 or mean ='' or mean is null)
or
(median = 0 or median ='' or median is null)
or
(stdev = 0 or stdev ='' or stdev is null)
;


##------------------------- WORKING ON exploratory data analysis -------------------------##

select *
from ushouseholdincome;

select *
from ushouseholdincome_statistics;

## join both tables
select *
from ushouseholdincome inc
inner join ushouseholdincome_statistics stats
on inc.id = stats.id
where mean <> 0;


# general analysis for states and statistics

select  inc.state_name, county, type, `primary`, mean, median
from ushouseholdincome inc
inner join ushouseholdincome_statistics stats
on inc.id = stats.id
where mean <> 0
order by 5 desc
;
## highest mean and median states

select  inc.state_name, round(avg(mean),1), round(avg(median),1)
from ushouseholdincome inc
inner join ushouseholdincome_statistics stats
on inc.id = stats.id
where mean <> 0
group by inc.state_name
order by 3 desc
;

# highest cities income
select  inc.State_Name, inc.city, round(avg(mean),1), round(avg(median),1)
from ushouseholdincome inc
inner join ushouseholdincome_statistics stats
on inc.id = stats.id
where mean <> 0
group by inc.city, inc.state_name
order by 3 desc
limit 5
;



# identifying states with more land area and water and percentages of coverage from land and water
select  state_name,
        sum(aland) AS land_area,
        sum(awater) AS water_area,
        SUM(aland) + SUM(awater) AS total_area,
        (SUM(aland) / (SUM(aland) + SUM(awater))) * 100 AS land_percentage,
        (SUM(awater) / (SUM(aland) + SUM(awater))) * 100 AS water_percentage
from ushouseholdincome
where state_name = 'new jersey'
group by state_name
;

# identifing cities land and water coverage white income

select  inc.State_Name, inc.city,inc.type, round(avg(mean),1), round(avg(median),1),
 sum(aland) AS land_area,
        sum(awater) AS water_area,
        SUM(aland) + SUM(awater) AS total_area,
        (SUM(aland) / (SUM(aland) + SUM(awater))) * 100 AS land_percentage,
        (SUM(awater) / (SUM(aland) + SUM(awater))) * 100 AS water_percentage
from ushouseholdincome inc
inner join ushouseholdincome_statistics stats
on inc.id = stats.id
group by inc.city, inc.state_name, inc.type
order by 4 desc
;

##income statistice for the type of city , then filter outliers by removing low counts of data entries
select  type, count(type) AS count_entries,
        round(avg(mean),1) AS avg_income,
        round(avg(median),1) AS median_income
from ushouseholdincome inc
inner join ushouseholdincome_statistics stats
on inc.id = stats.id
group by inc.type
having count(type) < 100
order by 4 desc ;



# check highest and lowest income by states
#highest median
select State_Name, avg(median)
from ushouseholdincome_statistics
group by state_name
order by avg(median) desc
limit 10 ;

#lowest meadian
select State_Name, avg(median)
from ushouseholdincome_statistics
group by state_name
order by avg(median) asc
limit 10 ;

## look at our data again
select *
from clean_ushouseholdincome inc
inner join clean_ushouseholdincome_statistics stats
on inc.id = stats.id;

##------------------------- WORKING ON SAVING / EXPORTING CLEAN DATA -------------------------##


## save both tables and export
CREATE TABLE clean_ushouseholdincome_statistics AS
SELECT *
FROM ushouseholdincome_statistics
WHERE mean <> 0;

CREATE TABLE clean_ushouseholdincome AS
SELECT *
FROM ushouseholdincome;

# export but we couldnt export to any folder
SHOW VARIABLES LIKE "secure_file_priv";

# EXPORT 1 ## set to your approved opath !!
SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_us_household_income.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM clean_ushouseholdincome;

#EXPORT 2 ## set to your approved path !!
SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_us_household_income_statistics1.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM clean_ushouseholdincome_statistics;










