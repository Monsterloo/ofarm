package com.lulu.ofarm.net.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;


/**
 * The persistent class for the sys_admin database table.
 * 
 */
@Entity
@Table(name="sys_admin")
@NamedQuery(name="SysAdmin.findAll", query="SELECT s FROM SysAdmin s")
public class SysAdmin implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "idGenerator")
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@Column(length = 32)
	private String id;

	private String createtime;

	private String email;

	private String loginname;

	private String password;

	private String phone;

	private String roletype;

	private String state;

	public SysAdmin() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(String createTime) {
		this.createtime = createTime;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLoginname() {
		return this.loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRoletype() {
		return this.roletype;
	}

	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}