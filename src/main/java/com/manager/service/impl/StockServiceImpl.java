package com.manager.service.impl;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.entity.InfoStockEntity;
import com.manager.entity.StockEntity;
import com.manager.mapping.StockMapper;
import com.manager.service.IStockService;
import com.manager.util.Page;
@Service
public class StockServiceImpl implements IStockService {
   @Autowired 
   private StockMapper stockMapper;
	@Override
	public int updatestock(StockEntity stockentity) {
		return stockMapper.updatestock(stockentity);
	}
	@Override
	public Pair<Integer, List<StockEntity>> allStockList(InfoStockEntity infostockentity) {
		Integer total=stockMapper.selectTotalStock(infostockentity);
		Page page=infostockentity.getPage();
		page.setTotal(total);
		List<StockEntity> list=stockMapper.allStockList(infostockentity);
		return Pair.with(total, list);
	}
	@Override
	public int insertstock(StockEntity stockentity) {
		return stockMapper.insertstock(stockentity);
	}
	@Override
	public int deletestock(int[] id) {
		return stockMapper.deletestock(id);
	}

	

}
