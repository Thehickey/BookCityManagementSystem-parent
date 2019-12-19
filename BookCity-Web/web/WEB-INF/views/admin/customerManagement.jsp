<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/19
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
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

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input class="layui-input" placeholder="开始日" name="start" id="start">
            <input class="layui-input" placeholder="截止日" name="end" id="end">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./member-add.html',600,400)"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table">

    </table>

    <div class="page">

    </div>

    <script type="text/javascript">
        $(function () {
            customerList_load();
            page_load();
        })

        //删除用户
        function deleteCustomer() {
            $(".deleteCustomer").click(function () {
                if (confirm("确认要删除吗?")){
                    var customerId = $(this).attr("data-customerId");
                    $.ajax({
                        url:"/admin/deleteCustomer?customerId=" + customerId,
                        type:"POST",
                        contentType:"application/json;charset=utf-8",
                        success:function (result) {
                            if (result.data == true){
                                alert("删除成功")
                                customerList_load();
                            }else {
                                alert("删除失败")
                            }
                        }
                    })
                }
            })
        }

        //页码加载
        function page_load() {
            var resultVal = "";
            $.ajax({
                url:"/admin/customerList",
                type:"GET",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    resultVal += "<div>";
                    resultVal += "<a class=\"prev\" href=\"\">&lt;&lt;</a>";
                    $.each(result.data.navigatepageNums,function (index,element) {
                        resultVal += "<a class=\"num\" data-num=\""+element+"\" href=\"javascript:;\">"+element+"</a>";
                    })
                    resultVal += "<a class=\"next\" href=\"\">&gt;&gt;</a>";
                    resultVal += "</div>";
                    $(".page").empty().append(resultVal);
                    loadcustomerListBypageNum();
                }
            })
        }

        //点击页码查询用户
        function loadcustomerListBypageNum() {
            $(".num").click(function () {
                var num = $(this).attr("data-num");
                var resultVal = "";
                $.ajax({
                    url:"/admin/customerList?pageNum=" + num,
                    type:"GET",
                    contentType:"application/json;charset=utf-8",
                    success:function (result) {
                        resultVal += "<thead>";
                        resultVal += "<tr>";
                        resultVal += "<th>";
                        resultVal += "<div class=\"layui-unselect header layui-form-checkbox\" lay-skin=\"primary\"><i class=\"layui-icon\">&#xe605;</i></div>";
                        resultVal += "</th>";
                        resultVal += "<th>ID</th>";
                        resultVal += "<th>用户名</th>";
                        resultVal += "<th>性别</th>";
                        resultVal += "<th>手机</th>";
                        resultVal += "<th>邮箱</th>";
                        resultVal += "<th>地址</th>";
                        resultVal += "<th>身份证号</th>";
                        resultVal += "<th>操作</th></tr>";
                        resultVal += "</thead>";
                        $.each(result.data.list,function (index,element) {
                            resultVal += "<tbody>";
                            resultVal += "<tr>";
                            resultVal += "<td>";
                            resultVal += "<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\" data-id='2'><i class=\"layui-icon\">&#xe605;</i></div>";
                            resultVal += "</td>";
                            resultVal += "<td>"+element.customerId+"</td>";
                            resultVal += "<td>"+element.customerUsername+"</td>";
                            resultVal += "<td>"+element.customerGender+"</td>";
                            resultVal += "<td>"+element.customerPhone+"</td>";
                            resultVal += "<td>"+element.customerEmail+"</td>";
                            resultVal += "<td>"+element.customerAdress+"</td>";
                            resultVal += "<td>"+element.customerIdcard+"</td>";
                            resultVal += "<td class=\"td-manage\">";
                            resultVal += "<a onclick=\"x_admin_show('修改密码','/admin/updateCustomerPassword?customerId="+element.customerId+"',600,400)\" title=\"修改密码\" href=\"javascript:;\">";
                            resultVal += "<i class=\"layui-icon\">&#xe631;</i>";
                            resultVal += "</a>";
                            resultVal += "<a title=\"删除\" class=\"deleteCustomer\" data-customerId=\""+element.customerId+"\" href=\"javascript:;\">";
                            resultVal += "<i class=\"layui-icon\">&#xe640;</i>";
                            resultVal += "</a>";
                            resultVal += "</td>";
                            resultVal += "</tr>";
                            resultVal += "</tbody>";
                        })
                        $(".layui-table").empty().append(resultVal);
                        deleteCustomer();
                    }
                })
            })
        }

        //加载所有用户
        function customerList_load() {
            var resultVal = "";
            $.ajax({
                url:"/admin/customerList",
                type:"GET",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    resultVal += "<thead>";
                    resultVal += "<tr>";
                    resultVal += "<th>";
                    resultVal += "<div class=\"layui-unselect header layui-form-checkbox\" lay-skin=\"primary\"><i class=\"layui-icon\">&#xe605;</i></div>";
                    resultVal += "</th>";
                    resultVal += "<th>ID</th>";
                    resultVal += "<th>用户名</th>";
                    resultVal += "<th>性别</th>";
                    resultVal += "<th>手机</th>";
                    resultVal += "<th>邮箱</th>";
                    resultVal += "<th>地址</th>";
                    resultVal += "<th>身份证号</th>";
                    resultVal += "<th>操作</th></tr>";
                    resultVal += "</thead>";
                    $.each(result.data.list,function (index,element) {
                        resultVal += "<tbody>";
                        resultVal += "<tr>";
                        resultVal += "<td>";
                        resultVal += "<div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\" data-id='2'><i class=\"layui-icon\">&#xe605;</i></div>";
                        resultVal += "</td>";
                        resultVal += "<td>"+element.customerId+"</td>";
                        resultVal += "<td>"+element.customerUsername+"</td>";
                        resultVal += "<td>"+element.customerGender+"</td>";
                        resultVal += "<td>"+element.customerPhone+"</td>";
                        resultVal += "<td>"+element.customerEmail+"</td>";
                        resultVal += "<td>"+element.customerAdress+"</td>";
                        resultVal += "<td>"+element.customerIdcard+"</td>";
                        resultVal += "<td class=\"td-manage\">";
                        resultVal += "<a onclick=\"x_admin_show('修改密码','/admin/updateCustomerPassword?customerId="+element.customerId+"',600,400)\" title=\"修改密码\" href=\"javascript:;\">";
                        resultVal += "<i class=\"layui-icon\">&#xe631;</i>";
                        resultVal += "</a>";
                        resultVal += "<a title=\"删除\" class=\"deleteCustomer\" data-customerId=\""+element.customerId+"\" href=\"javascript:;\">";
                        resultVal += "<i class=\"layui-icon\">&#xe640;</i>";
                        resultVal += "</a>";
                        resultVal += "</td>";
                        resultVal += "</tr>";
                        resultVal += "</tbody>";
                    })
                    $(".layui-table").empty().append(resultVal);
                    deleteCustomer();
                }
            })
        }
    </script>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj,id){

    }



    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>

</html>
