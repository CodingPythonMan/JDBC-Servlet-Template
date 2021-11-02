drop table t_board cascade constraints;

-- 게시판 테이블을 생성합니다.
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

-- 테이블에 테스트 글을 추가합니다.
insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(1, 0, '테스트글입니다.', '테스트글입니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(2, 0, '안녕하세요.', '상품 후기입니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(3, 2, '답변입니다.', '상품 후기에 대한 답변입니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(5, 3, '답변입니다.', '상품 좋습니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(4, 0, '김유신입니다.', '김유신 테스트 글입니다.', null, sysdate, 'sarang');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(6, 2, '상품 후기입니다.', '이순신씨의 상품 사용 후기를 올립니다!!', null, sysdate, 'robo');


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

