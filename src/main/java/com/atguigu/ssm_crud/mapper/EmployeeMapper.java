package com.atguigu.ssm_crud.mapper;

import com.atguigu.ssm_crud.pojo.Employee;
import com.atguigu.ssm_crud.pojo.EmployeeExample;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

public interface EmployeeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int countByExample(EmployeeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int deleteByExample(EmployeeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int deleteByPrimaryKey(Integer empId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int insert(Employee record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int insertSelective(Employee record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    List<Employee> selectByExample(EmployeeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    Employee selectByPrimaryKey(Integer empId);

    List<Employee> selectByExampleWithDept(EmployeeExample example);

    Employee selectByPrimaryKeyWithDept(Integer empId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int updateByPrimaryKeySelective(Employee record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbggenerated Mon Oct 10 15:55:58 CST 2022
     */
    int updateByPrimaryKey(Employee record);
}