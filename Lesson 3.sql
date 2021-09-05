-- ------------------------------BẢNG MẪU CÓ SẴN----------------------------------------

DROP DATABASE IF EXISTS Testing_System_Assingment_3;
CREATE DATABASE 		Testing_System_Assingment_3;
USE 					Testing_System_Assingment_3;

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(50) UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS		 Position;
CREATE TABLE 				`Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM','Dev			1',
								 'Test			1','Scrum Master	1','PM				1',
                                 'Dev			2','Test			2','Scrum Master	2',
                                 'PM				2','Dev			3','Test			3',
                                 'Scrum Master	3','PM				3','Dev			4',
                                 'Test			4','Scrum Master	4','PM				4') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS 				`Account`;
CREATE TABLE 						`Account`(
	AccountID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email							VARCHAR(50) UNIQUE KEY,
    Username						VARCHAR(50) UNIQUE KEY,
    FullName						NVARCHAR(50),
    DepartmentID 					TINYINT UNSIGNED ,
    PositionID						TINYINT UNSIGNED,
    CreateDate						DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) 		REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) 		REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS 		`Group`;
CREATE TABLE 				`Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS 		GroupAccount;
CREATE TABLE				GroupAccount(
	GroupID					TINYINT UNSIGNED ,
    AccountID				TINYINT UNSIGNED ,
    JoinDate				DATETIME 			DEFAULT NOW(),
    PRIMARY KEY 			(GroupID,AccountID),
    FOREIGN KEY				(GroupID) 			REFERENCES `Group`(GroupID) 
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS 		TypeQuestion;
CREATE TABLE 				TypeQuestion (
    TypeID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 				ENUM('Essay','Multiple-Choice') UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS 		CategoryQuestion;
CREATE TABLE 				CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS 			Question;
CREATE TABLE 					Question(
    QuestionID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content						NVARCHAR(100) 	 ,
    CategoryID					TINYINT UNSIGNED ,
    TypeID						TINYINT UNSIGNED ,
    CreatorID					TINYINT UNSIGNED ,
    CreateDate					DATETIME 		DEFAULT NOW(),
    FOREIGN KEY		(CategoryID) 				REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY		(TypeID) 					REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY		(CreatorID) 				REFERENCES `Account`(AccountId) 
);

-- create table 9: Answer
DROP TABLE IF EXISTS 		Answer;
CREATE TABLE 				Answer(
    AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) ,
    QuestionID				TINYINT UNSIGNED,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS 		Exam;
CREATE TABLE 					Exam(
    ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`						CHAR(10) ,
    Title						NVARCHAR(50) ,
    CategoryID					TINYINT UNSIGNED ,
    Duration					TINYINT UNSIGNED ,
    CreatorID					TINYINT UNSIGNED ,
    CreateDate					DATETIME 		DEFAULT NOW(),
    FOREIGN KEY		(CategoryID)				REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY		(CreatorID) 				REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS 				ExamQuestion;
CREATE TABLE 						ExamQuestion(
    ExamID							TINYINT UNSIGNED ,
	QuestionID						TINYINT UNSIGNED ,
    FOREIGN KEY		(QuestionID)	REFERENCES Question(QuestionID),
    FOREIGN KEY		(ExamID) 		REFERENCES Exam(ExamID) ,
    PRIMARY KEY 	(ExamID,QuestionID)
);

/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/
-- Add data Department
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   NULL		,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,   NULL		,   '2'		,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   NULL		,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   NULL		,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   NULL		,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- Add data Group
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Development'			,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

-- Add data GroupAccount
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Add data TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java Câu hỏi về Java Câu hỏi về Java Câu hỏi về Java'	,	1		,   '1'			,   '2'		,'2020-04-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 
/* -------------------------------- Question 1: Thêm ít nhất 10 record vào mỗi table/* ------------------------------*/

INSERT INTO  	Department	(	DepartmentID		,		DepartmentName		)
VALUES						(		'15'			,   N'Marketing		1'		),
							(		'11'			,   N'Sale			1'		),
							(		'12'			,   N'Bảo vệ		1'		),
							(		'13'			,   N'Nhân sự		1'		),
							(		'14'			,   N'Kỹ thuật		1'		),
							(		'16'			,   N'Tài chính		1'		),
							(		'17'			,   N'Phó giám đốc	1'		),
							(		'18'			,   N'Giám đốc		1'		),
							(		'19'			,   N'Thư kí		1'		),
							(		'20'			,   N'Bán hàng		1'		);
                            
INSERT INTO		 Position	(			PositionName				) 
VALUES 						(		'Dev			1'				),
							(		'Test			1'				),
							(		'Scrum Master	1'				),
							(		'PM				1'				),
							(		'Dev			2'				),
							(		'Test			2'				),
							(		'Scrum Master	2'				),
							(		'PM				2'				),
							(		'Dev			3'				),
							(		'Test			3'				),
							(		'Scrum Master	3'				),
							(		'PM				3'				),
							(		'Dev			4'				),
							(		'Test			4'				),
							(		'Scrum Master	4'				),
							(		'PM				4'				);

INSERT INTO		 `Account`	(			Email				,		 Username		,	 FullName	, DepartmentID	, PositionID	, CreateDate)
VALUES 						(	'abc111@gmail.com'			,		'abc111'		,		'HAHA1'	,		'15'	,  	'11'		,'2019-03-05'),
							(	'abc222@gmail.com'			,		'abc222'		,		'HAHA2'	,		'11'	,   '12'		,'2019-03-05'),
							(	'abc333@gmail.com'			,		'abc333'		,		'HAHA3'	,   	'12'	,   '13'		,'2019-03-07'),
							(	'abc444@gmail.com'			,		'abc444'		,		'HAHA4'	,   	'13'	,   '14'		,'2019-03-08'),
							(	'abc555@gmail.com'			,		'abc555'		,		'HAHA5'	,   	'14'	,   '15'		,'2019-03-10'),
							(	'abc666@gmail.com'			,		'abc666'		,		'HAHA6'	,   	'16'	,   '13'		,'2019-04-05'),
							(	'abc777@gmail.com'			,		'abc777'		,		'HAHA7'	,   	'17'	,   '12'		,'2019-04-09'),
							(	'abc888@gmail.com'			,		'abc888'		,		'HAHA8'	,   	'18'	,   '11'		,'2019-04-07'),
							(	'abc999@gmail.com'			,		'abc999'		,		'HAHA9'	,   	'19'	,   '12'		,'2019-04-07'),
							(	'abc000@gmail.com'			,		'abc000'		,		'HAHA0'	,   	'20'	,   '11'		,'2019-04-09');

INSERT INTO 	`Group`		(	  GroupName				, 	CreatorID		,		 CreateDate			)
VALUES 						(	N'Testing System	1'	,  		15			,		'2019-03-15'		),
							(	N'Development		1'	,  		11			,		'2020-03-17'		),
							(	N'VTI Sale 			4'	,  		12			,		'2020-03-19'		),
							(	N'VTI Sale 			5'	,  		13			,		'2020-03-12'		),
							(	N'VTI Sale 			6'	,  		14			,		'2020-03-28'		),
							(	N'VTI Creator		1'	,  		16			,		'2020-04-16'		),
							(	N'VTI Marketing 	2'	,  		17			,		'2020-04-17'		),
							(	N'Management		2'	,  		18			,		'2020-04-18'		),
							(	N'Management		3'	,  		19			,		'2020-04-19'		),
							(	N'Management		4'	,  		20			,		'2020-04-20'		);
                    
INSERT INTO `GroupAccount`	(	 GroupID	, AccountID	,		 JoinDate			)
VALUES 						(		12		,    10		,		'2019-03-25'		),
							(		13		,    12		,		'2020-04-27'		),
							(		14		,    13		,		'2020-07-29'		),
							(		15		,    14		,		'2020-03-20'		),
							(		16		,    15		,		'2020-03-18'		),
							(		17		,    18		,		'2020-04-26'		),
							(		18		,    17		,		'2020-04-27'		),
							(		19		,    16		,		'2020-04-28'		),
							(		20		,    11		,		'2020-04-29'		),
							(		11		,    19		,		'2020-04-20'		);


INSERT INTO CategoryQuestion		(			CategoryName		)
VALUES 								(		'Java		pro'		),
									(		'ASP.NET	pro'		),
									(		'ADO.NET	pro'		),
									(		'SQL		pro'		),
									(		'Postman	pro'		),
									(		'Ruby		pro'		),
									(		'Python		pro'		),
									(		'C++		pro'		),
									(		'C Sharp	pro'		),
									(		'PHP		pro'		);
													
-- Add data Question
INSERT INTO Question	(			Content				, CategoryID	,	 	TypeID		, 	CreatorID	, CreateDate )
VALUES 					(		'Java		pro'		,		11		, 		 '1'		,   '12'		,'2020-02-05'),
						(		'ASP.NET	pro'		,		20		, 		 '2'		,   '11'		,'2020-02-05'),
						(		'ADO.NET	pro'		,		19		, 		 '2'		,   '14'		,'2020-05-06'),
						(		'SQL		pro'		,		16		, 		 '1'		,   '13'		,'2020-05-06'),
						(		'Postman	pro'		,		15		, 		 '1'		,   '17'		,'2020-07-06'),
						(		'Ruby		pro'		,		13		, 		 '2'		,   '18'		,'2020-07-06'),
						(		'Python		pro'		,		12		, 		 '1'		,   '16'		,'2020-09-06'),
						(		'C++		pro'		,		18		, 		 '1'		,   '20'		,'2020-09-07'),
						(		'C Sharp	pro'		,		14		, 		 '2'		,   '15'		,'2020-11-07'),
						(		'PHP		pro'		,		17		, 		 '1'		,   '19'		,'2020-11-07');

-- Add data Answers
INSERT INTO		Answer	(  	Content			, 	QuestionID	, 	isCorrect	)
VALUES 					(	'Answer 	01'	,   	11		,		0		),
						(	'Answer 	02'	,   	14		,		1		),
						(	'Answer 	03'	,		15		,		0		),
						(	'Answer 	04'	,		16		,		1		),
						( 	'Answer 	05'	,		19		,		1		),
						(	'Answer 	06'	,		18		,		1		),
						(	'Answer 	07'	,		12		,		0		),
						(	'Answer 	08'	,		20		,		0		),
						(	'Answer 	09'	,		17		,		1		),
						(	'Answer 	10'	,		13		,		1		);
	

INSERT INTO		Exam	(`Code`			, 		Title				,	 CategoryID	, Duration	, 	CreatorID		, 	CreateDate		)
VALUES 					('VTIQ011'		, 	'Java		pro'		,		11		,	60		, 	 '15'			,	'2019-01-25'	),
						('VTIQ012'		, 	'ASP.NET	pro'		,		20		,	60		, 	 '12'			,	'2019-03-25'	),
						('VTIQ013'		, 	'ADO.NET	pro'		,		19		,	120		, 	 '14'			,	'2019-04-27'	),
						('VTIQ014'		, 	'SQL		pro'		,		16		,	60		, 	 '11'			,	'2020-05-28'	),
						('VTIQ015'		, 	'Postman	pro'		,		15		,	120		, 	 '18'			,	'2020-07-20'	),
						('VTIQ016'		, 	'Ruby		pro'		,		13		,	60		, 	 '19'			,	'2020-08-25'	),
						('VTIQ017'		, 	'Python		pro'		,		12		,	60		, 	 '17'			,	'2020-08-25'	),
						('VTIQ018'		, 	'C++		pro'		,		18		,	60		, 	 '13'			,	'2020-10-27'	),
						('VTIQ019'		, 	'C Sharp	pro'		,		14		,	90		, 	 '20'			,	'2020-12-27'	),
						('VTIQ020'		, 	'PHP		pro'		,		17		,	90		, 	 '16'			,	'2020-11-28'	);

/* Exercise 1+2 mau: Tiếp tục với Database Testing System -------------------------------- */

-- ------------------------------BẢNG MẪU CÓ SẴN----------------------------------------



-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(50) UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM','Dev			1',
								 'Test			1','Scrum Master	1','PM				1',
                                 'Dev			2','Test			2','Scrum Master	2',
                                 'PM				2','Dev			3','Test			3',
                                 'Scrum Master	3','PM				3','Dev			4',
                                 'Test			4','Scrum Master	4','PM				4') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED ,
    PositionID				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED ,
    AccountID				TINYINT UNSIGNED ,
    JoinDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID) 
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Essay','Multiple-Choice') UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED ,
    TypeID					TINYINT UNSIGNED ,
    CreatorID				TINYINT UNSIGNED ,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId) 
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) ,
    QuestionID				TINYINT UNSIGNED,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) ,
    Title					NVARCHAR(50) ,
    CategoryID				TINYINT UNSIGNED ,
    Duration				TINYINT UNSIGNED ,
    CreatorID				TINYINT UNSIGNED ,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED ,
	QuestionID			TINYINT UNSIGNED ,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
    PRIMARY KEY (ExamID,QuestionID)
);

/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/
-- Add data Department
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   NULL		,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,   NULL		,   '2'		,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   NULL		,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   NULL		,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   NULL		,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- Add data Group
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Development'			,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

-- Add data GroupAccount
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Add data TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java Câu hỏi về Java Câu hỏi về Java Câu hỏi về Java'	,	1		,   '1'			,   '2'		,'2020-04-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 

/* -------------------------------- Question 1: Thêm ít nhất 10 record vào mỗi table/* ------------------------------*/

INSERT INTO  	Department	(	DepartmentID		,		DepartmentName		)
VALUES						(		'15'			,   N'Marketing		1'		),
							(		'11'			,   N'Sale			1'		),
							(		'12'			,   N'Bảo vệ		1'		),
							(		'13'			,   N'Nhân sự		1'		),
							(		'14'			,   N'Kỹ thuật		1'		),
							(		'16'			,   N'Tài chính		1'		),
							(		'17'			,   N'Phó giám đốc	1'		),
							(		'18'			,   N'Giám đốc		1'		),
							(		'19'			,   N'Thư kí		1'		),
							(		'20'			,   N'Bán hàng		1'		);
                            
INSERT INTO		 Position	(			PositionName				) 
VALUES 						(		'Dev			1'				),
							(		'Test			1'				),
							(		'Scrum Master	1'				),
							(		'PM				1'				),
							(		'Dev			2'				),
							(		'Test			2'				),
							(		'Scrum Master	2'				),
							(		'PM				2'				),
							(		'Dev			3'				),
							(		'Test			3'				),
							(		'Scrum Master	3'				),
							(		'PM				3'				),
							(		'Dev			4'				),
							(		'Test			4'				),
							(		'Scrum Master	4'				),
							(		'PM				4'				);

INSERT INTO		 `Account`	(			Email				,		 Username		,	 FullName	, DepartmentID	, PositionID	, CreateDate)
VALUES 						(	'abc111@gmail.com'			,		'abc111'		,		'HAHA1'	,		'15'	,  	'11'		,'2019-03-05'),
							(	'abc222@gmail.com'			,		'abc222'		,		'HAHA2'	,		'11'	,   '12'		,'2019-03-05'),
							(	'abc333@gmail.com'			,		'abc333'		,		'HAHA3'	,   	'12'	,   '13'		,'2019-03-07'),
							(	'abc444@gmail.com'			,		'abc444'		,		'HAHA4'	,   	'13'	,   '14'		,'2019-03-08'),
							(	'abc555@gmail.com'			,		'abc555'		,		'HAHA5'	,   	'14'	,   '15'		,'2019-03-10'),
							(	'abc666@gmail.com'			,		'abc666'		,		'HAHA6'	,   	'16'	,   '13'		,'2019-04-05'),
							(	'abc777@gmail.com'			,		'abc777'		,		'HAHA7'	,   	'17'	,   '12'		,'2019-04-09'),
							(	'abc888@gmail.com'			,		'abc888'		,		'HAHA8'	,   	'18'	,   '11'		,'2019-04-07'),
							(	'abc999@gmail.com'			,		'abc999'		,		'HAHA9'	,   	'19'	,   '12'		,'2019-04-07'),
							(	'abc000@gmail.com'			,		'abc000'		,		'HAHA0'	,   	'20'	,   '11'		,'2019-04-09');

INSERT INTO 	`Group`		(	  GroupName				, 	CreatorID		,		 CreateDate			)
VALUES 						(	N'Testing System	1'	,  		15			,		'2019-03-15'		),
							(	N'Development		1'	,  		11			,		'2020-03-17'		),
							(	N'VTI Sale 			4'	,  		12			,		'2020-03-19'		),
							(	N'VTI Sale 			5'	,  		13			,		'2020-03-12'		),
							(	N'VTI Sale 			6'	,  		14			,		'2020-03-28'		),
							(	N'VTI Creator		1'	,  		16			,		'2020-04-16'		),
							(	N'VTI Marketing 	2'	,  		17			,		'2020-04-17'		),
							(	N'Management		2'	,  		18			,		'2020-04-18'		),
							(	N'Management		3'	,  		19			,		'2020-04-19'		),
							(	N'Management		4'	,  		20			,		'2020-04-20'		);
                    
INSERT INTO `GroupAccount`	(	 GroupID	, AccountID	,		 JoinDate			)
VALUES 						(		12		,    10		,		'2019-03-25'		),
							(		13		,    12		,		'2020-04-27'		),
							(		14		,    13		,		'2020-07-29'		),
							(		15		,    14		,		'2020-03-20'		),
							(		16		,    15		,		'2020-03-18'		),
							(		17		,    18		,		'2020-04-26'		),
							(		18		,    17		,		'2020-04-27'		),
							(		19		,    16		,		'2020-04-28'		),
							(		20		,    11		,		'2020-04-29'		),
							(		11		,    19		,		'2020-04-20'		);


INSERT INTO CategoryQuestion		(			CategoryName		)
VALUES 								(		'Java		pro'		),
									(		'ASP.NET	pro'		),
									(		'ADO.NET	pro'		),
									(		'SQL		pro'		),
									(		'Postman	pro'		),
									(		'Ruby		pro'		),
									(		'Python		pro'		),
									(		'C++		pro'		),
									(		'C Sharp	pro'		),
									(		'PHP		pro'		);
													
-- Add data Question
INSERT INTO Question	(			Content				, CategoryID	,	 	TypeID		, 	CreatorID	, CreateDate )
VALUES 					(		'Java		pro'		,		11		, 		 '1'		,   '12'		,'2020-02-05'),
						(		'ASP.NET	pro'		,		20		, 		 '2'		,   '11'		,'2020-02-05'),
						(		'ADO.NET	pro'		,		19		, 		 '2'		,   '14'		,'2020-05-06'),
						(		'SQL		pro'		,		16		, 		 '1'		,   '13'		,'2020-05-06'),
						(		'Postman	pro'		,		15		, 		 '1'		,   '17'		,'2020-07-06'),
						(		'Ruby		pro'		,		13		, 		 '2'		,   '18'		,'2020-07-06'),
						(		'Python		pro'		,		12		, 		 '1'		,   '16'		,'2020-09-06'),
						(		'C++		pro'		,		18		, 		 '1'		,   '20'		,'2020-09-07'),
						(		'C Sharp	pro'		,		14		, 		 '2'		,   '15'		,'2020-11-07'),
						(		'PHP		pro'		,		17		, 		 '1'		,   '19'		,'2020-11-07');

-- Add data Answers
INSERT INTO		Answer	(  	Content			, 	QuestionID	, 	isCorrect	)
VALUES 					(	'Answer 	01'	,   	11		,		0		),
						(	'Answer 	02'	,   	14		,		1		),
						(	'Answer 	03'	,		15		,		0		),
						(	'Answer 	04'	,		16		,		1		),
						( 	'Answer 	05'	,		19		,		1		),
						(	'Answer 	06'	,		18		,		1		),
						(	'Answer 	07'	,		12		,		0		),
						(	'Answer 	08'	,		20		,		0		),
						(	'Answer 	09'	,		17		,		1		),
						(	'Answer 	10'	,		13		,		1		);
	

INSERT INTO		Exam	(`Code`			, 		Title				,	 CategoryID	, Duration	, 	CreatorID		, 	CreateDate		)
VALUES 					('VTIQ011'		, 	'Java		pro'		,		11		,	60		, 	 '15'			,	'2019-01-25'	),
						('VTIQ012'		, 	'ASP.NET	pro'		,		20		,	60		, 	 '12'			,	'2019-03-25'	),
						('VTIQ013'		, 	'ADO.NET	pro'		,		19		,	120		, 	 '14'			,	'2019-04-27'	),
						('VTIQ014'		, 	'SQL		pro'		,		16		,	60		, 	 '11'			,	'2020-05-28'	),
						('VTIQ015'		, 	'Postman	pro'		,		15		,	120		, 	 '18'			,	'2020-07-20'	),
						('VTIQ016'		, 	'Ruby		pro'		,		13		,	60		, 	 '19'			,	'2020-08-25'	),
						('VTIQ017'		, 	'Python		pro'		,		12		,	60		, 	 '17'			,	'2020-08-25'	),
						('VTIQ018'		, 	'C++		pro'		,		18		,	60		, 	 '13'			,	'2020-10-27'	),
						('VTIQ019'		, 	'C Sharp	pro'		,		14		,	90		, 	 '20'			,	'2020-12-27'	),
						('VTIQ020'		, 	'PHP		pro'		,		17		,	90		, 	 '16'			,	'2020-11-28'	);
                        
                        
-- -----------------------------Question 2: lấy ra tất cả các phòng ban ----------------------------------------------

SELECT 		* 
FROM 		Department;

-- -----------------------------Question 3: lấy ra id của phòng ban "Sale"----------------------------------------------

SELECT 		DepartmentID 
FROM 		Department 
WHERE 		DepartmentName = 'Sale';

-- -----------------------------Question 4: lấy ra thông tin account có full name dài nhất----------------------------------------------

SELECT 		* 
FROM 		`Account` 
WHERE 		LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY 	Fullname ASC;

-- ----------------------------- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3 ----------------------------------------------

SELECT 		* 
FROM 		`Account` 
WHERE 		LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`) AND DepartmentID = 3
ORDER BY 	Fullname ASC;

-- ----------------------------- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 --------------------------------------------------------------

SELECT 		GroupName 
FROM 		`Group` 
WHERE 		CreateDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời	--------------------------------------------------------------

SELECT 		QuestionID
FROM 		Answer
GROUP BY 	QuestionID
HAVING 		COUNT(QuestionID) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 --------------------------------------
	 
SELECT 		`Code` 
FROM 		Exam
WHERE 		Duration >= 60 AND CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất -------------------------------------------------------------------------------- 

SELECT 		* 
FROM 		`Group`
ORDER BY 	CreateDate ASC 
LIMIT		5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2  --------------------------------------------------------------------------------

SELECT 		COUNT(DepartmentID) 
FROM 		`Account`
WHERE		DepartmentID = 2 ;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"  --------------------------------------------------------

SELECT 		Fullname 
FROM 		`Account`
WHERE 		FullName LIKE 'D%o' ;

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019 --------------------------------------------------------------

SET			foreign_key_checks = 0; 		 
DELETE 
FROM 		Exam 
WHERE 		CreateDate < '2019-12-20';
SET			foreign_key_checks = 1;
SELECT		*
FROM 		Exam;
 
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" -------------------------------------------------------------- 
SET			foreign_key_checks = 0; 		 
DELETE 
FROM 		Question
WHERE 		Content LIKE 'Câu hỏi%';
SET			foreign_key_checks = 1;
SELECT		*
FROM 		Question;


-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc"-------------------------------------------------------------- 
-- 				và email thành loc.nguyenba@vti.com.vn 							--------------------------------------

SET			foreign_key_checks = 0; 		 
UPDATE 		`Account` 
SET 		Fullname 	= 	N'Nguyễn Bá Lộc', 
			Email 		= 	'loc.nguyenba@vti.com.vn'
WHERE 		AccountID = 5;
SET			foreign_key_checks = 1;
SELECT		*
FROM 		`Account` ;

-- uestion 15: update account có id = 5 sẽ thuộc group có id = 4 ------------------------------- 
		 
UPDATE 		`GroupAccount` 
SET 		GroupID = 4
WHERE 		AccountID = 5;
SELECT		*
FROM 		`GroupAccount` ;
