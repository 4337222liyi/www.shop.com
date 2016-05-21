/* ==================================================================
 * 版权：    kcit 版权所有 (c) 2013
 * 文件：    jkjc.service.JcPrjJcItemService.java
 * 创建日期： 2015-12-08 下午 07:52:25
 * 功能：    接口：监测项目
 * 所含类:   {包含的类}
 * 修改记录：

 * 日期                        作者                内容
 * ==================================================================
 * 2015-12-08 下午 07:52:25  龚伟雄   创建文件，实现基本功能
 *
 * ==================================================================
 */
package com.ccthanking.business.jkjc.service;



import java.util.List;
import java.util.Map;

import com.ccthanking.business.jkjc.vo.JcPrjJcItemVO;
import com.ccthanking.framework.service.IBaseService;


/**
 * <p> JcPrjJcItemService.java </p>
 * <p> 功能：监测项目 </p>
 *
 * <p><a href="JcPrjJcItemService.java.html"><i>查看源代码</i></a></p>  
 *
 * @author <a href="mailto:gongwx_java@163.com">龚伟雄</a>
 * @version 0.1
 * @since 2015-12-08
 * 
 */
public interface JcPrjJcItemService extends IBaseService<JcPrjJcItemVO, String> {

	/**
     * 根据条件查询记录.
     * 
     * @param json
     * @param user
     * @return
     * @throws Exception
     * @since v1.00
     */
    String queryCondition(String json) throws Exception;
    
    /**
     * 新增记录.
     * 
     * @param json
     * @param user
     * @return
     * @throws Exception
     * @since v1.00
     */
    String insert(String json) throws Exception;

    /**
     * 修改记录.
     * 
     * @param json
     * @param user
     * @return
     * @throws Exception
     * @since v1.00
     */
    String update(String json) throws Exception;

    /**
     * 删除记录.
     * 
     * @param json
     * @param user
     * @return
     * @throws Exception
     * @since v1.00
     */
    String delete(String json) throws Exception;

	String queryById(String jCPRJITEMUID);

	Boolean removeData(String jCPRJITEMUID);

	List<Map<String, String>> queryJcObject();

	List<Map<String, String>> queryJcType();

}