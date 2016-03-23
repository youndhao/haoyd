package com.manager.util;



/**
 * 本类应用于查询中分页参数包装
 * <br/>
 * 使用方法：
 * <br/>
 * 1.封一个本类对象到查询bean的属性中;
 * <br/>
 * class QueryBean{
 * 
 * 	Page page;
 * 
 * }
 * <br/>
 * <br/>
 * 2.在查询前，设置一下本类对象的total属性;
 * <br/>
 * page.setTotal(2333);
 * <br/>
 * <br/>
 * 3.可以在查询bean里面获得startRow和endRow进行分页查询.
 * @author cxm
 *
 */
public class Page{
	

	private static Integer DEFAULT_CURRENT = 1;

	private static Integer DEFAULT_SIZE = 10;
	
	/**
	 * 当前页码
	 */
	private Integer currentPage;
	
	/**
	 * 每页大小
	 */
	private Integer pageSize;
	
	

	/**
	 * 开始行号
	 */
	private Integer startRow;
	
	/**
	 * 结束行号
	 */
	private Integer endRow;
	
	
	
	
	public Integer getPageSize() {
		return pageSize;
	}




	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}




	public Integer getCurrentPage() {
		return currentPage;
	}




	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}


	public Integer getStartRow() {
		return startRow;
	}


	public Integer getEndRow() {
		return endRow;
	}



	public void setTotal(Integer total) {

		Integer totalrows   = (total == null || total < 0 )? 0 : total;
		Integer pagesize    = (this.pageSize == null || this.pageSize < 1) ? DEFAULT_SIZE : this.pageSize;
		Integer pagecount   = totalrows / pagesize;
		Integer totalpage   = (totalrows - pagecount * pagesize) > 0 ? (pagecount + 1) : pagecount;
		Integer currentpage = this.currentPage == null ? DEFAULT_CURRENT : (this.currentPage < 1 ? 1 : (this.currentPage > totalpage ? totalpage : currentPage));
		this.startRow    = pagesize * (currentpage-1);
		this.endRow      = pagesize * currentpage;
	}

	
	

}
