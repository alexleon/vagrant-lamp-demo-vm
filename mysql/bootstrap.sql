create user 'admin'@'%' identified by 'admin123';
create user 'admin'@'192.168.33.10' identified by 'admin123';
create schema lampdemo;
grant all on lampdemo.* to 'admin'@'%';
