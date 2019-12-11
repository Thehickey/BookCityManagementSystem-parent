$(function () {
    cart_load();
})

function cart_load() {
    $.ajax({
        url:"/customer/cartList",
        type:"GET",
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            $("#cartTable").empty().append(result);
            deleteCommodity();
            addCommodity();
            subCommodity();
        }
    })
}

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