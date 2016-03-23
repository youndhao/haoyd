package com.manager.service;

import java.util.List;

import org.javatuples.Pair;

import com.manager.entity.InfoQueryEntity;
import com.manager.entity.User;
import com.manager.entity.UserPass;

public interface IUserService {
	public User login(User user) ;

	public int register(User record);

	public Pair<Integer, List<User>> selectinfo(InfoQueryEntity iEntity);

	public int changepass(UserPass up);

	public Pair<Integer, List<User>> allUserList(InfoQueryEntity iEntity);

	public int deleteuser(int[] id);

	public int updateuser(User u);
	

}
