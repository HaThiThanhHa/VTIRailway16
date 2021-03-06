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
						(	3,			N'B???o v???'		),
						(	4,			N'Nh??n s???'		),
						(	5,			N'K??? thu???t'		),
						(	6,			N'T??i ch??nh'	),
						(	7,			N'Ph?? gi??m ?????c'	),
						(	8,			N'Gi??m ?????c'		),
						(	9,			N'Th?? k??'		),
						(	10,			N'B??n h??ng'		);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguy???n h???i ????ng'		,   '1'			,   '1'		,'2020-12-22'),
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
VALUES 				(N'Tr??? l???i 01'	,   7			,	NULL		),
					(N'Tr??? l???i 02'	,   1			,	1			),
                    (N'Tr??? l???i 03'	,   8			,	NULL		),
                    (N'Tr??? l???i 04'	,   1			,	1			),
                    (N'Tr??? l???i 05'	,   2			,	1			),
                    (N'Tr??? l???i 06'	,   3			,	1			),
                    (N'Tr??? l???i 07'	,   5			,	NULL		),
                    (N'Tr??? l???i 08'	,   8			,	0			),
                    (N'Tr??? l???i 09'	,   9			,	1			),
                    (N'Tr??? l???i 10'	,   10			,	1			);
	
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


-- Question 1: Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
DROP VIEW IF EXISTS				Nh??n_Vi??n_v??_Ph??ng_Ban;
CREATE OR REPLACE VIEW			Nh??n_Vi??n_v_Ph??ng_Ban
	AS(
			SELECT 				D.DepartmentName , A.*
			FROM 				`Account`		AS	 	A 
			INNER JOIN 			Department 		AS		D		USING 	(DepartmentID) );
	SELECT			*
	FROM			Nh??n_Vi??n_v??_Ph??ng_Ban;
    
-- Question 2: Vi???t l???nh ????? l???y ra th??ng tin c??c account ???????c t???o sau ng??y 20/12/2010
DROP VIEW IF EXISTS				Account_t???o_sau_ng??y_20th??ng12n??m2020;
CREATE OR REPLACE VIEW			Account_t???o_sau_ng??y_20th??ng12n??m2020
	AS(
			SELECT				A.CreateDate , A.*  
			FROM				`Account` 		AS 		A
			HAVING				CreateDate > '2020-12-20' );
	SELECT			*
	FROM			Account_t???o_sau_ng??y_20th??ng12n??m2020;
    
    
-- Question 3: Vi???t l???nh ????? l???y ra t???t c??? c??c developer
DROP VIEW IF EXISTS				Account_thu???c_Developer;
CREATE OR REPLACE VIEW			Account_thu???c_Developer
	AS(

			SELECT			P.PositionName , A.* 
			FROM 			`Account`		AS 		A
			JOIN 			Position 		AS		P 		USING	(PositionID)		
			WHERE			PositionName  = 'Dev' );
            
	SELECT			*
	FROM			Account_thu???c_Developer;
    
    
-- Question 4: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >=3 nh??n vi??n
DROP VIEW IF EXISTS				Department_C??_h??n_3_Account;
CREATE OR REPLACE VIEW			Department_C??_h??n_3_Account
	AS(
			SELECT 		D.DepartmentName, D.DepartmentID, COUNT(A.DepartmentID)
			FROM 		`Account` 	AS 	A 
			INNER JOIN 	Department  AS 	D USING (DepartmentID) 
			GROUP BY 	A.DepartmentID
			HAVING 		COUNT(A.DepartmentID) >= 3);
            
	SELECT			*
	FROM			Department_C??_h??n_3_Account;

-- Question 5: Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u nh???t
DROP VIEW IF EXISTS				C??u_h???i_xu???t_hi???n_nhi???u_I;
CREATE OR REPLACE VIEW			C??u_h???i_xu???t_hi???n_nhi???u_I
	AS(
			SELECT 		Q.Content,COUNT(EQ.QuestionID)AS S???_l???n_xu???t_hi???n, EQ.QuestionID,Q.QuestionID
			FROM		Question		AS 		Q
			JOIN		ExamQuestion	AS		EQ		USING (QuestionID)
			GROUP BY 	EQ.QuestionID
			HAVING 		COUNT(EQ.QuestionID) = (SELECT COUNT(EQ.QuestionID)
												GROUP BY EQ.QuestionID
												ORDER BY COUNT(EQ.QuestionID)  DESC
												LIMIT 1));
