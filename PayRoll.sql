--UC1 - Create Payroll_Service Database
create database PayRoll_Service;
use PayRoll_Service;

--UC2 - Create employee_payroll table
create table employee_payroll
(
  id int primary key not null identity(1,1),
  nameofStudent varchar (150) not null,
  salary float not null,
  startDate date
)

--UC3 - Create employee_payroll data as part of CURD Operation
insert into employee_payroll (nameofStudent, Salary, StartDate) values
('Poonam', 40000.00, '22-Mar-2022'),
('Dhoni', 70000.00, '17-June-2007'),
('Virat', 50000.00, '18-May-2010'),
('Rohit', 60000.00, '09-Jan-2009');
