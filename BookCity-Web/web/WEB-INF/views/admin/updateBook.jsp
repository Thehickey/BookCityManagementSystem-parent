<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/20
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书信息修改</title>
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
        <input type="hidden" name="bookId" value="${book.bookId}">
        <div class="layui-form-item">
            <label for="B_bookName" class="layui-form-label">
                书名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="B_bookName" name="bookName" value="${book.bookName}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="B_bookCategoryName" class="layui-form-label">
                类别
            </label>
            <div class="layui-input-inline">
                <select name="bookCategoryId" class="layui-input layui-unselect" id="B_bookCategoryName" style="display: block">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="B_bookDescript" class="layui-form-label">
                图书简介
            </label>
            <div class="layui-input-inline">
                <textarea name="bookDescript" id="B_bookDescript" class="layui-input">${book.bookDescript}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="B_bookAuthor" class="layui-form-label">
                作者
            </label>
            <div class="layui-input-inline">
                <input name="bookAuthor" type="text" id="B_bookAuthor" class="layui-input" value="${book.bookAuthor}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="B_bookPress" class="layui-form-label">
                出版社
            </label>
            <div class="layui-input-inline">
                <input name="bookPress" type="text" id="B_bookPress" class="layui-input" value="${book.bookPress}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="B_bookDate" class="layui-form-label">
                上架日期

            </label>
            <div class="layui-input-inline">
                <input name="bookDate" type="date" id="B_bookDate" class="layui-input" value="${book.bookAuthor}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="B_bookPrice" class="layui-form-label">
                价格
            </label>
            <div class="layui-input-inline">
                <input name="bookPrice" type="text" id="B_bookPrice" class="layui-input" value="${book.bookPrice}">
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
        bookCategory_load();
        $(".layui-btn").click(function () {
            var $jsonData = {};
            $.each($(".layui-form").serializeArray(), function(i,e){
                $jsonData[e.name] = e.value;
            })
            $.ajax({
                url:"/admin/updateBook",
                data:JSON.stringify($jsonData),
                async:false,
                type:"POST",
                dataType:"json",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    if (result.data == true){
                        alert("图书修改成功")
                    }else {
                        alert("密码修改失败")
                    }
                }
            })
        })
    })

    //图书类别加载（框架问题，暂时废弃）
    function bookCategory_load() {
        var resultVar = "";
        $.ajax({
            url:"/admin/bookCategoryList",
            type:"GET",
            contentType:"application/json;charset=utf-8",
            success:function (result) {
                $.each(result.data,function (index,element) {
                    if (element.categoryId == ${book.bookCategoryId}){
                        resultVar += "<option selected value=\""+element.categoryId+"\">"+element.categoryName+"</option>"
                    }else {
                        resultVar += "<option value=\""+element.categoryId+"\">"+element.categoryName+"</option>"
                    }
                })
                $("#B_bookCategoryName").append(resultVar);
            }
        })
    }
</script>

</html>

