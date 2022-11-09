use docker;
create table users (
    id int(10) AUTO_INCREMENT PRIMARY KEY,
    name varchar(256),
    email varchar(256) UNIQUE,
    birthday date
);

create table companies(
    id int(10) AUTO_INCREMENT PRIMARY KEY,
    name varchar(256) UNIQUE
);

create table employees
(
    user_id int not null,
    company_id int not null,
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


