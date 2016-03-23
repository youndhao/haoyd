package com.manager.service;

import java.util.List;

import org.javatuples.Pair;

import com.manager.entity.BudgetList;
import com.manager.entity.BuyOrder;

public interface IManageService {

	int updateSale(BuyOrder buyOrder);

	int updateOrder(BuyOrder buyOrder);

	Pair<Integer, List<BudgetList>> budgetList(BuyOrder buyOrder);

}
