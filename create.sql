create table reg_user(
	name varchar(20),
	gender varchar(9),
	age varchar(10),
	mob_number varchar(15),
	password varchar(20),
	user_id varchar(30),
	primary key(user_id),
    securityq varchar(10),
    securitya varchar(20)
	);


create table fare
	(
train_type varchar(55),
km varchar(10),
s1 varchar(10),
c1 varchar(10),
ec1 varchar(10),
b1 varchar(10),
a1 varchar(10),
h1 varchar(10),
primary key(train_type)
);


create table train_info(
	train_no varchar(10),
	train_name varchar(50),
	type varchar(50),
	s_station_id varchar(6),
	d_station_id varchar(6),
	distance varchar(10),
	no_of_sleeper varchar(10),
    no_of_ac varchar(10),
    primary key(train_no),
    foreign key(type) references fare(train_type)
    );


create table train_schedule(
train_no varchar(10),
stop_no varchar(10),
station_id varchar(6),
km varchar(10) check(km>=0),
arrival_time_hr varchar(10),
arrival_time_min varchar(10) check(arrival_time_min<=59),
departure_time_hr varchar(10),
departure_time_min varchar(10) check(departure_time_min<=59),
primary key(train_no,stop_no,station_id),
foreign key(train_no) references train_info(train_no) on delete cascade 
);

create table coaches(
	train_no varchar(10),
	departure_date varchar(20),
	coach_no varchar(10),
    seat_no varchar(10) default 0,
  primary key(train_no,departure_date,coach_no),
  foreign key(train_no) references train_info(train_no) on delete cascade 
);

create table pnrholder(
pnr varchar(15);
)


create table ticket_detail(
	pnr varchar(15) primary key,
	src varchar(20),
	dest varchar(20),
    train_no varchar(30),
    departure_date varchar(20),
    coach_no varchar(20)
);


create table passenger_info(
	user_id varchar(30),
	PNR varchar(15),
	coach_no varchar(10),
	seat_no varchar(10),
	name varchar(40),
	gender varchar(10),
	age varchar(10),
	serial_no varchar(10),
	foreign key(pnr) references ticket_detail(pnr),
	primary key(PNR,serial_no),
	foreign key(user_id) references reg_user(user_id)
);


create table cancel_ticket(
T_number varchar(20) primary key,
cancel_date varchar(20),
refund_amount varchar(20),
foreign key(T_number) references ticket_booking(T_number)
);


create table admin(
emp_id varchar(50) primary key,
name varchar(40) ,
gender varchar(9),
age varchar(10) check(age>=0),
phone_no varchar(10) ,
email varchar(50)
);



create or replace trigger avail
after insert
on passenger_info
for each row
declare
coc varchar(10);
dat varchar(20);
t_num varchar(30);
begin
select train_no into t_num from ticket_detail where pnr=:new.pnr;
select departure_date into dat from ticket_detail where pnr=:new.pnr;
select coach_no into coc from ticket_detail where pnr=:new.pnr;
update coaches set seat_no=TO_CHAR(TO_NUMBER(seat_no)+1) where train_no=t_num and departure_date=dat and coach_no=coc;
end; 

create or replace trigger del
before delete
on passenger_info
for each row
declare
coc varchar(10);
dat varchar(20);
t_num varchar(30);
begin
select train_no into t_num from ticket_detail where pnr=:old.pnr;
select departure_date into dat from ticket_detail where pnr=:old.pnr;
select coach_no into coc from ticket_detail where pnr=:old.pnr;
update coaches set seat_no=TO_CHAR(TO_NUMBER(seat_no)-1) where train_no=t_num and departure_date=dat and coach_no=coc;
end; 

create or replace trigger pnradder
after insert
on ticket_detail
for each row
begin
update pnrholder set pnr=to_char(to_number(pnr)+1);
end;



create or replace trigger waitinglist
for delete
on passenger_info
compound trigger
coc varchar(10);
dat varchar(20);
t_num varchar(30);
new_pnr varchar(15):=0;
seatnumber number;
type warray is varray(50) of ticket_detail.pnr%type;
moves warray:=warray();
mover warray:=warray();
moved warray:=warray(); 
pnr_count integer;
cal integer;
b integer:=1;
c integer:=1;
d integer:=1;
ab integer:=0;
cd integer:=0;
cc integer:=0;
de integer:=0;


before each row is
begin
select train_no into t_num from ticket_detail where pnr=:old.pnr;
select departure_date into dat from ticket_detail where pnr=:old.pnr;
select coach_no into coc from ticket_detail where pnr=:old.pnr;
seatnumber:=to_number(:old.seat_no);
end before each row;


after statement is
begin
select max(to_number(seat_no)) into cal from passenger_info where pnr in (select pnr from ticket_detail where train_no=t_num and coach_no =coc and departure_date=dat);

if(cal<19) then

select distinct t.pnr BULK COLLECT INTO moved from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where   t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)>seatnumber ;
de:=moved.COUNT;

for d in 1..de loop
update passenger_info set seat_no=TO_CHAR(TO_NUMBER(seat_no)-1) where   PNR=moved(d) and  to_number(seat_no)>seatnumber ;
end loop;

else

if(seatnumber<19) then

select  distinct count(t.pnr) into cc from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)=19 ;

if cc>0 then
select  distinct t.pnr into new_pnr from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)=19 ;
update passenger_info set seat_no=to_char(seatnumber) where PNR=new_pnr and to_number(seat_no)=19 ;
end if;

select distinct t.pnr BULK COLLECT INTO mover from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where   t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)>19 ;
cd:=mover.COUNT;

for b in 1..cd loop
update passenger_info set seat_no=TO_CHAR(TO_NUMBER(seat_no)-1) where   PNR=mover(b) and  to_number(seat_no)>19 ;
end loop;

elsif (seatnumber>18) then

select distinct t.pnr BULK COLLECT INTO moves from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)>seatnumber;
ab:=moves.COUNT;

for c in 1..ab loop
update passenger_info set seat_no=TO_CHAR(TO_NUMBER(seat_no)-1) where PNR=moves(c) and to_number(seat_no)>seatnumber ;
end loop;

end if;
end if;

end after statement;
end waitinglist;









	