package Exercise5;

import java.time.LocalDate;
import java.util.Random;
import java.util.Scanner;

import Assignment2.Account;
import Assignment2.Department;
import Assignment2.Group;
import Assignment2.Position;
import Assignment2.PositionName;

public class Exercise5 {

	public static void main(String[] args) {
//		Exercise 5: Input from console
//		Question 1:
//		Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình


		System.out.println(">>>>>>>>		Exercise 5: Input from console		<<<<<<<<");
		System.out.println("***	Question 1:");
		System.out.println("	 Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình");
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào 3 số nguyên");
		System.out.println("Nhập vào số 1: ");
		int a = sc.nextInt();
		System.out.println("Nhập vào số 2: ");
		int b = sc.nextInt();
		System.out.println("Nhập vào số 3: ");
		int c = sc.nextInt();
		System.out.println("Bạn vừa nhập vào các số: " + a + " , " + b + " , " + c);
		}

//		Question 2: Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình
		public static void main1(String[] args) {
		System.out.println("***	Question 2:");
		System.out.println("	 Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình");

		Scanner sc = new Scanner(System.in);

		System.out.println("* Mời bạn nhập vào 2 số thực");
		System.out.println("	>> Nhập vào số 1: ");
		float f1 = sc.nextFloat();
		System.out.println("	>> Nhập vào số 2: ");
		float f2 = sc.nextFloat();
		System.out.println("		>>	Bạn vừa nhập vào các số:		" + f1 + " , " + f2);
	}

//		Question 3: Viết lệnh cho phép người dùng nhập họ và tên
		private static void question3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("***	Question 3:");
		System.out.println("	 Viết lệnh cho phép người dùng nhập nhập họ và tên");

		System.out.println("	>> Mời bạn nhập vào Họ: ");
		String s1 = sc.next();
		System.out.println("	>> Mời bạn nhập vào Tên: ");
		String s2 = sc.next();
		System.out.println("		>> Họ và tên của bạn là:" + s1 + " " + s2);
		}

//		Question 4: Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ

		private static void question4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("***	Question 4:");
		System.out.println("	 Viết lệnh cho phép người dùng nhập nhập  vào ngày sinh nhật của họ");

		System.out.println("	>> Mời bạn nhập vào năm sinh: ");
		int year = sc.nextInt();
		System.out.println("	>> Mời bạn nhập vào tháng sinh: ");
		int month = sc.nextInt();
		System.out.println("	>> Mời bạn nhập vào ngày sinh: ");
		int day = sc.nextInt();
		LocalDate dateBirth = LocalDate.of(year, month, day);
		System.out.println("		>> Ngày sinh của bạn là: " + dateBirth);
		}
	
//		Question 5:
//		Viết lệnh cho phép người dùng tạo account (viết thành method)
//		Đối với property Position, Người dùng nhập vào 1 2 3 4 và vào
//		chương trình sẽ chuyển thành Position.Dev, Position.Test,
//		Position.ScrumMaster, Position.PM
		private static void question5() {

		Scanner sc = new Scanner(System.in);
		System.out.println("***	Question 5:");
		System.out.println("	 Viết lệnh cho phép người dùng tạo account");

		Account accou = new Account();
		System.out.println("	>> Nhập ID: ");

		accou.accountID = sc.nextInt();
		System.out.println("	>> Nhập email: ");
		accou.email = sc.next();
		System.out.println("	>> Nhập userName: ");
		accou.userName = sc.next();
		System.out.println("	>> Nhập fullName: ");
		accou.fullName = sc.next();
		System.out.println("Nhập position (*** Nhập các số từ 1 đến 4 tương ứng với: 1.Dev, 2.Test, 3.Scrum_Master, 4.PM): ");

		int posNum = sc.nextInt();
		switch (posNum) {
		case 1:
			Position pos1 = new Position();
			pos1.positionID = 1;
			pos1.positionName = PositionName.DEV;
		break;
		case 2:
			Position pos2 = new Position();
			pos2.positionID = 2;
			pos2.positionName = PositionName.TEST;
		break;
		case 3:
			Position pos3 = new Position();
			pos3.positionID = 3;
			pos3.positionName = PositionName.SCRUM_MASTER;
		break;
		case 4:
			Position pos4 = new Position();
			pos4.positionID = 4;
			pos4.positionName = PositionName.PM;

		break;
		}
		System.out.println("Thông tin Acc vừa nhập, ID: " + accou.accountID +"\\n"+ "Email: " + accou.email + " UserName: "+ accou.userName +"\\n"+ " FullName: " + accou.fullName +"\\n"+ "Position: " + posNum);
		}
		;
