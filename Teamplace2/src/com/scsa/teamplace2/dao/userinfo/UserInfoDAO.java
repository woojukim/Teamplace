package com.scsa.teamplace2.dao.userinfo;

import java.util.List;

import com.scsa.teamplace2.vo.UserInfo;

public interface UserInfoDAO {

	public void delete(String useremail);

	public void insert(UserInfo userinfo);

	public List<UserInfo> select();

	public UserInfo select(String useremail);

	public void update(UserInfo userinfo);

}