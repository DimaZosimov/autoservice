INSERT INTO sv_role(role_id, name)
VALUES(1, 'ROLE_USER'), (2, 'ROLE_ADMIN');

INSERT INTO sv_user(username, password, person_id)
VALUES('admin', 'admin', 1);

INSERT INTO sv_person(first_name, middle_name, last_name, date_of_birth, user_id)
VALUES('dima', 'alex', 'zosimov', '2009-04-01', 1);

INSERT INTO sv_user_sv_role(user_user_id, roles_role_id)
VALUES(1, 2);

INSERT INTO sv_auto (brand, model, engine, year_of_manufacture, mileage, person_id)
VALUES('audi', 'a6', 0, '2009', '200000', 1), ('audi', 'a4', 1, '2001', '300000', 1);

INSERT INTO sv_spare_part (name, auto_id, mileage, service_period, requiring_service)
VALUES('масло моторное', 1, '200000', '10000', false), ('фильтр маслянный', 1, '200000', '10000', false),
('масло моторное', 2, '300000', '8000', false), ('фильтр маслянный', 2, '300000', '8000', false);