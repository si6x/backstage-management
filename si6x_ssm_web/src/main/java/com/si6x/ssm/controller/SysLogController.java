package com.si6x.ssm.controller;

import com.si6x.ssm.pojo.SysLog;
import com.si6x.ssm.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Si6x
 */
@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    private SysLogService sysLogService;

    @Autowired
    public void setSysLogService(SysLogService sysLogService) {
        this.sysLogService = sysLogService;
    }

    @RequestMapping("/findAllSysLog")
    public ModelAndView findAllSysLog() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogs = sysLogService.findAllSysLog();
        mv.addObject("sysLogs",sysLogs);
        mv.setViewName("syslog-list");
        return mv;
    }
}
