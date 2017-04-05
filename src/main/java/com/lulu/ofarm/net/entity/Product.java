package com.lulu.ofarm.net.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;


/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@Table(name="product")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "idGenerator")
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@Column(length = 32)
	private String pid;

	private String createtime;

	//产品库存数
	private int inventory;

	//产品出产地
	private String origin;

	//产品分类编号
	private String pcategory;

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

	public Product() {
	}

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getCreattime() {
		return this.createtime;
	}

	public void setCreattime(String createtime) {
		this.createtime = createtime;
	}

	public int getInventory() {
		return this.inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public String getOrigin() {
		return this.origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getPcategory() {
		return this.pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPimg() {
		return this.pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPunit() {
		return this.punit;
	}

	public void setPunit(String punit) {
		this.punit = punit;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}