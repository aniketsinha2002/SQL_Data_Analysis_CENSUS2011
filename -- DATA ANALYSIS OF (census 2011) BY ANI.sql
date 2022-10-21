-- DATA ANALYSIS OF (census 2011) BY ANIKET SINHA --

-- SQLite
SELECT District, State, Growth, Sex_Ratio, Literacy
FROM Dataset1_Data1;

---- COUNT FOR WESTBENGAL AND OTHERS ----
SELECT count(*), CASE WHEN State='West Bengal' THEN 'West Bengal'
ELSE 'Others' END AS WestBengal_Count
FROM Dataset1_Data1
GROUP by 2;

---- COUNT FOR DISTRICT KOLKATA AND OTHERS ----
SELECT count(*), CASE WHEN District='Kolkata' THEN 'Kolkata'
ELSE 'Others' END AS Kolkata_Count
FROM Dataset1_Data1
GROUP by 2;

---DISTINCT STATE PRESENT---
SELECT Count(*) AS Distinct_State
FROM (SELECT DISTINCT State from Dataset1_Data1);

---DISTINCT DISTRICT PRESENT---
SELECT Count(*) AS Distinct_District
FROM (SELECT DISTINCT District from Dataset1_Data1);


----NO OF ROWS INTO OUR DATASET---
select count(*) AS NoOfRowsInD1 from Dataset1_Data1;
select count(*) AS NoOfRowsInD2 from Dataset2_Sheet1;

----COUNT FOR WESTBENGAL ----
SELECT Count(*) AS Number_Of_WB_States from Dataset1_Data1 where State in ('West Bengal');


---- TOTAL POPULATION --> POPULATION OF INDIA ----
select sum(population) as Total_Population_of_INDIA from Dataset2_Sheet1;


-- AVG GROWTH--
select state,avg(growth)*100 as avg_growth from Dataset1_Data1 group by state order by avg_growth desc;


-- AVG SEX RATIO--
select state,round(avg(Sex_Ratio)) as avg_Sex_Ratio from Dataset1_Data1 group by state order by avg_Sex_Ratio desc;


--- STATES HAVING AVG LITERACY RATE >80% --- 
select state,round(avg(literacy),0) as avg_literacy_ratio from Dataset1_Data1
group by state having round(avg(literacy),0)>80 order by avg_literacy_ratio desc;

--- TOP 3 STATE HAVING HIGHEST GROWTH RATIO ---
select state, avg(growth)*100 as Top3_avg_growth from Dataset1_Data1 group by state order by Top3_avg_growth desc limit 3;

--TOP 3 STATE SHOWING LOWEST SEX RATIO--
select state,round(avg(sex_ratio),0) as Lowest_sex_ratio from Dataset1_Data1 group by state order by Lowest_sex_ratio asc limit 3;

