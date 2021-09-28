	package Exercise1;

import java.util.Date;

public class A_Exercise1 {

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
		acc1.groups 					= groupAcc1;
		
		// System.out.println(acc1);
		
		
		Account acc2 					= new Account();
		acc2.accountID 					= 2;
		acc2.email 						= "hjhasida@gmail.com";
		acc2.userName 					= "daonq2";
		acc2.fullName 					= "Dao Nguyen 2";
		acc2.department 				= dep2;
		acc2.position 					= pos2;
		acc2.createDate 				= new Date(2019,05,07);
		Group[] groupAcc2				= { group3, group2 };
		acc2.groups						= groupAcc2;
		
		Account acc3					= new Account();
		acc3.accountID 					= 3;
		acc3.email 						= "kakjsaabc@gmail.com";
		acc3.userName 					= "daonq3";
		acc3.fullName 					= "Dao Nguyen 3";
		acc3.department					= dep3;
		acc3.position		 			= pos3;
		acc3.createDate 				= new Date(2019,05,17);
		
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


		 


// Question 1:
		 
			System.out.println("***Question 1:");
			System.out.println("	Check acc2");

			if (acc2.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban.");
			} else {
			System.out.println("Phòng ban của nv này là: " + acc2.department.departmentName);
			}

// Question 2:
//		Kiểm tra account thứ 2
//		*	Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
//		*	Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên
//			này là Java Fresher, C# Fresher"
//		*	Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là người
//			quan trọng, tham gia nhiều group"
//		*	Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
//			người hóng chuyện, tham gia tất cả các group"
			
			System.out.println("***Question 2 :");
			System.out.println("	Check acc2 theo IF ");
			
			if (acc2.groups == null) {
			System.out.println("Nhân viên này chưa có group");
			} else {
			int countGroup = acc2.groups.length;
			if (countGroup == 1 || countGroup == 2) {
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			}
			if (countGroup == 3) {
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
			}
			if (countGroup >= 4) {
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");

			}
			}
// Question 3:
// Sử dụng toán tử ternary để làm Question 1
			System.out.println("***Question 3:");
			System.out.println("	Sử dụng toán tử ternary để làm Question 1 ");

			System.out.println(acc2.department == null 
					? "Nhân viên này chưa có phòng ban."
					: "Phòng của nhân viên này là: " 
					+ acc2.department.departmentName);

// Question 4:
//			Sử dụng toán tử ternary để làm yêu cầu sau:
//			Kiểm tra Position của account thứ 1
//			Nếu Position = Dev thì in ra text "Đây là Developer"
//			Nếu không phải thì in ra text "Người này không phải là Developer"
//			System.out.println("---------Question 4: sử dụng Terry cho Position------)
			System.out.println("***Question 4:");
			System.out.println("	Sử dụng toán tử ternary để làm yêu cầu ");


			System.out.println (acc1.position.positionName.toString() == "Dev" 
					? "Đây là Developer" 
					: "Người này không phải là Developer");

//		SWITCH CASE
//	Question 5:
//		Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format sau:
//		*	Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
//		*	Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên"
//		*	Nếu số lượng account = 3 thì in ra "Nhóm có ba thành viên"
//		*	Còn lại in ra "Nhóm có nhiều thành viên"
			
			System.out.println(">>>>>>>>		SWITCH CASE		<<<<<<<<");
			System.out.println("***Question 5:");
			System.out.println("	Số lượng acc trong nhóm 1 ");

		if (group1.accounts == null) {
			System.out.println("Group chưa có thành viên nào tham gia");
		} else {
		int countAccInGroup = group1.accounts.length;
		switch (countAccInGroup) {
		case 1:
			System.out.println("Nhóm có một thành viên");
		break;
		case 2:
			System.out.println("Nhóm có hai thành viên");
		break;
		case 3:
			System.out.println("Nhóm có ba thành viên");
		break;
		default:
			System.out.println("Nhóm có nhiều thành viên");
		break;
			}
			}
//		Question 7:  Sử dụng switch case để làm lại Question 4
		System.out.println("***Question 7:");
		System.out.println("	Sử dụng switch case để làm lại Question 4");
		
		String positionName = acc1.position.positionName.toString();
		switch (positionName) {
		case "Dev":
		System.out.println("Đây là Developer");
		break;
		default:
		System.out.println("Người này không phải là Developer");
		break;
		}
//			Question 6:
//			Sử dụng switch case để làm lại Question 2
		
		System.out.println("***Question 6:");
		System.out.println("	Check số lượng Group nhân viên tham gia");