//		Question 6: Viết lệnh cho phép người dùng tạo department (viết thành method)
		private static void question6() {
		System.out.println("***	Question 6:");
		System.out.println("	 Viết lệnh cho phép người dùng tạo department ");

		System.out.println("Mời bạn nhập vào thông tin Department cân tạo: 	");
		Scanner sc = new Scanner(System.in);
		Department dep = new Department ();
		System.out.println("	>>  Nhập ID: ");
		dep.departmentID = sc.nextInt();
		System.out.println("	>>  Nhập Name: ");
		dep.departmentName = sc.next();
		System.out.println("	>>  Thông tin Department vừa nhập, ID: " + dep.departmentID+ " Name: " + dep.departmentName);
		}

//		Question 7: Nhập số chẵn từ console
		private static void question7() {
		System.out.println("***	Question 7:");
		System.out.println("	  Nhập số chẵn từ console");
		
		Scanner sc = new Scanner(System.in);
		while (true) {
		System.out.println("		>> Hãy nhập vào 1 số chẵn: ");
		int a = sc.nextInt();
		if (a % 2 == 0) {
		System.out.println("		>> Bạm vừa nhập vào:" + a);
		return;
		} else {
		System.out.println("		=>> Nhập sai, đây không phải là số chẵn");

		}
		}
		}

//		Question 8: Viết chương trình thực hiện theo flow sau:
//		Bước 1:
//		Chương trình in ra text "mời bạn nhập vào chức năng muốn sử
//		dụng"
//		Bước 2:
//		Nếu người dùng nhập vào 1 thì sẽ thực hiện tạo account
//		Nếu người dùng nhập vào 2 thì sẽ thực hiện chức năng tạo
//		department
//		Nếu người dùng nhập vào số khác thì in ra text "Mời bạn nhập
//		lại" và quay trở lại bước 1
		private static void question8() {
			
		System.out.println("***	Question 8:");
		System.out.println("	  Viết chương trình thực hiện theo flow");

		Scanner sc = new Scanner(System.in);
		int choose;
		while (true) {
		System.out.println("		>> Mời bạn chọn chức năng: 1. Tạo Account, 2. Tạo Department");

		choose = sc.nextInt();
		if (choose == 1 || choose == 2) {
		switch (choose) {
		case 1:
		question5();
		break;
		case 2:
		question7();
		break;
		}
		return;
		} else {
		System.out.println("		>>  Nhập lại: ");
		}
		}
		}

