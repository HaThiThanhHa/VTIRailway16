package assignment;

import java.util.Date;

public class Assignment1 {

	public static void main(String[] args) {
		
		// Tạo Department

		Department dep1 = new Department();
		dep1.departmentID = 1;
		dep1.departmentName = "Marketing";
	
		Department dep2 = new Department();
		dep2.departmentID = 2;
		dep2.departmentName = "Sale";
		
		Department dep3 = new Department();
		dep3.departmentID = 3;
		dep3.departmentName = "IT";

		// Tạo Position

		Position pos1 = new Position();
		pos1.positionID = 1;
		pos1.positionName = PositionName.DEV;

		Position pos2 = new Position();
		pos2.positionID = 2;
		pos2.positionName = PositionName.PM;
		
		Position pos3 = new Position();
		pos3.positionID = 3;
		pos3.positionName = PositionName.SCRUM_MASTER;

		// Tạo Group

		Group group1 = new Group();
		group1.groupID= 1;
		group1.groupName = "Testing System";

		Group group2 = new Group();
		group2.groupID = 2;
		group2.groupName = "Development";
		
		Group group3 = new Group();
		group3.groupID = 3;
		group3.groupName = "Sale";

		// Tạo Account
		
		Account acc1 					= new Account();
		acc1.accountID		 			= 1;
		acc1.email 						= "abc@gmail.com";
		acc1.userName 					= "daonq1";
		acc1.fullName 					= "Dao Nguyen 1";
		acc1.department 				= dep1;
		acc1.position			 		= pos1;
		acc1.createDate					= new Date(2020,12,9);
		Group[] groupAcc1 				= { group1, group2 };
		acc1.groups = groupAcc1;
		
		// System.out.println(acc1);
		
		
		Account acc2 					= new Account();
		acc2.accountID 					= 2;
		acc2.email 						= "hjhasida@gmail.com";
		acc2.userName 					= "daonq2";
		acc2.fullName 					= "Dao Nguyen 2";
		acc2.department 				= dep2;
		acc2.position 					= pos2;
		acc2.createDate 				= new Date(2019,5,7);
		acc2.groups						= new Group[] { group3, group2 };
		
		Account acc3					= new Account();
		acc3.accountID 					= 3;
		acc3.email 						= "kakjsaabc@gmail.com";
		acc3.userName 					= "daonq3";
		acc3.fullName 					= "Dao Nguyen 3";
		acc3.department					= dep3;
		acc3.position		 			= pos3;
		acc3.createDate 				= new Date(2019,5,17);
		
		 // tao public class GroupAccount 

		 GroupAccount  ga1 		= new GroupAccount ();
		 ga1.group			 	= group1 ;
		 ga1.account			= acc1;
		 ga1.joinDate 			= new Date (2018,11,25);
	
		 GroupAccount  ga2 		= new GroupAccount ();
		 ga2.group				= group2;
		 ga2.account			= acc2;
		 ga2.joinDate 			= new Date (2018,3,9);
	
		GroupAccount  ga3		= new GroupAccount ();
		ga3.group 				= group3;
		ga3.account				= acc3;
		ga3.joinDate 			= new Date (2019,6,2);		

		//tao public class TypeQuestion {
		TypeQuestion tq1 = new TypeQuestion ();
		tq1.typeID			= 1;
		tq1.typeName		= TypeName.MULTIPLE_CHOICE;
		
		TypeQuestion tq2 = new TypeQuestion ();
		tq2.typeID			= 2;
		tq2.typeName		= TypeName.ESSAY;
		
		TypeQuestion tq3 = new TypeQuestion ();
		tq3.typeID			= 3;
		tq3.typeName		= TypeName.MULTIPLE_CHOICE;

		// tao public class CatelogyQuestion {

		CatelogyQuestion cateQues1 = new  CatelogyQuestion();
		cateQues1.catelogyID = 1;
		cateQues1.questionCatelogyName = QuestionCatelogyName.JAVA;

		CatelogyQuestion cateQues2 = new  CatelogyQuestion();
		cateQues2.catelogyID = 2;
		cateQues2.questionCatelogyName = QuestionCatelogyName.NET;

		CatelogyQuestion cateQues3 = new  CatelogyQuestion();
		cateQues3.catelogyID = 3;
		cateQues3.questionCatelogyName = QuestionCatelogyName.POSTMAN;
				
		CatelogyQuestion cateQues4 = new  CatelogyQuestion();
		cateQues4.catelogyID = 4;
		cateQues4.questionCatelogyName = QuestionCatelogyName.RUBY;
				
		CatelogyQuestion cateQues5= new  CatelogyQuestion();
		cateQues5.catelogyID = 5;
		cateQues5.questionCatelogyName = QuestionCatelogyName.SQL;
		
		
		//tao public class Question {

		Question q1 										= new Question ();	
		q1.questionID										= 1;
		q1.content											= "content question1";
		q1.catelogyQuestion									= cateQues1;		
		q1.account											= acc1;
		q1.createDate										= new Date (2018,11,04);
		
		Question q2								 			= new Question ();	
		q2.questionID										= 2;
		q2.content											= "content question2";
		q2.catelogyQuestion									= cateQues2;
		q2.account											= acc2;
		q2.createDate										= new Date (2017,06,25);		
		
		Question q3 = new Question ();	
		q3.questionID										= 3;
		q3.content											= "content question3";
		q3.catelogyQuestion									= cateQues3;					
		q3.account											= acc3;
		q3.createDate										= new Date (2018,04,06);
		
		// tao Answer

		Answer ans1 				= new Answer ();
		ans1.answerID 				=  1;
		ans1.content 				= "answer001";
		ans1.question 				= q1 ;
		ans1.isCorrect				= true ;

		Answer ans2					= new Answer ();
		ans2.answerID 				=  2;
		ans2.content 				= "answer002";
		ans2.question				= q2 ;
		ans2.isCorrect 				= false ;		
		
		Answer ans3 				= new Answer ();
		ans3.answerID 				=  3;
		ans3.content 				= "answer003";
		ans3.question 				= q3 ;
		ans3.isCorrect 				= true ;		
		
		
		// tao Exam

		Exam ex1 				= new Exam();
		ex1.examID 				= 1;
		ex1.code				= "a1";
		ex1.title				= "title 0000001";
		ex1.catelogyID			= 1;
		ex1.duration			= Duration.SHORT;
		ex1.account				= acc1;
		ex1.createDate 			= new Date (2018,8,5);
		
		Exam ex2 				= new Exam();
		ex2.examID 				= 2;
		ex2.code				= "a2";
		ex2.title				= "title 0000002";
		ex2.catelogyID			= 2;
		ex2.duration			= Duration.MEDIUM;
		ex2.account				= acc2;
		ex2.createDate 			= new Date (2018,8,25);
		
		Exam ex3				= new Exam();
		ex3.examID 				= 3;
		ex3.code				= "a3";
		ex3.title				= "title 0000003";
		ex3.catelogyID			= 3;
		ex3.duration			= Duration.LONG;
		ex3.account				= acc3;
		ex3.createDate 			= new Date (2018,10,24);

			// tao public class ExamQuestion {

		ExamQuestion eq1 				= new ExamQuestion();
		 eq1.exam						= ex1;
		 eq1.question			 		= q1;
		
		ExamQuestion eq2				= new ExamQuestion();
		 eq2.exam						= ex2;
		 eq2.question					= q2;
		
		ExamQuestion eq3 				= new ExamQuestion();
		 eq3.exam						= ex3;
		 eq3.question					= q3;


	}

	
	
	


}