		if (acc2.groups == null) {
			System.out.println("Nhân viên này chưa có group");
		} else {
		switch (acc2.groups.length) {
		case 1:
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
		break;
		case 2:
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
		break;
		case 3:
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
		break;
		default:
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
			break;
		}

//			FOREACH
//			Question 8 : In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ
		System.out.println("***Question 8:");
		System.out.println("	In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ");
			
			Account[] accArray = { acc1, acc2, acc3 };
			for (Account account : accArray) {
			System.out.println("AccountID: " + account.accountID + " Email: " + account.email + " Name: " + account.fullName);
			}

//			Question 9:
//			In ra thông tin các phòng ban bao gồm: id và name
			System.out.println("***Question 9:");
			System.out.println("	In ra thông tin các phòng ban bao gồm: id và name ");
				
			Department[] depArray = { dep1, dep2, dep3 };
			for (Department department : depArray) {
			System.out.println("DepID: " + department.departmentID + " Name: " +department.departmentName);
			}

//			FOR
//			Question 10:
//			In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
//			họ theo định dạng như sau:
//			Thông tin account thứ 1 là:
//			Email: NguyenVanA@gmail.com
//			Full name: Nguyễn Văn A
//			Phòng ban: Sale
//			Thông tin account thứ 2 là:
//			Email: NguyenVanB@gmail.com
//			Full name: Nguyễn Văn B
//			Phòng ban: Marketting
			
			System.out.println(">>>>>>>>		FOR		<<<<<<<<");
			System.out.println("***Question 10:");
			System.out.println("	In thông tin account:");

			Account[] accArray1 = { acc1, acc2 };
			for (int i = 0; i < accArray1.length; i++) {
			System.out.println("Thông tin account thứ " + (i + 1) + "là:");

			System.out.println("	Email:		" + accArray1[i].email);
			System.out.println("	Full name:	" + accArray1[i].fullName);
			System.out.println("	Phòng ban:	" + accArray1[i].department.departmentName);
			}
			
//			Question 11:
//			In ra thông tin các phòng ban bao gồm: id và name theo định dạng sau:
//			Thông tin department thứ 1 là:
//			Id: 1
//			Name: Sale
//			Thông tin department thứ 2 là:
//			Id: 2
//			Name: Marketing
			System.out.println("***Question 11:");
			System.out.println("	In thông tin phòng ban:");

			Department[] depArray1 = { dep1, dep2, dep3 };
			for (int i = 0; i < depArray1.length; i++) {
			System.out.println("Thông tin department thứ " + (i + 1) + "là:");

			System.out.println("Department Id: " 	+ depArray1[i].departmentID);
			System.out.println("Department Name: " 	+ depArray1[i].departmentName);
			}
//			Question 12:
//			Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
			System.out.println("***Question 12:");
			System.out.println("	Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10");

			Department[] depArray2 = { dep1, dep2, dep3 };
			for (int i = 0; i < 2; i++) {
			System.out.println("Thông tin department thứ " + (i + 1) + "là:");

			System.out.println("Id: " + depArray2[i].departmentID);
			System.out.println("Name: " + depArray2[i].departmentName);
			}
			
//			Question 13:
//			In ra thông tin tất cả các account ngoại trừ account thứ 2
			
			System.out.println("***Question 13:");
			System.out.println("	In ra thông tin tất cả các account ngoại trừ account thứ 2");

			Account[] accArray2 = { acc1, acc2, acc3 };
			for (int i = 0; i < accArray2.length; i++) {
			if (i != 1) {
			System.out.println("Thông tin account thứ " + (i + 1) + " là:");
			System.out.println("	Email:		" + accArray2[i].email);
			System.out.println("	Full name:	" + accArray2[i].fullName);
			System.out.println("	Phòng ban:	" + accArray2[i].department.departmentName);
			}
			}
//			Question 14:
//			In ra thông tin tất cả các account có id < 4
			
			System.out.println("***Question 14:");
			System.out.println("	In ra thông tin tất cả các account có id < 4");

			Account[] accArray3 = { acc1, acc2, acc3 };
			for (int j = 0; j < accArray3.length; j++) {
			if (accArray3[j].accountID < 4) {
			System.out.println("Thông tin account thứ " + (j + 1) + " là:");
			System.out.println("	Email:		" + accArray3[j].email);
			System.out.println("	Full name:	" + accArray3[j].fullName);
			System.out.println("	Phòng ban:	" + accArray3[j].department.departmentName);
			}
			}
			
		
//			Question 15:
//			In ra các số chẵn nhỏ hơn hoặc bằng 20
			
			
			System.out.println("***Question 15:");
			System.out.println("	In ra các số chẵn nhỏ hơn hoặc bằng 20");

			for (int i = 1; i <= 20; i++) {
			if (i%2 ==0 ) {
			System.out.print("Các số chẵn nhỏ hơn hoặc bằng 20 :		");
			System.out.print(i+ " ,");
			}
			}
		
//			WHILE
//			Question 16:
//			Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết hợp với
//			lệnh break, continue
//			// WHILE Question 16: Làm lại các Question ở phần FOR bằng cách sử
//			dụng WHILE kết hợp với lệnh break, continue
//			// Question 16-10: In ra thông tin các account bao gồm: Email,
//			FullName và tên phòng ban của họ theo định dạng
			
			System.out.println(">>>>>>>>		WHILE		<<<<<<<<");
			System.out.println("***Question 16/10:");
			System.out.println("	Làm lại các Question ở phần FOR bằng cách sử dụng WHILE");

			Account[] accArray1610 = { acc1, acc2, acc3 };
			int i1610 = 0;
			while (i1610 < accArray1.length) {
			System.out.println("Thông tin account thứ " + (i1610 + 1) + "là:");
			System.out.println("	Email:		" + accArray1610[i1610].email);
			System.out.println("	Full name:	" + accArray1610[i1610].fullName);
			System.out.println("	Phòng ban:	" + accArray1610[i1610].department.departmentName);
			i1610++;
			}

			// Question 16-11: In ra thông tin các phòng ban bao gồm: id và name

			System.out.println("***Question 16/11:");
			System.out.println("	Làm lại Question 11 ở phần FOR bằng cách sử dụng WHILE");
			Department[] depArray1611 = { dep1, dep2, dep3 };
			int j1611 = 0;
			while (j1611 < depArray1611.length) {
			System.out.println("Thông tin department thứ " + (j1611 + 1) + "là:");
			System.out.println("	Id:		" + depArray1611[j1611].departmentID);
			System.out.println("	Name:	" + depArray1611[j1611].departmentName);
			j1611++;
			}

			// Question 16-12: Chỉ in ra thông tin 2 department đầu tiên 
			System.out.println("***Question 16/12:");
			System.out.println("	Làm lại Question 12 ở phần FOR bằng cách sử dụng WHILE");
			Department[] depArray1612 = { dep1, dep2, dep3 };
			int i1612 = 0;
			while (i1612 < 2) {
			System.out.println("Thông tin department thứ " + (i1612 + 1) + " là:");
			System.out.println("	Id:		" + depArray2[i1612].departmentID);
			System.out.println("	Name:	" + depArray2[i1612].departmentName);
			i1612++;
			}

			// Question 16-13: in ra thông tin tất cả các account ngoại trừ account thứ 2
			System.out.println("***Question 16/13:");
			System.out.println("	Làm lại Question 13 ở phần FOR bằng cách sử dụng WHILE");
			Account[] accArray1613 = { acc1, acc2, acc3 };
			int i1613 = 0;
			while (i1613 < accArray1613.length) {
			if (i1613 != 1) {
			System.out.println("Thông tin account thứ " + (i1613 +1) + " là:");
			System.out.println("Email: " + accArray1613[i1613].email);
			System.out.println("Full name: " +accArray1613[i1613].fullName);
			System.out.println("Phòng ban: " +accArray1613[i1613].department.departmentName);
			}
			i1613++;
			}

			// Question 16-14: In ra thông tin tất cả các account có id < 4
			System.out.println("***Question 16/14:");
			System.out.println("	Làm lại Question 14 ở phần FOR bằng cách sử dụng WHILE");
			Account[] accArray1614 = { acc1, acc2, acc3 };
			int i1614 = 0;
			while (i1614 < accArray1614.length) {
			if (accArray1614[i1614].accountID < 4) {
			System.out.println("Thông tin account thứ " + (i1614 +1) + " là:");
			System.out.println("Email: " + accArray1614[i1614].email);
			System.out.println("Full name: " +accArray1614[i1614].fullName);
			System.out.println("Phòng ban: " +accArray1614[i1614].department.departmentName);
			}
			i1614++;
			}

			// Question 16- 15: In ra các số chẵn nhỏ hơn hoặc bằng 20

			System.out.println("***Question 16/15:");
			System.out.println("	Làm lại Question 15 ở phần FOR bằng cách sử dụng WHILE");
			int i1615 = 1;
			while (i1615 <= 20) {
			if (i1615 % 2 == 0) {
			System.out.print(i1615 + " ");
			}
			i1615++;
			}
			}
		
//			DO-WHILE
//			Question 17:
//			Làm lại các Question ở phần FOR bằng cách sử dụng DO-WHILE kết hợp với
//			lệnh break, continue
//			// DO-WHILE Question 17: Làm lại các Question ở phần FOR bằng cách sử
//			dụng DO-WHILE kết hợp với lệnh break, continue
//			// Question 17-10: In ra thông tin các account bao gồm: Email,
//			FullName và tên phòng ban của họ theo định dạng

