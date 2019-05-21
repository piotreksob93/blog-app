
insert into user (email,first_name,last_name,password,username) values ('piotreksob93@gmail.com','Piotr','Sobiborowicz','$2a$10$W5oISeZfwzhPK3n9wx0DVOmaJLWoWHVTeDOh09Xn44FRM0QTKVFf6','piotrek');
insert into users_roles (user_id,role_id) values ('1','1');
insert into users_roles (user_id,role_id) values ('1','2');
insert into role (role_name) values ('ROLE_USER');
insert into role (role_name) values ('ROLE_ADMIN');

