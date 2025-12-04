select * from depression


--########## Descriptive Statistics  ###########


 --ãÊæÓØ ÇáÏÎá ááÇİÑÇÏ ÇáãæÌæÏíä İí ÇáÚíäÉ 1

select avg (Income) as [average income] 
from depression


-- ÇáÍÇáÉ ÇáÇÌÊãÇÚíÉ ááÇÔÎÇÕ ÇáãæÌæÏíä İí ÇáÚíäÉ  2

select Marital_Status,count (Marital_Status) as [count of depressed]
from depression
group by Marital_Status
order by  [count of depressed] desc


--3 ãÇ ÃŞá æÃÚáì ÏÎá ãæÌæÏ İí ÇáÚíäå

select max (Income) as [highest income]
from depression


select min (Income) as [lowest income]
from depression


 -- ãÊæÓØ ÚãÑ ÇáÇÔÎÇÕ ÇáãæÌæÏíä İí ÇáÚíäÉ 4
 
select avg (age) as [average age]
from depression


--5 ãÇ åí ÇßËÑ İÆå ÚãÑíÉ ÙåæÑÇ 

SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 20 THEN '18-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '70+'
    END AS [Age Group],

    COUNT(*) AS [Count Of People]
FROM depression
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 20 THEN '18-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '70+'
    END
ORDER BY [Count Of People] DESC;


-- 6 ÚÏÏ ÇáÇÔÎÇÕ ÇáĞì íÚÇäæä ãä ÇãÑÇÖ ãÒãäÉ

select count(Chronic_Medical_Conditions) as [people count]
from depression
where Chronic_Medical_Conditions = 1


--7 ãÇ ÚÏÏ ÇáÃÔÎÇÕ Çááí ÚäÏåã ÊÇÑíÎ ÇßÊÆÇÈ + ÃãÑÇÖ ãÒãäÉ¿

select count(Chronic_Medical_Conditions) as [average age]
from depression
where Chronic_Medical_Conditions = 1 and History_of_Mental_Illness = 1


-- 8 åá íÊÌå ÇáÔÎÕ ÇáãÕÇÈ ÈÇáÇßÊÆÇÈ ÚÇÏÉ Çáí ÇáÊÏÎíä 

select Smoking_Status,count (Smoking_Status) as [count of depressed]
from depression
group by Smoking_Status
order by  [count of depressed] desc


-- 9 åá íÊÌå ÇáÔÎÕ ÇáãÕÇÈ ÈÇáÇßÊÆÇÈ ÚÇÏÉ Çáí ÇáßÍæáíÇÊ 

select Alcohol_Consumption,count (Alcohol_Consumption) as [count of depressed]
from depression
group by Alcohol_Consumption
order by  [count of depressed] desc


-- 10 åá ÇáÃÔÎÇÕ Çááí ÚäÏåã ÊÚáíã ãäÎİÖ åãÇ ÃÚáì İÆÉ ÚäÏåÇ ÇßÊÆÇÈ¿

select Education_Level ,count (*) as [people count]
from depression
group by Education_Level
order by  [people count] desc


 -- ÚÏÏ ÇáÇÔÎÇÕ ÇáãæÌæÏíä İ ÇáÚíäÉ ÏÎáåã ÇÚáí ãä ÇáãÊæÓØ æ ÚÏÏ ÇáĞíä ÏÎáåã ÇŞá ãä ÇáãÊæÓØ 11

WITH IncomeData AS (
    SELECT 
        Name,
        Income,
        AVG(Income) OVER () AS AvgIncome,
        CASE 
            WHEN Income > AVG(Income) OVER () THEN 'Above Average'
            ELSE 'Below Average'
        END AS [Income Category]
    FROM depression
)
SELECT 
    [Income Category],
    COUNT(*) AS [People Count]
FROM IncomeData
GROUP BY [Income Category]; 


 

-- ###############3 Lifestyle Analysis ##################




--12 åá ÇáãÏÎäíä Çá ÚäÏåã ÊÇÑíÎ ÇßÊÆÇÈ ÃÚáì ãä ÛíÑ ÇáãÏÎäíä¿

SELECT Smoking_Status, COUNT(*) AS total_people,
    SUM(CASE WHEN History_of_Mental_Illness = '1' THEN 1 ELSE 0 END) AS depression_count,
    AVG(CASE WHEN History_of_Mental_Illness = '1' THEN 1.0 ELSE 0 END) * 100 AS depression_percentage
