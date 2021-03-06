/*============================== CREATE DATABASE =======================================*/
/*======================================================================================*/
DROP DATABASE IF EXISTS 		Testing_System_5;
CREATE DATABASE 				Testing_System_5;
USE 							Testing_System_5;

/*============================== CREATE TABLE=== =======================================*/
/*======================================================================================*/

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED NOT NULL,
    AccountID				TINYINT UNSIGNED NOT NULL,
    JoinDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID) 
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId) 
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
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
						(N'B???o v???'		),
						(N'Nh??n s???'		),
						(N'K??? thu???t'	),
						(N'T??i ch??nh'	),
						(N'Ph?? gi??m ?????c'),
						(N'Gi??m ?????c'	),
						(N'Th?? k??'		),
						(N'B??n h??ng'	);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguy???n h???i ????ng'		,   '5'			,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'		,   '1'			,   '2'		,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
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
							(	2		,    1		,'2020-03-07'),
							(	3		,    1		,'2020-03-09'),
							(	4		,    2		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	6		,    5		,'2020-04-06'),
							(	7		,    5		,'2020-04-07'),
							(	8		,    7		,'2020-04-08'),
							(	9		,    7		,'2020-04-09'),
							(	10		,    8		,'2020-04-10');


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
VALUES 					(N'C??u h???i v??? Java C??u h???i v??? Java C??u h???i v??? Java C??u h???i v??? Java'	,	1		,   '1'			,   '2'		,'2020-04-05'),
						(N'C??u H???i v??? PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'H???i v??? C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'H???i v??? Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'H???i v??? Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'H???i v??? ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'H???i v??? ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'H???i v??? C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'H???i v??? SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'H???i v??? Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Tr??? l???i 01'	,   1			,	0		),
					(N'Tr??? l???i 02'	,   1			,	1		),
                    (N'Tr??? l???i 03'	,   1			,	0		),
                    (N'Tr??? l???i 04'	,   1			,	1		),
                    (N'Tr??? l???i 05'	,   2			,	1		),
                    (N'Tr??? l???i 06'	,   3			,	1		),
                    (N'Tr??? l???i 07'	,   4			,	0		),
                    (N'Tr??? l???i 08'	,   8			,	0		),
                    (N'Tr??? l???i 09'	,   9			,	1		),
                    (N'Tr??? l???i 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'????? thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'????? thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'????? thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'????? thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'????? thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'????? thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'????? thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'????? thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'????? thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'????? thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
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
                        
                        
                        
                        
/* ----------------------------------------------------------------------------------------------------------------------------*/
/* ----------------------------------------------------------------------------------------------------------------------------*/
/* ----------------------------------------------------------------------------------------------------------------------------*/

/*			SQL ??? Assignment 5			*/
    
-- Question 1: T???o view c?? ch???a danh s??ch nh??n vi??n thu???c ph??ng ban sale
DROP VIEW IF EXISTS			Nh??n_Vi??n_SALE;
CREATE OR REPLACE VIEW		Nh??n_Vi??n_SALE
AS
	SELECT		 D.DepartmentName , A.*
	FROM 		`Account` A 
	INNER JOIN 	`Department` D 		ON 		A.DepartmentID = D.DepartmentID
	WHERE		D.DepartmentID = '2' ;

SELECT			*
FROM			Nh??n_Vi??n_SALE ;

-- Quetion 1 Ch???y b???ng CTE

WITH 	Nh??n_Vi??n_Sale
AS(
		SELECT			D.DepartmentName, A.*
		FROM 			`Account` A 
		INNER JOIN 		`Department` D	USING (DepartmentID)
		WHERE			D.DepartmentID = '2' 
)
SELECT 	*
FROM 	Nh??n_Vi??n_Sale;


-- Question 2: T???o view c?? ch???a th??ng tin c??c account tham gia v??o nhi???u group nh???t
DROP VIEW IF EXISTS					 Account_N??ng_N???;
CREATE OR REPLACE VIEW 				 Account_N??ng_N???
AS
SELECT 		COUNT(GA.AccountID) AS 	S???_L?????ng_Group_Tham_Gia,GROUP_CONCAT(GroupID) AS T??n_Group_Tham_Gia, A.*
FROM		`Account`			AS  A 
INNER JOIN 	`GroupAccount` 		AS	GA		 USING (AccountID )
GROUP BY	A.AccountID
HAVING		COUNT(GA.AccountID) = (
									SELECT 		COUNT(GA.AccountID) 
									FROM		`Account` 		AS 		A 
									INNER JOIN 	`GroupAccount` 	AS		GA		 USING	 (AccountID)
									GROUP BY	A.AccountID
									ORDER BY	COUNT(GA.AccountID) DESC
									LIMIT		1
								  );
SELECT 	*
FROM  	 Account_N??ng_N???;

-- Quetion 2 Ch???y b???ng CTE

WITH 		Account_N??NG_N??? 
AS (
SELECT 		COUNT(GA.AccountID) AS 	S???_L?????ng_Group_Tham_Gia,GROUP_CONCAT(GroupID) AS T??n_Group_Tham_Gia, A.*
FROM		`Account`			AS  A 
INNER JOIN 	`GroupAccount` 		AS	GA		 USING (AccountID )
GROUP BY	A.AccountID
ORDER BY	COUNT(GA.AccountID) DESC
LIMIT		1 )

SELECT 	*
FROM	Account_N??NG_N???;


-- Question 3: T???o view c?? ch???a c??u h???i c?? nh???ng content qu?? d??i (content qu?? 20 t???)
-- ???????c coi l?? qu?? d??i) v?? x??a n?? ??i
DROP VIEW IF EXISTS					 Content_D??i_D??ng;
CREATE OR REPLACE VIEW 				 Content_D??i_D??ng
AS
	SELECT	QuestionID , Content AS Content_Qu??_D??i , CategoryID , TypeID , CreatorID , CreateDate
    FROM	Question
    WHERE 	LENGTH(Content) > 18;
	
