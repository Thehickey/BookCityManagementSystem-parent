<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/19
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户密码修改</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/Background/css/font.css">
    <link rel="stylesheet" href="/static/Background/css/xadmin.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/Background/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/Background/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="L_username" class="layui-form-label">
                昵称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_username" disabled="" value="${customer.customerUsername}" class="layui-input">
            </div>
        </div>
        <input type="hidden" id="customerId" name="customerId" value="${customer.customerId}">
        <input type="hidden" id="customerPassword" value="${customer.customerPassword}">
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
                <span class="x-red">*</span>旧密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_repas" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_pass" class="layui-form-label">
                <span class="x-red">*</span>新密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_pass" name="customerPassword" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_repass" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="save" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".layui-btn").click(function () {
            //新密码不能为空
            if ($("#L_pass").val() == null){
                return;
            }
            //旧密码与当前密码不一致
            if ($("#L_repas").val() != $("#customerPassword").val()) {
                alert("旧密码与当前密码不一致");
                return;
            }
            //新密码与确认密码不一致
            if ($("#L_pass").val() != $("#L_repass").val()){
                alert("新密码与确认密码不一致");
                return;
            }
            var $jsonData = {};
            $.each($(".layui-form").serializeArray(), function(i,e){
                $jsonData[e.name] = e.value;
            })
            $.ajax({
                url:"/admin/updateCustomerPassword",
                data:JSON.stringify($jsonData),
                type:"POST",
                dataType:"json",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    if (result.data == true){
                        alert("密码修改成功")
                    }else {
                        alert("密码修改失败")
                    }
                }
            })
        })
    })

    //验证
    function verification() {
        
    }
</script>

</html>
