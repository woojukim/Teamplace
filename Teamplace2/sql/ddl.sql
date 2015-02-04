/* userinfo */
CREATE TABLE userinfo (
	useremail VARCHAR2(100) NOT NULL, /* useremail */
	userpassword VARCHAR2(30), /* userpassword */
	usernickname VARCHAR2(50) /* usernickname */
);

ALTER TABLE userinfo
	ADD
		CONSTRAINT PK_userinfo
		PRIMARY KEY (
			useremail
		);

/* teaminfo */
CREATE TABLE teaminfo (
	teamno NUMBER NOT NULL, /* teamno */
	teamleaderemail VARCHAR2(100), /* teamleaderemail */
	teamname VARCHAR2(100), /* teamname */
	teamdesc VARCHAR2(500), /* teamdesc */
	teamcday DATE, /* teamcday */
	teamdday DATE, /* teamdday */
	teamcatebig VARCHAR2(50), /* teamcatebig */
	teamcatesmall VARCHAR2(50), /* teamcatesmall */
	teamgoal VARCHAR2(1000), /* teamgoal */
	teampeople NUMBER /* teampeople */
);

ALTER TABLE teaminfo
	ADD
		CONSTRAINT PK_teaminfo
		PRIMARY KEY (
			teamno
		);

/* teammember */
CREATE TABLE teammember (
	teamno NUMBER NOT NULL, /* teamno */
	useremail VARCHAR2(100) NOT NULL, /* useremail */
	toolnumber VARCHAR2(100), /* toolnumber */
	usercolor VARCHAR2(20), /* usercolor */
	textcolor VARCHAR2(20) /* textcolor */
);

ALTER TABLE teammember
	ADD
		CONSTRAINT PK_teammember
		PRIMARY KEY (
			teamno,
			useremail
		);

/* article */
CREATE TABLE article (
	articleno NUMBER NOT NULL, /* articleno */
	dictreeno NUMBER, /* dictreeno */
	useremail VARCHAR2(100), /* useremail */
	articlecontent VARCHAR2(4000), /* articlecontent */
	articletitle VARCHAR2(200), /* articletitle */
	articlefilename VARCHAR2(100), /* articlefilename */
	articlefiletype VARCHAR2(20), /* articlefiletype */
	articledate DATE, /* articledate */
	articlecnt NUMBER, /* articlecnt */
	teamno NUMBER /* teamno */
);

ALTER TABLE article
	ADD
		CONSTRAINT PK_article
		PRIMARY KEY (
			articleno
		);

/* feedback */
CREATE TABLE feedback (
	feedbackno NUMBER NOT NULL, /* feedbackno */
	useremail VARCHAR2(100), /* useremail */
	articleno NUMBER, /* articleno */
	feedbackcontent VARCHAR2(4000), /* feedbackcontent */
	feedbackpage VARCHAR2(30) /* feedbackpage */
);

ALTER TABLE feedback
	ADD
		CONSTRAINT PK_feedback
		PRIMARY KEY (
			feedbackno
		);

/* vote */
CREATE TABLE vote (
	voteno NUMBER NOT NULL, /* voteno */
	useremail VARCHAR2(100), /* useremail */
	teamno NUMBER, /* teamno */
	votetitle VARCHAR(100), /* votetitle */
	votedday DATE /* votedday */
);

ALTER TABLE vote
	ADD
		CONSTRAINT PK_vote
		PRIMARY KEY (
			voteno
		);

/* voteoption */
CREATE TABLE voteoption (
	voteoptionno NUMBER NOT NULL, /* voteoptionno */
	voteno NUMBER, /* voteno */
	voteoptiontitle VARCHAR2(100), /* voteoptiontitle */
	voteoptioncnt NUMBER, /* voteoptioncnt */
	voteoptionnickname VARCHAR2(1000) /* voteoptionnickname */
);

ALTER TABLE voteoption
	ADD
		CONSTRAINT PK_voteoption
		PRIMARY KEY (
			voteoptionno
		);

/* msg */
CREATE TABLE msg (
	msgno NUMBER NOT NULL, /* msgno */
	teamno NUMBER, /* teamno */
	senduseremail VARCHAR2(100), /* senduseremail */
	sendusernickname VARCHAR2(100), /* sendusernickname */
	receiveusermail VARCHAR2(100), /* receiveuseremail */
	receiveusernickname VARCHAR2(100), /* receiveusernickname */
	msgdate DATE, /* msgdate */
	msgcontent VARCHAR2(4000), /* msgcontent */
	msgtype VARCHAR2(20), /* msgtype */
	msgflag NUMBER /* msgflag */
);

ALTER TABLE msg
	ADD
		CONSTRAINT PK_msg
		PRIMARY KEY (
			msgno
		);

