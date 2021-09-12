/* SQL-ASSIGNMENT 4 */

DROP DATABASE IF EXISTS 			Testing_System_Assignment_4;
CREATE DATABASE IF NOT EXISTS		Testing_System_Assignment_4;
USE 								Testing_System_Assignment_4;

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
    Content					NVARCHAR(100) ,
    QuestionID				TINYINT UNSIGNED ,
    isCorrect				BIT ,
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
INSERT INTO Department(DepartmentID ,	DepartmentName) 
VALUES
						(	1,			N'Marketing'	),
						(	2,			N'Sale'			),
						(	3,			N'Bảo vệ'		),
						(	4,			N'Nhân sự'		),
						(	5,			N'Kỹ thuật'		),
						(	6,			N'Tài chính'	),
						(	7,			N'Phó giám đốc'	),
						(	8,			N'Giám đốc'		),
						(	9,			N'Thư kí'		),
						(	10,			N'Bán hàng'		);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   '1'			,   '1'		,'2020-12-22'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,	'1'			,   '2'		,'2020-12-28'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '1'			,   '3'		,'2020-12-30'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-12-31'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '3'			,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '3'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		,'2020-09-05'),
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
VALUES 						(	1		,    4		,'2019-03-05'),
							(	2		,    4		,'2020-03-07'),
							(	3		,    4		,'2020-03-09'),
							(	4		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	6		,    5		,'2020-04-06'),
							(	7		,    5		,'2020-04-07'),
							(	8		,    6		,'2020-04-08'),
							(	9		,    6		,'2020-04-09'),
							(	10		,    6		,'2020-04-10');


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
VALUES 				(N'Trả lời 01'	,   7			,	NULL		),
					(N'Trả lời 02'	,   1			,	1			),
                    (N'Trả lời 03'	,   8			,	NULL		),
                    (N'Trả lời 04'	,   1			,	1			),
                    (N'Trả lời 05'	,   2			,	1			),
                    (N'Trả lời 06'	,   3			,	1			),
                    (N'Trả lời 07'	,   5			,	NULL		),
                    (N'Trả lời 08'	,   8			,	0			),
                    (N'Trả lời 09'	,   9			,	1			),
                    (N'Trả lời 10'	,   10			,	1			);
	
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
VALUES 					(	1	,		1		),
						(	2	,		7		), 
						(	3	,		7		), 
						(	4	,		7		), 
						(	5	,		8		), 
						(	6	,		8		), 
						(	7	,		8		), 
						(	8	,		8		), 
						(	9	,		7		), 
						(	10	,		8		); 


-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
DROP VIEW IF EXISTS				Nhân_Viên_và_Phòng_Ban;
CREATE OR REPLACE VIEW			Nhân_Viên_v_Phòng_Ban
	AS(
			SELECT 				D.DepartmentName , A.*
			FROM 				`Account`		AS	 	A 
			INNER JOIN 			Department 		AS		D		USING 	(DepartmentID) );
	SELECT			*
	FROM			Nhân_Viên_và_Phòng_Ban;
    
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
DROP VIEW IF EXISTS				Account_tạo_sau_ngày_20tháng12năm2020;
CREATE OR REPLACE VIEW			Account_tạo_sau_ngày_20tháng12năm2020
	AS(
			SELECT				A.CreateDate , A.*  
			FROM				`Account` 		AS 		A
			HAVING				CreateDate > '2020-12-20' );
	SELECT			*
	FROM			Account_tạo_sau_ngày_20tháng12năm2020;
    
    
-- Question 3: Viết lệnh để lấy ra tất cả các developer
DROP VIEW IF EXISTS				Account_thuộc_Developer;
CREATE OR REPLACE VIEW			Account_thuộc_Developer
	AS(

			SELECT			P.PositionName , A.* 
			FROM 			`Account`		AS 		A
			JOIN 			Position 		AS		P 		USING	(PositionID)		
			WHERE			PositionName  = 'Dev' );
            
	SELECT			*
	FROM			Account_thuộc_Developer;
    
    
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên
DROP VIEW IF EXISTS				Department_Có_hơn_3_Account;
CREATE OR REPLACE VIEW			Department_Có_hơn_3_Account
	AS(
			SELECT 		D.DepartmentName, D.DepartmentID, COUNT(A.DepartmentID)
			FROM 		`Account` 	AS 	A 
			INNER JOIN 	Department  AS 	D USING (DepartmentID) 
			GROUP BY 	A.DepartmentID
			HAVING 		COUNT(A.DepartmentID) >= 3);
            
	SELECT			*
	FROM			Department_Có_hơn_3_Account;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
