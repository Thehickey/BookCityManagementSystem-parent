$(function () {
    bookCategory_load();
    win();
    pageNums();
})

function pageNums() {
    $(".pageNums").click(function () {
        var categoryId = $(this).attr("data-categoryId");
        var pageNum = $(this).attr("data-num");
        var categoryName = $(this).attr("data-categoryName");
        navigatepageNums_load(categoryId,categoryName,pageNum);
    })
}

function bookCategory_load() {
    $.ajax({
        url:"/book/bookCategory",
        type:"GET",
        async:false,
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            $.each(result.data,function (index,element) {
                var resultVal = "";
                resultVal += "<div data-id='"+element.categoryId+"' id='f"+element.categoryId+"'>";
                resultVal += "<div class='am-container'>";
                resultVal += "<div class='shopTitle'>";
                resultVal += "<h4>"+element.categoryName+"</h4>";
                resultVal += "<h3>每一本书籍都有一个故事</h3>";
                resultVal += "<span id=\"navigatepageNums"+element.categoryId+"\" class='more'>";
                resultVal += "</span>";
                resultVal += "</div>";
                resultVal += "</div>";
                resultVal += "</div>";
                $("#shopmain").append(resultVal);
                navigatePages_load(element.categoryId,element.categoryName);
                bookList_load(element.categoryId);
            })
        }
    })
}

//加载分页页数
function navigatePages_load(categoryId,categoryName) {
    var resultVal = "";
    $.ajax({
        url:"/book/bookListByCategoryForHome?categoryId=" + categoryId + "&pageNum=1",
        type:"GET",
        async:false,
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            $.each(result.data.navigatepageNums,function (index,element) {
                resultVal += "&nbsp;&nbsp;<a href=\"javascript:;\" class=\"pageNums\" data-categoryName=\""+categoryName+"\" data-categoryId=\""+categoryId+"\" data-num=\""+element+"\">"+element+"</a>";
            })
            $("#navigatepageNums"+categoryId+"").append(resultVal);
        }
    })
}

//点击分页数时加载
function navigatepageNums_load(categoryId,categoryName,pageNum) {
    var resultVal = "";
    $.ajax({
        url:"/book/bookListByCategoryForHome?categoryId=" + categoryId + "&pageNum=" + pageNum,
        type:"GET",
        async:false,
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            resultVal += "<div class='am-container'>";
            resultVal += "<div class='shopTitle'>";
            resultVal += "<h4>"+categoryName+"</h4>";
            resultVal += "<h3>每一本书籍都有一个故事</h3>";
            resultVal += "<span id=\"navigatepageNums"+categoryId+"\" class='more'>";
            resultVal += "</span>";
            resultVal += "</div>";
            resultVal += "</div>";
            resultVal += "<div class=\"am-g am-g-fixed floodFour\">";
            resultVal += "<div class=\"am-u-sm-5 am-u-md-4 text-one list \">";
            resultVal += "<a href=\"# \">";
            resultVal += "<div class=\"outer-con \">";
            resultVal += "<div class=\"title \">";
            resultVal += "开抢啦！";
            resultVal += "</div>";
            resultVal += "<div class=\"sub-title \">";
            resultVal += "零食大礼包";
            resultVal += "</div>";
            resultVal += "</div>";
            resultVal += "<img src=\"/static/images/act1.png \" />";
            resultVal += "</a>";
            resultVal += "<div class=\"triangle-topright\"></div>";
            resultVal += "</div>";
            $.each(result.data.list,function (index,element) {
                if (index == 0){
                    resultVal += "<div class=\"am-u-sm-7 am-u-md-4 text-two sug\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 1){
                    resultVal += "<div class=\"am-u-sm-7 am-u-md-4 text-two\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 2){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three big\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 3){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three sug\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 4){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three \">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"/"+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 5){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three last big \">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }
            })
            resultVal += "</div>";
            $("#f"+categoryId+"").empty().append(resultVal);
            navigatePages_load(categoryId,categoryName);
            win();
            pageNums();
        }
    })
}

function bookList_load(categoryId) {
    var resultVal = "";
    $.ajax({
        url:"/book/bookListByCategoryForHome?categoryId=" + categoryId + "&pageNum=1",
        type:"GET",
        async:false,
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            resultVal += "<div class=\"am-g am-g-fixed floodFour\">";
            resultVal += "<div class=\"am-u-sm-5 am-u-md-4 text-one list \">";
            resultVal += "<a href=\"# \">";
            resultVal += "<div class=\"outer-con \">";
            resultVal += "<div class=\"title \">";
            resultVal += "开抢啦！";
            resultVal += "</div>";
            resultVal += "<div class=\"sub-title \">";
            resultVal += "零食大礼包";
            resultVal += "</div>";
            resultVal += "</div>";
            resultVal += "<img src=\"/static/images/act1.png \" />";
            resultVal += "</a>";
            resultVal += "<div class=\"triangle-topright\"></div>";
            resultVal += "</div>";
            $.each(result.data.list,function (index,element) {
                if (index == 0){
                    resultVal += "<div class=\"am-u-sm-7 am-u-md-4 text-two sug\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 1){
                    resultVal += "<div class=\"am-u-sm-7 am-u-md-4 text-two\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 2){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three big\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 3){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three sug\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 4){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three \">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }else if (index == 5){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three last big \">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += "￥" + element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\">";
                    resultVal += "<span data-bookPrice=\""+element.bookPrice+"\" data-bookName=\""+element.bookName+"\">";
                    resultVal += "</span>";
                    resultVal += "</i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\""+element.bookPicUrl+"\" /></a>";
                    resultVal += "</div>";
                }
            })
            resultVal += "</div>";
            $("#f"+categoryId+"").append(resultVal);
        }
    })
}

function win() {
    $(".seprate").click(function () {
        var bookPrice = $(this).find("span").attr("data-bookPrice");
        var bookName = $(this).find("span").attr("data-bookName");
        $.ajax({
            url:"/customer/insertCommodity?bookName=" + bookName +"&bookPrice=" + bookPrice,
            type:"POST",
            contentType:"application/json;charset=utf-8",
            success:function (result) {
                if (result.code == 200){
                    alert(result.message)
                }else{
                    alert(result.message)
                }
            }
        })
    })
}