--�������ݿ�
create database Bcz
on
(
	name=Bcz_data,
	filename='E:\�ٴ�ն��Ŀ\���ݿ�\BCZ_DATA.mdf',
	size=10mb,
	maxsize=30mb,
	filegrowth=10mb
)
log on
(
	name=Bcz_log,
	filename='E:\�ٴ�ն��Ŀ\���ݿ�\BCZ_LOG.ldf',
	size=2mb,
	maxsize=10mb,
	filegrowth=1mb
);

use Bcz
go
--����Ա��
create table Lecturer
(
	L_ID int IDENTITY(1,1) not null,
	L_VDATE varchar(20) not null,
	L_NAME varchar(10) not null,
	L_PASS varchar(16) not null 
)
alter table lecturer alter column L_ID int

--�û���
create table Users
(
	U_ID int IDENTITY(1,1) not null primary key,
	U_NAME varchar(10) not null unique,
	U_PASSWORD varchar(16) not null,
	U_IMG image,
	U_EMAIL varchar(50),
	U_REGISTERTIME datetime
)

--���ʰ����ͱ�
create table CourseContentType
(
	CCT_ID int IDENTITY(1,1) not null primary key,
	CCT_NAME varchar(20) not null,
	CCT_DESC varchar(50) 
)

--���ʰ�
create table Coures
(
	C_ID int IDENTITY(1,1) not null primary key,
	C_NAME varchar(20) not null,
	CCT_ID int not null foreign key(CCT_ID) references CourseContentType(CCT_ID),
	C_RELEASEDATE datetime not null,
	c_vocabulary int not null
)

--���ʱ�
create table CourseDetails
(
	CD_ID int IDENTITY(1,1) not null primary key,
	C_ID int not null foreign key(C_ID) references Coures(C_ID),
	CD_NAME char(20) not null,
	CD_YINBIAO varchar(30) not null,
	CD_Mean varchar(max) not null,
	CD_RIGHT_PIC image not null,
	CD_WRONG_PIC1 image not null,
    CD_WRONG_PIC2 image not null,
	CD_WRONG_PIC3 image not null,
	CD_SENEng varchar(max) not null,
	CD_SENChi varchar(max) not null,
	CD_VIDEO varchar(max)
)

--�û��ƻ���
create table UserCollect
(
	UC_ID int IDENTITY(1,1) not null primary key,
	U_ID int not null foreign key(U_ID) references Users(U_ID),
	C_ID int not null foreign key(C_ID) references Coures(C_ID),
	UC_EveWord int not null,
	UC_ComDay int not null,
	UC_StartDay datetime not null,
	UC_EndDay datetime not null,
	UC_IsRead int not null
)

--�û����ȱ�
create table UserDownload
(
	UD_ID int IDENTITY(1,1) not null primary key,
	U_ID int not null foreign key(U_ID) references Users(U_ID),
	C_ID int not null foreign key(C_ID) references Coures(C_ID),
	CD_ID int not null foreign key(CD_ID) references CourseDetails(CD_ID),
	CD_IsBei int not null,
	UD_CUT int not null,
	UD_STUDY datetime,
	UD_Review datetime,
	UD_Data int not null,
	UD_Status int not null,
)

--�û���̬��
create table UserActivity
(
	UA_ID int IDENTITY(1,1) not null primary key,
	U_ID int not null foreign key(U_ID) references Users(U_ID),
	C_ID int not null foreign key(C_ID) references Coures(C_ID),
	UA_DATE datetime,
	UA_WordNum int
)

