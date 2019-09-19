package com.soft.biz;

import com.soft.mapper.AdminMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userBiz")
public class UserBizImpl implements UserBiz {
//    @Resource
//    private SqlSession session;
    @Resource
    private AdminMapper adminMapper;

    private boolean falg;


    @Override
    public List userlist(int page,String uname,int limit) { return adminMapper.userlist(page,uname,limit); }

    @Override
    public List usercount(String uname) {
        return adminMapper.usercount(uname);
    }
}
