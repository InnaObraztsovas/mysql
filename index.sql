use docker;
create table users
(
    id       int(10) AUTO_INCREMENT PRIMARY KEY,
    name     varchar(256),
    email    varchar(256) UNIQUE,
    birthday date
);

create table companies
(
    id   int(10) AUTO_INCREMENT PRIMARY KEY,
    name varchar(256) UNIQUE
);

create table employees
(
    user_id            int  not null unique,
    company_id         int  not null,
    date_of_employment date not null
);

ALTER TABLE employees
    add constraint employees_companies_id_fk
        foreign key (company_id) references companies (id)
            ON DELETE CASCADE;

ALTER TABLE employees
    add constraint employees_users_id_fk
        foreign key (user_id) references users (id)
            ON DELETE CASCADE;


select c.name, max(u.birthday), min(u.birthday)
from companies as c
         join employees e on c.id = e.company_id
         join users u on u.id = e.user_id
group by c.id;

select c.name, round(avg(DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), u.birthday)), '%Y') + 0))
from companies as c
         join employees e on c.id = e.company_id
         join users u on u.id = e.user_id
group by c.id;


select c.name, count(c.name)
from companies as c
         join docker.employees e on c.id = e.company_id
         join docker.users u on u.id = e.user_id
group by c.name
order by count(*) desc
limit 1;

select c.name, max(e.date_of_employment)
from users as u
         join docker.employees e on u.id = e.user_id
         join docker.companies c on c.id = e.company_id
group by c.name;




















