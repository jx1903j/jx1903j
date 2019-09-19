package com.soft.web;

import com.soft.biz.UserBiz;
import com.soft.entity.TblAdmin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/adminlist")
public class AdminlistHandler {

    private List<TblAdmin> userlist;
    private Map<String,Object> usermap=new HashMap<String, Object>();
    @Resource
    private UserBiz userBiz;
    @RequestMapping("/index.action")
    public ModelAndView find(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value="/userinfo4.action", method= RequestMethod.GET, produces="application/json;charset=utf-8")
    public @ResponseBody Map userinfo4(int page,String uname,int limit){


        int thispage=(page-1)*limit;
        userlist=userBiz.userlist(thispage,uname,limit);
        List usercount=userBiz.usercount(uname);
        int pagecount=usercount.size();
        usermap.put("code",0);
        usermap.put("count",pagecount);
        usermap.put("data",userlist);
        return usermap;
    }
    @RequestMapping("/reg.action")
    public ModelAndView addadmin(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/reg");
        return mav;
    }
    @RequestMapping("/userList.action")
    public ModelAndView userList(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/UserList");
        return mav;
    }


}
