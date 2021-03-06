<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/18
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<body>
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
            <div class="layui-input-inline">
                <select name="contrller">
                    <option>支付状态</option>
                    <option>已支付</option>
                    <option>未支付</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="contrller">
                    <option>支付方式</option>
                    <option>支付宝</option>
                    <option>微信</option>
                    <option>货到付款</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="contrller">
                    <option value="">订单状态</option>
                    <option value="0">待确认</option>
                    <option value="1">已确认</option>
                    <option value="2">已收货</option>
                    <option value="3">已取消</option>
                    <option value="4">已完成</option>
                    <option value="5">已作废</option>
                </select>
            </div>
            <input type="text" name="username"  placeholder="请输入订单号" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./order-add.html')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>订单编号</th>
            <th>收货人</th>
            <th>总金额</th>
            <th>实付金额</th>
            <th>订单状态</th>
            <th>下单时间</th>
            <th >操作</th>
        </tr>
        </thead>
        <c:forEach var="orderMaster" items="${pageInfo.list}">
            <tbody>
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${orderMaster.orderSn}</td>
                <td>${orderMaster.orderCustomerName}:${orderMaster.orderCustomerPhone}</td>
                <td>${orderMaster.orderMoney}</td>
                <td>${orderMaster.orderPaymentMoney}</td>
                <td>
                    <c:if test="${orderMaster.orderStatus == 0}">
                        待付款
                    </c:if>
                    <c:if test="${orderMaster.orderStatus == 1}">
                        待发货
                    </c:if>
                    <c:if test="${orderMaster.orderStatus == 2}">
                        待收货
                    </c:if>
                    <c:if test="${orderMaster.orderStatus == 3}">
                        已收货
                    </c:if>
                </td>
                <td>${orderMaster.orderCreateTime}</td>
                <td class="td-manage">
                    <c:if test="${orderMaster.orderStatus == 0}">
                        <a class="pay" data-orderId="${orderMaster.orderId}" title="发货" href="javascript:;">
                            <span>提醒支付</span>
                        </a>
                    </c:if>
                    <c:if test="${orderMaster.orderStatus == 1}">
                        <a title="查看图书"  onclick="x_admin_show('编辑','/admin/getDetail?orderId=${orderMaster.orderId}')" href="javascript:;">
                            <i class="layui-icon">&#xe63c;</i>
                        </a>
                        <a class="consignment" data-orderId="${orderMaster.orderId}" title="发货" href="javascript:;">
                            <i class="layui-icon">&#xe601;</i>
                        </a>
                    </c:if>
                    <c:if test="${orderMaster.orderStatus == 2}">
                        <a class="takegoods" data-orderId="${orderMaster.orderId}" title="发货" href="javascript:;">
                            <span>提醒收货</span>
                        </a>
                    </c:if>
<%--                    <a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">--%>
<%--                        <i class="layui-icon">&#xe63c;</i>--%>
<%--                    </a>--%>
<%--                    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">--%>
<%--                        <i class="layui-icon">&#xe640;</i>--%>
<%--                    </a>--%>
                </td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="/admin/order?pageNum=${pageInfo.prePage}">&lt;&lt;</a>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <a href="/admin/order?pageNum=${num}">${num}</a>
            </c:forEach>
            <a class="next" href="/admin/order?pageNum=${pageInfo.nextPage}">&gt;&gt;</a>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        consignment();
    })

    function consignment() {
        $(".consignment").click(function () {
            var orderId = $(this).attr("data-orderId");
            $.ajax({
                url:"/admin/consignment?orderId=" + orderId,
                type:"POST",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    if (result.data == true){
                        alert("发货成功")
                        window.location.href = "/admin/order";
                    }else {
                        alert("发货失败");
                    }
                }
            })
        })
    }
</script>

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
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
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
