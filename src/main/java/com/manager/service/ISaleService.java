package com.manager.service;

import java.util.List;

import org.javatuples.Pair;

import com.manager.entity.BuyOrder;
import com.manager.entity.Product;
import com.manager.entity.Products;
import com.manager.entity.QueryProduct;
import com.manager.entity.SaleBudgetList;
import com.manager.entity.Time;

public interface ISaleService {

	List<Product> selectProducts();

	boolean saveSaleHistory(Products products);

	List<SaleBudgetList> saleYearList(BuyOrder order);

	List<SaleBudgetList> saleTimeList(BuyOrder order);

	Pair<Integer, List<Product>> productList(QueryProduct qproduct);

	int addProduct(Product p);

	List<Time> selectTime();

	Pair<Integer, List<SaleBudgetList>> budgetList(BuyOrder order);

}
