-- LESSON 6 --

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban 
-- 			và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS 	Get_All_Department;
DELIMITER $$
CREATE PROCEDURE			Get_All_Department( IN TenPhongBan NVARCHAR (50))
	BEGIN
		SELECT		*
        FROM		`Account`
        JOIN		Department		USING 	(DepartmentID)
        WHERE		DepartmentName 		= 	TenPhongBan ;
	END	$$ 
    
DELIMITER ;
Call 	Get_All_Department('Sale');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group 

DROP PROCEDURE IF EXISTS	Account_Number_in_group;
DELIMITER $$
CREATE PROCEDURE			Account_Number_in_group( IN in_GroupID TINYINT UNSIGNED)
	BEGIN
		SELECT				GroupID, GroupName, COUNT(GA.AccountID) , Group_Concat(GA.AccountID)
        FROM 				`Group`
        JOIN 				GroupAccount AS GA USING(GroupID)
        WHERE	 			GroupID = in_GroupID;
	END $$
DELIMITER ;	

CALL Account_Number_in_group ('2');



-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại

DROP PROCEDURE IF EXISTS 		TypeQuestion_Month;
DELIMITER $$
CREATE PROCEDURE			 	TypeQuestion_Month()
BEGIN
	SELECT		* , COUNT(TypeID)
    FROM		Question		AS		Q
    JOIN		TypeQuestion	AS		TQ				USING (TypeID)
    WHERE 		MONTH(Q.CreateDate) = Month(NOW()		AND 	YEAR(Q.CreateDate)	=	YEAR(NOW))
	GROUP BY	Q.TypeID ;
END$$
DELIMITER ;
CALL		TypeQuestion_Month(now());


-- Question 3: Tạo store để thống kê mỗi type question
-- có bao nhiêu question được tạo trong tháng hiện tại

DROP PROCEDURE IF EXISTS QuestionOfMonth;
DELIMITER $$
CREATE PROCEDURE QuestionOfMonth()
BEGIN
	SELECT		COUNT(TypeID)
    FROM		Question
    WHERE		MONTH(CreateDate) = Month(NOW());
END$$
DELIMITER ;

call QuestionOfMonth();


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS TypeID_QuestionMax;
DELIMITER $$
CREATE PROCEDURE TypeID_QuestionMax()
BEGIN
	WITH MAX_Count_TypeID AS(
								SELECT		COUNT(TypeID)
								FROM		Question 
								GROUP BY	TypeID
								ORDER BY	COUNT(TypeID) DESC
								LIMIT 		1)
   
   SELECT 		TypeID
    FROM		Question
    GROUP BY 	TypeID
    HAVING		COUNT(TypeID) = (SELECT * FROM MAX_Count_TypeID);	

END$$
DELIMITER ;
set @out_id_typequestion = 0;
call  TypeID_QuestionMax(@out_id_typequestion);
select @out_id_typequestion;
call  TypeID_QuestionMax();

    -- bài 4 , đã sửa
DROP PROCEDURE IF EXISTS get_typequestion;
DELIMITER $$
CREATE PROCEDURE get_typequestion(OUT out_id_typequestion TINYINT UNSIGNED)
 BEGIN
 WITH
 Count_TypeID AS (
 SELECT TypeID, count(TypeID) 'num'
 FROM question 
            GROUP BY TypeID)
 SELECT TypeID INTO out_id_typequestion
 FROM question
 GROUP BY TypeID
        HAVING count(TypeID) = (SELECT max(num)
  FROM  Count_TypeID)
 Limit 1;
    END $$
DELIMITER ;
set @out_id_typequestion = 0;
call get_typequestion(@out_id_typequestion);
select @out_id_typequestion;
    

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
-- Cách 1
SET 		@out_id_5 = 0 ;
CALL 		get_typequestion(@out_id_5);
SELECT		*
FROM		TypeQuestion
WHERE		TypeName = @out_id_5;

-- cách 2 

DROP PROCEDURE IF EXISTS Name_TypeQuestion;
DELIMITER $$
CREATE PROCEDURE  Name_TypeQuestion()
BEGIN
		SET 		@out_id_5 = 0 ;
        CALL 		get_typequestion(@out_id_5);
		SELECT		*
		FROM		TypeQuestion
		WHERE		TypeName = @out_id_5;
		END$$
DELIMITER ;


-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của
-- người dùng nhập vào

-- Nhập:1 -- Trả về Group có tên chứa chuỗi
-- Nhập:2 -- Trả về User có username chứa chuỗi 


DROP PROCEDURE IF EXISTS 	NameGroup_Or_UserName;
DELIMITER $$
CREATE PROCEDURE 			NameGroup_Or_UserName
							(IN	in_StringInput VARCHAR(50), IN in_Select TINYINT)
BEGIN
	IF in_Select = 1 THEN
		SELECT 	*
        FROM	`Group`
        WHERE	GroupName LIKE in_StringInput;
	ELSE
		SELECT 	Email, Username, FullName
        FROM	`Account`
        WHERE	Username LIKE in_StringInput;
	END IF;
END$$
DELIMITER ;


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
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   '5'			,   '1'		,'2020-03-05'),
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
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2021-09-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2021-09-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2021-09-06'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2021-09-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2021-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2021-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2021-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2021-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2021-04-07');

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