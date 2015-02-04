package com.scsa.teamplace2.service;

import java.util.List;

import com.scsa.teamplace2.vo.UserInfo;

public interface UserInfoService {

	public List<UserInfo> find();

	public UserInfo find(String useremail);
	
	public void modify(UserInfo userinfo);

	public void remove(String useremail);

	public void save(UserInfo userinfo);
	
}