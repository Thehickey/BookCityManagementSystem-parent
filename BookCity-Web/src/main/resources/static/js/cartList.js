$(function () {
    cart_load();
})

function cart_load() {
    $.ajax({
        url:"/customer/cartList",
        type:"GET",
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            $(".concent").empty().append(result);
            deleteCommodity();
            addCommodity();
            subCommodity();
            addCheckEvent();
            go();
        }
    })
}

//结算
function go() {
    $("#J_Go").click(function () {
        var code = "";
        $.each($(":checkbox"),function (index,element) {
            if (element.checked == true){
                $.ajax({
                    url:"/customer/confirmCommodity?cartId=" + $(element).attr("data-cartId"),
                    type:"POST",
                    contentType:"application/json;charset=utf-8",
                    success:function (result) {
                        code = result.code;
                    }
                })
            }
        })
        window.location.href = "/customer/pay?total=" + $("#J_Total").text();
    })
}

//减少商品数量
function subCommodity() {
    $(".min").click(function () {
        var bookName = $(this).attr("data-bookName");
        $.ajax({
            url:"/customer/subCommodity?bookName=" + bookName,
            type:"POST",
            contentType:"application/json;charset=utf-8",
            success:function (result) {
                if (result.code == 200){
                    cart_load();
                }else{
                    alert(result.message)
                }
            }
        })
    })
}

//添加商品数量
function addCommodity() {
    $(".add").click(function () {
        var bookName = $(this).attr("data-bookName");
        $.ajax({
            url:"/customer/addCommodity?bookName=" + bookName,
            type:"POST",
            contentType:"application/json;charset=utf-8",
            success:function (result) {
                if (result.code == 200){
                    cart_load();
                }else{
                    alert(result.message)
                }
            }
        })
    })
}

//删除商品
function deleteCommodity() {
    $(".delete").click(function () {
        if (confirm("请确认删除")){
            var bookName = $(this).attr("data-bookName");
            $.ajax({
                url:"/customer/deleteCommodity?bookName=" + bookName,
                type:"POST",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    if (result.code == 200){
                        alert(result.message)
                        cart_load();
                    }else{
                        alert(result.message)
                    }
                }
            })
        }
    })
}

//添加选择事件
function addCheckEvent() {
    $(".check-1").click(function () {
        $(":checkbox").each(function (i, e) {
            $(e).prop("checked", !$(e).prop("checked"));
        });
        getCommodityCount();
        getTotal();
    });
    $(".check-2").click(function () {
        $(":checked").prop("checked", false);
        getCommodityCount();
        getTotal();
    });
    $(".check-3").click(function () {
        $(":checkbox").prop("checked", true);
        getCommodityCount();
        getTotal();
    });
    $(":checkbox").click(function () {
        getCommodityCount();
        getTotal();
    })
}

//获取商品数量
function getCommodityCount() {
    var count = 0;
    $.each($(":checkbox"),function (index,element) {
        if (element.checked == true){
            count++;
        }
    })
    $("#J_SelectedItemsCount").text(count);
}

//获取总价
function getTotal() {
    var total = 0;
    $.each($(":checkbox"),function (index,element) {
        if (element.checked == true){
            total += parseInt( $(element).attr("data-Total"));
        }
    })
    $("#J_Total").text(total);
}