package com.myspring.TouchGym.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", mName=" + mName + ", mPhone=" + mPhone + ", mStartDate=" + mStartDate
				+ ", mLastDate=" + mLastDate + "]";
	}

	private String id;
	private String mName;
	private String mPhone;
	private Date mStartDate;
	private Date mLastDate;

	public MemberVO() {
		
	}

	public MemberVO(String id, String mName, String mPhone, Date mStartDate, Date mLastDate) {
		this.id = id;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mStartDate = mStartDate;
		this.mLastDate = mLastDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public Date getmStartDate() {
		return mStartDate;
	}

	public void setmStartDate(Date mStartDate) {
		this.mStartDate = mStartDate;
	}

	public Date getmLastDate() {
		return mLastDate;
	}

	public void setmLastDate(Date mLastDate) {
		this.mLastDate = mLastDate;
	}

}
