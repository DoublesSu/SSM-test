package com.atguigu.ssm_crud.service;

import com.atguigu.ssm_crud.pojo.Employee;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface EmployeeService {

    PageInfo<Employee> getAllEmployee(Integer pageNum);

    int saveEmployee(Employee employee);

    /**
     *检查用户名是否可用
     *@return True：可用，False：不可用
     */
    boolean checkUser(String userName);

    /**
    *根据Id获取员工信息
    *@return Employee
    */
    Employee getEmployeeById(String empId);

    /**
    *更新员工信息
    *@return int
    */
    int updateEmployee(Employee employee);

    /**
    *根据Id删除员工
    *@return int
    */
    int deleteEmployeeById(Integer empId);

    /**
    *根据集合中的Id删除员工
    *@return int
    */
    int deleteEmployeeByList(List<Integer> ids);
}
