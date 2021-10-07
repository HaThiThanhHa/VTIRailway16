package com.vti.backend;

import java.util.Scanner;
import com.vti.entity.MyMath;
import com.vti.entity.Square;

public class Exercise2_Ques4 {

	private Scanner sc;
	public Exercise2_Ques4() {
	 sc = new Scanner(System.in);
		}
	public void question() {
		MyMath myMath = new MyMath();
		while (true) {
			System.out.println("=======================================================================");

			System.out.println("=================Lựa chọn chức năng bạn muốn sử dụng===================");

			System.out.println("=== 1. Tính tổng 2 số kiểu int. ===");

			System.out.println("=== 2. Tính tổng 2 số kiểu byte. ===");

			System.out.println("=== 3. Tính tổng 2 số kiểu Float. ===");

			System.out.println("=== 4. Tính tổng 2 số kiểu int và float. ===");

			System.out.println("=== 5. Tính tổng 2 số kiểu Byte và float. ===");

			System.out.println("=== 6. Exit.===");
			System.out.println("=======================================================================");

			int menuChoose = sc.nextInt();
			switch (menuChoose) {
			case 1:
				System.out.println("Nhập vào số int 1: ");
				int int1 = sc.nextInt();
				System.out.println("Nhập vào số int 2: ");
				int int2 = sc.nextInt();
				System.out.println("Tổng 2 số là: " +

						myMath.getSum(int1, int2));
				break;

			case 2:
				System.out.println("Nhập vào số byte 1: ");
				byte byte1 = sc.nextByte();
				System.out.println("Nhập vào số byte 2: ");
				byte byte2 = sc.nextByte();
				System.out.println("Tổng 2 số là: " +

						myMath.getSum(byte1, byte2));
				break;
			case 3:
				System.out.println("Nhập vào số float 1: ");
				Float float1 = sc.nextFloat();
				System.out.println("Nhập vào số float 2: ");
				Float float2 = sc.nextFloat();
				System.out.println("Tổng 2 số là: " +

						myMath.getSum(float1, float2));
				break;
			case 4:
				System.out.println("Nhập vào số int 1: ");
				int int4 = sc.nextInt();
				System.out.println("Nhập vào số float 2: ");
				Float float4 = sc.nextFloat();
				System.out.println("Tổng 2 số là: " +

						myMath.getSum(float4, int4));
				break;
			case 5:
				System.out.println("Nhập vào số byte 1: ");
				byte byte5 = sc.nextByte();
				System.out.println("Nhập vào số float 2: ");
				Float float5 = sc.nextFloat();
				System.out.println("Tổng 2 số là: " +

						myMath.getSum(byte5, float5));
				break;
			case 6:
				return;
			}
		}
	}
}