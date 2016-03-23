package com.manager.service.impl;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.entity.InfoQueryEntity;
import com.manager.entity.User;
import com.manager.entity.UserPass;
import com.manager.mapping.UserMapper;
import com.manager.service.IUserService;
import com.manager.util.Page;
@Service()
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userMapper;
	@Override
	public User login(User user) {

		return userMapper.login(user);
	}
	@Override
	public int register(User record) {
		return userMapper.insert(record);
		
	}
	@Override
	public Pair<Integer, List<User>> selectinfo(InfoQueryEntity iEntity) {
		Integer total=userMapper.selectTotal(iEntity);
		Page page=iEntity.getPage();
		
		page.setTotal(total);
		List<User> list=userMapper.selectinfo(iEntity);
		return Pair.with(total, list);
	}
	@Override
	public int changepass(UserPass userPass) {
		// TODO Auto-generated method stub
		return userMapper.changepass(userPass);
	}
	@Override
	public Pair<Integer, List<User>> allUserList(InfoQueryEntity iEntity) {
		Integer total=userMapper.selectTotalUser(iEntity);
		Page page=iEntity.getPage();
		page.setTotal(total);
		List<User> list=userMapper.allUserList(iEntity);
		return Pair.with(total, list);
	}
	@Override
	public int deleteuser(int[] id) {
		
		return userMapper.deleteuser(id);
	}
	@Override
	public int updateuser(User u) {
		
		return userMapper.updateuser(u);
	}

}