		System.out.println(">>>>>>>>		DO-WHILE		<<<<<<<<");
		System.out.println("***Question 17/10:");
		System.out.println("	Làm lại Question 10 ở phần FOR bằng cách sử dụng DO-WHILE");
			Account[] accArray1710 = { acc1, acc2, acc3 };
			int i1710 = 0;
			do {
			System.out.println("Thông tin account thứ " + (i1710 + 1) + "là:");
			System.out.println("Email: " + accArray1710[i1710].email);
			System.out.println("Full name: " + accArray1710[i1710].fullName);
			System.out.println("Phòng ban: " + accArray1710[i1710].department.departmentName);
			i1710++;
			} while (i1710 < accArray1710.length);

			// Question 17-11: In ra thông tin các phòng ban bao gồm: id và name
			System.out.println("***Question 17/11:");
			System.out.println("	Làm lại Question 11 ở phần FOR bằng cách sử dụng DO-WHILE");
			Department[] depArray1711 = { dep1, dep2, dep3 };
			int j1711 = 0;
			do {
			System.out.println("Thông tin department thứ " + (j1711 + 1) + "là:");
			System.out.println("	Id:		" + depArray1711[j1711].departmentID);
			System.out.println("	Name:	" + depArray1711[j1711].departmentName);
			j1711++;
			} while (j1711 < depArray1711.length);

