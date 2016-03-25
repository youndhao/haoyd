package com.manager.service;

import java.util.List;
import java.util.Map;

import org.javatuples.Pair;

import com.manager.entity.BudgetList;
import com.manager.entity.BuyMaterialList;
import com.manager.entity.BuyOrder;
import com.manager.entity.BuyOrderList;
import com.manager.entity.Material;
import com.manager.entity.Materials;
import com.manager.entity.QueryMaterial;
import com.manager.entity.Time;




public interface IBuyService {

	Pair<Integer, List<BuyOrderList>> orderlist(BuyOrder buyOrder);

	Pair<Integer, List<Material>> materialList(QueryMaterial qMaterial);

	int addMaterial(Material material);

	List<Material> selectMaterial();

	boolean saveBuyMaterial(Materials materials);

	List<Time> selectTime();

	Pair<Integer, List<BuyMaterialList>> buyMaterialList(BuyOrder order);

	int editState(BuyMaterialList buyMaterialList);
	

}
