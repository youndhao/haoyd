package com.manager.service.impl;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.entity.BudgetList;
import com.manager.entity.BuyOrder;
import com.manager.mapping.ManageMapper;
import com.manager.service.IManageService;
import com.manager.util.Page;
@Service
public class ManageServiceImpl implements IManageService {
@Autowired ManageMapper manageMapper;

@Override
public int updateSale(BuyOrder buyOrder) {
	// TODO Auto-generated method stub
	return manageMapper.updateSale(buyOrder);
}

@Override
public int updateOrder(BuyOrder buyOrder) {
	// TODO Auto-generated method stub
	return manageMapper.updateOrder(buyOrder);
}

@Override
public Pair<Integer, List<BudgetList>> budgetList(BuyOrder buyOrder) {
	Integer total = manageMapper.selectTotal(buyOrder);
	Page page = buyOrder.getPage();
	page.setTotal(total);
	List<BudgetList> list = manageMapper.budgetList(buyOrder);
	return Pair.with(total, list);
}
	
}