FROM depression
GROUP BY Smoking_Status;


--13 åá ÇáäÔÇØ ÇáÈÏäí ÇáãäÎİÖ  ãÑÊÈØ ÈÇÑÊİÇÚ ãÚÏáÇÊ ÇáÇßÊÆÇÈ¿

select Physical_Activity_Level,count (*) as [count of depressed]
from depression
group by Physical_Activity_Level
order by [count of depressed] desc


--14 åá ÃäãÇØ ÇáÛĞÇÁ  áåÇ ÚáÇŞÉ ÈÇáÅÕÇÈÉ ÈÇáÇßÊÆÇÈ¿

select Dietary_Habits,count (Dietary_Habits) as [count of depressed]
from depression
group by Dietary_Habits
order by  [count of depressed] desc


--15 åá ÇáÇÔÎÇÕ Çá ÚäÏåã ÊÇÑíÎ ááãÑÖ ÇáäİÓí ÈíÚÇäæ ãä ŞáÉ Çáäæã

select  History_of_Mental_Illness,Sleep_Patterns ,count (*) as [people count]
from depression
group by Sleep_Patterns ,History_of_Mental_Illness
order by  [people count] desc




-- ##############        Demographics & Socio-economic         #############




--16 ãÇ ãÊæÓØ ÇáÏÎá ááÃÔÎÇÕ Çááí ÚäÏåã ÊÇÑíÎ ÚÇÆáí ááÇßÊÆÇÈ ãŞÇÑäÉ ÈÛíÑåã¿

select Family_History_of_Depression, avg (Income) as [average income] 
from depression
group by Family_History_of_Depression
order by  [average income] desc


--17 åá İí İÑŞ İí ãÚÏá ÇáÇßÊÆÇÈ Èíä ÇáãÊÒæÌíä æÛíÑ ÇáãÊÒæÌíä¿

select Marital_Status,count (Marital_Status)  as [count of depressed]
from depression
group by Marital_Status
order by  [count of depressed] desc


--18 åá ÇáÚÇØáíä Úä ÇáÚãá  ãÚÑÖæä ááÇßÊÆÇÈ ÃßËÑ ãä ÇáÚÇãáíä¿

select Employment_Status,count (Employment_Status) as [count of depressed]
from depression
group by Employment_Status
order by  [count of depressed] desc


--19 åá ÚÏÏ ÇáÃØİÇá  áå ÚáÇŞÉ ÈãÚÏáÇÊ ÇáÇßÊÆÇÈ¿

select Number_of_Children,count (Number_of_Children) as [count of depressed people]
from depression
group by Number_of_Children
order by  [count of depressed people] desc


-- 20 åá ãÓÊæì ÇáÊÚáíã  ãÑÊÈØ ÈÒíÇÏÉ Ãæ ÇäÎİÇÖ ãÚÏá ÇáÇßÊÆÇÈ¿

select Education_Level, count (Education_Level) as [count of depressed people]
from depression
group by Education_Level
order by  [count of depressed people] desc


-- 21 åá ÇáÊŞÏã İí ÇáÓä  áíå ÚáÇŞÉ ÈÒíÇÏÉ ÇÍÊãÇáíÉ ÇáÇÕÇÈÉ ÈÇáÇßÊÆÇÈ¿

select Age,count (*) as [count of depressed]
from depression
group by age
order by  [count of depressed] desc




-- ###################    Health & Medical History   ########################




--åá æÌæÏ ÃãÑÇÖ ãÒãäÉ ãÑÊÈØ ÈÇáÇßÊÆÇÈ¿  22  

select Chronic_Medical_Conditions,count (*) as [count of depressed]
from depression
group by Chronic_Medical_Conditions
order by  [count of depressed] desc


--23 åá ÇáÃÔÎÇÕ ÇáĞíä áÏíåã ÊÇÑíÎ ÚÇÆáí ãä ÇáÇßÊÆÇÈ íÚÇäæä ãä ÃãÑÇÖ ãÒãäÉ ÃßËÑ¿