SELECT		*
FROM		Content_D??i_D??ng;

-- Quetion 3 Ch???y b???ng CTE    
WITH 		Content_H??n_18_K??_T???
AS (
	SELECT	QuestionID , Content AS Content_Qu??_D??i , CategoryID , TypeID , CreatorID , CreateDate
    FROM	Question
    WHERE 	LENGTH(Content) > 18 )
	
SELECT		*
FROM		Content_H??n_18_K??_T???;



-- Question 4: T???o view c?? ch???a danh s??ch c??c ph??ng ban c?? nhi???u nh??n vi??n nh???t
DROP VIEW IF EXISTS					 Department_Nhi???u_Nh??n_Vi??n_Nh???t;
CREATE OR REPLACE VIEW 				 Department_Nhi???u_Nh??n_Vi??n_Nh???t
AS
	SELECT		 D.DepartmentName 	AS Department_Nhi???u_Nh??n_Vi??n_Nh???t, COUNT(A.DepartmentID) AS S???_L?????ng_Nh??n_Vi??n , A.*
	FROM 		`Account` 			AS		A 
	INNER JOIN 	`Department` 		AS		D 		USING (DepartmentID)
	GROUP BY	A.AccountID
	HAVING		COUNT(A.AccountID) = (
									SELECT 		COUNT(A.AccountID) 
									FROM		`Account` 		AS		A 
									INNER JOIN 	`Department`	AS		D 		 USING (DepartmentID)
									GROUP BY	A.AccountID
									ORDER BY	COUNT(A.AccountID) DESC
									LIMIT		1
								  );	

SELECT 	*
FROM  	 Department_Nhi???u_Nh??n_Vi??n_Nh???t;

-- Question 4 ch???y b???ng CTE
WITH		Department_Nhi???u_Nh??n_Vi??n_I
AS(
	SELECT		 D.DepartmentName 	AS Department_Nhi???u_Nh??n_Vi??n_I, COUNT(A.DepartmentID) AS S???_L?????ng_Nh??n_Vi??n , A.*
	FROM 		`Account` 			AS		A 
	INNER JOIN 	`Department` 		AS		D 		USING (DepartmentID)
	GROUP BY	A.AccountID
	HAVING		COUNT(A.AccountID) = (
									SELECT 		COUNT(A.AccountID) 
									FROM		`Account` 		AS 		A 
									INNER JOIN 	`Department`	AS     	D 		 USING (DepartmentID)
									GROUP BY	A.AccountID
									ORDER BY	COUNT(A.AccountID) DESC
									LIMIT		1) )

SELECT 	*
FROM  	 Department_Nhi???u_Nh??n_Vi??n_I;

-- Question 5: T???o view c?? ch???a t???t c??c c??c c??u h???i do user h??? Nguy???n t???o
DROP VIEW IF EXISTS				C??u_H???i_Do_User_H???_Nguy???n_T???o;
CREATE OR REPLACE VIEW 			C??u_H???i_Do_User_H???_Nguy???n_T???o
AS
	SELECT				A.FullName , Q.*
	FROM 				Question 		AS		Q 		
	INNER JOIN 			`Account` 		AS		A 		ON 		A.AccountID = Q.CreatorID
	WHERE				SUBSTRING_INDEX(FullName,' ',1) = 'Nguyen';	

SELECT 			*
FROM			C??u_H???i_Do_User_H???_Nguy???n_T???o;

-- Question 5 ch???y b???ng CTE
WITH		Question_Do_User_H???_Nguy???n_T???o
AS(
	SELECT				A.FullName , Q.*
	FROM 				Question 		AS		Q 		
	INNER JOIN 			`Account` 		AS		A 		ON 		A.AccountID = Q.CreatorID
	WHERE				SUBSTRING_INDEX(FullName,' ',1) = 'Nguyen')

SELECT 			*
FROM			Question_Do_User_H???_Nguy???n_T???o;