			// Question 17-12: Chỉ in ra thông tin 2 department đầu tiên 

			System.out.println("***Question 17/12:");
			System.out.println("	Làm lại Question 12 ở phần FOR bằng cách sử dụng DO-WHILE");

			Department[] depArray1712 = { dep1, dep2, dep3 };
			int i1712 = 0;
			do {
			System.out.println("Thông tin department thứ " + (i1712 + 1) +" là:");
			System.out.println("	Id:		" + depArray1712[i1712].departmentID);
			System.out.println("	Name:	" + depArray1712[i1712].departmentName);
			i1712++;
			} while (i1712 < 2);

			// Question 17-13: in ra thông tin tất cả các account ngoại trừ account thứ 2

			System.out.println("***Question 17/13:");
			System.out.println("	Làm lại Question 13 ở phần FOR bằng cách sử dụng DO-WHILE");

			Account[] accArray1713 = { acc1, acc2, acc3 };
			int i1713 = 0;
			do {
			if (i1713 != 1) {
			System.out.println("Thông tin account thứ " + (i1713 +1) + " là:");
			System.out.println("	Email:		" + accArray1713[i1713].email);
			System.out.println("	Full name:	" + accArray1713[i1713].fullName);
			System.out.println("	Phòng ban:	" + accArray1713[i1713].department.departmentName);
			}
			i1713++;
			} while (i1713 < accArray1713.length);

			// Question 17-14: In ra thông tin tất cả các account có id < 4
			System.out.println("***Question 17/14:");
			System.out.println("	Làm lại Question 14 ở phần FOR bằng cách sử dụng DO-WHILE");

			Account[] accArray1714 = { acc1, acc2, acc3 };
			int i1714 = 0;
			do {
			if (accArray1714[i1714].accountID < 4) {
			System.out.println("Thông tin account thứ " + (i1714 +1) + " là:");
			System.out.println("	Email:		" + accArray1714[i1714].email);
			System.out.println("	Full name:	" + accArray1714[i1714].fullName);
			System.out.println("	Phòng ban:	" +accArray1714[i1714].department.departmentName);
			}
			i1714++;
			} while (i1714 < accArray1714.length);

			// Question 17- 15: In ra các số chẵn nhỏ hơn hoặc bằng 20

			System.out.println("***Question 17/15:");
			System.out.println("	Làm lại Question 15 ở phần FOR bằng cách sử dụng DO-WHILE");
			int i1715 = 1;
			do {
			if (i1715 % 2 == 0) {
			System.out.print(i1715 + " ");
			}
			i1715++;
			} while (i1715 <= 20);
		}		 
	}
	





