     -- THEM DU LIEU MOI

USE								Testing_System_Assingment_1;

-- BANG DEPARTMENT ----------------------------------------------------------------------

    INSERT INTO 		Department  (DepartmentName)
    VALUES							(	'A'		),
									(	'B'		),
									(	'C'		),
									(	'D'		),    
                                    (	'E'		),
                                    (	'F'		),
                                    (	'I'		),
                                    (	'J'		),
                                    (	'K'		),
                                    (	'L'		);
                                    
SELECT * FROM			 Department;

-- BANG `Position`----------------------------------------------------------------------

	INSERT INTO 		`Position`  (PositionName) 
    VALUES							('Dev'			),
									('Test'			),
									('Scrum Master'	),
 									('SQL'			),
									('PM'			);
SELECT * FROM 			`Position`;

-- BANG `Account`----------------------------------------------------------------------


INSERT INTO 	`Account`  (Email,				PositionID,		UserName,		FullName	,	 DepartmentID,	CreateDate		)	
VALUES				   	('abc123@gmail.com',		'1',		'abc123',		'abc'		,		'10'	,	'2020-01-01'	),
						('abc234@gmail.com',		'2',		'abc234',		'def'		,		'9'		,	'2020-02-02'	),
						('abc345@gmail.com',		'3',		'abc345',		'ghi'		,		'8'		,	'2020-03-03'	),
						('abc456@gmail.com',		'4',		'abc456',		'jkl'		,		'7'		,	'2020-04-04'	),
						('abc567@gmail.com',		'5',		'abc567',		'mno'		,		'6'		,	'2020-05-05'	),
                        ('abc678@gmail.com',		'5',		'abc678',		'abc'		,		'5'		,	'2020-06-06'	),
                        ('abc789@gmail.com',		'4',		'abc789',		'def'		,		'4'		,	'2020-07-07'	),
                        ('abc890@gmail.com',		'3',		'abc890',		'ghi'		,		'3'		,	'2020-08-08'	),
                        ('abc012@gmail.com',		'2',		'abc012',		'jkl'		,		'2'		,	'2020-09-09'	),
                        ('abc000@gmail.com',		'1',		'abc000',		'mno'		,		'1'		,	'2020-10-10'	);

SELECT * FROM 		`Account`;  
                                                        
-- BANG `Group`----------------------------------------------------------------------

INSERT INTO 			`Group` 	(GroupName,					CreatorID		, 			CreateDate			)
    VALUES							('Phat_Trien_Phan_Mem'	,		2			,			'2020-01-11'			),
									('Sale'					,		1			,			'2020-02-12'			),
									('Tester'				,		3			,			'2020-03-13'			),
									('Cham_Soc_Khach_Hang'	,		5			,			'2020-04-14'			),
									('PR'					,		4			,			'2020-05-15'			),
                                    ('Phat_Trien_Phan_Mem1'	,		6			,			'2020-06-16'			),
                                    ('Sale1'				,		7			,			'2020-07-17'			),
                                    ('Tester1'				,		9			,			'2020-08-18'			),
                                    ('Cham_Soc_Khach_Hang1'	,		10			,			'2020-09-19'			),
                                    ('PR1'					,		8			,			'2020-10-20'			);
SELECT * FROM 			`Group`;


-- BANG Group_Account----------------------------------------------------------------------

	INSERT INTO 	Group_Account  	(	AccountID	,			  GroupID	) 
    VALUES							(		'1'		,				'1'		),
									(		'2'		,				'2'		),
									(		'3'		,				'3'		),
									(		'4'		,				'4'		),
									(		'5'		,				'5'		),
                                    (		'6'		,				'1'		),
									(		'7'		,				'2'		),
									(		'8'		,				'3'		),
									(		'9'		,				'4'		),
									(		'10'	,				'5'		);
SELECT * FROM 			Group_Account;

-- BANG Type_Question ----------------------------------------------------------------------

	INSERT INTO 		Type_Question  (TypeName)
    VALUES								('Essay'		),
										('Multiple_Choice'	);
                                    
SELECT * FROM 			Type_Question;

