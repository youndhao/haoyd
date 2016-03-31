package com.manager.service.impl;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.entity.Contact;
import com.manager.entity.InfoContactEntity;
import com.manager.mapping.ContactMapper;
import com.manager.service.IContactService;
import com.manager.util.Page;
@Service
public class ContactServiceImpl implements IContactService {
  @Autowired ContactMapper contactMapper;
	@Override
	public Pair<Integer, List<Contact>> allContactList(
			InfoContactEntity contactentity) {
		Integer total=contactMapper.selectTotalContact(contactentity);
		Page page=contactentity.getPage();
		page.setTotal(total);
		List<Contact> list=contactMapper.allContactList(contactentity);
		return Pair.with(total, list);
		
	}
	@Override
	public int insertcontact(Contact contact) {
		return contactMapper.insertcontact(contact);

	}
	@Override
	public int deletecontact(int[] id) {
		return contactMapper.deletecontact(id);
	}
	@Override
	public int updatecontact(Contact contact) {
		return contactMapper.updatecontact(contact);
	}

}
