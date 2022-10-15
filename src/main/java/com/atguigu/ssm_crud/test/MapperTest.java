//package com.atguigu.ssm_crud.test;
//
//import com.atguigu.ssm_crud.controller.EmployeeController;
//import com.atguigu.ssm_crud.mapper.DepartmentMapper;
//import com.atguigu.ssm_crud.mapper.EmployeeMapper;
//import com.atguigu.ssm_crud.pojo.Department;
//import com.atguigu.ssm_crud.pojo.Employee;
//import com.atguigu.ssm_crud.service.EmployeeService;
//import com.github.pagehelper.Page;
//import com.github.pagehelper.PageInfo;
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mock.web.MockHttpServletRequest;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.MvcResult;
//import org.springframework.test.web.servlet.ResultActions;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//
//import java.util.Iterator;
//import java.util.List;
//import java.util.UUID;
//
///**
// * Description：
// *
// * @author Su
// * version 1.0
// * @date 2022/10/10 20:08
// */
//@WebAppConfiguration
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
//public class MapperTest {
//
//    @Autowired
//    EmployeeMapper employeeMapper;
//
//    @Autowired
//    EmployeeService employeeService;
//
//    @Autowired
//    DepartmentMapper departmentMapper;
//
//    @Autowired
//    SqlSession sqlSession;
//
//    @Test
//    public void testCRUD() {
////        System.out.println(employeeService);
////
////        List<Employee> employees = employeeMapper.selectByExampleWithDept(3);
////        for (Employee employee:employees){
////            System.out.println(employee);
////插入部门信息
////        departmentMapper.insertSelective(new Department(null, "开发部"));
////        departmentMapper.insertSelective(new Department(null, "人事部"));
////        List<Department> departments = departmentMapper.selectByExample(null);
////        System.out.println(departments.size());
//
////        employeeMapper.insert(new Employee(null,"Tom","女","123@qq.com",3));
////        employeeMapper.insert(new Employee(null,"Jerry","女","123@qq.com",2));
//
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class );
//        for (int i=0;i<200;i++){
//            String uuid = UUID.randomUUID().toString().substring(1,4);
//            mapper.insertSelective(new Employee(null,uuid+":"+i,"M",uuid+"@qq.com",4));
//        }
//
//    }
//
//}
//
//
//
