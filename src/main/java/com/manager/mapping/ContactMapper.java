package com.manager.mapping;

import java.util.List;

import com.manager.entity.Contact;
import com.manager.entity.InfoContactEntity;

public interface ContactMapper {

	 Integer selectTotalContact(InfoContactEntity contactentity) ;
		

	 List<Contact> allContactList(InfoContactEntity contactentity) ;


	int insertcontact(Contact contact);


	int deletecontact(int[] id);


	int updatecontact(Contact contact);
		
	
	

}
