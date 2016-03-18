package com.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.entity.User;
import com.manager.mapping.UserMapper;
import com.manager.service.IUserService;
@Service()
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userMapper;
	@Override
	public User login(User user) {

		return userMapper.login(user);
	}

}
