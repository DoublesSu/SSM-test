package com.atguigu.ssm_crud.service;

import com.atguigu.ssm_crud.mapper.DepartmentMapper;
import com.atguigu.ssm_crud.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Description：
 *
 * @author Su
 * version 1.0
 * @date 2022/10/12 16:31
 */

@Service
public class DepertmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;


    @Override
    public List<Department> getAllDepartment() {
        return departmentMapper.selectByExample(null);
    }
}
