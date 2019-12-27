
create or replace trigger waitinglist
after delete
on passenger_info
for each row
declare
coc varchar(10);
dat varchar(20);
t_num varchar(30);
new_pnr varchar(15);
type warray is varray(50) of ticket_detail.pnr%type;
moves warray:=warray();
b integer:=1;
ab integer:=1;

begin
select train_no into t_num from ticket_detail where pnr=:old.pnr;
select departure_date into dat from ticket_detail where pnr=:old.pnr;
select coach_no into coc from ticket_detail where pnr=:old.pnr;
select  t.pnr into new_pnr from ticket_detail t left join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and p.seat_no=10000;
update passenger_info set seat_no=:old.seat_no where PNR=new_pnr and seat_no=10000;
select distinct t.pnr BULK COLLECT INTO moves from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and p.seat_no>10000 and p.seat_no>:old.seat_no;
ab:=moves.count;
for b in 1..ab loop
update passenger_info set seat_no=TO_CHAR(TO_NUMBER(seat_no)-10000) where PNR=moves(b) and seat_no>10000 and seat_no>:old.seat_no ;

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
pnr_count integer;

b integer:=1;
c integer:=1;
ab integer:=0;
cd integer:=0;
cc integer:=0;


before each row is
begin
select train_no into t_num from ticket_detail where pnr=:old.pnr;
select departure_date into dat from ticket_detail where pnr=:old.pnr;
select coach_no into coc from ticket_detail where pnr=:old.pnr;
seatnumber:=to_number(:old.seat_no);
end before each row;


after statement is
begin


select distinct t.pnr BULK COLLECT INTO mover from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where to_number(p.seat_no)>seatnumber and t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)<10000 ;
cd:=mover.COUNT;

select distinct t.pnr BULK COLLECT INTO moves from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)>9999 and to_number(p.seat_no)>seatnumber;
ab:=moves.COUNT;

for b in 1..cd loop
update passenger_info set seat_no=TO_CHAR(TO_NUMBER(seat_no)-1) where  to_number(seat_no)<10000 and PNR=mover(b) and to_number(seat_no)>seatnumber;
end loop;


for c in 1..ab loop
update passenger_info set seat_no=TO_CHAR(TO_NUMBER(seat_no)-10000) where PNR=moves(b) and to_number(seat_no)>9999  and to_number(seat_no)>seatnumber ;
end loop;

select  distinct count(t.pnr) into cc from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)=0 ;
if cc>0 then
if seatnumber<9999 then
select  distinct t.pnr into new_pnr from ticket_detail t inner join passenger_info p on t.pnr=p.PNR where t.train_no=t_num and t.departure_date=dat and t.coach_no=coc and to_number(p.seat_no)=0 ;
end if;
end if;

if seatnumber<9999 then
update passenger_info set seat_no='18' where PNR=new_pnr and to_number(seat_no)=0 ;
	end if;



end after statement;
end waitinglist;

