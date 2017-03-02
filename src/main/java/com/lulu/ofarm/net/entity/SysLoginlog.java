package com.lulu.ofarm.net.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;


/**
 * The persistent class for the sys_loginlog database table.
 * 
 */
@Entity
@Table(name="sys_loginlog")
@NamedQuery(name="SysLoginlog.findAll", query="SELECT s FROM SysLoginlog s")
public class SysLoginlog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "idGenerator")
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@Column(length = 32)
	private String id;

	private String ip;

	private String loginname;

	@Temporal(TemporalType.TIMESTAMP)
	private Date logintime;

	public SysLoginlog() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getLoginname() {
		return this.loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public Date getLogintime() {
		return this.logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

}