select Family_History_of_Depression , Chronic_Medical_Conditions,count (*) as [people count]
from depression
where Family_History_of_Depression = 1 
group by Family_History_of_Depression ,Chronic_Medical_Conditions
order by  [people count] desc


--24 åá ÇáÃÔÎÇÕ Çááí ÚäÏåã ÊÇÑíÎ ÊÚÇØí ãæÇÏ ãÎÏÑÉ ÚäÏåã ãÚÏáÇÊ ÃÚáì ááÇßÊÆÇÈ¿

select History_of_Substance_Abuse,count (*) as [count of depressed]
from depression
group by History_of_Substance_Abuse
order by  [count of depressed] desc


-- 25 åá æÌæÏ ÊÇÑíÎ ãÑÖ äİÓí  íÒíÏ ÇÍÊãÇáíÉ æÌæÏ ÇßÊÆÇÈ¿

select History_of_Mental_Illness,count (History_of_Mental_Illness) as [count of depressed]
from depression
group by History_of_Mental_Illness
order by  [count of depressed] desc


--26 åá ÇáÃÔÎÇÕ Çááí ÚäÏåã ÊÇÑíÎ ÚÇÆáí ÈÇáÇßÊÆÇÈ ÚäÏåã ÚÇÏÇÊ äæã ÃÓæÃ¿

select Family_History_of_Depression,Sleep_Patterns, count (*) as [average income] 
from depression
group by Family_History_of_Depression , Sleep_Patterns
order by Family_History_of_Depression, [average income] desc


--27 åá ÇáÃÔÎÇÕ Çááí ÚäÏåã ÃãÑÇÖ ãÒãäÉ Èíßæä ÏÎáåã ÃŞá æÈÇáÊÇáí ãÚÑÖíä áÇßÊÆÇÈ¿

select Chronic_Medical_Conditions, avg (Income) as [average income] 
from depression
group by Chronic_Medical_Conditions
order by  [average income] desc


--28 åá ÇáÃÔÎÇÕ Çááí ÈíÊÚÇØæÇ ãæÇÏ ãÎÏÑÉ ÚäÏåã äÔÇØ ÈÏäí ÃŞá¿

select History_of_Substance_Abuse, Physical_Activity_Level , count (*) as [people count] 
from depression
group by History_of_Substance_Abuse , Physical_Activity_Level
order by History_of_Substance_Abuse, [people count] desc




-- #################           Correlations / Interactions)             #####################




--29 ãÇ ÇáÚáÇŞÉ Èíä ÇáÏÎá æÇáäÔÇØ ÇáÈÏäí ÈÇáäÓÈÉ ááÃÔÎÇÕ Çááí ÚäÏåã ÇßÊÆÇÈ¿

select Physical_Activity_Level, avg (Income) as [average income] 
from depression
group by Physical_Activity_Level
order by  [average income] desc


--30 åá İí ÚáÇŞÉ Èíä Çáäæã æÇáÊÏÎíä ÚäÏ ÇáÃÔÎÇÕ Çááí ÚäÏåã ÊÇÑíÎ ÇßÊÆÇÈ¿

select Sleep_Patterns, Smoking_Status,count (*) as [count of people] 
from depression
group by Sleep_Patterns , Smoking_Status
order by  Sleep_Patterns,[count of people]  desc


--31 åá ÇáÃÔÎÇÕ Çááí ÚäÏåã ÊÇÑíÎ İí ÊÚÇØí ãæÇÏ ãÎÏÑÉ æ ÊÇÑíÎ ãÑÖ äİÓí ãÚÑÖíä áÇßÊÆÇÈ ÈÏÑÌÉ ÃÚáì¿

select History_of_Substance_Abuse,History_of_Mental_Illness,count (*) as [count of depressed]
from depression
group by History_of_Substance_Abuse , History_of_Mental_Illness
order by History_of_Substance_Abuse, [count of depressed] desc


--32 åá ÇáÊÚáíã ÇáãÑÊİÚ íŞáá ÃËÑ ÇáÚæÇãá ÇáÓáÈíÉ Òí ÇáÊÏÎíä Úáì ÇáÇßÊÆÇÈ¿

select Education_Level ,Smoking_Status,count (*) as [people count]
from depression
group by Education_Level ,Smoking_Status
order by  Smoking_Status,[people count] desc


