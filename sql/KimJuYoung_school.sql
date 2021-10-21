create table subject(
    no number(6) not null unique,
    s_num number(2),
    s_name varchar2(20) not null
);

alter table subject
add constraint s_num_pk primary key (s_num);

create table student(
    no number(6) not null unique,
    sd_num number(8),
    sd_name varchar2(10) not null,
    sd_id varchar2(24) not null unique,
    sd_passwd varchar2(50),
    s_num number(2),
    sd_birth date not null,
    sd_phone varchar2(20) not null,
    sd_address varchar2(50) not null,
    sd_email varchar2(100) not null unique,
    sd_date date not null
);

alter table student
add constraint sd_num_pk primary key (sd_num);

alter table student
add (constraint r_1 foreign key(s_num) references subject(s_num));

create table lesson(
    no number(6) not null unique,
    l_abbre varchar2(4),
    l_name varchar2(40) not null
);

alter table lesson
add constraint l_abbre_pk primary key (l_abbre);

create table trainee(
    no number(6) not null,
    sd_num number(8),
    l_abbre varchar2(40),
    t_section varchar2(50) not null,
    t_date date not null
);

alter table trainee
add (constraint s_2 foreign key(sd_num) references student(sd_num));

alter table trainee
add (constraint s_3 foreign key(l_abbre) references lesson(l_abbre));

commit;