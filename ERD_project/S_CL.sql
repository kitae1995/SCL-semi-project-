
/* Drop Triggers */

DROP TRIGGER TRI_reply_rno;
DROP TRIGGER TRI_sr_reply_sr_no;
DROP TRIGGER TRI_s_board_s_tno;
DROP TRIGGER TRI_table_tno;
DROP TRIGGER TRI_t_reply_tr_no;



/* Drop Tables */

DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE sr_reply CASCADE CONSTRAINTS;
DROP TABLE s_board CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_reply_rno;
DROP SEQUENCE SEQ_sr_reply_sr_no;
DROP SEQUENCE SEQ_s_board_s_tno;
DROP SEQUENCE SEQ_table_tno;
DROP SEQUENCE SEQ_t_reply_tr_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_reply_rno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sr_reply_sr_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_board_s_tno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_table_tno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_reply_tr_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE members
(
	ID varchar2(100) NOT NULL UNIQUE,
	PW varchar2(100) NOT NULL,
	name varchar2(100) NOT NULL,
	email varchar2(100) NOT NULL,
	phone varchar2(100) NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE reply
(
	r_like number(10,0) NOT NULL,
	r_content varchar2(100) NOT NULL,
	rno number(10,0) NOT NULL,
	r_writer varchar2(100) NOT NULL,
	r_reg_date date DEFAULT SYSDATE,
	r_tno number(10,0) NOT NULL,
	PRIMARY KEY (rno)
);


CREATE TABLE sr_reply
(
	sr_no number(10,0) NOT NULL,
	sr_writer varchar2(100) NOT NULL,
	sr_content varchar2(100),
	sr_regdate date DEFAULT SYSDATE NOT NULL,
	sr_sno number(10,0) NOT NULL,
	PRIMARY KEY (sr_no)
);


CREATE TABLE s_board
(
	s_like number(10,0) NOT NULL,
	s_title varchar2(100) NOT NULL,
	s_content varchar2(100) NOT NULL,
	s_reg_date date DEFAULT SYSDATE NOT NULL,
	s_reply varchar2(100),
	s_tno number(10,0) NOT NULL,
	s_writer varchar2(100) NOT NULL,
	PRIMARY KEY (s_tno)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (r_writer)
	REFERENCES members (ID)
;


ALTER TABLE sr_reply
	ADD FOREIGN KEY (sr_writer)
	REFERENCES members (ID)
;


ALTER TABLE s_board
	ADD FOREIGN KEY (s_writer)
	REFERENCES members (ID)
;


ALTER TABLE reply
	ADD FOREIGN KEY (r_tno)
	REFERENCES s_board (s_tno)
;


ALTER TABLE sr_reply
	ADD FOREIGN KEY (sr_sno)
	REFERENCES s_board (s_tno)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_reply_rno BEFORE INSERT ON reply
FOR EACH ROW
BEGIN
	SELECT SEQ_reply_rno.nextval
	INTO :new.rno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sr_reply_sr_no BEFORE INSERT ON sr_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_sr_reply_sr_no.nextval
	INTO :new.sr_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_s_board_s_tno BEFORE INSERT ON s_board
FOR EACH ROW
BEGIN
	SELECT SEQ_s_board_s_tno.nextval
	INTO :new.s_tno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_table_tno BEFORE INSERT ON table
FOR EACH ROW
BEGIN
	SELECT SEQ_table_tno.nextval
	INTO :new.tno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_t_reply_tr_no BEFORE INSERT ON t_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_t_reply_tr_no.nextval
	INTO :new.tr_no
	FROM dual;
END;

/




