package com.lulu.ofarm.net.webmodel;

public class ZtreeNode {
	private String id;
	
	private String pId;
	
	private String name;
	
	private String isParent;

	private String state;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsParent() {
		return isParent;
	}

	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}

	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "ZtreeNode [id=" + id + ", pId=" + pId + ", name=" + name + ", isParent=" + isParent + ", state=" + state
				+ "]";
	}
	
}
