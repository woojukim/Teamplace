package com.scsa.teamplace2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.teamplace2.dao.userinfo.UserInfoDAO;
import com.scsa.teamplace2.vo.UserInfo;

@Service("userInfoService")
@Transactional(propagation=Propagation.SUPPORTS)
public class UserInfoServiceImpl implements UserInfoService{

	UserInfoDAO userinfodao;
	
	@Autowired
	public void setUserinfodao(UserInfoDAO userinfodao) {
		this.userinfodao = userinfodao;
	}

	public UserInfoServiceImpl(){}

	public List<UserInfo> find(){
		return userinfodao.select();
	}

	public UserInfo find(String useremail){
		return userinfodao.select(useremail);
	}

	public void modify(UserInfo userinfo){
		userinfodao.update(userinfo);
	}

	public void remove(String useremail){
		userinfodao.delete(useremail);
	}

	public void save(UserInfo userinfo){
		userinfodao.insert(userinfo);
	}
}