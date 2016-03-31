package com.manager.service;

import java.util.List;

import org.javatuples.Pair;

import com.manager.entity.Contact;
import com.manager.entity.InfoContactEntity;

public interface IContactService {

	Pair<Integer, List<Contact>> allContactList(InfoContactEntity contactentity);

	int insertcontact(Contact contact);

	int deletecontact(int[] id);

	int updatecontact(Contact contact);

}
