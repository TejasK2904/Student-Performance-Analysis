-- 1) View all data

SELECT * FROM public.students

-- 2) Select specific columns

Select sr_no, names, city, functional_area, 
		salary, levels from students;


-- 3) Count Total Records
Select count(*) from students;


-- 4) Filter by city

Select * from students
where city = 'Mumbai';


-- 5) Candidates with experience more than 3 years
Select * from students
where experience > 3;


-- 6) Average Salary
Select round(Avg(salary)) as Average_Salary
from public.students;


-- 7) Maximum and Minimum Salary
Select max(salary) as Maximum_Salary,
		min(salary) as Minimum_Salary
from students;	
		

-- 8) Group By City

Select city, count(*) as total_students
from students group by city;

-- 9) Gender wise Count
Select gender,count(*) as total_count
from public.students
group by gender;

-- 10) Industry wise average Salary 
Select industry, round(avg(salary)) as Average_Salary
from students
group by industry
limit 100;


-- 11) Top 5 highest paid candidates
Select * from Students 
order by salary desc
limit 5;

-- 12) Expereince level Classification

select names, experience,
case 
	when experience < 1 then 'Fresher'
	when experience < 3 then 'Junior'
	when experience < 7 then 'Mid - Level'
else 'Senior'
End as experience_level
from students
limit 100;


-- 13)Find the Duplicate Images
Select email, count(*) as total_count
from students
group by email
having count(*) > 1
order by total_count; 


-- 14) Calculate age from DOB
Select names, city,
extract(year from age(current_date,dob)) as age
from students
limit 100;





-- 15 Highest Salary in Each City (Subquery)
Select * from students
where (city, salary) in(select city, max(salary)
from students 
group by city);

-- 16)Rank Candidates by Salary (Window Function)
select names, salary,
rank() over(order by salary desc)
as salary_rank
from students;


--17)Skill Based Search (LIKE)
select * from students
where key_skills like'%.net%';


-- 18)Percentage of Candidates per Industry
select industry, count(*) as total_candidates,
round(count(*)*100/sum(count(*))over(),2) as percentage
from students
group by industry
order by percentage desc;
