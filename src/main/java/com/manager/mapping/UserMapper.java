package com.manager.mapping;

import java.util.List;

import com.manager.entity.InfoQueryEntity;
import com.manager.entity.User;
import com.manager.entity.UserPass;

public interface UserMapper {
	User login(User user);

	int insert(User record);

	Integer selectTotal(InfoQueryEntity iEntity);

	List<User> selectinfo(InfoQueryEntity iEntity);

	int changepass(UserPass userPass);

	List<User> allUserList(InfoQueryEntity iEntity);

	Integer selectTotalUser(InfoQueryEntity iEntity);

	int deleteuser(int[] id);

	int updateuser(User u);

}
