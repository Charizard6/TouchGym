package com.myspring.TouchGym.member.vo;

import org.springframework.stereotype.Component;

@Component("lockerVO")
public class LockerVO {

	private int lockerNum;
	private String lockerPWD;
	private String lockerMember;


	public LockerVO() {
		
	}

	public LockerVO(int lockerNum, String lockerPWD, String lockerMember) {
		this.lockerNum = lockerNum;
		this.lockerPWD = lockerPWD;
		this.lockerMember = lockerMember;
	}

	public int getlockerNum() {
		return lockerNum;
	}

	public void setlockerNum(int lockerNum) {
		this.lockerNum = lockerNum;
	}

	public String getlockerPWD() {
		return lockerPWD;
	}

	public void setlockerPWD(String lockerPWD) {
		this.lockerPWD = lockerPWD;
	}

	public String getlockerMember() {
		return lockerMember;
	}

	public void setlockerMember(String lockerMember) {
		this.lockerMember = lockerMember;
	}

}
