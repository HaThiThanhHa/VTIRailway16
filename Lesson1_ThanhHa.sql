DROP DATABASE IF EXISTS			Testing_System_Assingment_1;

CREATE DATABASE IF NOT EXISTS	Testing_System_Assingment_1;

USE								Testing_System_Assingment_1;

CREATE TABLE			Department (
    DepartmentID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName 		NVARCHAR (100) NOT NULL
);
CREATE TABLE 	Position (
    PositionID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
    PositionName 		ENUM ('Dev','Test','Scrum Master','SQL','PM')
);

CREATE TABLE `Account` (
    AccountID 			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email 				VARCHAR(100) NOT NULL UNIQUE KEY,
    UserName			VARCHAR(100) NOT NULL UNIQUE KEY,
    ET_IQ				TINYINT CHECK(20> ET_IQ > 0 ),
    -- CHECK LA RANG BUOC DIEU KIEN CACH VIET KHAC  TINYINT NOT NULL CHECK(20> ET_IQ AND ET_IQ > 0 ),
    FullName			NVARCHAR(100) ,
    DepartmentID		TINYINT UNSIGNED ,
    PositionID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
    
	FOREIGN KEY (DepartmentID)		REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)	 	REFERENCES `Position` (PositionID )
);
    
CREATE TABLE			`Group` (
    GroupID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName			NVARCHAR (50),
    CreatorID			SMALLINT UNSIGNED,
    CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

CREATE TABLE 			Group_Account (
    GroupID				TINYINT UNSIGNED  ,
    AccountID			SMALLINT UNSIGNED ,
    JoinDay				DATETIME DEFAULT NOW(),
    FOREIGN KEY (GroupID) 	REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
	PRIMARY KEY	(GroupID,AccountID)
); 

CREATE TABLE			Type_Question (
    TypeID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName			ENUM ('Essay','Multiple_Choice') NOT NULL
);
    
CREATE TABLE			CategoryQuestion (
    CategoryID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName		NVARCHAR (50) NOT NULL
);
    
CREATE TABLE			Question (
    QuestionID			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content				TEXT NOT NULL,
    -- DU LIEU NHIEU NEN DUNG TEXT 
    CategoryID			TINYINT UNSIGNED NOT NULL,
    TypeID				TINYINT UNSIGNED NOT NULL,
    CreatorID			SMALLINT UNSIGNED NOT NULL,
    Create_Day			DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) 		REFERENCES Type_Question(TypeID),
	FOREIGN KEY (CreatorID) 	REFERENCES `Account`(AccountID)
);
    
CREATE TABLE 			Answer (
	AnswerID			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content				TEXT NOT NULL,
    QuestionID			SMALLINT UNSIGNED,
    isCorrect			ENUM ('True','Fall'),
    FOREIGN KEY (QuestionID) 	REFERENCES Question (QuestionID)
    );

CREATE TABLE 			Exam (
	ExamID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code`				NVARCHAR (50) NOT NULL UNIQUE KEY,
	Title				VARCHAR (50) NOT NULL,
    CategoryID			TINYINT UNSIGNED NOT NULL,
    Duration			TINYINT UNSIGNED NOT NULL,
    CreatorID			SMALLINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID) 	REFERENCES `Account`(AccountID),
    FOREIGN KEY (CategoryID) 	REFERENCES CategoryQuestion(CategoryID)
    );

CREATE TABLE 			ExamQuestion (
    ExamID 				TINYINT UNSIGNED ,
    QuestionID 			SMALLINT UNSIGNED ,
    FOREIGN KEY (ExamID) 		REFERENCES Exam (ExamID),
    FOREIGN KEY (QuestionID) 	REFERENCES Question (QuestionID),
    PRIMARY KEY	(ExamID ,QuestionID)
);





                                    
                                    