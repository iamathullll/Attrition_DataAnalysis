create database Employee_attrition;
select * from Employee_attrition.employee_attirtion_new;
use employee_attrition;
select * from employee_attirtion_new;
select count(maritalstatus),maritalstatus from employee_attirtion_new group by maritalstatus;#522 single 777 married 377 devorced
alter table employee_attirtion_new add age_category varchar(20);
select age,case when age between 18 and 30 then 'Young adults'
when age between 30 and 50 then 'Middle aged adults'
else 'Older adults' end as age_category from employee_attirtion_new;
update employee_attirtion_new set age_category=case when age between 18 and 30 then 'Young adults'
when age between 30 and 50 then 'Middle aged adults'
else 'Older adults' end;
set sql_safe_updates=0;
alter table Employee_attirtion_new add salary_category varchar(30);
select MonthlyIncome,case  when monthlyincome<5000 then 'Low salary'
when monthlyincome>=5000 and monthlyincome<=10000 then 'Average salary'
else 'High salary' end as salary_category from employee_attirtion_new;
update employee_attirtion_new set salary_category=case when monthlyincome<5000 then 'Low salary'
when monthlyincome>=5000 and monthlyincome<=10000 then 'Average salary'
else 'High salary' end ;
select                                        #salary analysis
JobRole, 
Department, 
AVG(MonthlyIncome) as AverageMonthlyIncome,
MIN(MonthlyIncome) as MinMonthlyIncome,
MAX(MonthlyIncome) as MaxMonthlyIncome
from 
    Employee_attirtion_new
group by 
    JobRole, Department
order by
    AverageMonthlyIncome desc;
    select                               #Group Employees into Age Categories:
    age_category as AgeCategory,
    count(employeeid) as TotalEmployees
    from Employee_attirtion_new
    group by
    age_category
    order by 
    TotalEmployees desc;
    select                                #Gender-Based Salary Disparities
    Gender, 
    avg(MonthlyIncome) as AverageMonthlyIncome,
    min(MonthlyIncome) as MinMonthlyIncome,
    max(MonthlyIncome) as MaxMonthlyIncome
from 
    Employee_attirtion_new
group by 
    Gender
order by
    AverageMonthlyIncome desc;

select         #12. Financial Impact Analysis

    JobRole,
    sum(MonthlyIncome) as TotalAttritionCost
from 
    Employee_attirtion_new
where 
    Attrition = 'Yes'
group by
    JobRole
order by
    TotalAttritionCost desc;
    
select   #Compare Job Satisfaction Across Departments:
    Department, 
    avg(JobSatisfaction) as AverageJobSatisfaction,
    count(EmployeeID) as TotalEmployees
from 
    Employee_attirtion_new
group by
    Department
order by 
    AverageJobSatisfaction desc;
#Gender-Based Salary Disparities
select 
    Gender, 
    avg(MonthlyIncome) as AverageMonthlyIncome,
    min(MonthlyIncome) as MinMonthlyIncome,
    max(MonthlyIncome) as MaxMonthlyIncome
from 
    Employee_attirtion_new
group by
    Gender
order by
    AverageMonthlyIncome desc;
select businesstravel,count(*) as count from employee_attirtion_new group by businesstravel;
select age_category,count(attrition) as num_left from employee_attirtion_new where attrition='Yes' group by age_category;
select attrition,avg(dailyrate) from employee_attirtion_new group by attrition;
select age_category,count(attrition) as num_left from employee_attirtion_new where attrition='Yes' group by age_category;




