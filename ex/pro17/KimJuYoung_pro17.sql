drop table t_board cascade constraints;

-- �Խ��� ���̺��� �����մϴ�.
create table t_board(
    articleNO number(10) primary key,
    parentNO number(10) default 0,
    title varchar2(500) not null,
    content varchar2(4000),
    imageFileName varchar2(100),
    writedate date default sysdate not null,
    id varchar2(10),
    constraint fk_id foreign key(id)
    references t_member(id)
);

-- ���̺� �׽�Ʈ ���� �߰��մϴ�.
insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(1, 0, '�׽�Ʈ���Դϴ�.', '�׽�Ʈ���Դϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(2, 0, '�ȳ��ϼ���.', '��ǰ �ı��Դϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(3, 2, '�亯�Դϴ�.', '��ǰ �ı⿡ ���� �亯�Դϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(5, 3, '�亯�Դϴ�.', '��ǰ �����ϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(4, 0, '�������Դϴ�.', '������ �׽�Ʈ ���Դϴ�.', null, sysdate, 'sarang');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(6, 2, '��ǰ �ı��Դϴ�.', '�̼��ž��� ��ǰ ��� �ı⸦ �ø��ϴ�!!', null, sysdate, 'robo');


commit;

select*
from t_board;

select level,
    articleNO,
    parentNO,
    lpad(' ', 4*(level-1)) || title title,
    content,
    writeDate,
    id
from t_board
start with parentNO=0
connect by prior articleNO=parentNO
order siblings by articleNO desc;

