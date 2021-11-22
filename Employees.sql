# ������ � ����� ���������� �� ������������ postgres (�� ���� postgres)
psql -U postgres	
create database employees; # ������� �� � ������ employees
# ������� ������������ � ������ <user_empl> � ������� <pass_empl>
create user user_empl with password 'pass_empl';
# ���������, ��� ���������� �� <employees>
# �������� ������������ <user_empl>
alter database employees owner to user_empl;
# -----------------
# ������ � ����� ���������� �� ������������ user_empl (�� employees)
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
