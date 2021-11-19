create table doctors(
    doc_id number(10) not null,
    major_treat varchar2(25) not null,
    doc_name varchar2(20) not null,
    doc_gen char(1) not null,
    doc_phone varchar2(15) null,
    doc_email varchar2(50) unique,
    doc_position varchar2(20) not null
);

alter table doctors
add constraint doc_id_pk primary key(doc_id);

create table nurses(
    nur_id number(10) not null,
    major_job varchar2(25) not null,
    nur_name varchar2(20) not null,
    nur_gen char(1) not null,
    nur_phone varchar2(15) null,
    nur_email varchar2(50) unique,
    nur_position varchar2(20) not null
);

alter table nurses
add constraint nur_id_pk primary key(nur_id);

create table patients(
    pat_id number(10) not null,
    nur_id number(10) not null,
    doc_id number(10) not null,
    pat_name varchar2(20) not null,
    pat_gen char(1) not null,
    pat_jumin varchar2(14) not null,
    pat_addr varchar2(100) not null,
    pat_phone varchar2(15) null,
    pat_email varchar2(50) unique,
    pat_job varchar2(20) not null
);

alter table patients
add constraint pat_id_pk primary key (pat_id);

alter table patients
add (constraint r_2 foreign key (doc_id) 
references doctors (doc_id));

alter table patients
add (constraint r_3 foreign key (nur_id)
references nurses (nur_id));

create table treatments(
    treat_id number(15) not null,
    pat_id number(10) not null,
    doc_id number(10) not null,
    treat_contents varchar2(1000) not null,
    treat_date date not null
);

alter table treatments
add constraint treat_pat_doc_id_pk 
primary key (treat_id, pat_id, doc_id);

alter table treatments
add (constraint r_5 foreign key(pat_id)
references patients(pat_id));

alter table treatments
add(constraint r_6 foreign key(doc_id)
references doctors(doc_id));

create table charts(
    chart_id varchar2(20) not null,
    treat_id number(15) not null,
    doc_id number(10) not null,
    pat_id number(10) not null,
    nur_id number(10) not null,
    chart_contents varchar2(1000) not null
);

alter table charts
add constraint chart_treat_doc_pat_id_pk
primary key(chart_id, treat_id, doc_id, pat_id);

alter table charts
add(constraint r_4 foreign key(nur_id)
references nurses (nur_id));

alter table charts
add(constraint r_7 foreign key(treat_id, pat_id, doc_id)
references treatments (treat_id, pat_id, doc_id));

insert into doctors
values (070576, '피부과', '홍길동', 'F', '016-333-7263',
'lja@hanbh.com', '전문의');

select *
from doctors;