//Question 9: Viết method cho phép người dùng thêm group vào account theo flow sau:
//		Bước 1:
//In ra tên các usernames của user cho người dùng xem
//		Bước 2:
//Yêu cầu người dùng nhập vào username của account
//		Bước 3:
//In ra tên các group cho người dùng xem
//		Bước 4:
//Yêu cầu người dùng nhập vào tên của group
//		Bước 5:
//Dựa vào username và tên của group người dùng vừa chọn, hãy
//thêm account vào group đó .
		private static void question9() {
		System.out.println("***	Question 9:");
		System.out.println("	  Viết method cho phép người dùng thêm group vào account theo flow ");
			
			Scanner sc = new Scanner(System.in);
			// Tạo Group
			Group group1 = new Group();
			group1.groupID = 4 ;
			group1.groupName = "Testing_System";
			group1.createDate = LocalDate.of(2021, 1, 1);
			Group group2 = new Group();
			group2.groupID= 5;
			group2.groupName= "Development";
			group2.createDate = LocalDate.of(2020, 2, 1);
			Group group3 = new Group();
			group3.groupID = 6;
			group3.groupName= "Sale";
			group3.createDate = LocalDate.of(2019, 9, 23);

			// Tạo Account

			Account acc1 = new Account();
			acc1.accountID = 1;
			acc1.email = "daonq1";
			acc1.userName = "daonq1";
			acc1.fullName = "Dao Nguyen 1";
			acc1.createDateEx5 = LocalDate.now();
			Account acc2 = new Account();
			acc2.accountID = 2;
			acc2.email = "daonq2";
			acc2.userName = "daonq2";
			acc2.fullName = "Dao Nguyen 2";
			acc2.createDateEx5 = LocalDate.of(2021, 03, 17);
			Account acc3 = new Account();
			acc3.accountID = 3;
			acc3.email = "daonq3";
			acc3.userName = "daonq3";
			acc3.fullName = "Dao Nguyen 3";
			acc3.createDateEx5 = LocalDate.now();

			Account[] accArray = { acc1, acc2, acc3 };
			Group[] groupArray = { group1, group2, group3 };
			System.out.println("		>> Danh sách User đang có trên hệ thống: ");
			for (int i = 0; i < accArray.length; i++) {
			System.out.println(accArray[i].userName);
}
			System.out.println("		>> Nhập vào UserName của account: ");
			String userName = sc.next();
			System.out.println("		>> Danh sách Group đang có trên hệ thống: ");
			for (int i = 0; i < accArray.length; i++) {
			System.out.println(groupArray[i].groupName);
}
			System.out.println("		>> Nhập vào tên Group cần thêm: ");
			String groupName = sc.next();
			int indexGroup = -1;
			for (int i = 0; i < groupArray.length; i++) {
			if (groupArray[i].groupName.equals(groupName)) {
			indexGroup = i;
}
}
			int indexAccount = -1;
			for (int j = 0; j < accArray.length; j++) {
			if (accArray[j].userName.equals(userName)) {
			indexAccount = j;
}
}
			if (indexAccount < 0 || indexGroup < 0) {
			System.out.println("*** Kiểm tra lại thông tin bạn nhập, không có Account hoặc group này trên hệ thống");

			} else {
			for (int j = 0; j < accArray.length; j++) {
			if (accArray[j].userName.equals(userName)) {
			Group[] gpAdd = { groupArray[indexGroup] };
			accArray[j].groups = gpAdd;
			System.out.println("Bạn vừa Add group: " + accArray[indexAccount].groups[0].groupName + " cho Account: "+accArray[indexAccount].userName);
}
}
}
}
;
//Question 10: Tiếp tục Question 8 và Question 9
//	Bổ sung thêm vào bước 2 của Question 8 như sau:
//	*	Nếu người dùng nhập vào 3 thì sẽ thực hiện chức năng thêm group vào account
//	Bổ sung thêm Bước 3 của Question 8 như sau:
//	*	Sau khi người dùng thực hiện xong chức năng ở bước 2 thì in ra dòng
//		text để hỏi người dùng "Bạn có muốn thực hiện chức năng khác
//		không?". Nếu người dùng chọn "Có" thì quay lại bước 1, nếu người
//		dùng chọn "Không" thì kết thúc chương trình (sử dụng lệnh return để
//		kết thúc chương trình)
		
	private static void question10() {
	System.out.println("***	Question 10:");
	System.out.println("	  Viết chương trình thực hiện theo flow ");

	Scanner sc = new Scanner(System.in);
	int choose;
	while (true) {
		System.out.println("		>> Mời bạn chọn chức năng: 1. Tạo Account, 2. Tạo Department, 3.Add Group vào Account");
		choose = sc.nextInt();
		if (choose == 1 || choose == 2 || choose == 3) {
			switch (choose) {
		case 1:
				question5();
				break;
		case 2:
				question7();
				break;
		case 3:
				question9();
				break;
}
		System.out.println("		>> Bạn có muốn tiếp tục không ? Hãy chọn Menu, Chọn 0 để thoát chương trình!");
			int ak = sc.nextInt();
		if (ak == 0) {
		System.out.println("Goodbye!!!");
		return;
}
		} else {
		System.out.println("Nhập lại: ");
}
}
}

