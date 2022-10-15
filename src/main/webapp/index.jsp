<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <%--    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">--%>

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.cn/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.cn/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<%--<script src="https://cdn.jsdelivr.cn/npm/jquery@1.12.4/dist/jquery.min.js"--%>
<%--        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"--%>
<%--        crossorigin="anonymous"></script>--%>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>


<%--<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>--%>
<%--<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">--%>

<!-- 员工添加的Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addModalLabel">添加员工</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名：</label>
                        <div class="col-xs-4">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱：</label>
                        <div class="col-xs-4">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-xs-4">
                            <%--提交时，传输部门Id即可--%>
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>


                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工编辑的Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="updateModalLabel">员工修改</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal" method="post">
                    <%--                    <input type="hidden" name="_method" value="PUT">--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label ">姓名：</label>
                        <div class="col-xs-4">
                            <p class="form-control-static" name="empName" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱：</label>
                        <div class="col-xs-4">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-xs-4">
                            <%--提交时，传输部门Id即可--%>
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>


                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工批量删除的Modal -->
<div class="modal fade" id="empDeleteMoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="deleteMoreModalLabel">批量删除</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal">
                    <table class="table table-hover" id="emps_delete_table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" name="">全选</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>邮箱</th>
                            <th>部门</th>
                        </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_delete_btn">删除</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>SSM-CRUD</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn" type="button">添加</button>
            <button class="btn btn-danger" id="emp_delete_more_btn">删除</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all">全选/全不选</th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>


    <div class="row">

        <%--        分页栏--%>
        <div id="page_nav_area" class="col-md-6"></div>

        <%--        分页信息--%>
        <div id="page_info_area" class="col-md-6"></div>
    </div>
</div>


