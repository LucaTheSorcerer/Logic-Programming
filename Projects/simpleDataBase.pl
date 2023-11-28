:- discontiguous add_employee/3.
:- discontiguous get_all_employees/1.
:- discontiguous get_employees_by_title/2.
:- discontiguous update_employee/3.
:- discontiguous remove_employee/1.



% Define a predicate to store data
:- dynamic(employee/3).

% Sample data
employee(john, 35, developer).
employee(sara, 28, designer).
employee(mike, 42, manager).

% Query to retrieve all employees
get_all_employees(EmployeeList) :-
    findall(Employee, employee(Employee, _, _), EmployeeList),
    write('All Employees: '), write(EmployeeList), nl.

% Query to retrieve employees based on a specific criterion (e.g., job title)
get_employees_by_title(Title, EmployeeList) :-
    findall(Employee, employee(Employee, _, Title), EmployeeList),
    write('Employees with title '), write(Title), write(': '), write(EmployeeList), nl.

% Query to add a new employee
add_employee(Name, Age, Title) :-
    retractall(employee(Name, _, _)),
    assertz(employee(Name, Age, Title)),
    write('Employee added: '), write(Name), nl.

% Query to update employee information
update_employee(Name, NewAge, NewTitle) :-
    retract(employee(Name, _, _)),
    assertz(employee(Name, NewAge, NewTitle)),
    write('Employee updated: '), write(Name), nl.

% Query to remove an employee
remove_employee(Name) :-
    retract(employee(Name, _, _)),
    write('Employee removed: '), write(Name), nl.

% Example usage:
:-  add_employee('Alice', 30, 'engineer').
:-  get_all_employees(Employees1).
:-  get_employees_by_title('developer', DeveloperList1).
:-  update_employee('John', 36, 'senior developer').
:-  remove_employee('Sara').
:-  get_all_employees(Employees2).





person(john, 25, male).
person(susan, 30, female).
person(mike, 22, male).
person(lisa, 28, female).

is_adult(Name) :-
    person(Name, Age, _),
    Age >= 18.

is_male(Name) :-
    person(Name, _, male).

is_female(Name) :-
    person(Name, _, female).


