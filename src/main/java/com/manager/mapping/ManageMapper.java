package com.manager.mapping;

import java.util.List;

import com.manager.entity.BudgetList;
import com.manager.entity.BuyOrder;

public interface ManageMapper {

	int updateSale(BuyOrder buyOrder);

	int updateOrder(BuyOrder buyOrder);

	Integer selectTotal(BuyOrder buyOrder);

	List<BudgetList> budgetList(BuyOrder buyOrder);

}
