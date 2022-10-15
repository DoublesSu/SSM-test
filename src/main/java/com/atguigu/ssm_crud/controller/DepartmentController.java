package com.atguigu.ssm_crud.controller;

import com.atguigu.ssm_crud.pojo.Department;
import com.atguigu.ssm_crud.pojo.Msg;
import com.atguigu.ssm_crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Description：
 *
 * @author Su
 * version 1.0
 * @Date 2022/10/12 16:28
 */

@Controller
public class DepartmentController {


    @Autowired
    private DepartmentService departmentService;


    @ResponseBody
    @RequestMapping(value = "/depts", method = RequestMethod.GET)
    public Msg depts() {
        List<Department> depts = departmentService.getAllDepartment();

        return Msg.success("处理成功").add("depts",depts);
    }

    public void GitTest(){
        System.out.println("GitTest2");
        System.out.println("GitTest3");
        System.out.println("GitTest4");
        System.out.println("GitTest5-hot-fix");
    }


}
