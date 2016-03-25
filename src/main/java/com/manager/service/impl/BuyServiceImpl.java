package com.manager.service.impl;

import java.util.List;
import java.util.Map;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;








import com.manager.entity.BudgetList;
import com.manager.entity.BuyMaterial;
import com.manager.entity.BuyMaterialList;
import com.manager.entity.BuyOrder;
import com.manager.entity.BuyOrderList;
import com.manager.entity.Material;
import com.manager.entity.Materials;
import com.manager.entity.QueryMaterial;
import com.manager.entity.SaleCheckentity;
import com.manager.entity.Time;
import com.manager.mapping.BuyMapper;
import com.manager.service.IBuyService;
import com.manager.util.Page;
import com.manager.util.UuidCreat;
@Service
public class BuyServiceImpl implements IBuyService {
  @Autowired BuyMapper buyMapper;
  
	@Override
	public Pair<Integer, List<BuyOrderList>> orderlist(BuyOrder buyOrder) {
		// TODO Auto-generated method stub
		Integer total=buyMapper.selectOrderTotal(buyOrder);
		Page page=buyOrder.getPage();
		page.setTotal(total);
		List<BuyOrderList> list=buyMapper.orderList(buyOrder);
		return Pair.with(total, list);
	}

	@Override
	public Pair<Integer, List<Material>> materialList(QueryMaterial qMaterial) {
		Integer total=buyMapper.selectTotal(qMaterial);
		Page page=qMaterial.getPage();
		page.setTotal(total);
		List<Material> list=buyMapper.materialList(qMaterial);
		return Pair.with(total, list);
	}

	@Override
	public int addMaterial(Material material) {
		// TODO Auto-generated method stub
		return buyMapper.addMaterial(material);
	}

	@Override
	public List<Material> selectMaterial() {
		// TODO Auto-generated method stub
		return buyMapper.selectMaterials();
	}

	@Override
	public boolean saveBuyMaterial(Materials materials) {
		boolean a = true;
		String bid = null;
		SaleCheckentity checkentity = new SaleCheckentity();
		List<BuyMaterial> list = materials.getBuymaterials();
		for(BuyMaterial sale:list){
			checkentity.setYear(sale.getYear());
			checkentity.setTime(sale.getTime());
			if(buyMapper.check(checkentity)>0){
				bid = buyMapper.selectBid(sale);
				sale.setBid(bid);
				if(buyMapper.saveBMconn(sale)!=1){
					a=false; 
				}else{
					a= true;
				}
				
			}else{
				bid = UuidCreat.getUuid("BID-");
				sale.setBid(bid);;
				if(buyMapper.saveBuyMaterial(sale)!=1){
					a=false;
				}else{
					if(buyMapper.saveBMconn(sale)!=1){
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
	public List<Time> selectTime() {
		return buyMapper.selectTime();
	}

	@Override
	public Pair<Integer, List<BuyMaterialList>> buyMaterialList(BuyOrder order) {
		Integer total = buyMapper.selectMaterialTotal(order);
		Page page = order.getPage();
		page.setTotal(total);
		List<BuyMaterialList> list = buyMapper.buyMaterialList(order);
		return Pair.with(total, list);
	}

	@Override
	public int editState(BuyMaterialList buyMaterialList) {
		return buyMapper.editState(buyMaterialList);
	}

	

}
