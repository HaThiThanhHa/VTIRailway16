package com.vti.entity2;

public class Date {
	private int day;
	private int month;
	private int year;

	public Date(int day, int month, int year) {
		this.day 	= day;
		this.month	= month;
		this.year 	= year;
	}

	public int getDay() {
		return day;
	}

	public int getMonth() {
		return month;
	}

	public int getYear() {
		return year;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public boolean isLeapYear() {
		year = this.year;
		boolean isLeap = false;
		
		if (year % 4 == 0) 
			{
			if (year % 100 == 0)
			{
			if (year % 400 == 0)
				return true;
			else
				return false;
		} else
return true;
} else {
return false;
}
}

	@Override
	public String toString() {
		return "Date [day=" + day + ", month=" + month + ", year=" + year

				+ "]";
	}
}
