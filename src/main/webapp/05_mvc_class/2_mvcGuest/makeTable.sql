CREATE TABLE GuestTB
(
	MESSAGE_ID NUMBER PRIMARY KEY,
	GUEST_NAME VARCHAR2(10) NOT NULL,
	PASSWORD VARCHAR2(10) NOT NULL,
	MESSAGE VARCHAR2(512) NOT NULL
);

CREATE SEQUENCE seq_messageId_guestTb;