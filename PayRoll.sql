--UC1 - Create Payroll_Service Database.
create database PayRoll_Service;
use PayRoll_Service;

--UC2 - Create employee_payroll table.
create table employee_payroll
(
  id int primary key not null identity(1,1),
  nameofStudent varchar (150) not null,
  salary float not null,
  startDate date
)
select * from employee_payroll

--UC3 - inserting values to table.
insert into employee_payroll (nameofStudent, Salary, StartDate) values
('Bill', 100000.00, '2018-01-03'),
('Terisa', 200000.00, '2019-11-13'),
('Charlie', 300000.00, '2020-05-21');

--UC4 - Retrieve employee_payroll data.
select * from employee_payroll

--UC5 - Retrieve salary of particular employee and in particular date range.
select salary from employee_payroll where nameofStudent = 'Bill';
select * from employee_payroll
where StartDate between CAST ('2018-01-01' as date) and GETDATE()

--UC6 - add Gender to Employee_Payroll Table and Update the Rows to reflect the correct Employee Gender.
Alter table employee_payroll add Gender char(1);
select * from employee_payroll
Update employee_payroll set Gender='F' where nameofStudent = 'Terisa';
Update employee_payroll set Gender='M' where nameofStudent = 'Bill' or nameofStudent = 'Charlie';
update employee_payroll set salary = 300000.00 where nameofStudent = 'Terisa';
select * from employee_payroll

--UC7 - find sum, average, min, max and number of male and female employees.
select Sum(salary)  as "TotalSalaryofMales" from employee_payroll where gender = 'M' group by gender;
select Sum(salary)  as "TotalSalaryofFemale" from employee_payroll where gender = 'F' group by gender;
select Sum(salary) as "TotalSalary", Gender from employee_payroll group by Gender;
select Avg(salary) as "AverageSalary", Gender from employee_payroll group by Gender;
select Min(salary) as "MinimumSalary", Gender from employee_payroll group by Gender;
select Max(salary) as "MaximumSalary", Gender from employee_payroll group by Gender;
select count(salary) as "NumberofMales&Females", Gender from employee_payroll group by Gender;
select * from employee_payroll;

--UC8 - add employee PhoneNo, department(not null), Address (using default values).
alter table employee_payroll add PhoneNo bigint;
select * from employee_payroll;
update employee_payroll set PhoneNo = 9234569874 where id = 1;
alter table employee_payroll add Address varchar(100) not null default 'Bangalore';
alter table employee_payroll add Department varchar(250) not null default 'IT';
select * from employee_payroll;

--UC9 - Extend table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay.
Alter table employee_payroll
add basicpay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float;
select *from employee_payroll;
Update employee_payroll set Deduction = 1000 where Gender = 'F';
Update employee_payroll set Deduction = 1000 where Gender = 'M';
Update employee_payroll set basicpay = 5000 where Gender = 'M';
Update employee_payroll set basicpay = 8000 where Gender = 'F';
update employee_payroll set NetPay = (basicPay - Deduction)
update employee_payroll set TaxablePay = 0, IncomeTax = 0
select * from employee_payroll; 

-- UC10 - Adding another Value for Terissa in Sales&Marketing Department.
insert into employee_payroll 
values(104,'Terissa',400000.00,'2020-06-1','F',8156782910,'Sales','mumbai',2000,1000,200,18000),
(105,'Terissa',400000.00,'2020-06-1','F',8156782910,'Marketing','mumbai',2000,1000,200,18000);
select * from employee_payroll; 

--UC11 - adding same name to with differnt department and same other attributes to same table.
--adding company table
 create table company
(company_id int primary key,
companyName varchar(50) not null);
--inserted data into company table
insert into company
values(101, 'Infosys India');
select * from company;

--altering table employee payroll to add company id column
alter table employee_payroll
add company_id int not null default 101;
select * from employee_payroll;

--adding Department table
create table Departments
(departmentID int primary key,
departmentName varchar(50) not null,
noOfEmployees int ,
headOfDepartment varchar(50) not null);
--inserted data into department table
insert into Departments values
(01,'Design',17,'Mr. PavanPavale'),(02,'HR',67,'Supriya Halbhavi'),(03,'Maintainence',8,'VishuG');
insert into Departments(departmentID,departmentName,headOfDepartment)
values(04,'Sales','Somaanth'),(05,'Marketing','Savita Gondi');
select * from Departments;

--creating employee department table
create table EmployeeDepartment
(employeeID int not null, departmentID int not null);
--inserted data into employee department table
insert into EmployeeDepartment
values
(1,01),(2,02),(3,02),(1,03);
select * from EmployeeDepartment;