package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.Member;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Si6x
 * 会员信息表
 */
@Repository
public interface MemberMapper {

    /**
     * 根据Id查询会员信息
     * @param memberId
     * @return
     * @throws Exception
     */
    @Select("select * from member where id = #{memberId}")
    public Member findByIdMember(String memberId) throws Exception;
}
