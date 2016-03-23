package com.manager.mapping;

import java.util.List;

import com.manager.entity.BuyOrder;
import com.manager.entity.Product;
import com.manager.entity.QueryProduct;
import com.manager.entity.SaleBudgetList;
import com.manager.entity.SaleCheckentity;
import com.manager.entity.SaleHistory;
import com.manager.entity.Time;

public interface SaleMapper {

	 int check(SaleCheckentity checkentity) ;


	 String selectPid(SaleHistory sale) ;

	 int savePSconn(SaleHistory sale) ;
	
	 int saveSaleHistory(SaleHistory sale) ;
	

	 List<Product> selectProducts() ;


	List<SaleBudgetList> saleYearList(BuyOrder order);


	List<SaleBudgetList> saleTimeList(BuyOrder order);


	Integer selectTotal(QueryProduct qproduct);


	List<Product> productList(QueryProduct qproduct);


	int addProduct(Product p);


	List<Time> selectTime();


	Integer selectBudgetTotal(BuyOrder order);


	List<SaleBudgetList> budgetList(BuyOrder order);
	

}
