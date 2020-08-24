/* 회원 */
CREATE TABLE member (
	midx number(8) NOT NULL, /* 회원번호 */
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pwd varchar2(40) NOT NULL, /* 비밀번호 */
	sex number(3) NOT NULL, /* 성별 */
	post number(6) NOT NULL, /* 우편번호 */
	addr1 VARCHAR2(200) NOT NULL, /* 주소1 */
	addr2 VARCHAR2(200) NOT NULL, /* 주소2 */
	hp1 number(3) NOT NULL, /* 연락처1 */
	hp2 number(4) NOT NULL, /* 연락처2 */
	hp3 number(4) NOT NULL, /* 연락처3 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	statez number(3) /* 상태 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			midx
		);

/* 공지사항 */
CREATE TABLE News (
	nidx number(20) NOT NULL, /* 공지번호 */
	name varchar2(30) NOT NULL, /* 작성자 */
	title VARCHAR2(200) NOT NULL, /* 공지제목 */
	content varchar2(1000) NOT NULL, /* 공지내용 */
	image varchar2(200), /* 공지사진 */
	wdate DATE NOT NULL, /* 작성일 */
	adminidx number(10), /* 관리자번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE News
	ADD
		CONSTRAINT PK_News
		PRIMARY KEY (
			nidx
		);

/* 유기동물등록 */
CREATE TABLE inputBoard (
	iidx number(20) NOT NULL, /* 글번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	title VARCHAR2(200) NOT NULL, /* 제목 */
	image VARCHAR2(200) NOT NULL, /* 사진 */
	color VARCHAR2(10) NOT NULL, /* 색상 */
	sex number(2) NOT NULL, /* 성별 */
	weight number(6), /* 몸무게 */
	trans number(2), /* 중성화여부 */
	addr VARCHAR2(200), /* 발견주소 */
	indate DATE, /* 발견날짜 */
	astate number(3) NOT NULL, /* 상태 */
	center VARCHAR2(50), /* 보호센터 */
	proect VARCHAR2(200) NOT NULL, /* 보호장소 */
	tel number(11) NOT NULL, /* 연락처 */
	intdate DATE, /* 작성일 */
	form number(3), /* 종류 */
	midx number(8), /* 회원번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE inputBoard
	ADD
		CONSTRAINT PK_inputBoard
		PRIMARY KEY (
			iidx
		);

/* upCg */
CREATE TABLE upCategory (
	upCg_code number(8) NOT NULL, /* upCg_code */
	upCg_name VARCHAR2(30) NOT NULL /* upCg_name */
);

ALTER TABLE upCategory
	ADD
		CONSTRAINT PK_upCategory
		PRIMARY KEY (
			upCg_code
		);

/* downCg */
CREATE TABLE downCategory (
	downCg_code number(8) NOT NULL, /* downCg_code */
	downCg_name varchar2(30) NOT NULL, /* downCg_name */
	upCg_code number(8) NOT NULL /* upCg_code */
);

ALTER TABLE downCategory
	ADD
		CONSTRAINT PK_downCategory
		PRIMARY KEY (
			downCg_code
		);

/* 자유게시판 */
CREATE TABLE Board (
	bidx number(20) NOT NULL, /* 글번호 */
	subject varchar2(50) NOT NULL, /* 제목 */
	name varchar2(30) NOT NULL, /* 작성자 */
	content varchar2(1000) NOT NULL, /* 내용 */
	indate DATE, /* 작성일 */
	midx number(8), /* 회원번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE Board
	ADD
		CONSTRAINT PK_Board
		PRIMARY KEY (
			bidx
		);

/* 자원봉사신청 */
CREATE TABLE ApplicationView (
	aidx number(20) NOT NULL, /* 글번호 */
	name varchar2(30) NOT NULL, /* 회원이름 */
	sex number(2), /* 성별 */
	birth varchar2(6), /* 생년월일 */
	tel number(11) NOT NULL, /* 연락처 */
	post number(6) NOT NULL, /* 우편번호 */
	addr1 varchar2(200) NOT NULL, /* 주소1 */
	addr2 varchar2(200) NOT NULL, /* 주소2 */
	contents varchar2(1000), /* 내용 */
	wdate DATE, /* 신청일 */
	midx number(8), /* 회원번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE ApplicationView
	ADD
		CONSTRAINT PK_ApplicationView
		PRIMARY KEY (
			aidx
		);

/* 회원 */
CREATE TABLE member2 (
	idx NUMBER(8) NOT NULL, /* 회원번호 */
	name varchar2(30) NOT NULL, /* 회원이름 */
	id varchar2(30) NOT NULL, /* 아이디 */
	pwd varchar2(50) NOT NULL, /* 비밀번호 */
	hp1 number(3) NOT NULL, /* 연락처1 */
	hp2 number(4) NOT NULL, /* 연락처2 */
	hp3 number(4) NOT NULL, /* 연락처3 */
	post number(6) NOT NULL, /* 우편번호 */
	addr1 varchar2(200) NOT NULL, /* 주소1 */
	addr2 varchar2(200) NOT NULL, /* 주소2 */
	email varchar2(100) NOT NULL, /* 이메일 */
	state number(3) NOT NULL /* 회원상태 */
);

ALTER TABLE member2
	ADD
		CONSTRAINT PK_member2
		PRIMARY KEY (
			idx
		);


select *from admin;

/* 관리자 */
CREATE TABLE admin (
	adminidx number(10) NOT NULL, /* 관리자번호 */
	adminName varchar2(50) NOT NULL, /* 관리자이름 */
	adminPwd varchar2(100) NOT NULL, /* 관리자비밀번호 */
	lv number(5) NOT NULL /* 관리자등급 */
);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			adminidx
		);

/* 1:1문의 */
CREATE TABLE onetoone (
	oneidx number(10) NOT NULL, /* 글번호 */
	subject varchar2(50) NOT NULL, /* 제목 */
	name varchar2(30) NOT NULL, /* 작성자 */
	hp number(11) NOT NULL, /* 연락처 */
	content varchar2(1000) NOT NULL, /* 내용 */
	wdate DATE, /* 작성일자 */
	email varchar2(100) NOT NULL, /* 이메일 */
	downCg_code number(8), /* downCg_code */
	midx number(8) /* 회원번호 */
);

ALTER TABLE onetoone
	ADD
		CONSTRAINT PK_onetoone
		PRIMARY KEY (
			oneidx
		);

/* 자주묻는질문 */
CREATE TABLE question (
	qidx number(8) NOT NULL, /* 글번호 */
	subject varchar2(50) NOT NULL, /* 제목 */
	content varchar2(1000) NOT NULL, /* 내용 */
	adminidx number(10), /* 관리자번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE question
	ADD
		CONSTRAINT PK_question
		PRIMARY KEY (
			qidx
		);

/* 입양후기 */
CREATE TABLE Review (
	ridx number(20) NOT NULL, /* 글번호 */
	subject varchar2(50) NOT NULL, /* 제목 */
	name varchar2(30) NOT NULL, /* 작성자 */
	content varchar2(1000) NOT NULL, /* 내용 */
	indate DATE, /* 작성일 */
	image varchar2(1000) NOT NULL, /* 사진 */
	image2 varchar2(1000), /* 사진2 */
	downCg_code number(8), /* downCg_code */
	midx number(8) /* 회원번호 */
);

ALTER TABLE Review
	ADD
		CONSTRAINT PK_Review
		PRIMARY KEY (
			ridx
		);

/* 업체소식 */
CREATE TABLE CompanyNews (
	cidx number(20) NOT NULL, /* 업체글번호 */
	name varchar2(30) NOT NULL, /* 작성자 */
	title VARCHAR2(200) NOT NULL, /* 공지제목 */
	content varchar2(1000) NOT NULL, /* 공지내용 */
	image varchar2(200), /* 공지사진 */
	wdate DATE NOT NULL, /* 작성일 */
	adminidx number(10), /* 관리자번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE CompanyNews
	ADD
		CONSTRAINT PK_CompanyNews
		PRIMARY KEY (
			cidx
		);

/* 이벤트 */
CREATE TABLE EventNews (
	eidx number(20) NOT NULL, /* 이벤트번호 */
	name varchar2(30) NOT NULL, /* 작성자 */
	title VARCHAR2(200) NOT NULL, /* 공지제목 */
	content varchar2(1000) NOT NULL, /* 공지내용 */
	image varchar2(200), /* 공지사진 */
	wdate DATE NOT NULL, /* 작성일 */
	adminidx number(10), /* 관리자번호 */
	downCg_code number(8) /* downCg_code */
);

ALTER TABLE EventNews
	ADD
		CONSTRAINT PK_EventNews
		PRIMARY KEY (
			eidx
		);

/* 1:1답변 */
CREATE TABLE one_to (
	oneidx number(10) NOT NULL, /* 글번호 */
	re_index number(10) NOT NULL, /* 답변글번호 */
	re_content varchar2(500), /* 답변내용 */
	re_date DATE, /* 답변일 */
	adminidx number(10) /* 관리자번호 */
);

ALTER TABLE one_to
	ADD
		CONSTRAINT PK_one_to
		PRIMARY KEY (
			oneidx,
			re_index
		);

ALTER TABLE News
	ADD
		CONSTRAINT FK_admin_TO_News
		FOREIGN KEY (
			adminidx
		)
		REFERENCES admin (
			adminidx
		);

ALTER TABLE News
	ADD
		CONSTRAINT FK_downCategory_TO_News
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE inputBoard
	ADD
		CONSTRAINT FK_member_TO_inputBoard
		FOREIGN KEY (
			midx
		)
		REFERENCES member (
			midx
		);

ALTER TABLE inputBoard
	ADD
		CONSTRAINT FK_downCategory_TO_inputBoard
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE downCategory
	ADD
		CONSTRAINT FK_upCategory_TO_downCategory
		FOREIGN KEY (
			upCg_code
		)
		REFERENCES upCategory (
			upCg_code
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_member_TO_Board
		FOREIGN KEY (
			midx
		)
		REFERENCES member (
			midx
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_downCategory_TO_Board
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE ApplicationView
	ADD
		CONSTRAINT FK_member_TO_ApplicationView
		FOREIGN KEY (
			midx
		)
		REFERENCES member (
			midx
		);

ALTER TABLE ApplicationView
	ADD
		CONSTRAINT FK_downCategory_TO_ApplicationView
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);


ALTER TABLE onetoone
	ADD
		CONSTRAINT FK_downCategory_TO_onetoone
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE onetoone
	ADD
		CONSTRAINT FK_member_TO_onetoone
		FOREIGN KEY (
			midx
		)
		REFERENCES member (
			midx
		);

ALTER TABLE question
	ADD
		CONSTRAINT FK_admin_TO_question
		FOREIGN KEY (
			adminidx
		)
		REFERENCES admin (
			adminidx
		);

ALTER TABLE question
	ADD
		CONSTRAINT FK_downCategory_TO_question
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE Review
	ADD
		CONSTRAINT FK_downCategory_TO_Review
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE Review
	ADD
		CONSTRAINT FK_member_TO_Review
		FOREIGN KEY (
			midx
		)
		REFERENCES member (
			midx
		);

ALTER TABLE CompanyNews
	ADD
		CONSTRAINT FK_admin_TO_CompanyNews
		FOREIGN KEY (
			adminidx
		)
		REFERENCES admin (
			adminidx
		);

ALTER TABLE CompanyNews
	ADD
		CONSTRAINT FK_downCategory_TO_CompanyNews
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE EventNews
	ADD
		CONSTRAINT FK_admin_TO_EventNews
		FOREIGN KEY (
			adminidx
		)
		REFERENCES admin (
			adminidx
		);

ALTER TABLE EventNews
	ADD
		CONSTRAINT FK_downCategory_TO_EventNews
		FOREIGN KEY (
			downCg_code
		)
		REFERENCES downCategory (
			downCg_code
		);

ALTER TABLE one_to
	ADD
		CONSTRAINT FK_onetoone_TO_one_to
		FOREIGN KEY (
			oneidx
		)
		REFERENCES onetoone (
			oneidx
		);

ALTER TABLE one_to
	ADD
		CONSTRAINT FK_admin_TO_one_to
		FOREIGN KEY (
			adminidx
		)
		REFERENCES admin (
			adminidx
		);