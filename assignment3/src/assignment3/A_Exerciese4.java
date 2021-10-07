package assignment3;

import java.util.Scanner;

public class A_Exerciese4 {

	@SuppressWarnings("unused")
	private static Scanner sc;
	public static void main(String[] args) {
		question1() ;question2();question3();question4();question5();question6();
		question7() ;question8();question9();question10();question11();question12();
		question13() ;question14();question15();question16();
	}

//	
//	Question 1:
//		Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó (các từ có
//		thể cách nhau bằng nhiều khoảng trắng );
	private static void question1() {
		System.out.println(">>>>>>>>		Exercise 1:  (Optional): Datatype Casting		<<<<<<<<");
		System.out.println("***	Question 1:");
		System.out.println("	 Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó  ");		
		
		String s1;
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập chuỗi: ");
		s1 = scanner.nextLine();
		System.out.println("Số kí tự: " + s1.length());
		scanner.close();
		}
	;
	
//	Question 2:
//		Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
	private static void question2() {
	System.out.println("***	Question 2:");
	System.out.println("	  Noi 2 chuoi bat ki lai vs nhau"); 
	sc = new Scanner(System.in);
	Scanner sc1 = new Scanner(System.in);
	System.out.println("Nhập vào chuỗi 1: ");
	String s1 = sc1.next();
	System.out.println("Nhập vào chuỗi 2: ");
	String s2 = sc1.next();

	System.out.println("Kết quả sau khi nối chuỗi: " + s1 + " " + s2);
	sc1.close();
	}
	
	//
//	Question 3:
//		Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên chưa viết hoa chữ cái đầu
//		thì viết hoa lên
		public static void question3() {

		System.out.println("***	Question 3:");
		System.out.println("	  Viết chương trình để người dùng nhập vào tên và kiểm tra"); 
			
		Scanner scanner = new Scanner(System.in);
		String name;
		System.out.println("Nhập Tên: ");
		name = scanner.nextLine();
		String firstCharacter = name.substring(0, 1).toUpperCase();
		String leftCharacter = name.substring(1);
		System.out.println("char at:"+ name.charAt(1));
		name = firstCharacter + leftCharacter;
		System.out.println(name);
		scanner.close();
		}
		;
//		Question 4:
//		Viết chương trình để người dùng nhập vào tên và in từng ký tự trong tên
//		của người dùng ra
//		VD:
//		Người dùng nhập vào "Nam", hệ thống sẽ in ra
//		"Ký tự thứ 1 là: N"
//		"Ký tự thứ 1 là: A"
//		"Ký tự thứ 1 là: M"
		
