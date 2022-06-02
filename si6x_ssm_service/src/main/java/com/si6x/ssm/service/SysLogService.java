package com.si6x.ssm.service;

import com.si6x.ssm.pojo.SysLog;

import java.util.List;

public interface SysLogService {

    /**
     * 保存日志
     * @param sysLog
     * @throws Exception
     */
    void saveSysLog(SysLog sysLog) throws Exception;

    /**
     * 查询所有日志
     * @return
     */
    List<SysLog> findAllSysLog() throws Exception;
}
