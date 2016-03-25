package com.manager.mapping;

import java.util.List;

import com.manager.entity.BuyMaterial;
import com.manager.entity.BuyMaterialList;
import com.manager.entity.BuyOrder;
import com.manager.entity.BuyOrderList;
import com.manager.entity.Material;
import com.manager.entity.QueryMaterial;
import com.manager.entity.SaleCheckentity;
import com.manager.entity.Time;

public interface BuyMapper {

	Integer selectOrderTotal(BuyOrder buyOrder);

	List<BuyOrderList> orderList(BuyOrder buyOrder);

	Integer selectTotal(QueryMaterial qMaterial);

	List<Material> materialList(QueryMaterial qMaterial);

	int addMaterial(Material material);

	List<Material> selectMaterials();

	int check(SaleCheckentity checkentity);

	String selectBid(BuyMaterial buyMaterial);

	int saveBMconn(BuyMaterial buyMaterial);

	int saveBuyMaterial(BuyMaterial buyMaterial);

	List<Time> selectTime();

	Integer selectMaterialTotal(BuyOrder order);

	List<BuyMaterialList> buyMaterialList(BuyOrder order);

	int editState(BuyMaterialList buyMaterialList);

}
