package com.atguigu.ssm_crud.controller;


import com.atguigu.ssm_crud.pojo.Employee;
import com.atguigu.ssm_crud.pojo.Msg;
import com.atguigu.ssm_crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    //        @RequestMapping(value = "/emps")
    public String getAllEmployee(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model) {
        PageInfo pageInfo = employeeService.getAllEmployee(pageNum);
        model.addAttribute("pageInfo", pageInfo);
        return "employee_list";
    }

    /**
     * 查询员工信息，返回Json数据
     *
     * @return PageInfo
     */
    @ResponseBody
    @RequestMapping(value = "/emps")
    public Msg getAllEmployeeWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        PageInfo pageInfo = employeeService.getAllEmployee(pageNum);
//        model.addAttribute("pageInfo", pageInfo);

//        链式操作
        return Msg.success().add("pageInfo", pageInfo);
    }

    private Map<String, Object> errorMsgs;

    /**
     * 员工保存
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "emp", method = RequestMethod.POST)
    public Msg saveEmployee(@Valid Employee employee, BindingResult bindingResult) {//@Valid 封装的信息需要检验


        //        校验存在错误时
        if (bindingResult.hasErrors()) {
            Map<String, Object> errorMsgs = handleErrors(bindingResult);

            return Msg.fail().add("errorFields", errorMsgs);
        } else {
            employeeService.saveEmployee(employee);
        }

        return Msg.success();
    }


    private Map<String, Object> handleErrors(BindingResult bindingResult) {
        errorMsgs = new HashMap<>();

        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        for (FieldError fieldError : fieldErrors) {
//                获取错误字段的key，value
            errorMsgs.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        return errorMsgs;
    }

    /**
     * 检查用户名是否可用
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/checkUser", method = RequestMethod.GET)
    public Msg checkUser(Employee employee) {

        String empName = employee.getEmpName();
        String empReg = "(^[a-zA-A0-9_-]{5,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";

        if (!empName.matches(empReg)) {
            return Msg.fail("用户名格式错误，不可用");
        }

        boolean result = employeeService.checkUser(empName);

        //返回当前userName是否可用
        if (result) {
            return Msg.success("用户名可用");
        } else {
            return Msg.fail("用户名已存在，不可用");
        }
    }

    /**
     * 根据Id获取员工信息
     *
     * @return Msg
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.GET)
    public Msg getEmployeeById(@PathVariable("empId") String empId) {
        Employee employee = employeeService.getEmployeeById(empId);

        return Msg.success().add("employee", employee);
    }

    /**
     * 更新员工信息
     *
     * @return Msg
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    public Msg updateEmployee(@Valid Employee employee, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            Map<String, Object> errorMsgs = handleErrors(bindingResult);

            return Msg.fail().add("errorFields", errorMsgs);

        } else {

            int count = employeeService.updateEmployee(employee);

            return Msg.success();
        }
    }

    /**
     * 根据员工Id删除信息
     *
     * @return Msg
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empIds}", method = RequestMethod.DELETE)
    public Msg deleteEmployeeById(@PathVariable("empIds") String empIds) {
        int count;
        if (empIds.contains("-")) {
            List<Integer> ids = new ArrayList<>();
            String[] idsStr = empIds.split("-");
            for (String str : idsStr) {
                ids.add(Integer.parseInt(str));
            }
            count = employeeService.deleteEmployeeByList(ids);

        } else {
            int empId = Integer.parseInt(empIds);
            count = employeeService.deleteEmployeeById(empId);
        }


        return Msg.success();
    }
}


//IOC容器找不到EmployeeService的bean

//HTTP Status 404 - /ssm_crud/WEB-INF/views/emp.jsp