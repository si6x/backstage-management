package com.si6x.ssm.controller;

import com.si6x.ssm.pojo.SysLog;
import com.si6x.ssm.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @author Si6x
 */
@Component
@Aspect
public class LogAop {

    private SysLogService sysLogService;
    private HttpServletRequest request;

    private Date visitTime; //开始时间
    private Class clazz; //访问的类
    private Method method; //访问的方法


    @Autowired
    public LogAop(HttpServletRequest request) {
        this.request = request;
    }

    @Autowired
    public void setSysLogService(SysLogService sysLogService) {
        this.sysLogService = sysLogService;
    }

    //前置通知 主要是获取开启时间，执行的哪一个类，哪一个方法
    @Before("execution(* com.si6x.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date(); //当前时间就是开始时间;
        clazz = jp.getTarget().getClass();//具体访问的类
        String methodName = jp.getSignature().getName();//获取访问的方法名称
        Object[] args = jp.getArgs(); //获取访问的方法参数


        //获取具体执行的方法的method对象
        if (args == null || args.length == 0){
            method = clazz.getMethod(methodName); // 只能获取无参数的方法
        }else{
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName,classArgs);
        }
    }

    @After("execution(* com.si6x.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        long time = new Date().getTime() - visitTime.getTime(); //获取访问时长

        String url = "";

        //获取url
        if (clazz != null && method != null && clazz != SysLogController.class){
            //获取类上的@RequestMapping(/"orders")
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);

            if (classAnnotation != null){
                String[] classValue = classAnnotation.value();
                //获取方法上的@RequestMapping(xxx)
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);

                if (methodAnnotation != null){
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0] + methodValue[0];
                }
            }

            //获取访问的ip
            String ip = request.getRemoteAddr();

            //获取当前的用户
            SecurityContext context = SecurityContextHolder.getContext(); //从上下文中获得当前的用户
            User user = (User) context.getAuthentication().getPrincipal();
            String username = user.getUsername();

            //将日志相关信息封装到Service对象
            SysLog sysLog = new SysLog();
            sysLog.setVisitTime(visitTime);
            sysLog.setUsername(username);
            sysLog.setIp(ip);
            sysLog.setUrl(url);
            sysLog.setExecutionTime(time);
            sysLog.setMethod("[类名] " + clazz.getName() + "[方法名] " + method.getName());

            //调用service完成
            sysLogService.saveSysLog(sysLog);
        }
    }
}
