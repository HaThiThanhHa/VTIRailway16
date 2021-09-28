package Exercise2;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class A_Exercise2 {

	public static void main(String[] args) {

		
		//		Exercise 2 (Optional): System out printf

		System.out.println("			>>>>>>>>>>> Exercise 2 (Optional): System out printf <<<<<<<<<");
		
		System.out.println("***Question 1:");
		System.out.println("	Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số nguyên đó");
		int i = 5;
		System.out.printf("		>> Số nguyên được khai báo là:	","%d%n", i);
		System.out.printf("%d%n", i);

		
		
//		Question 2:
//		Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in ra số nguyên đó thành định dạng như sau: 100,000,000
	
		System.out.println("***Question 2:");
		System.out.println("	Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in ra số nguyên đó thành định dạng như sau: 100,000,000");

		int i1 = 100000000;
		System.out.printf("		>> Số nguyên được khai báo là:	",Locale.US, "%,d%n", i1);
		System.out.printf(Locale.US, "%,d%n", i1);

//		Question 3:
//		Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số đó chỉ bao gồm 4 số đằng sau
		System.out.println("***Question 3:");
		System.out.println("	Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số đó chỉ bao gồm 4 số đằng sau");

		float i3 = 5.567098f;
		System.out.printf("		>> Số nguyên được khai báo là:	","%5.4f%n", i3);
		System.out.printf("%5.4f%n", i3);

//		Question 4:
//		Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định dạng như sau:
//		Họ và tên: "Nguyễn Văn A" thì sẽ in ra trên console như sau:
//		Tên tôi là "Nguyễn Văn A" và tôi đang độc thân.
//
		System.out.println("***Question 4:");
		System.out.println("	Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định dạng");
		String i4 = "Nguyễn Văn A";
		System.out.printf("		>> Tên tôi là " + i4 + " và tôi đang độc thân ");
		
		System.out.println(" ");
//		Question 5:
//		Lấy thời gian bây giờ và in ra theo định dạng sau:
//		24/04/2020 11h:16p:20s
		System.out.println("***Question 5:");
		System.out.println("	Lấy thời gian bây giờ và in ra theo định dạng ");
		
		String pattern = "dd/MM/yyyy HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		System.out.print("	>> Thời gian hiện tại là:	 " );
		System.out.println(date);

		
//		Question 6:
//		In ra thông tin account (như Question 8 phần FOREACH) theo định dạng
//		table (giống trong Database)
	}

}
