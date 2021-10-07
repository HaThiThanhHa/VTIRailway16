package com.vti.entity2;

public class NhanVien extends CanBo{

	public NhanVien() {
		// TODO Auto-generated constructor stub
	}

	private String	job;
	
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "NhanVien [job=" + job + ", toString()=" + super.toString() + "]";
	}

	}



