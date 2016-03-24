package com.manager.mapping;

import java.util.List;

import com.manager.entity.InfoStockEntity;
import com.manager.entity.StockEntity;

public interface StockMapper {

	int updatestock(StockEntity stockentity);

	Integer selectTotalStock(InfoStockEntity infostockentity);

	List<StockEntity> allStockList(InfoStockEntity infostockentity);

	int insertstock(StockEntity stockentity);

	int deletestock(int[] id);

}
