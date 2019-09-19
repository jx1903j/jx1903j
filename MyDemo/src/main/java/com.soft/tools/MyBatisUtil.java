package com.soft.tools;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class MyBatisUtil {
    private static String sqlconf="SqlMapConfig.xml";
    public static SqlSessionFactory sf;
         static {
            Reader reader= null;
            try {
                reader = Resources.getResourceAsReader(sqlconf);
            } catch (IOException e) {
                e.printStackTrace();
            }
        SqlSessionFactoryBuilder sfb=new SqlSessionFactoryBuilder();
            sf= sfb.build(reader);
        }
        public static SqlSession getSession(){
             return sf.openSession();
        }

}
