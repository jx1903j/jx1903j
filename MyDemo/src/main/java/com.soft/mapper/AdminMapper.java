package com.soft.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AdminMapper {


    public List userlist(@Param("page") int page,@Param("uname") String uname,@Param("limit") Integer limit);
    public List usercount(@Param("uname") String uname);

}
