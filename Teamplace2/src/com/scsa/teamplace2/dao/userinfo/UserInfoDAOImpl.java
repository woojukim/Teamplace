package com.scsa.teamplace2.dao.userinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.teamplace2.vo.UserInfo;

@Repository("userInfoDAO")
public class UserInfoDAOImpl implements UserInfoDAO{

	SqlSession session;
	
	@Autowired
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void delete(String useremail) {
		session.delete("UserInfo.delete",useremail);
	}

	@Override
	public void insert(UserInfo userinfo) {
		session.insert("UserInfo.insert", userinfo);
	}

	@Override
	public List<UserInfo> select() {
		return session.selectList("UserInfo.selectList");
	}

	@Override
	public UserInfo select(String useremail) {
		return session.selectOne("UserInfo.select",useremail);
	}

	@Override
	public void update(UserInfo userinfo) {
		session.update("UserInfo.update",userinfo);
	}
}