		public static void question4() {
		System.out.println("***	Question 4:");
		System.out.println("	  Viết chương trình để người dùng nhập vào tên và in từng ký tự trong tên"); 
		String name;
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập tên: ");
		name = scanner.nextLine();
		name = name.toUpperCase();
		for (int i = 0; i < name.length(); i++) {
		System.out.println("Ký tự thứ " + i + " là: " + name.charAt(i));
		}
		scanner.close();
		}
//		Question 5:
//		Viết chương trình để người dùng nhập vào họ, sau đó yêu cầu người
//		dùng nhập vào tên và hệ thống sẽ in ra họ và tên đầy đủ
		public static void question5() {
		System.out.println("***	Question 5:");
		System.out.println("	  Viết chương trình để người dùng nhập vào họ và tên và hệ thống sẽ in ra họ và tên đầy đủ"); 
			
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập họ: ");
		String firstName = scanner.nextLine();
		System.out.println("Nhập tên: ");
		String lastName = scanner.nextLine();
		System.out.println("Họ tên đầy đủ: " + firstName.concat(lastName));
		scanner.close();
		}

//		Question 6:
//		Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
//		sau đó hệ thống sẽ tách ra họ, tên , tên đệm
//		VD:
//		Người dùng nhập vào "Nguyễn Văn Nam"
//		Hệ thống sẽ in ra
//		"Họ là: Nguyễn"
//		"Tên đệm là: Văn"
//		"Tên là: Nam"
		public static void question6() {
		System.out.println("***	Question 6:");
		System.out.println("	  Viết chương trình để người dùng nhập vào họ và tên sau đó hệ thống sẽ tách ra họ, tên , tên đệm"); 
		String fullName;
		String lastName = "", middleName = "", firstName = "";
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập họ tên đầy đủ:");
		fullName = scanner.nextLine();
		// Chuẩn hóa xâu
		fullName = fullName.trim();
		String[] words = fullName.split(" ");
		lastName = words[0];
		firstName = words[words.length - 1];
		for (int i = 1; i <= words.length - 2; i++) {
		middleName += words[i] + " ";
		}
		System.out.println("Họ là: " + lastName);
		System.out.println("Tên đệm là: " + middleName);
		System.out.println("Tên là: " + firstName);
		scanner.close();
		}
//		Question 7:
//		Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
//		chuẩn hóa họ và tên của họ như sau:
//		a) Xóa dấu cách ở đầu và cuối và giữa của chuỗi người dùng nhập
//		vào
//		VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
//		chuẩn hóa thành "nguyễn văn nam"
//		b) Viết hoa chữ cái mỗi từ của người dùng
//		VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
//		chuẩn hóa thành "Nguyễn Văn Nam"
		public static void question7() {
		System.out.println("***	Question 7:");
		System.out.println("	  Viết chương trình để người dùng nhập vào họ và tên sau đó chuẩn hóa họ và tên của họ"); 
			
		Scanner scanner = new Scanner(System.in);
		String fullName;
		System.out.println("Nhập họ tên đầy đủ");
		fullName = scanner.nextLine();
		scanner.close();
		// remove space characters
		fullName = fullName.trim();
		fullName = fullName.replaceAll("\\s+", " ");
		System.out.println("test"+ fullName);
		String[] words = fullName.split(" ");
		fullName = "";
		for (String word : words) {
		String firstCharacter = word.substring(0, 1).toUpperCase();
		String leftCharacter = word.substring(1);
		word = firstCharacter + leftCharacter;
		fullName += word + " ";
		}
		System.out.println("Họ tên sau khi chuẩn hóa: " + fullName);
		}

//		Question 8:
//		In ra tất cả các group có chứa chữ "Java"
		public static void question8() {
		System.out.println("***	Question 8:");
		System.out.println("	  In ra tất cả các group có chứa chữ \"Java\" "); 
				
		String[] groupNames = { "Java with VTI", "Cách qua môn gia va", "Học Java có khó không?" };

		for (String groupName : groupNames) {
		if (groupName.contains("Java")) {
		System.out.println(groupName);
		}
		}
		}
//		Question 9:
//		In ra tất cả các group "Java"
		public static void question9() {
		System.out.println("***	Question 9:");
		System.out.println("	  In ra tất cả các group \"Java\" "); 
		String[] groupNames = { "Java", "C#", "C++" };
		for (String groupName : groupNames) {
		if (groupName.equals("Java")) {
		System.out.println(groupName);
		}
		}
		}
//		Question 10 (Optional):
//		Kiểm tra 2 chuỗi có là đảo ngược của nhau hay không.
//		Nếu có xuất ra “OK” ngược lại “KO”.
//		Ví dụ “word” và “drow” là 2 chuỗi đảo ngược nhau.
		public static void question10() {
		System.out.println("***	Question 10:");
		System.out.println("	  Kiểm tra 2 chuỗi có là đảo ngược của nhau hay không. "); 
		Scanner scanner = new Scanner(System.in);
		String s1, s2, reverseS1 = "";
		System.out.println("Nhập chuỗi 1");
		s1 = scanner.nextLine();
		System.out.println("Nhập chuỗi 2");
		s2 = scanner.nextLine();
		scanner.close();
		for (int i = s1.length() - 1; i >= 0; i--) {
		reverseS1 += s1.substring(i, i + 1);
		}
		if (s2.equals(reverseS1)) {
		System.out.println("Đây là chuỗi đảo ngược !");
		}
		else {
		System.out.println("Đây không phải chuỗi đảo ngược");
		}
		}
//		Question 11 (Optional): Count special Character
//		Tìm số lần xuất hiện ký tự "a" trong chuỗi
		public static void question11() {
		System.out.println("***	Question 11:");
		System.out.println("	  	Tìm số lần xuất hiện ký tự \"a\" trong chuỗi "); 
		Scanner scanner = new Scanner(System.in);
		String str;
		System.out.println("Mời bạn nhập vào một chuỗi: ");
		str = scanner.nextLine();
		scanner.close();
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
		if ('a' == str.charAt(i)) {
		count++;
		}
		}

		System.out.println(count);
		}
		
