
insert into user (email,first_name,last_name,password,username) values ('piotreksob93@gmail.com','Piotr','Sobiborowicz','$2a$10$W5oISeZfwzhPK3n9wx0DVOmaJLWoWHVTeDOh09Xn44FRM0QTKVFf6','piotrek');
insert into user (email,first_name,last_name,password,username) values ('piotreksob93@gmail.com','Piotr','Sobiborowicz','$2a$10$W5oISeZfwzhPK3n9wx0DVOmaJLWoWHVTeDOh09Xn44FRM0QTKVFf6','admin');

insert into user (email,first_name,last_name,password,username) values ('karol@gmail.com','Karol','Sobiborowicz','$2a$10$W5oISeZfwzhPK3n9wx0DVOmaJLWoWHVTeDOh09Xn44FRM0QTKVFf6','karol');


insert into users_roles (user_id,role_id) values ('1','1');
insert into users_roles (user_id,role_id) values ('1','2');
insert into users_roles (user_id,role_id) values ('2','1');
insert into users_roles (user_id,role_id) values ('2','2');
insert into users_roles (user_id,role_id) values ('3','1');


insert into role (role_name) values ('ROLE_USER');
insert into role (role_name) values ('ROLE_ADMIN');

insert into post (id,created_date,post_content,post_title,user_id) values (1,'2019-06-10 09:47:57','waawfafwawf','1awfawfwafawfwaffwa','1');


insert into post_comments (id,comment_content,created_date,post_id,user_id) values (1,'Super post','2019-06-10 09:47:57','1','1');

