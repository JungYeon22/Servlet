-- Oracle
[테이블]
CREATE TABLE board(
     seq NUMBER NOT NULL,               -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,           -- 아이디
     name VARCHAR2(40) NOT NULL,       -- 이름
     email VARCHAR2(40),                  -- 이메일
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 

     ref NUMBER NOT NULL,                 -- 그룹번호
     lev NUMBER DEFAULT 0 NOT NULL,     -- 단계
     step NUMBER DEFAULT 0 NOT NULL,    -- 글순서
     pseq NUMBER DEFAULT 0 NOT NULL,    -- 원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 답변수

     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE
 );

[시퀀스]
CREATE SEQUENCE seq_board  NOCACHE NOCYCLE;


---------------------------------------------------------------------

[테이블] -- MySQL
CREATE TABLE board(
     seq INT NOT NULL AUTO_INCREMENT primary key,               -- 글번호 (오토 증가)
     id VARCHAR(20) NOT NULL,           -- 아이디
     name VARCHAR(40) NOT NULL,       -- 이름
     email VARCHAR(40),                  -- 이메일
     subject VARCHAR(255) NOT NULL,    -- 제목
     content VARCHAR(4000) NOT NULL,   -- 내용 

     ref INT NOT NULL,                 -- 그룹번호
     lev INT DEFAULT 0 NOT NULL,     -- 단계
     step INT DEFAULT 0 NOT NULL,    -- 글순서
     pseq INT DEFAULT 0 NOT NULL,    -- 원글번호
     reply INT DEFAULT 0 NOT NULL,   -- 답변수

     hit INT DEFAULT 0,              -- 조회수
     logtime DATETIME default current_timestamp
 );
 
 -- MYSQL 시간 예시
 logtime DATE default (current_DATE)		-- 현재 날짜 / 반드시 괄호를 써야 한다.
 logtime DATETIME default (current_time)	-- 현재 시간 /반드시 괄호를 써야 한다.
 logtime DATETIME default current_timestamp	-- 현재 날짜 & 시간
 logtime DATETIME default now()	-- 현재 날짜 & 시간
 
 
 -- MySQL 게시판 생성 procedure
 DELIMITER //
create PROCEDURE boardWriteboard (in id_val varchar(20)
							, in name_val varchar(20)
                            , in email_val varchar(20)
                            , in subject_val varchar(50)
                            , in content_val varchar(300))
begin
	DECLARE ref_val INT;

	SELECT AUTO_INCREMENT into ref_val
	FROM information_schema.TABLES 
	WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='board';
    
    insert into board(id, name, email, subject, content, ref) 
  		values ( id_val
  				, name_val
  				, email_val
  				, subject_val
  				, content_val
  				, ref_val);
end //
DELIMITER ;

 
 
 -- MySQL 게시판 삭제 procedure
 DELIMITER //
create PROCEDURE boardDelete (in seq_value int)
begin
	update board set reply=reply-1 
	where seq=(select p.pseq from (select pseq from board where seq=seq_value)as p);
  			
	update board set subject = concat('[원글이 삭제된 답글]', subject) where pseq=seq_value;
  			
	delete from board where seq=seq_value;
end //
DELIMITER ;

 
 
 
 
 
 
 
 
 
 
 
 
 