/* privatetimetree */
CREATE TABLE privatetimetree (
	privatetimetrrno NUMBER NOT NULL, /* privatetimetreeno */
	useremail VARCHAR2(100), /* useremail */
	teamno NUMBER, /* teamno */
	privatetimetreecontent VARCHAR2(4000), /* privatetimetreecontent */
	privatetimetreedate DATE /* privatetimetreedate */
);

ALTER TABLE privatetimetree
	ADD
		CONSTRAINT PK_privatetimetree
		PRIMARY KEY (
			privatetimetrrno
		);

/* todo */
CREATE TABLE todo (
	todono NUMBER NOT NULL, /* todono */
	teamno NUMBER, /* teamno */
	todocontent VARCHAR(4000), /* todocontent */
	todoflag VARCHAR2(20) /* todoflag */
);

ALTER TABLE todo
	ADD
		CONSTRAINT PK_todo
		PRIMARY KEY (
			todono
		);

/* cal */
CREATE TABLE cal (
	calno NUMBER NOT NULL, /* calno */
	teamno NUMBER, /* teamno */
	useremail VARCHAR2(100), /* useremail */
	calcontent VARCHAR2(4000), /* calcontent */
	calsdate DATE, /* calsdate */
	caledate DATE /* caledate */
);

ALTER TABLE cal
	ADD
		CONSTRAINT PK_cal
		PRIMARY KEY (
			calno
		);

/* dictree */
CREATE TABLE dictree (
	dictreeno NUMBER NOT NULL, /* dictreeno */
	teamno NUMBER, /* teamno */
	dictreetitle VARCHAR2(100), /* dictreetitle */
	updictreeno NUMBER /* updictreeno */
);

ALTER TABLE dictree
	ADD
		CONSTRAINT PK_dictree
		PRIMARY KEY (
			dictreeno
		);

/* timetree */
CREATE TABLE timetree (
	timetreeno NUMBER NOT NULL, /* timetreeno */
	teamno NUMBER, /* teamno */
	timetreecontent VARCHAR2(4000), /* timetreecontent */
	timetreedate DATE /* timetreedate */
);

ALTER TABLE timetree
	ADD
		CONSTRAINT PK_timetree
		PRIMARY KEY (
			timetreeno
		);

/* budget */
CREATE TABLE budget (
	budgetno NUMBER NOT NULL, /* budgetno */
	teamno NUMBER, /* teamno */
	budgetcontent VARCHAR2(4000), /* budgetcontent */
	budgetmoney NUMBER, /* budgetmoney */
	budgetdate DATE, /* budgetdate */
	budgetflag VARCHAR2(20), /* budgetflag */
	budgetnow NUMBER /* budgetnow */
);

ALTER TABLE budget
	ADD
		CONSTRAINT PK_budget
		PRIMARY KEY (
			budgetno
		);

/* log */
CREATE TABLE log (
	logno NUMBER NOT NULL, /* logno */
	teamno NUMBER, /* teamno */
	useremail VARCHAR2(100), /* useremail */
	logcontent VARCHAR2(4000), /* logcontent */
	logdate DATE /* logdate */
);

ALTER TABLE log
	ADD
		CONSTRAINT PK_log
		PRIMARY KEY (
			logno
		);

/* notice */
CREATE TABLE notice (
	noticeno NUMBER NOT NULL, /* noticeno */
	teamno NUMBER, /* teamno */
	useremail VARCHAR2(100), /* useremail */
	noticetitle VARCHAR2(100), /* noticetitle */
	noticecontent VARCHAR2(4000), /* noticecontent */
	noticedate DATE /* noticedate */
);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			noticeno
		);

/* url */
CREATE TABLE url (
	urlno NUMBER NOT NULL, /* urlno */
	teamno NUMBER, /* teamno */
	useremail VARCHAR2(100), /* useremail */
	urltitle VARCHAR2(100), /* urltitle */
	urllink VARCHAR2(200), /* urllink */
	urldate DATE /* urldate */
);

ALTER TABLE url
	ADD
		CONSTRAINT PK_url
		PRIMARY KEY (
			urlno
		);

/* privatetodo */
CREATE TABLE privatetodo (
	privatetodono NUMBER NOT NULL, /* privatetodono */
	useremail VARCHAR2(100), /* useremail */
	teamno NUMBER, /* teamno */
	privatetimetreecontent VARCHAR2(4000), /* privatetimetreecontent */
	privatetimetreedate DATE /* privatetimetreedate */
);

ALTER TABLE privatetodo
	ADD
		CONSTRAINT PK_privatetodo
		PRIMARY KEY (
			privatetodono
		);

