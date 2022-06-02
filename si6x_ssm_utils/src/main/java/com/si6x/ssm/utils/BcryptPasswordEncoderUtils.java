package com.si6x.ssm.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * @author Si6x
 */
public class BcryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    public static String encodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }

    public static void main(String[] args) {
        String password = "456";
        String pwd = encodePassword(password);
        //$2a$10$O3Dv6vEqiXjAaIE2vdGGYuWY29U6M.K9uTgvHz9T5BxQ8I4ccf/wO
        //$2a$10$d7ZkF9bCT.s1QjtgxkKg7ubrUD3EdxZ6z8zPu9lqzCY1pncodzldq
        System.out.println(pwd);
    }

}
