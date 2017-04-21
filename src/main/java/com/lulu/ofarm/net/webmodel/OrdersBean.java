package com.lulu.ofarm.net.webmodel;

import java.util.Date;
import java.util.List;

public class OrdersBean {
	private String oid;

	private String admin;

	private String adminId;
	
	private String createtime;

	private String customeraddress;

	private String customername;

	private String customerphone;

	private String note;

	private String state;

	private List<OrderdetailBean> orderdetailBeanList;
	
	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getCustomeraddress() {
		return customeraddress;
	}

	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerphone() {
		return customerphone;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<OrderdetailBean> getOrderdetailBeanList() {
		return orderdetailBeanList;
	}

	public void setOrderdetailBeanList(List<OrderdetailBean> orderdetailBeanList) {
		this.orderdetailBeanList = orderdetailBeanList;
	}

	
}
