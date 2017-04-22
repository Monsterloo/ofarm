package com.lulu.ofarm.net.webmodel;

import java.util.List;

public class ChartBean {

	private double totalIncome;
	
	private double newOrders;
	
	private double productNumber;

	private List<PieBean> pbList;
	
	public double getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(double totalIncome) {
		this.totalIncome = totalIncome;
	}

	public double getNewOrders() {
		return newOrders;
	}

	public void setNewOrders(double newOrders) {
		this.newOrders = newOrders;
	}

	public double getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(double productNumber) {
		this.productNumber = productNumber;
	}

	public List<PieBean> getPbList() {
		return pbList;
	}

	public void setPbList(List<PieBean> pbList) {
		this.pbList = pbList;
	}
	
	
	
}