DROP VIEW IF EXISTS				Câu_hỏi_xuất_hiện_nhiều_I;
CREATE OR REPLACE VIEW			Câu_hỏi_xuất_hiện_nhiều_I
	AS(
			SELECT 		Q.Content,COUNT(EQ.QuestionID)AS Số_lần_xuất_hiện, EQ.QuestionID,Q.QuestionID
			FROM		Question		AS 		Q
			JOIN		ExamQuestion	AS		EQ		USING (QuestionID)
			GROUP BY 	EQ.QuestionID
			HAVING 		COUNT(EQ.QuestionID) = (SELECT COUNT(EQ.QuestionID)
												GROUP BY EQ.QuestionID
												ORDER BY COUNT(EQ.QuestionID)  DESC
												LIMIT 1));
SELECT			*
FROM			Câu_hỏi_xuất_hiện_nhiều_I;

-- Question 6: Thống kê mỗi category Question được sử dụng trong bao nhiêu Question
DROP VIEW IF EXISTS				Số_lần_Category_Question_trong_Question;
CREATE OR REPLACE VIEW			Số_lần_Category_Question_trong_Question
			AS(
				SELECT			CQ.CategoryID, 
								CQ.CategoryName, COUNT(Q.CategoryID) AS Số_lần_Category_Question_trong_Question,
								CQ.*
				FROM			CategoryQuestion 	AS 	CQ 
				LEFT JOIN 		Question 			AS 	Q			USING (CategoryID)
				GROUP BY		CQ.CategoryID
				ORDER BY		CQ.CategoryID DESC	);

SELECT			*
FROM			Số_lần_Category_Question_trong_Question;


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

DROP VIEW IF EXISTS				Số_lần_Question_xuất_hiện_trong_Exam;
CREATE OR REPLACE VIEW			Số_lần_Question_xuất_hiện_trong_Exam
	AS(
			SELECT				Q.Content, COUNT(EQ.QuestionID) 	AS		Số_lần_Question_xuất_hiện_trong_Exam , EQ.*
			FROM				Question 		AS		Q 
			LEFT JOIN 			ExamQuestion 	AS		EQ		 	USING 	(QuestionID )
			GROUP BY			Q.QuestionID
			ORDER BY 			EQ.ExamID DESC);
SELECT			*
FROM			Số_lần_Question_xuất_hiện_trong_Exam;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
DROP VIEW IF EXISTS				Question_có_nhiều_Answer_I;
CREATE OR REPLACE VIEW			Question_có_nhiều_Answer_I
	AS(
			SELECT 				Q.QuestionID, Q.Content, COUNT(A.QuestionID) AS Số_lần_xuất_hiện , A.*
			FROM				Question 		AS 		Q 
			INNER JOIN 			Answer 			AS		A 		USING (QuestionID)
			GROUP BY			A.QuestionID
			HAVING				COUNT(A.QuestionID) =	(SELECT		COUNT(A.QuestionID)
																	FROM			Answer 			AS		A 
																	INNER JOIN  	Question		AS		Q	 USING (QuestionID)
																	GROUP BY		A.QuestionID
																	ORDER BY		COUNT(A.QuestionID) DESC
																	LIMIT			1 ));

SELECT			*
FROM			Question_có_nhiều_Answer_I;
			
-- Question 9: Thống kê số lượng account trong mỗi group
DROP VIEW IF EXISTS				Số_lượng_Account_trong_mỗi_Group;
CREATE OR REPLACE VIEW			Số_lượng_Account_trong_mỗi_Group
	AS(	
			SELECT				G.GroupName , G.GroupID, COUNT(GA.AccountID) AS Số_lượng_xuất_hiện , GA.*
			FROM				GroupAccount	AS		GA 
			RIGHT JOIN 			`Group` 		AS		G 		USING (GroupID)
			GROUP BY			G.GroupID
			ORDER BY			G.GroupID 		DESC);

SELECT			*
FROM			Số_lượng_Account_trong_mỗi_Group;


-- Question 10: Tìm chức vụ có ít người nhất
DROP VIEW IF EXISTS				PositionName_ít_member_I;
CREATE OR REPLACE VIEW			PositionName_ít_member_I
	AS(
				SELECT 			P.PositionName, P.PositionID, COUNT(A.PositionID) AS Số_thành_viên , A.*
				FROM			Position 	AS		P 
				INNER JOIN 		`Account` 	AS		A		USING (PositionID)
				GROUP BY 		P.PositionID
				HAVING			COUNT(A.PositionID)	=	(SELECT 	COUNT(P.PositionID) 
														FROM		Position 		AS		P 
														INNER JOIN 	`Account` 		AS		A		USING (PositionID)	
														GROUP BY	P.PositionID 			
                                                        ORDER BY	P.PositionID 	ASC
                                                        LIMIT		1));
				
SELECT			*
FROM			PositionName_ít_member_I;

-- Question 11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