-- BANG CategoryQuestion ----------------------------------------------------------------------

	INSERT INTO 		CategoryQuestion 	(	CategoryName	) 
    VALUES									(	'JAVA'			),
											(	'.NET'			),
											(	'SQL'			),
											(	'POSTMAN'		),
											(	'RUBY'			),
											(	'ASP.NET'		),
											(	'ADO.NET'		),
											(	'Python'		),
											(	'C++'			),
											(	'C Sharp'		),
											(	'PHP'			);
SELECT * FROM 			CategoryQuestion;

-- BANG Question ----------------------------------------------------------------------

INSERT INTO	 Question	(Content		, CategoryID,	 TypeID			, CreatorID	)
VALUES 					('JAVA'			,	'1'		,		'1'			,   '1'		),
						('.NET'			,	'10'	,		'2'			,   '2'		),
						('SQL'			,	'9'		, 	  	'2'			,   '3'		),
						('POSTMAN'		,	'6'		,   	'1'			,   '4'		),
						('RUBY'			,	'5'		,   	'1'			,   '5'		),
						('ASP.NET'		,	'3'		,   	'2'			,   '6'		),
						('ADO.NET'		,	'2'		,   	'1'			,   '7'		),
						('Python'		,	'8'		,   	'1'			,   '8'		),
						('C++'			,	'4'		,   	'2'			,   '9'		),
						('C Sharp'		,	'7'		,   	'1'			,   '10'	);

SELECT * FROM 			Question;

-- BANG Answer	 ----------------------------------------------------------------------

INSERT INTO Answer	(  Content		, 		QuestionID	, 		isCorrect	)
VALUES 				('JAVA'			, 		 '1'			,	'True'		),
					('.NET'			, 		 '2'			,	'Fall'		),
                    ('SQL'			, 		 '3'			,	'True'		),
                    ('POSTMAN'		, 		 '4'			,	'True'		),
                    ('RUBY'			, 		 '5'			,	'Fall'		),
                    ('ASP.NET'		, 		 '6'			,	'Fall'		),
                    ('ADO.NET'		, 		 '7'			,	'True'		),
                    ('Python'		, 		 '8'			,	'True'		),
                    ('C++'			, 		 '9'			,	'Fall'		),
                    ('C Sharp'		, 		 '10'			,	'Fall'		);                     
SELECT * FROM 			Answer;

-- BANG Exam	 ----------------------------------------------------------------------

INSERT INTO Exam	(`Code`		, Title			, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('A01'		, 'JAVA'		, 		'6'		,	'10'	,     '1'		,'2020-01-21'),
					('A02'		, '.NET'		, 		'7'		,	'20'	,     '2'		,'2020-02-22'),
                    ('A03'		, 'SQL'			, 		'8'		,	'30'	,     '3'		,'2020-03-23'),
                    ('A04'		, 'POSTMAN'		, 		'9'		,	'40'	,     '4'		,'2020-04-24'),
                    ('A05'		, 'RUBY'		, 		'10'	,	'50'	,     '5'		,'2020-05-25'),
                    ('A06'		, 'ASP.NET'		, 		'5'		,	'60'	,     '6'		,'2020-06-26'),
                    ('A07'		, 'ADO.NET'		, 		'4'		,	'70'	,     '7'		,'2020-07-27'),
                    ('A08'		, 'Python'		, 		'3'		,	'80'	,     '8'		,'2020-08-28'),
                    ('A09'		, 'C++'			, 		'2'		,	'90'	,     '9'		,'2020-09-29'),
                    ('A10'		, 'C Sharp'		, 		'1'	,		'100'	,     '10'		,'2020-10-30');
                    
                    
SELECT * FROM 			Exam;

-- 	BANG ExamQuestion	----------------------------------------------------------------------
INSERT INTO ExamQuestion(ExamID			, QuestionID	) 
VALUES 					(	 '1'		,		 '1'	),
						(	 '2'		,		 '2'	), 
						(	 '3'		,		 '3'	), 
						(	 '4'		,		 '4'	), 
						(	 '5'		,		 '5'	), 
						(	 '6'		,		 '6'	), 
						(	 '7'		,		 '7'	), 
						(	 '8'		,		 '8'	), 
						(	 '9'		,		 '9'	), 
						(	 '10'		,		 '10'	); 
SELECT * FROM 			ExamQuestion;


