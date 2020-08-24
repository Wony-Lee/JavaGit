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

create sequence applicationview_seq
increment by 1
start with 1
nocache;