SELECT			*
FROM			C??u_h???i_xu???t_hi???n_nhi???u_I;

-- Question 6: Th???ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question
DROP VIEW IF EXISTS				S???_l???n_Category_Question_trong_Question;
CREATE OR REPLACE VIEW			S???_l???n_Category_Question_trong_Question
			AS(
				SELECT			CQ.CategoryID, 
								CQ.CategoryName, COUNT(Q.CategoryID) AS S???_l???n_Category_Question_trong_Question,
								CQ.*
				FROM			CategoryQuestion 	AS 	CQ 
				LEFT JOIN 		Question 			AS 	Q			USING (CategoryID)
				GROUP BY		CQ.CategoryID
				ORDER BY		CQ.CategoryID DESC	);

SELECT			*
FROM			S???_l???n_Category_Question_trong_Question;


-- Question 7: Th??ng k?? m???i Question ???????c s??? d???ng trong bao nhi??u Exam

DROP VIEW IF EXISTS				S???_l???n_Question_xu???t_hi???n_trong_Exam;
CREATE OR REPLACE VIEW			S???_l???n_Question_xu???t_hi???n_trong_Exam
	AS(
			SELECT				Q.Content, COUNT(EQ.QuestionID) 	AS		S???_l???n_Question_xu???t_hi???n_trong_Exam , EQ.*
			FROM				Question 		AS		Q 
			LEFT JOIN 			ExamQuestion 	AS		EQ		 	USING 	(QuestionID )
			GROUP BY			Q.QuestionID
			ORDER BY 			EQ.ExamID DESC);
SELECT			*
FROM			S???_l???n_Question_xu???t_hi???n_trong_Exam;

