package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SysLogMapper {

    /**
     * 保存日志
     * @param sysLog
     * @throws Exception
     */
    @Insert("insert into ssm.syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void saveSysLog(SysLog sysLog) throws Exception;

    /**
     * 查询所有日志
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.syslog")
    List<SysLog> findAllSysLog() throws Exception;
}
