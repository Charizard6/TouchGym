package com.myspring.TouchGym.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("paymentVO")
public class PaymentVO {
	
	private int pindex;
	private int pPrice;
	private Date pPaydate;
	private String pID;
	private String pInfo;
	
	@Override
	public String toString() {
		return "PaymentVO [index=" + pindex + ", pPrice=" + pPrice + ", pPaydate=" + pPaydate + ", pID=" + pID
				+ ", pInfo=" + pInfo + "]";
	}
	public PaymentVO() {}
	public PaymentVO(int pindex,int pPrice,Date pPaydate,String pID,String pInfo) {
		this.pindex=pindex;
		this.pPrice=pPrice;
		this.pPaydate=pPaydate;
		this.pID=pID;
		this.pInfo=pInfo;
	}
	public int getpindex() {
		return pindex;
	}
	public void setpindex(int pindex) {
		this.pindex=pindex;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice=pPrice;
	}
	public Date getpPaydate() {
		return pPaydate;
	}
	public void setpPaydate(Date pPaydate) {
		this.pPaydate=pPaydate;
	}
	public String getpID() {
		return pID;
	}
	public void setpID(String pID) {
		this.pID=pID;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo=pInfo;
	}
}
