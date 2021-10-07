package assignment;

import java.util.Date;
import java.util.Scanner;

public class Bt_buoi_hoc_thu_3 {

	@SuppressWarnings("resource")
	public static void main(String[] args) {


		Account[]	listAccount	= new Account[5];
		
		for (int i = 0 ; i < listAccount.length ; i++) {
	
			listAccount[i] 	=	new Account();
			listAccount[i].accountID 	= i+1;
			listAccount[i].fullName 	= "Nguyen" + (i+1);
		}
		
		for (int i = 0 ; i < listAccount.length ; i++) {
		System.out.println(listAccount[i].accountID +  " " + listAccount[i].fullName);
		
		
		}
		;
	// Ex2* Default value
	// Question1
		System.out.println("***		Question 1 		***");
		System.out.println("	  	Ex2* Default value");
		
		Account[] listAccount1	= new Account[5];
		
		for (int i1 = 0 ; i1 < listAccount.length ; i1++) {
			listAccount[i1] 			=	new Account();
			listAccount[i1].email		= "Email"+ (i1+1)+"@gmail.com";
			listAccount[i1].userName	= "UserName" +(i1+1);
			listAccount[i1].fullName 	= "Full_Name"+(i1+1);
			listAccount[i1].createDate	= new Date();
			System.out.println(listAccount[i1].email );
			System.out.println(listAccount[i1].userName);
			System.out.println(listAccount[i1].fullName);
			System.out.println(listAccount[i1].createDate);
			
		// Question1 * Dem ki tu trong chuoi
			System.out.println("***		Question 1 		***");
			System.out.println("	  Dem ki tu trong chuoi");
			String S1 = "chuoi ki tu bat ki    ";
			System.out.println(S1.length());
			
		// Question 2 * Noi 2 chuoi bat ki lai vs nhau
			System.out.println("***		Question 2 		***");
			System.out.println("	  Noi 2 chuoi bat ki lai vs nhau"); 
			
			String S2 = "ha ha ha ha ha";
			System.out.println(S1.concat(S2)); 	// cach1
			
			S1 = S1.concat(S2);					// cach 2
			System.out.println(S1);
		}
		
		// Question 3 * yeu cau nhap ten, Viet hoa chu cai dau len
		System.out.println("***		Question 3 		***");
		System.out.println("	  Noi 2 chuoi bat ki lai vs nhau"); 
		
			Scanner scanner = new Scanner(System.in);
			System.out.println("		>> Vui long nhap ho va ten :		");
			String ten = scanner.nextLine();
			String S11 = ten.substring(0,1).toUpperCase();	
			String S21 = ten.substring(1);
					
			String newName = S11+S21;
			System.out.println(newName);
	}	
		
	// Question 7 nhap day du ho va ten ,
	//	chuan hoa ten "nguyen    Van   Nam   " -> "Nguyen Van　Nam"

	@SuppressWarnings("unused")
	private static void questionA7() {
	System.out.println("***		Question 7 		***");
	System.out.println("	  Viết chương trình thực hiện theo yeu cau");

	}	
	
}

