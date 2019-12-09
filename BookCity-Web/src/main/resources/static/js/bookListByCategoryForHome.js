$(function () {
    $.ajax({
        url:"/book/bookCategory",
        type:"GET",
        async:false,
        contentType:"application/json;charset=utf-8",
        success:function (result) {
            var categoryId = "";
            $.each(result.data,function (index,element) {
                var resultVal = "";
                categoryId = element.categoryId;
                resultVal += "<div data-id='"+element.categoryId+"' id='f"+element.categoryId+"'>";
                resultVal += "<div class='am-container'>";
                resultVal += "<div class='shopTitle'>";
                resultVal += "<h4>"+element.categoryName+"</h4>";
                resultVal += "<h3>每一本书籍都有一个故事</h3>";
                resultVal += "<span class='more'>";
                resultVal += "<a href=\"# \">更多书籍<i class=\"am-icon-angle-right\" style=\"padding-left:10px ;\" ></i></a>";
                resultVal += "</span>";
                resultVal += "</div>";
                resultVal += "</div>";
                resultVal += "</div>";
                $("#shopmain").append(resultVal);
                bookList_load(categoryId);
            })
        }
    })
})

function bookList_load(categoryId) {
    var resultVal = "";
    $.ajax({
        url:"/book/bookListByCategoryForHome?categoryId=" + categoryId,
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
            resultVal += "<img src=\"..//static/images/act1.png \" />";
            resultVal += "</a>";
            resultVal += "<div class=\"triangle-topright\"></div>";
            resultVal += "</div>";
            resultVal += "</div>";
            $.each(result.data,function (index,element) {
                if (index == 0){
                    resultVal += "<div class=\"am-u-sm-7 am-u-md-4 text-two sug\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\"></i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"..//static/images/2.jpg\" /></a>";
                    resultVal += "</div>";
                }else if (index == 1){
                    resultVal += "<div class=\"am-u-sm-7 am-u-md-4 text-two\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\"></i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"..//static/images/1.jpg\" /></a>";
                    resultVal += "</div>";
                }else if (index == 2){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three big\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\"></i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"..//static/images/5.jpg\" /></a>";
                    resultVal += "</div>";
                }else if (index == 3){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three sug\">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\"></i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"..//static/images/3.jpg\" /></a>";
                    resultVal += "</div>";
                }else if (index == 4){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three \">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\"></i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"..//static/images/4.jpg\" /></a>";
                    resultVal += "</div>";
                }else if (index == 5){
                    resultVal += "<div class=\"am-u-sm-3 am-u-md-2 text-three last big \">";
                    resultVal += "<div class=\"outer-con \">";
                    resultVal += "<div class=\"title \">";
                    resultVal += element.bookName;
                    resultVal += "</div>";
                    resultVal += "<div class=\"sub-title \">";
                    resultVal += element.bookPrice;
                    resultVal += "</div>";
                    resultVal += "<i class=\"am-icon-shopping-basket am-icon-md  seprate\"></i>";
                    resultVal += "</div>";
                    resultVal += "<a href=\"# \"><img src=\"..//static/images/5.jpg\" /></a>";
                    resultVal += "</div>";
                }
            })
            $("#shopmain").find("#f"+categoryId+"").append(resultVal);
        }
    })
}