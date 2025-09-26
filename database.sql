create table gym
(
gym_id int primary key,
gym_name varchar(15),
gym_address varchar(20),
gym_contact varchar(15)
);




create table members
(
member_id int primary key,
member_name varchar(30),
member_address varchar(20),
member_contact varchar(15),
member_email varchar(30),
gym_id int,
constraint member_gym_id foreign key(gym_id)
references gym(gym_id)
);



create table fee
(
fee_id int primary key,
fee_ammount varchar(20),
fee_date date,
member_id int,
constraint member_fee foreign key(member_id)
references members(member_id)
);




create table  trainers
(
trainer_id int primary key,
trainer_name varchar(30),
trainer_address  varchar(20),
trainer_contact varchar(15),
gym_id int,
constraint trainer_gym_id foreign key(gym_id)
references gym(gym_id)
);




create table trainer_member
(
trainer_id int,
member_id int,
constraint trainer_member1 foreign key(trainer_id)
references trainers(trainer_id),
constraint trainer_member2 foreign key(member_id)
references members(member_id)
);



create table training_schedule
(
sess_id int primary key,
sess_date date,
sess_time time,
sess_duration time,
sess_detailes varchar(30),
trainer_id int,
member_id int,
constraint trainer_schedule1 foreign key(trainer_id)
references trainers(trainer_id),
constraint trainer_schedule2 foreign key(member_id)
references members(member_id)
);





create table staff
(
staff_id int primary key,
staff_name varchar(30),
staff_address varchar(20),
staff_contact varchar(15),
gym_id int,
constraint staff_gym_id foreign key(gym_id)
references gym(gym_id)
);




create table equipments
(
equipment_id int primary key,
equipment_name varchar(30),
equipment_type varchar(20)
);




create table gym_equipment
(
gym_id int,
equipment_id int,
constraint gym_equipment1 foreign key(gym_id)
references gym(gym_id),
constraint gym_equipment2 foreign key(equipment_id)
references equipments(equipment_id)
);




insert into gym(gym_id ,gym_name, gym_address , gym_contact)
values('514656' ,'Fitness Gym', 'street 16', '54861586' );



insert into members(member_id,member_name,gym_id,member_contact,member_email,member_address)
values('15874','hossam','514656','4963498','hossam@gmail.com','street 121');

insert into trainers(trainer_id , trainer_name, trainer_address , trainer_contact)
values('5487165', 'Chitoos' , 'street 16' , '4461646');

update trainers
set gym_id=514656 
where trainer_id= 5487165 ;


insert into staff(staff_id,staff_name,staff_contact,staff_address,gym_id)
values('545996', 'mustafa' , '645989' , 'street 15' , '514656');


insert into equipments(equipment_id,equipment_name , equipment_type)
values('5494922','shoulder press' ,'shoulders');


insert into fee(fee_id , fee_date , fee_ammount, member_id)
values('5933314' ,'12-18-2024' ,'650' , '15874');


insert into gym_equipment(equipment_id , gym_id )
values ('5494922','514656');

insert into trainer_member(trainer_id , member_id)
values('5487165','15874');

insert into training_schedule(sess_id,sess_date , sess_duration , sess_detailes , sess_time , member_id , trainer_id)
values ('664953','12-18-2024','01:00:00','cardio' ,'03:00:00','15874','5487165');









SELECT m.member_id,member_name,sess_id,trainer_id 
FROM members m, training_schedule t
WHERE m.member_id = t.member_id;

SELECT m.member_id,member_name,sess_id,trainer_id 
FROM members m join training_schedule t
on m.member_id = t.member_id;