//Question 11: Tiếp tục Question 10
//Bổ sung thêm vào bước 2 của Question 8 như sau:
//Nếu người dùng nhập vào 4 thì sẽ thực hiện chức năng thêm account
//vào 1 nhóm ngẫu nhiên, chức năng sẽ được cài đặt như sau:
//Bước 1:
//In ra tên các usernames của user cho người dùng xem
//6
//Bước 2:
//Yêu cầu người dùng nhập vào username của account
//Bước 3:
//Sau đó chương trình sẽ chọn ngẫu nhiên 1 group
//Bước 4:
//Thêm account vào group chương trình vừa chọn ngẫu nhiên

		private static void question11() {
		System.out.println("***	Question 11:");
		System.out.println("	  Viết chương trình thực hiện theo flow ");

		Scanner sc = new Scanner(System.in);
		int choose;
		while (true) {
		System.out.println("Mời bạn chọn chức năng: 1. Tạo Account, 2. Tạo Department, 3.Add Group vào Account, 4. Thêm Account vào 1 nhóm ngẫunhiên");
		choose = sc.nextInt();
		if (choose == 1 || choose == 2 || choose == 3 || choose == 4) {

			switch (choose) {
		case 1:
			question5();
			break;
		case 2:
			question7();
			break;
		case 3:
			question9();
			break;
		case 4:
			addAccountToRandomGroup();
			break;
			}
		System.out.println("Bạn có muốn tiếp tục không? Hãy chọn Menu, Chọn 0 để thoát chương trình!");
		int ak = sc.nextInt();
		if (ak == 0) {
			System.out.println("GoodBye!!!");
			return;
		}
		} else {
		System.out.println("Nhập lại: ");
}
}
}
		private static void addAccountToRandomGroup() {
			Scanner sc = new Scanner(System.in);
// Tạo Group
			Group group7 = new Group();
			group7.groupID = 7;
			group7.groupName = "Testing_System1";
			group7.createDate = LocalDate.of(2021, 1, 1);

			Group group8 = new Group();
			group8.groupID = 8;
			group8.groupName= "Development 1";
			group8.createDate = LocalDate.of(2020, 2, 1);

			Group group9 = new Group();
			group9.groupID = 9;
			group9.groupName = "Sale VIP";
			group9.createDate = LocalDate.of(2019, 9, 23);

// Tạo Account

			Account acc7 = new Account();
			acc7.accountID = 7;
			acc7.email = "jguuhuh@gmail.com";
			acc7.userName = "Anh Pham";
			acc7.fullName = "Nguyen Pham Anh";
			acc7.createDateEx5 = LocalDate.now();
			
			Account acc8 = new Account();
			acc8.accountID = 8;
			acc8.email = "sckjdkjdihuh@gmail.com";
			acc8.userName = "dongnhi";
			acc8.fullName = "Nguyen dong nhi";
			acc8.createDateEx5 = LocalDate.of(2021, 03, 17);
			
			Account acc9 = new Account();
			acc9.accountID = 9;
			acc9.email = "daonq3@gmail.com";
			acc9.userName = "DoanThanh";
			acc9.fullName = "Doan Thu Thanh";
			acc9.createDateEx5 = LocalDate.now();
			
			Account[] accArray = { acc7, acc8, acc9 };
			Group[] groupArray = { group7, group8, group9 };
			System.out.println("		>> Danh sách User đang có trên hệ thống: ");
			for (int i = 0; i < accArray.length; i++) {
			System.out.println(accArray[i].userName);
}
			System.out.println("		>> Nhập vào UserName của account: ");
			String userName = sc.next();
			System.out.println("Danh sách Group đang có trên hệ thống: ");
			for (int i = 0; i < accArray.length; i++) {
			System.out.println(groupArray[i].groupName);
}

			Random random = new Random();
			int indexGroup = random.nextInt(2);
			int indexAccount = -1;
			for (int j = 0; j < accArray.length; j++) {
			if (accArray[j].userName.equals(userName)) {
				indexAccount = j;
			}
			}
			if (indexAccount < 0) {
			System.out.println("	*** Kiểm tra lại thông tin bạn nhập, không có Account này trên hệ thống");

			} else {
			for (int j = 0; j < accArray.length; j++) {
			if (accArray[j].userName.equals(userName)) {
			Group[] gpAdd = { groupArray[indexGroup] };
			accArray[j].groups = gpAdd;
			System.out.println("Bạn vừa Add group: " + accArray[indexAccount].groups[0].groupName+ " cho Account: "+ accArray[indexAccount].userName);
					}
				}
			}
		}
	}