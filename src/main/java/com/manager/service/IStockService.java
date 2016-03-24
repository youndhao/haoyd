package com.manager.service;

import java.util.List;

import org.javatuples.Pair;

import com.manager.entity.InfoStockEntity;
import com.manager.entity.StockEntity;


public interface IStockService {

	int updatestock(StockEntity stockentity);


	Pair<Integer, List<StockEntity>> allStockList(InfoStockEntity infostockentity);


	int insertstock(StockEntity stockentity);


	int deletestock(int[] id);

}