DROP VIEW IF EXISTS				Thống_kê_mỗi_Department_có_bao_nhiêu_Position;
CREATE OR REPLACE VIEW			Thống_kê_mỗi_Department_có_bao_nhiêu_Position
	AS(
				SELECT			D.DepartmentName, P.PositionName , COUNT(P.PositionName) AS Số_lượng_member, A.*
				FROM			`Account`			AS		A	 
				INNER JOIN 		Position			AS		P		USING	(PositionID)
                INNER JOIN 		Department			AS		D		USING	(DepartmentID)
				GROUP BY		A.DepartmentID 	);

SELECT			*
FROM			Thống_kê_mỗi_Department_có_bao_nhiêu_Position;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của 
-- 				question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …

DROP VIEW IF EXISTS				Question_và_Account;
CREATE OR REPLACE VIEW			Question_và_Account
	AS(
			SELECT 				Q.CreatorID AS Người_tạo_Question, Q.Content AS Nội_dung_câu_hỏi,
								T.TypeName ,
                                A.Content 	AS Nội_dung_câu_trả_lời
			FROM				Question		AS		Q 
			INNER JOIN 			Answer 			AS		A		 ON				Q.QuestionID = A.QuestionID
			INNER JOIN			TypeQuestion 	AS		T		 USING			(TypeID ));

SELECT			*
FROM			Question_và_Account;


-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

DROP VIEW IF EXISTS				Thống_kê_số_lượng_Essay_và_MultipleChoice;
CREATE OR REPLACE VIEW			Thống_kê_số_lượng_Essay_và_MultipleChoice
	AS(
				SELECT			T.TypeName	, COUNT(Q.TypeID)
				FROM			Question 		AS		Q 
				INNER JOIN 		TypeQuestion 	AS		T		 USING	 (TypeID)
				GROUP BY		Q.TypeID);

SELECT			*
FROM			Thống_kê_số_lượng_Essay_và_MultipleChoice;

-- Question 14 và 15: lấy ra group không có account nào

DROP VIEW IF EXISTS				Group_không_có_member;
CREATE OR REPLACE VIEW			Group_không_có_member
	AS(
			SELECT		G.*
			FROM		`Group`		 	AS		G
			JOIN		GroupAccount	AS		GA		USING		(GroupID)	
			WHERE		GA.AccountID 	IS 				NULL);
          
SELECT			*
FROM			Group_không_có_member;     


-- Question 16: lấy ra question không có answer nào 

DROP VIEW IF EXISTS				Question_không_có_Answer;
CREATE OR REPLACE VIEW			Question_không_có_Answer
		AS(
				SELECT			A.*
				FROM			Answer				AS		A 	
				JOIN			Question			AS 		Q	USING 	(QuestionID)
                WHERE			A.isCorrect 		IS			NULL ) ;
					
SELECT			*
FROM			Question_không_có_Answer;
     

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT 		A.FullName
FROM 		`Account` 		AS		A
JOIN 		GroupAccount 	AS		GA		USING (AccountID)
WHERE 		GA.GroupID = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT 		A.FullName
FROM 		`Account` 		AS		A
JOIN 		GroupAccount 	AS		GA		USING (AccountID)
WHERE 		GA.GroupID = 2;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
DROP VIEW IF EXISTS				Record_không_trùng_nhau;
CREATE OR REPLACE VIEW			Record_không_trùng_nhau

	AS(
				SELECT 			A.FullName , GA.*
				FROM 			`Account` 		AS		A
				JOIN 			GroupAccount 	AS		GA		USING (AccountID)
				WHERE 			GA.GroupID = 1
						UNION	
				SELECT 			A.FullName , GA.*
				FROM 			`Account` 		AS		A
				JOIN 			GroupAccount 	AS		GA		USING (AccountID)
				WHERE 			GA.GroupID = 2 );
                
SELECT			*
FROM			Record_không_trùng_nhau;


-- Question 18: 
-- a) Lấy các group có lớn hơn bằng 5 thành viên 
SELECT 		G.GroupName, COUNT(1) AS so_luong
FROM 		`Group` 		AS		G
JOIN 		GroupAccount 	AS		GA	 	USING (GroupID)
GROUP BY	GA.GroupID
HAVING 		so_luong >= 5 ;

-- b) Lấy các group có nhỏ hơn 7 thành viên 

SELECT 		G.GroupName, COUNT(1) AS so_luong
FROM 		`Group` 		AS		G
JOIN 		GroupAccount 	AS		GA	 	USING (GroupID)
GROUP BY	GA.GroupID
HAVING 		so_luong <= 7;


SELECT 		G.GroupName, COUNT(1) AS so_luong
FROM 		`Group` 		AS		G
JOIN 		GroupAccount 	AS		GA	 	 	USING (GroupID)
GROUP BY	GA.GroupID
HAVING 		so_luong >= 3
UNION
SELECT 		G.GroupName, COUNT(1) AS so_luong
FROM 		`Group` 		AS		G
JOIN 		GroupAccount 	AS		GA	 	 	USING (GroupID)
GROUP BY	GA.GroupID
HAVING 		so_luong <= 7;