/* role */
CREATE TABLE role (
	roleno NUMBER NOT NULL, /* roleno */
	useremail VARCHAR2(100), /* useremail */
	todono NUMBER, /* todono */
	roledate DATE, /* roledate */
	teamno NUMBER /* teamno */
);

ALTER TABLE role
	ADD
		CONSTRAINT PK_role
		PRIMARY KEY (
			roleno
		);

/* chatresult */
CREATE TABLE chatresult (
	resultno NUMBER NOT NULL, /* resultno */
	teamno NUMBER, /* teamno */
	resultdate DATE, /* resultdate */
	resultfilename VARCHAR2(100) /* resultfilename */
);

ALTER TABLE chatresult
	ADD
		CONSTRAINT PK_TABLE
		PRIMARY KEY (
			resultno
		);

ALTER TABLE teaminfo
	ADD
		CONSTRAINT FK_userinfo_TO_teaminfo
		FOREIGN KEY (
			teamleaderemail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE teammember
	ADD
		CONSTRAINT FK_teaminfo_TO_teammember
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE teammember
	ADD
		CONSTRAINT FK_userinfo_TO_teammember
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		)
		ON DELETE CASCADE;

ALTER TABLE article
	ADD
		CONSTRAINT FK_userinfo_TO_article
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE article
	ADD
		CONSTRAINT FK_dictree_TO_article
		FOREIGN KEY (
			dictreeno
		)
		REFERENCES dictree (
			dictreeno
		);

ALTER TABLE article
	ADD
		CONSTRAINT FK_teaminfo_TO_article
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		);

ALTER TABLE feedback
	ADD
		CONSTRAINT FK_article_TO_feedback
		FOREIGN KEY (
			articleno
		)
		REFERENCES article (
			articleno
		)
		ON DELETE CASCADE;

ALTER TABLE feedback
	ADD
		CONSTRAINT FK_userinfo_TO_feedback
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		)
		ON DELETE CASCADE;

ALTER TABLE vote
	ADD
		CONSTRAINT FK_userinfo_TO_vote
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE vote
	ADD
		CONSTRAINT FK_teaminfo_TO_vote
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE voteoption
	ADD
		CONSTRAINT FK_vote_TO_voteoption
		FOREIGN KEY (
			voteno
		)
		REFERENCES vote (
			voteno
		)
		ON DELETE CASCADE;

ALTER TABLE msg
	ADD
		CONSTRAINT FK_teaminfo_TO_msg
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		);

ALTER TABLE privatetimetree
	ADD
		CONSTRAINT FK_teaminfo_TO_privatetimetree
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE privatetimetree
	ADD
		CONSTRAINT FK_userinfo_TO_privatetimetree
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		)
		ON DELETE CASCADE;

ALTER TABLE todo
	ADD
		CONSTRAINT FK_teaminfo_TO_todo
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE cal
	ADD
		CONSTRAINT FK_teaminfo_TO_cal
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE cal
	ADD
		CONSTRAINT FK_userinfo_TO_cal
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE dictree
	ADD
		CONSTRAINT FK_teaminfo_TO_dictree
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE timetree
	ADD
		CONSTRAINT FK_teaminfo_TO_timetree
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE budget
	ADD
		CONSTRAINT FK_teaminfo_TO_budget
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE log
	ADD
		CONSTRAINT FK_teaminfo_TO_log
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE log
	ADD
		CONSTRAINT FK_userinfo_TO_log
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_teaminfo_TO_notice
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE notice
	ADD
		CONSTRAINT FK_userinfo_TO_notice
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE url
	ADD
		CONSTRAINT FK_teaminfo_TO_url
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE url
	ADD
		CONSTRAINT FK_userinfo_TO_url
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		);

ALTER TABLE privatetodo
	ADD
		CONSTRAINT FK_userinfo_TO_privatetodo
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		)
		ON DELETE CASCADE;

ALTER TABLE privatetodo
	ADD
		CONSTRAINT FK_teaminfo_TO_privatetodo
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE role
	ADD
		CONSTRAINT FK_userinfo_TO_role
		FOREIGN KEY (
			useremail
		)
		REFERENCES userinfo (
			useremail
		)
		ON DELETE CASCADE;

ALTER TABLE role
	ADD
		CONSTRAINT FK_todo_TO_role
		FOREIGN KEY (
			todono
		)
		REFERENCES todo (
			todono
		)
		ON DELETE CASCADE;

ALTER TABLE role
	ADD
		CONSTRAINT FK_teaminfo_TO_role
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;

ALTER TABLE chatresult
	ADD
		CONSTRAINT FK_teaminfo_TO_TABLE
		FOREIGN KEY (
			teamno
		)
		REFERENCES teaminfo (
			teamno
		)
		ON DELETE CASCADE;