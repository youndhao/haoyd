package com.manager.service.impl;

import java.util.List;






import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import com.manager.entity.InfoStockEntity;
import com.manager.entity.StockExport;
import com.manager.entity.InfoStockExport;
import com.manager.mapping.StockExportMapper;
import com.manager.service.IStockExportService;
import com.manager.util.Page;
@Service

public class StockExportServiceImpl implements IStockExportService {
	@Autowired
	StockExportMapper stockExportMapper;

	@Override
	public List<StockExport> selectAll() {
		return stockExportMapper.stockExportList();
	}

	


}
