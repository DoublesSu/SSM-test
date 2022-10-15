package com.atguigu.ssm_crud.service;

import com.atguigu.ssm_crud.mapper.EmployeeMapper;
import com.atguigu.ssm_crud.pojo.Employee;
import com.atguigu.ssm_crud.pojo.EmployeeExample;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Description：
  *
 * @author Su
 * version 1.0
 * @date 2022/10/10 18:08
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public PageInfo<Employee> getAllEmployee(Integer pageNum) {
        PageHelper.startPage(pageNum, 5);
//        List<Employee> employees = employeeMapper.selectByExample(null);
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        PageInfo<Employee> pageInfo = new PageInfo<>(employees, 5);

        return pageInfo;
    }

    @Override
    public int saveEmployee(Employee employee) {
        int count = employeeMapper.insertSelective(employee);

        return count;

    }

    /**
     * 检查用户名是否可用
     *
     * @return True：可用，False：不可用
     */
    @Override
    public boolean checkUser(String userName) {

        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpNameEqualTo(userName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    @Override
    public Employee getEmployeeById(String empId) {
        EmployeeExample example=new EmployeeExample();
        example.createCriteria().andEmpIdEqualTo(Integer.parseInt(empId));
        List<Employee> employees = employeeMapper.selectByExampleWithDept(example);
        Employee employee = employees.get(0);
        return employee;
    }

    @Override
    public int updateEmployee(Employee employee) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdEqualTo(employee.getEmpId());
        int count = employeeMapper.updateByExampleSelective(employee, example);
        return count;
    }

    @Override
    public int deleteEmployeeById(Integer empId) {
        return employeeMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public int deleteEmployeeByList(List<Integer> ids) {
        EmployeeExample example=new EmployeeExample();
        example.createCriteria().andEmpIdIn(ids);
        return employeeMapper.deleteByExample(example);
    }
}

//https://github.com/DoublesSu/git-demo.git
