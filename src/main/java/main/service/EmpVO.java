package main.service;

import java.lang.reflect.Field;

public class EmpVO {
	
	private String empno;
	private String name;
	private String dname;
	private String position;
	private String status;
	private String startdate;
	private String appoinmentdate;
	private String gender;
	private String phone;
	private String email;
	private String specialnote;
	private String delyn;
	
	private String from;
	private String to;
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getAppoinmentdate() {
		return appoinmentdate;
	}
	public void setAppoinmentdate(String appoinmentdate) {
		this.appoinmentdate = appoinmentdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSpecialnote() {
		return specialnote;
	}
	public void setSpecialnote(String specialnote) {
		this.specialnote = specialnote;
	}
	
	public void getVOvalue(Object vo) {
		for(Field field : vo.getClass().getDeclaredFields()){
			field.setAccessible(true);
			Object value;
			try {
				value = field.get(vo);
				System.out.println(field.getName()+" : "+value);
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
