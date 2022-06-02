package com.si6x.ssm.service.impl;

import com.si6x.ssm.mapper.SysLogMapper;
import com.si6x.ssm.pojo.SysLog;
import com.si6x.ssm.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysLogServiceImpl implements SysLogService {

    private SysLogMapper sysLogMapper;

    @Autowired
    public void setSysLogMapper(SysLogMapper sysLogMapper) {
        this.sysLogMapper = sysLogMapper;
    }

    /**
     * 保存日志
     * @param sysLog
     * @throws Exception
     */
    @Override
    public void saveSysLog(SysLog sysLog) throws Exception {
        sysLogMapper.saveSysLog(sysLog);
    }

    /**
     * 查询所有日志
     * @return
     * @throws Exception
     */
    @Override
    public List<SysLog> findAllSysLog() throws Exception {
        return sysLogMapper.findAllSysLog();
    }
}
