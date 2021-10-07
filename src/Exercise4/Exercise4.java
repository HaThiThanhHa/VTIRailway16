package Exercise4;

import java.time.LocalDate;
import java.util.Random;

public class Exercise4 {

	public static void main(String[] args) {

//		Exercise 4 (Optional): Random Number
//		Question 1:
//		In ngẫu nhiên ra 1 số nguyên


		System.out.println(">>>>>>>>		Exercise 4 (Optional): Random Number		<<<<<<<<");
		System.out.println("***	Question 1:");
		System.out.println("	 In ngẫu nhiên ra 1 số nguyên");
			
		Random random = new Random();
		int n = random.nextInt();
		System.out.println("	>>>	Số ngẫu nhiên: " + n);

//		Question 2:
//		In ngẫu nhiên ra 1 số thực
		System.out.println("***	Question 2:");
		System.out.println("	 In ngẫu nhiên ra 1 số thực");
		float f = random.nextFloat();
		System.out.println("		>>>	Số ngẫu nhiên: " + f);

//		Question 3:
//		Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in ngẫu nhiên ra tên của 1 bạn

		System.out.println("***	Question 3:");
		System.out.println("	 Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in ngẫu nhiên ra tên của 1 bạn");

		String[] nameArr = { "Hoang", "Binh", "Dung", "Yen", "Vy" };
		int i = random.nextInt(nameArr.length);
		System.out.println("		>>> Tên ngẫu nhiên 1 bạn trong lớp: " + nameArr[i]);

//		Question 4:
//		Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995
		
		System.out.println("***	Question 4:");
		System.out.println("	 Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995 :");
		
		int minDay = (int) LocalDate.of(1995, 7, 24).toEpochDay(); 
		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();

		long randomInt = minDay + random.nextInt(maxDay - minDay); 
		LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
		System.out.println("		>>> "+randomDay);

//		Question 5:
//		Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
		
		System.out.println("***	Question 5:");
		System.out.println("	 Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây");
		
		int now = (int) LocalDate.now().toEpochDay();
		int randomDate = now - random.nextInt(365);
		LocalDate reusultDate = LocalDate.ofEpochDay(randomDate);
		System.out.println("	>>>	Ngày ngẫu nhiên là: " + reusultDate);

//		Question 6:
//		Lấy ngẫu nhiên 1 ngày trong quá khứ
		System.out.println("***	Question 6:");
		System.out.println("		 Lấy ngẫu nhiên 1 ngày trong quá khứ");
		
		int 		maxDay1 	= (int) LocalDate.now().toEpochDay();
		long 		randomDay1 	= random.nextInt(maxDay1);
		LocalDate 	resultDate1 = LocalDate.ofEpochDay(randomDay1);
		System.out.println("		>>> 1 Ngày ngẫu nhiên trong quá khứ :	" + resultDate1);

//		Question 7:
//		Lấy ngẫu nhiên 1 số có 3 chữ số
		System.out.println("***	Question 7:");
		System.out.println("	 Lấy ngẫu nhiên 1 số có 3 chữ số :");
		
		int z = random.nextInt(999 - 100 + 1) + 100;
		System.out.println("	>>>	"+ z);
	}

}
