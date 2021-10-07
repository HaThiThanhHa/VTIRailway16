package assignment;

public class Bt_buoi3 {

	public static void main(String[] args) {
		
		
		Account accDemo1 	= new Account();
		accDemo1.accountID 	=	100 ;
		accDemo1.fullName	=	"test1";
		
		Account accDemo2 	= new Account();
		accDemo2.accountID 	=	100 ;
		accDemo2.fullName	=	"test1";
		
		Account accDemo3 	= new Account();
		accDemo3.accountID 	=	100 ;
		accDemo3.fullName	=	"test1";
		
		
		System.out.println(accDemo1.equals(accDemo2));
		System.out.println(accDemo1.equals(accDemo3));
		
		
	}

}