//
		
		public static void question12() {
		System.out.println("***	Question 12:");
		System.out.println("	  	Đảo ngược chuỗi sử dụng vòng lặp"); 
		Scanner scanner = new Scanner(System.in);
		String s1, reverseS1 = "";
		System.out.println("Nhập chuỗi 1");
		s1 = scanner.nextLine();
		for (int i = s1.length() - 1; i >= 0; i--) {
		reverseS1 += s1.charAt(i);
		}
		System.out.println(reverseS1);
		scanner.close();
		}
//		Question 13 (Optional): String not contains digit
//		Kiểm tra một chuỗi có chứa chữ số hay không, nếu có in ra false ngược
//		lại true.
//		Ví dụ:
//		"abc" => true
//		"1abc", "abc1", "123", "a1bc", null => false
		
		public static void question13() {
		System.out.println("***	Question 13:");
		System.out.println("	  	Kiểm tra một chuỗi có chứa chữ số hay không");
		Scanner scanner = new Scanner(System.in);
		String str;
		System.out.println("Nhập chuỗi: ");
		str = scanner.nextLine();
		scanner.close();
		for (int i = 0; i < str.length(); i++) {
		if (checkKeyNumber(str.charAt(i))) {
		System.out.println("False");
		return;
		}
		}
		System.out.println("True");
		}
		public static boolean checkKeyNumber(char ch) {
		if (ch >= '0' && ch <= '9') {
		return true;
		}
		return false;
		}
//		Question 14 (Optional): Replace character
//		Cho một chuỗi str, chuyển các ký tự được chỉ định sang một ký tự khác
//		cho trước.
//		Ví dụ:
//		"VTI Academy" chuyển ký tự 'e' sang '*' kết quả " VTI Acad*my"
		
		public static void question14() {
		System.out.println("***	Question 14:");
		System.out.println("	  	Replace character");
			
		Scanner scanner = new Scanner(System.in);
		String str;
		char ch1, ch2;
		System.out.println("Nhập chuỗi: ");

		str = scanner.nextLine();
		System.out.println("Nhập kí tự muốn chuyển: ");
		ch1 = scanner.nextLine().toCharArray()[0]; // chuyển một mảng string sang array char, sau đó lấy phần tử thứ 0

		System.out.println("Nhập kí tự sẽ chuyển: ");
		ch2 = scanner.nextLine().toCharArray()[0];
		scanner.close();
		for (int i = 0; i < str.length(); i++) {
		if (str.charAt(i) == ch1) {
		str = str.replace(ch1, ch2);
		}
		}
		System.out.println("Chuoi sau khi chuyen: " + str);
		}
//		Question 15 (Optional): Revert string by word
//		Đảo ngược các ký tự của chuỗi cách nhau bởi dấu cách mà không dùng
//		thư viện.
//		Ví dụ: " I am developer " => "developer am I".
//		Các ký tự bên trong chỉ cách nhau đúng một dấu khoảng cách.
//		Gợi ý: Các bạn cần loại bỏ dấu cách ở đầu và cuối câu, thao tác cắt
//		chuỗi theo dấu cách
		public static void question15() {
		System.out.println("***	Question 15:");
		System.out.println("	  	 Revert string by word");
				
		Scanner scanner = new Scanner(System.in);
		String str;
		System.out.println("Chuỗi: ");
		str = scanner.nextLine();
		scanner.close();
		str = str.trim();
		str = str.replaceAll("\\s+", " ");
		String[] words = str.split(" ");
		for (int i = words.length - 1; i >= 0; i--) {
		System.out.print(words[i] + " ");
		}
		}
//		Question 16 (Optional):
//		Cho một chuỗi str và số nguyên n >= 0. Chia chuỗi str ra làm các phần
//		bằng nhau với n ký tự. Nếu chuỗi không chia được thì xuất ra màn
//		hình “KO”.
		public static void question16() {
		System.out.println("***	Question 1６:");
		System.out.println("	  	(Optional)");
		Scanner scanner = new Scanner(System.in);
		String str;
		int n;
		System.out.println("Chuỗi: ");
		str = scanner.nextLine();
		System.out.println("Nhập n: ");
		n = scanner.nextInt();
		scanner.close();
		if (str == null || str.isEmpty() || str.length() % n != 0) {
		System.out.println("No");
		return;
		}

		for (int i = 0; i < str.length(); i += n) {
		System.out.println(str.substring(i, i + n));
		}
		}
	
	}