--33 åá íæÌÏ ÚáÇŞÉ Èíä ããÇÑÓÉ ÇáÑíÇÖÉ Çæ ÇáäÔÇØ ÇáÈÏäí æ ãÓÊæí ÇáÏÎá¿

select Physical_Activity_Level, avg (Income) as [average income] 
from depression
group by Physical_Activity_Level
order by  [average income] desc


--34 åá ÇáÃÔÎÇÕ Çááí ãÏãäíä ßÍæá ÈíÚÇäæÇ ãä äæã ÓíÆ İÇÈÇáÊÇáí ÃßÊÑ ÚÑÖÉ ááÇßÊÆÇÈ¿

select Sleep_Patterns, count (Alcohol_Consumption) as [people count] 
from depression
where Alcohol_Consumption = 'High'
group by Sleep_Patterns
order by  [people count] desc


--35 åá íæÌÏ ÇÎÊáÇİ İí ÇáÏÎá ÍÓÈ æÌæÏ ÊÇÑíÎ ÚÇÆáí ãÚ ÇáÇßÊÆÇÈ¿

select Family_History_of_Depression, avg (Income) as [average income] 
from depression
group by Family_History_of_Depression
order by  [average income] desc


-- 36 ãÊæÓØ ÇÚãÇÑ ÇáÇÔÎÇÕ ÇáãÕÇÈíä ÈÇáÇßÊÆÇÈ Çá ÈíÔÊÛáæ æ ÇáÚæÇØáíÉ 

select Employment_Status,avg(age) 
from depression
group by Employment_Status



-- ################   Advanced / Predictive Thinking   #######################




--37. ãÇ Ãåã 3 ÚæÇãá ãÑÊÈØÉ ÈÇáÇßÊÆÇÈ İí ÇáÈíÇäÇÊ¿

-- Smoking Status

SELECT 'Smoking Status' AS Factor ,Smoking_Status AS Value ,
AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END) AS [Depression Rate]
FROM depression
GROUP BY Smoking_Status

UNION ALL

-- Sleep Patterns

SELECT 'Sleep Patterns' AS Factor, Sleep_Patterns  AS Value,
AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END)
FROM depression
GROUP BY Sleep_Patterns

UNION ALL

-- Alcohol Consumption

SELECT 'Alcohol Consumption' AS Factor , Alcohol_Consumption AS Value,
    AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END)
FROM depression
GROUP BY Alcohol_Consumption


--38. åá ããßä ÊæŞÚ ÇáÇßÊÆÇÈ ÈÇÓÊÎÏÇã ÚæÇãá:  Çáäæã¡ ÇáäÔÇØ ÇáÈÏäí¿

SELECT Sleep_Patterns , Physical_Activity_Level,
    AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END) AS [Depression rate]
FROM depression
GROUP BY Sleep_Patterns , Physical_Activity_Level
ORDER BY [depression rate] DESC;


--39. ãÇ ÇÍÊãÇáíÉ ÇáÇßÊÆÇÈ ááÃÔÎÇÕ Çááí ÚäÏåã: äæã Şáíá æ ÏÎá ãäÎİÖ æ ÊÏÎíä

SELECT 
    AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END) AS Depression_Rate
FROM depression
WHERE 
    Sleep_Patterns = 'Poor'
    AND Income < (SELECT AVG(Income) FROM depression)
    AND Smoking_Status = 'Current';



--40. ÃíåãÇ ÃŞæì ÇÑÊÈÇØğÇ ÈÇáÇßÊÆÇÈ: Çáäæã ÇáÓíÆ Ãã ÇáÊÚÇØí Ãã ÇáÏÎá ÇáãäÎİÖ¿.

-- substance abuse
SELECT 'Substance Abuse' AS Factor, AVG(CASE WHEN History_of_Mental_Illness = 1THEN 1.0 ELSE 0 END)
FROM depression
WHERE History_of_Substance_Abuse = 'Y'


UNION ALL

-- sleep

SELECT 'Poor Sleep' AS Factor, AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END) AS Depression_Rate
FROM depression
WHERE Sleep_Patterns = 'poor'

UNION ALL


-- low income

SELECT  'Low Income' AS Factor, AVG(CASE WHEN History_of_Mental_Illness = 1 THEN 1.0 ELSE 0 END)
FROM depression
WHERE Income < (SELECT AVG(Income) FROM depression);