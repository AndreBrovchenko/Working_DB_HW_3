# входим в режим управления от пользователя postgres (БД тоже postgres)
psql -U postgres	
create database employees; # создаем БД с именем employees
# создаем пользователя с именем <user_empl> и паролем <pass_empl>
create user user_empl with password 'pass_empl';
# указываем, что владельцем БД <employees>
# является пользователь <user_empl>
alter database employees owner to user_empl;
# -----------------
# входим в режим управления от пользователя user_empl (БД employees)
psql -U user_empl employees
# -----------------
CREATE TABLE Departments (
id_department serial primary key,
department_name varchar(50) not null
);
# -----------------
CREATE TABLE Employees (
id_employee serial primary key,
employee_name varchar(50) not null,
id_department integer references Departments (id_department),
boss integer references Employees (id_employee)
);
# -----------------
