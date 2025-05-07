select count(*)
from employees e
left join dept_emp d
on e.emp_no = d.emp_no;

select count(emp_no)
from employees
GROUP BY emp_no

select emp_no, min(from_date), min(to_date), max(from_date), max(to_date)
from dept_emp 
where emp_no in (10010,10018,10029,10040,10050,10060,10070,10080,10088,10098,10108,10116)
group by emp_no;



select last_name, count(*)  as cnt
from employees
group by last_name
order by cnt desc ;

select last_name, rank() over(PARTITION by last_name ) as rnk
from employees
order by cnt ;


CREATE SEQUENCE sequence_name
    START WITH 1    
    INCREMENT BY 1  
    MINVALUE 1      
    MAXVALUE 999999 
    CACHE 20        
    CYCLE;          



-- order by cnt desc;



/*, count(*) over(PARTITION BY last_name) as cnt */
/*, rank() over(PARTITION by last_name) as rnk*/
