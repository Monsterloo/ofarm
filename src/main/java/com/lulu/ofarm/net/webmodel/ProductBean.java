package com.lulu.ofarm.net.webmodel;

public class ProductBean {

	private String pid;

	private String createtime;

	//产品库存数
	private int inventory;

	//产品出产地
	private String origin;

	//产品分类编号
	private String pcategory;
	
	private String pcategoryName;

	//产品图片路径
	private String pimg;

	//产品名字
	private String pname;

	//产品单价
	private double price;

	//产品单位
	private String punit;

	//产品状态
	private String state;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPcategoryName() {
		return pcategoryName;
	}

	public void setPcategoryName(String pcategoryName) {
		this.pcategoryName = pcategoryName;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPunit() {
		return punit;
	}

	public void setPunit(String punit) {
		this.punit = punit;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	

}