-- Question 8: L???y ra Question c?? nhi???u c??u tr??? l???i nh???t
DROP VIEW IF EXISTS				Question_c??_nhi???u_Answer_I;
CREATE OR REPLACE VIEW			Question_c??_nhi???u_Answer_I
	AS(
			SELECT 				Q.QuestionID, Q.Content, COUNT(A.QuestionID) AS S???_l???n_xu???t_hi???n , A.*
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
FROM			Question_c??_nhi???u_Answer_I;
			
-- Question 9: Th???ng k?? s??? l?????ng account trong m???i group
DROP VIEW IF EXISTS				S???_l?????ng_Account_trong_m???i_Group;
CREATE OR REPLACE VIEW			S???_l?????ng_Account_trong_m???i_Group
	AS(	
			SELECT				G.GroupName , G.GroupID, COUNT(GA.AccountID) AS S???_l?????ng_xu???t_hi???n , GA.*
			FROM				GroupAccount	AS		GA 
			RIGHT JOIN 			`Group` 		AS		G 		USING (GroupID)
			GROUP BY			G.GroupID
			ORDER BY			G.GroupID 		DESC);

SELECT			*
FROM			S???_l?????ng_Account_trong_m???i_Group;


-- Question 10: T??m ch???c v??? c?? ??t ng?????i nh???t
DROP VIEW IF EXISTS				PositionName_??t_member_I;
CREATE OR REPLACE VIEW			PositionName_??t_member_I
	AS(
				SELECT 			P.PositionName, P.PositionID, COUNT(A.PositionID) AS S???_th??nh_vi??n , A.*
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
FROM			PositionName_??t_member_I;

-- Question 11: th???ng k?? m???i ph??ng ban c?? bao nhi??u dev, test, scrum master, PM

DROP VIEW IF EXISTS				Th???ng_k??_m???i_Department_c??_bao_nhi??u_Position;
CREATE OR REPLACE VIEW			Th???ng_k??_m???i_Department_c??_bao_nhi??u_Position
	AS(
				SELECT			D.DepartmentName, P.PositionName , COUNT(P.PositionName) AS S???_l?????ng_member, A.*
				FROM			`Account`			AS		A	 
				INNER JOIN 		Position			AS		P		USING	(PositionID)
                INNER JOIN 		Department			AS		D		USING	(DepartmentID)
				GROUP BY		A.DepartmentID 	);

SELECT			*
FROM			Th???ng_k??_m???i_Department_c??_bao_nhi??u_Position;

-- Question 12: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m: th??ng tin c?? b???n c???a 
-- 				question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i, c??u tr??? l???i l?? g??, ???

DROP VIEW IF EXISTS				Question_v??_Account;
CREATE OR REPLACE VIEW			Question_v??_Account
	AS(
			SELECT 				Q.CreatorID AS Ng?????i_t???o_Question, Q.Content AS N???i_dung_c??u_h???i,
								T.TypeName ,
                                A.Content 	AS N???i_dung_c??u_tr???_l???i
			FROM				Question		AS		Q 
			INNER JOIN 			Answer 			AS		A		 ON				Q.QuestionID = A.QuestionID
			INNER JOIN			TypeQuestion 	AS		T		 USING			(TypeID ));

SELECT			*
FROM			Question_v??_Account;


-- Question 13: l???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m

DROP VIEW IF EXISTS				Th???ng_k??_s???_l?????ng_Essay_v??_MultipleChoice;
CREATE OR REPLACE VIEW			Th???ng_k??_s???_l?????ng_Essay_v??_MultipleChoice
	AS(
				SELECT			T.TypeName	, COUNT(Q.TypeID)
				FROM			Question 		AS		Q 
				INNER JOIN 		TypeQuestion 	AS		T		 USING	 (TypeID)
				GROUP BY		Q.TypeID);

SELECT			*
FROM			Th???ng_k??_s???_l?????ng_Essay_v??_MultipleChoice;

-- Question 14 v?? 15: l???y ra group kh??ng c?? account n??o

DROP VIEW IF EXISTS				Group_kh??ng_c??_member;
CREATE OR REPLACE VIEW			Group_kh??ng_c??_member
	AS(
			SELECT		G.*
			FROM		`Group`		 	AS		G
			JOIN		GroupAccount	AS		GA		USING		(GroupID)	
			WHERE		GA.AccountID 	IS 				NULL);
          
SELECT			*
FROM			Group_kh??ng_c??_member;     


-- Question 16: l???y ra question kh??ng c?? answer n??o 

DROP VIEW IF EXISTS				Question_kh??ng_c??_Answer;
CREATE OR REPLACE VIEW			Question_kh??ng_c??_Answer
		AS(
				SELECT			A.*
				FROM			Answer				AS		A 	
				JOIN			Question			AS 		Q	USING 	(QuestionID)
                WHERE			A.isCorrect 		IS			NULL ) ;
					
SELECT			*
FROM			Question_kh??ng_c??_Answer;
     

-- Question 17:
-- a) L???y c??c account thu???c nh??m th??? 1
SELECT 		A.FullName
FROM 		`Account` 		AS		A
JOIN 		GroupAccount 	AS		GA		USING (AccountID)
WHERE 		GA.GroupID = 1;

-- b) L???y c??c account thu???c nh??m th??? 2
SELECT 		A.FullName
FROM 		`Account` 		AS		A
JOIN 		GroupAccount 	AS		GA		USING (AccountID)
WHERE 		GA.GroupID = 2;

-- c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b) sao cho kh??ng c?? record n??o tr??ng nhau
DROP VIEW IF EXISTS				Record_kh??ng_tr??ng_nhau;
CREATE OR REPLACE VIEW			Record_kh??ng_tr??ng_nhau

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
FROM			Record_kh??ng_tr??ng_nhau;


-- Question 18: 
-- a) L???y c??c group c?? l???n h??n b???ng 5 th??nh vi??n 
SELECT 		G.GroupName, COUNT(1) AS so_luong
FROM 		`Group` 		AS		G
JOIN 		GroupAccount 	AS		GA	 	USING (GroupID)
GROUP BY	GA.GroupID
HAVING 		so_luong >= 5 ;

-- b) L???y c??c group c?? nh??? h??n 7 th??nh vi??n 

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
