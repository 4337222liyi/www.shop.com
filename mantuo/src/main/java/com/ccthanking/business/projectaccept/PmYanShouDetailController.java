/* ==================================================================
 * 版权：    kcit 版权所有 (c) 2013
 * 文件：    projectaccept.service.PmYanShouDetailController.java
 * 创建日期： 2016-03-28 上午 11:52:17
 * 功能：    服务控制类：工程验收
 * 所含类:   PmYanShouDetailService
 * 修改记录：

 * 日期                        作者                内容
 * ==================================================================
 * 2016-03-28 上午 11:52:17  龚伟雄   创建文件，实现基本功能
 *
 * ==================================================================
 */
package com.ccthanking.business.projectaccept;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccthanking.business.projectaccept.service.PmYanShouDetailService;
import com.ccthanking.framework.common.User;
import com.ccthanking.framework.common.rest.handle.servlet.RestContext;
import com.ccthanking.framework.model.requestJson;


/**
 * <p> PmYanShouDetailController.java </p>
 * <p> 功能：工程验收 </p>
 *
 * <p><a href="PmYanShouDetailController.java.html"><i>查看源代码</i></a></p>  
 *
 * @author <a href="mailto:gongwx_java@163.com">龚伟雄</a>
 * @version 0.1
 * @since 2016-03-28
 * 
 */

@Controller
@RequestMapping("/projectaccept/pmYanShouDetailController")
public class PmYanShouDetailController {

	private static Logger logger = LoggerFactory.getLogger(PmYanShouDetailController.class);

    @Autowired
    private PmYanShouDetailService pmYanShouDetailService;

    /**
     * 查询json
     * 
     * @param json
     * @return
     * @throws Exception
     */
    @RequestMapping(params = "query")
    @ResponseBody
    public requestJson queryCondition(final HttpServletRequest request, requestJson json) throws Exception {
        User user = RestContext.getCurrentUser();
        logger.info("<{}>执行操作【工程验收查询】",user.getName());
        requestJson j = new requestJson();
        String domresult = "";
        domresult = this.pmYanShouDetailService.queryCondition(json.getMsg());
        j.setMsg(domresult);
        return j;

    }

    /**
     * 保存数据json
     * 
     * @param json
     * @return
     * @throws Exception
     */
    @RequestMapping(params = "insert")
    @ResponseBody
    protected requestJson insert(final HttpServletRequest request, requestJson json) throws Exception {
        User user = RestContext.getCurrentUser();
        logger.info("<{}>执行操作【工程验收新增】",user.getName());
        requestJson j = new requestJson();
        String resultVO = "";
        resultVO = this.pmYanShouDetailService.insert(json.getMsg());
        j.setMsg(resultVO);
        return j;
    }

    /**
     * 修改记录.
     * 
     * @param request
     * @param json
     * @return
     * @throws Exception
     * @since v1.00
     */
    @RequestMapping(params = "update")
    @ResponseBody
    protected requestJson update(HttpServletRequest request, requestJson json) throws Exception {
        User user = RestContext.getCurrentUser();
        logger.info("<{}>执行操作【工程验收修改】",user.getName());
        requestJson j = new requestJson();
        String resultVO = "";
        resultVO = this.pmYanShouDetailService.update(json.getMsg());
        j.setMsg(resultVO);
        return j;
    }
    
    @RequestMapping(params = "batchUpdate")
    @ResponseBody
    protected requestJson batchUpdate(HttpServletRequest request, requestJson json) throws Exception {
        User user = RestContext.getCurrentUser();
        logger.info("<{}>执行操作【工程验收修改】",user.getName());
        requestJson j = new requestJson();
        String resultVO = "";
        resultVO = this.pmYanShouDetailService.batchUpdate(json.getMsg());
        j.setMsg(resultVO);
        return j;
    }

    /**
     * 删除记录.
     * 
     * @param request
     * @param json
     * @return
     * @throws Exception
     * @since v1.00
     */
    @RequestMapping(params = "delete")
    @ResponseBody
    public requestJson delete(HttpServletRequest request, requestJson json) throws Exception {
        User user = RestContext.getCurrentUser();
        logger.info("<{}>执行操作【工程验收删除】",user.getName());
        requestJson j = new requestJson();
        String resultVO = "";
        resultVO = this.pmYanShouDetailService.delete(json.getMsg());
        j.setMsg(resultVO);
        return j;
    }

    @RequestMapping(params = "querySon")
    @ResponseBody
    public requestJson  querySon(final HttpServletRequest request, requestJson json) throws Exception {
        User user = RestContext.getCurrentUser();
        logger.info("<{}>执行操作【工程验收子表查询】querySon",user.getName());
        requestJson j = new requestJson(); 
        List domresult = null;
        String yanshou_uid = request.getParameter("YANSHOU_UID");
        domresult = this.pmYanShouDetailService.querySon(json.getMsg(),yanshou_uid);
        j.setObj(domresult);
        return j; 
    }
    
}