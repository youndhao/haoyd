package com.manager.service.impl;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;








import com.manager.entity.BuyOrder;
import com.manager.entity.QueryProduct;
import com.manager.entity.SaleBudgetList;
import com.manager.entity.SaleHistory;
import com.manager.entity.Product;
import com.manager.entity.Products;
import com.manager.entity.SaleCheckentity;
import com.manager.entity.Time;
import com.manager.mapping.SaleMapper;
import com.manager.service.ISaleService;
import com.manager.util.Page;
import com.manager.util.UuidCreat;

@Service
public class SaleServiceImpl implements ISaleService {
	@Autowired 
	private SaleMapper saleMapper;

	@Override
	public List<Product> selectProducts() {
		// TODO Auto-generated method stub
		return saleMapper.selectProducts();
	}

	@Override
	public boolean saveSaleHistory(Products products) {
		boolean a = true;
		String hid = null;
		int type = products.getType();
		SaleCheckentity checkentity = new SaleCheckentity();
		List<SaleHistory> list = products.getSalehist();
		for(SaleHistory sale:list){
			checkentity.setYear(sale.getYear());
			checkentity.setTime(sale.getTime());
			checkentity.setType(type);
			sale.setType(type);
			if(saleMapper.check(checkentity)>0){
				hid = saleMapper.selectPid(sale);
				sale.setHid(hid);
				if(saleMapper.savePSconn(sale)!=1){
					a=false; 
				}else{
					a= true;
				}
				
			}else{
				hid = UuidCreat.getUuid("HID-");
				sale.setHid(hid);
				if(saleMapper.saveSaleHistory(sale)!=1){
					a=false;
				}else{
					if(saleMapper.savePSconn(sale)!=1){
						a=false; 
					}else{
						a= true;
					}
				}
			}
		}
		return a;
	}

	@Override
	public List<SaleBudgetList> saleYearList(BuyOrder order) {

		return saleMapper.saleYearList(order);
	}

	@Override
	public List<SaleBudgetList> saleTimeList(BuyOrder order) {
	
		return saleMapper.saleTimeList(order);
	}

	@Override
	public Pair<Integer, List<Product>> productList(QueryProduct qproduct) {
		Integer total = saleMapper.selectTotal(qproduct);
		Page page = qproduct.getPage();
		page.setTotal(total);
		List<Product> list = saleMapper.productList(qproduct);
		return Pair.with(total, list);
	}

	@Override
	public int addProduct(Product p) {
		return saleMapper.addProduct(p);
	}

	@Override
	public List<Time> selectTime() {
		return saleMapper.selectTime();
	}

	@Override
	public Pair<Integer, List<SaleBudgetList>> budgetList(BuyOrder order) {
		Integer total = saleMapper.selectBudgetTotal(order);
		Page page = order.getPage();
		page.setTotal(total);
		List<SaleBudgetList> list = saleMapper.budgetList(order);
		return Pair.with(total, list);
	}

}
