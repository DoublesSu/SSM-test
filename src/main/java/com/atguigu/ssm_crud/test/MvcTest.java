//package com.atguigu.ssm_crud.test;
//
//import com.atguigu.ssm_crud.pojo.Employee;
//import com.github.pagehelper.PageInfo;
//import org.junit.Before;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mock.web.MockHttpServletRequest;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.MvcResult;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//import org.junit.Test;
//
//import java.util.List;
//
//
///**
// * Description：
// *
// * @author Su
// * version 1.0
// * @date 2022/10/10 23:49
// */
//@WebAppConfiguration
//@RunWith(SpringJUnit4ClassRunner.class)
////直接使用类路径
//@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:dispatcherServlet-servlet.xml"})
//public class MvcTest {
//
//    //虚拟mvc
//    MockMvc mockMvc;
//
//    @Autowired
//    WebApplicationContext context;
//
//    @Before
//    public void testMVC() {
//        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
//    }
//
//
//    @Test
//    public void testPage() throws Exception {
//        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNum", "5")).andReturn();
//
//
////        请求成功后，请求域中存在pageInfo对象
//        MockHttpServletRequest request = mvcResult.getRequest();
//        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
//        System.out.println("当前页面：" + pageInfo.getPageNum());
//        System.out.println("总页码：" + pageInfo.getPages());
//        System.out.println("总记录数：" + pageInfo.getTotal());
//        System.out.println("========================");
//
//        int[] nums = pageInfo.getNavigatepageNums();
//        for (int i : nums) {
//            System.out.println(" " + i);
//        }
//        System.out.println("========================");
//        List<Employee> list = pageInfo.getList();
//
//        for (Employee employee : list) {
//            System.out.println(employee);
//        }
//
//
//        //请求域中查询的page为null，Controller类未添加@Controller注解
//    }
//}
