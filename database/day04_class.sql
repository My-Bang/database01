-- 직원들의 직속상사의 정보를 출력하시오 (self join)
select staff.last_name, staff.job_id,manager.last_name, manager.job_id
from employees staff, employees manager
where staff.manager_id = manager.employee_id;