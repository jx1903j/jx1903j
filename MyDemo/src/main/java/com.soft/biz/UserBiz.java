package com.soft.biz;

import java.util.List;

public interface UserBiz {



    public List userlist(int page,String uname,int limit);
    public List usercount(String uname);

}
