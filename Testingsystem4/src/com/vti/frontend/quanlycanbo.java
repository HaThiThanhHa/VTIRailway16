package com.vti.frontend;

import com.vti.backend.QLCB;

public class quanlycanbo {

	public quanlycanbo() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {

		QLCB quanLy1 = new QLCB();
		QLCB.themmoiCanbo();
		quanLy1.themmoiCanbo2("nguyen manh", 10);
		quanLy1.themmoiCanbo2("nhi nguyen", 22);
		quanLy1.themmoiCanbo2("anh", 43);
		QLCB.xemdanhsachCanbo();
		
		quanLy1.xoaTheoName();
		quanLy1.deleteTheoHoTen();
		quanLy1.timKiemTheoHoTen();

	}

}