<script type="text/javascript">
    // 页面加载完成，查询分页数据
    $(function () {
        // 启动加载员工页面
        to_page(1);
    });
    var nextPages;
    var prePages;
    var pageNum;
    var pageTotals;

    // 提取ajax请求
    function to_page(page) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pageNum=" + page,
            type: "GET",
            success: function (result) {

                pageNum = result.extend.pageInfo.pageNum;
                pageTotals = result.extend.pageInfo.pages;
                //调用显示员工分页
                build_emps_table(result)

                // 解析显示分页条
                build_page_nav(result)

                //调用显示分页信息
                build_page_info(result)
            }
        });
    }

    // 加载多选删除界面
    <%--function to_delete_page(pageNum) {--%>
    <%--    $.ajax({--%>
    <%--        url: "${APP_PATH}/emps",--%>
    <%--        data: "pageNum=" + pageNum,--%>
    <%--        type: "GET",--%>
    <%--        success: function (result) {--%>
    <%--            delete_emps_table(result)--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>


    // 弹出获取员工分页
    // function delete_emps_table(result) {
    //     // 每次调用前，清空页面数据
    //     $("#emps_delete_table tbody").empty();
    //
    //     var emps = result.extend.pageInfo.list;
    //     $.each(emps, function (index, item) {
    //         var empCheckTd = $("<input type='checkbox' class='check_item'></<input>");
    //         var empIdTd = $("<td></td>").append(item.empId);
    //         var empNameTd = $("<td></td>").append(item.empName);
    //         var empGenderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
    //         var empEmailTd = $("<td></td>").append(item.email);
    //         var empDeptTd = $("<td></td>").append(item.department.deptName);
    //         var empCheckTd = $("<input type='checkbox'></<input>");
    //
    //
    //         $("<tr></tr>").append(empCheckTd).append(empCheckTd).append(empIdTd).append(empNameTd)
    //             .append(empGenderTd).append(empEmailTd).append(empDeptTd).appendTo("#emps_delete_table tbody");
    //     });
    // }


    // 获取员工分页
    function build_emps_table(result) {
        // 每次调用前，清空页面数据
        $("#emps_table tbody").empty();
        //每次调用前，重置全选/全不选按钮的状态
        $("#check_all").prop("checked", false);

        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkTb = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var empEmailTd = $("<td></td>").append(item.email);
            var empDeptTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edi_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).attr("edit-id", item.empId).append("编辑");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).attr("delete-id", item.empId).attr("empName", item.empName).append("删除");

            var operatorTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkTb).append(empIdTd).append(empNameTd)
                .append(empGenderTd).append(empEmailTd).append(empDeptTd).append(operatorTd).appendTo("#emps_table tbody");
        });
    }

    // 全选/全不选绑定单击事件
    $(document).on("click", "#check_all", function () {
        // alert( $("#check_all").prop("checked"));
        $(".check_item").prop("checked", $(this).prop("checked"));

    });

    // 每一个checkbox绑定单击事件
    $(document).on("click", ".check_item", function () {
        // 选中个数是否等于当前checkbox的总个数，是否点满
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    })

    // 分页条
    function build_page_nav(result) {
        // $("#page_nav_area").append(result.extend.pageInfo.navigatepageNums)
        $("#page_nav_area").empty();
        // 提取pageHelp属性：
        var isFirstPage = result.extend.pageInfo.isFirstPage;
        var isLastPage = result.extend.pageInfo.isLastPage;
        var navigatepageNums = result.extend.pageInfo.navigatepageNums;


        var ul = $("<ul></ul>").addClass("pagination")
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#")); //to_page(1)
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#")); //to_page(result.extend.pageInfo.pageNum-1)

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"))
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"))

        // 首页则禁用，不是首页则绑定单击事件
        if (isFirstPage) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(pageNum - 1);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        // 从navigate获取页码，绑定单击事件，并添加到ul标签
        $.each(navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"))
            if (pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            })
            ul.append(numLi);
        });
        // 末页则禁用，不是末页则绑定单击事件
        if (isLastPage) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(pageTotals);
            });
        }

        ul.append(nextPageLi).append(lastPageLi);
        $("<nav></nav>").append(ul).appendTo("#page_nav_area");
    }

    // 分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();

        var total = result.extend.pageInfo.total;
        var pageSize = result.extend.pageInfo.pageSize;

        // 判断是否倒数第一条数据
        nextPages = (total % pageSize) == 0 ? pageTotals + 1 : pageTotals;
        prePages = (((total % pageSize) == 1) && (pageNum == pageTotals)) ? pageTotals - 1 : pageNum;

        $("#page_info_area").append("第" + pageNum + "页,共" + total + "条记录，共" + pageTotals + "页")
    }

    // 员工"添加"，弹出添加页面
    $("#emp_add_modal_btn").click(function () {
        // 清空表单样式及内容
        reset_form("#empAddModal form");

        // 获取部门信息
        getDepts("#dept_add_select");

        // 弹出Modal模态框
        $("#empAddModal").modal({
            // 点击背景不关闭
            backdrop: "static"
        })

    });

    //员工编辑按钮
    $(document).on("click", ".edi_btn", function () {
        // alert("editor");

        reset_form_style("#empUpdateModal form");

        // 1、回显员工信息
        var id = $(this).attr("edit-id");//idit-id，添加组件属性：员工的id信息
        getEmp(id);

        // 2、回显部门信息
        getDepts("#dept_update_select");

        // 3、弹出Modal模态框
        $("#empUpdateModal").modal({
            // 点击背景不关闭
            backdrop: "static"
        })

        // 4、更新按钮
        $("#emp_update_btn").click(function () {

            //+ "&_method=PUT"
            var str = $("#empUpdateModal form").serialize() + "&empName=" + $("#empName_update_static").text() + "&dId=" + $("#dept_update_select").val() + "&empId=" + $("#empName_update_static").attr("empId");
            // alert(str);
            $.ajax({
                url: "${APP_PATH}/emp/" + $("#empName_update_static").attr("empId"),
                data: str,
                type: "PUT",
                success: function (result) {
                    // alert("success")
                    if (100 == result.code) {
                        $("#empUpdateModal").modal("hide");
                        // 2、跳转到员工所在页面
                        to_page(pageNum);
                    }
                }
            });
        });
    })


    //员工删除按钮
    $(document).on("click", ".del_btn", function () {
        // 根据组件Id查
        var id = $(this).attr("delete-id");
        if (!confirm("确认删除[ " + $(this).attr("empName") + " ]的所有信息?")) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            data: null,
            type: "DELETE",
            success: function (result) {
                to_page(prePages);
                alert(result.msg);
            }
        })
    });

    // 更新邮箱，格式本地校验
    $("#email_update_input").change(function () {

        $("#email_update_input").find("*").removeClass("has-success has-error has-warning");
        // $("#email_update_input").find(".help-block").text("");

        if (!validate_form_email("#email_update_input")) {
            return false;
        }


        //清除就错误格式，添加成功格式
        // show_validate_msg("#email_update_input", "success", "前端校验：邮箱格式正确")
    })


    // 根据Id获取员工信息
    function getEmp(id) {

        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            data: null,
            type: "GET",
            success: function (result) {
                var empName = result.extend.employee.empName;
                var email = result.extend.employee.email;
                var gender = result.extend.employee.gender;
                var dId = result.extend.employee.dId;
                var empId = result.extend.employee.empId;


                $("#empName_update_static").attr("empId", empId)
                // p标签的文本信息是text（）
                $("#empName_update_static").text(empName);
                //input标签的文本信息是value（）
                $("#email_update_input").val(email);
                //多选一的选项属性value=选项对应的value
                $("#empUpdateModal input[name=gender]").val([gender]);//把需要选择的元素放在数组中
                $("#empUpdateModal select[name=dId]").val([dId]);//把需要选择的元素放在数组中,value=dId的元素

            }
        })
    }

    // 清空表单样式及内容
    function reset_form(ele) {
        // 清理当前对象的内容
        reset_form_content(ele)
        // 清空表单样式
        reset_form_style(ele)
    }

    function reset_form_content(ele) {
        $(ele)[0].reset();
    }

    function reset_form_style(ele) {
        $(ele).find("*").removeClass("has-success has-error has-warning");
        $(ele).find(".help-block").text("");
    }

    //获取部门信息
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            data: null,
            type: "GET",
            success: function (result) {
                // console.log(result)

                // 把得到的部门信息添加到下拉选框
                $.each(result.extend.depts, function (index, item) {
                    var optionEle = $("<option></option>>").append(item.deptName).attr("value", item.deptId);
                    optionEle.appendTo(ele);
                })
            }
        });
    }

    //前端校验输入的信息是否有效
    function validate_add_form() {

        if (!validate_form_empName("#empName_add_input")) {
            return false;
        }
        if (!validate_form_email("#email_add_input")) {
            return false;
        }
        return true;
    }

    // 校验empName格式
    function validate_form_empName(ele) {
        var empName = $("#empName_add_input").val();
        // jquery正则表达式
        var regName = /(^[a-zA-A0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;

        if (!regName.test(empName)) {
            // alert("用户名可以由3-5位中文或者5-16位英文组成");

            show_validate_msg(ele, "error", "用户名可以由3-5位中文或者5-16位英文组成");
            return false;
        } else {
            show_validate_msg(ele, "success", "用户名格式正确");
            return true;
        }

    }

    // 校验email格式
    function validate_form_email(ele) {

        var email = $(ele).val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        if (!regEmail.test(email)) {
            // alert("请检查邮箱格式");
            show_validate_msg(ele, "error", "邮箱格式错误");
            return false;
        } else {
            show_validate_msg(ele, "success", "邮箱格式正确");
            return true;
        }

    }

    // 添加邮箱，格式本地校验
    $("#email_add_input").change(function () {
        if (!validate_form_email("#email_add_input")) {
            return false;
        }
    })

    //服务器校验
    // 输入框内容改变后，发送ajax请求校验是否可用
    $("#empName_add_input").change(function () {

        //直接调用前端方法判断格式是否符合规则
        if (!validate_form_empName("#empName_add_input")) {
            return false;
        }

        // 发送ajax请求，校验输入的用户名是否可用
        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkUser",
            data: "empName=" + empName,
            type: "GET",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add_input", "success", result.msg)

                    // 添加保存button属性：可用
                    $("#emp_save_btn").attr("ajax-va", "success");
                } else if (result.code == 200) {
                    show_validate_msg("#empName_add_input", "error", result.msg)

                    // 添加保存button属性：不可用
                    $("#emp_save_btn").attr("ajax-va", "error");
                }
            }
            , error: function (XMLHttpRequest, textStatus, errorThrown) {
                //查看错误信息
                alert("出现错误");
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
    });

    // 提取正确、错误的格式信息
    function show_validate_msg(ele, status, msg) {
        // 清空表单的样式及内容
        $(ele).parent().removeClass("has-success has-error has-warning");
        $(ele).next("span").text("");

        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);

        }

    }

    // 点击保存按钮，数据库保存信息
    $("#emp_save_btn").click(function () {

        // 校验表单数据
        if (!validate_add_form()) {
            return false;
        }
        //查看按钮是否可用
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }

        //向发送保存请求，服务器保存数据
        $.ajax({
            url: "${APP_PATH}/emp",
            data: $("#empAddModal form").serialize(),
            type: "POST",
            success: function (result) {
                // alert(result.msg);
                if (result.code == 100) {
                    // 1、关闭modal视图
                    $("#empAddModal").modal("hide");
                    // 2、跳转到最后一页
                    to_page(nextPages);
                } else {
                    // 显示提示信息
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                }
            }
        });
    });

    //点击批量删除
    $("#emp_delete_more_btn").click(function () {
        //弹出选择式
        // to_delete_page(pageNum);


        //弹出批量删除MODAL
        // $("#empDeleteMoreModal").modal({
        //     backdrop: "static"
        // });

        var empNames = "";
        var empIds = "";
        $.each($(".check_item:checked"), function () {
            empNames += ($(this).parents("tr").find("button:eq(1)").attr("empname")) + ",";
            empIds += ($(this).parents("tr").find("button:eq(1)").attr("delete-id")) + "-";
        });

        empNames = empNames.substring(0, empNames.length - 1);
        empIds = empIds.substring(0, empIds.length - 1);

        if (confirm("确认删除【" + empNames + "】吗?")) {
            // 发送删除请求
            $.ajax({
                url: "${APP_PATH}/emp/" + empIds,
                data: null,
                type: "DELETE",
                success: function (result) {
                    // alert(pageNum);
                    to_page($(".check_item:checked").length == $(".check_item").length && (pageNum == pageTotals) ? pageNum - 1 : pageNum);
                }
            });
        }
    });

</script>

</body>
</html>

<%--{"code":200,"msg":"处理失败","extend":{"errorFields":{"email":"后台校验：邮箱格式错误"}}}--%>