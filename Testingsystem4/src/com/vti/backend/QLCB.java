package com.vti.backend;

import java.util.ArrayList;
import java.util.Scanner;

import com.vti.entity2.CanBo;
import com.vti.entity2.Gender;

public class QLCB {

	public QLCB() {
	}

	static ArrayList<com.vti.entity2.CanBo> listCanBo = new ArrayList<>();

	// a) Thêm mới cán bộ
	public static void themmoiCanbo() {

		@SuppressWarnings("resource")
		Scanner scanner = new Scanner(System.in);
		com.vti.entity2.CanBo canbo1 = new com.vti.entity2.CanBo();
		System.out.println("Nhập tên cán bộ:");
		canbo1.setFullName(scanner.nextLine());
		System.out.println("Nhập tuổi cán bộ:");
		canbo1.setAge(scanner.nextInt());
		scanner.nextLine();
		System.out.println("Nhập giới tính cán bộ:(1-Male;2-Female;3-Unknown)");
		if (scanner.hasNextInt()) {
			switch (scanner.nextInt()) {
			case 1:
				canbo1.setGender(com.vti.entity2.Gender.Male);
				break;
			case 2:
				canbo1.setGender(com.vti.entity2.Gender.Female);
				break;
			case 3:
				canbo1.setGender(com.vti.entity2.Gender.UNKNOWN);
				break;
			default:
				break;
			}
		}
		scanner.hasNextLine();
		System.out.println(canbo1);
		listCanBo.add(canbo1);

	}

	public void themmoiCanbo2(String fullName, int age) {
		com.vti.entity2.CanBo canBo = new com.vti.entity2.CanBo();
		canBo.setFullName(fullName);
		canBo.setAge(age);
		listCanBo.add(canBo);
	}

	// them canbo1 vào trong mảng listCanBo để quản lý
	// c) Hiện thị thông tin về danh sách các cán bộ
	@Override
	public String toString() {
		return "QLCB [listCanBo=" + listCanBo + "]";
	}

	public static void xemdanhsachCanbo() {

		for (com.vti.entity2.CanBo canBo : listCanBo) {
			System.out.println(canBo);
		}
	}

	// tim kiem theo ho ten
	public void timKiemTheoHoTen() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhap ten can bo muon tim");
		String search = scanner.nextLine();
		for (com.vti.entity2.CanBo canBo : listCanBo) {
			if (canBo.getFullName().toLowerCase().indexOf(search.toLowerCase()) >= 0) {
				System.out.println(canBo);

			}
		}
	}
	public void xoaTheoName() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập tên cần xóa thông tin: ");
		String search = scanner.nextLine();
		listCanBo.removeIf(canBo -> canBo.getFullName().equals(search));
		System.out.println(listCanBo);
	
	
}
	// d) nhap vao ten can bo va xoa can bo do
	public void deleteTheoHoTen() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhap ten can bo muon xoa");
		String search = scanner.nextLine();
		for (int i = 0; i < listCanBo.size(); i++) {

			if (listCanBo.get(i).getFullName().toLowerCase().indexOf(search.toLowerCase()) >= 0) {
				listCanBo.remove(i);
				i = i - 1;
				System.out.println(listCanBo);
			}
		}
	}
}