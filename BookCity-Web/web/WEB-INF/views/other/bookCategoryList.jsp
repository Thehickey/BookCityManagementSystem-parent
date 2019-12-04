<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/4
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach var="bookCategory" items="${bookCategoryList}">
    <li class="appliance js_toggle relative first">
        <div class="category-info">
            <h3 class="category-name b-category-name"><i><img src="/static/images/cake.png"></i><a class="ml-22" title="${bookCategory.categoryName}">${bookCategory.categoryName}</a></h3>
            <em>&gt;</em></div>
        <div class="menu-item menu-in top">
            <div class="area-in">
                <div class="area-bg">
                    <div class="menu-srot">
                        <div class="sort-side">
                            <dl class="dl-sort">
                                <dt><span title="蛋糕">蛋糕</span></dt>
                                <dd><a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a></dd>
                                <dd><a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a></dd>
                                <dd><a title="瑞士卷" href="#"><span>瑞士卷</span></a></dd>
                                <dd><a title="软面包" href="#"><span>软面包</span></a></dd>
                                <dd><a title="马卡龙" href="#"><span>马卡龙</span></a></dd>
                                <dd><a title="千层饼" href="#"><span>千层饼</span></a></dd>
                                <dd><a title="甜甜圈" href="#"><span>甜甜圈</span></a></dd>
                                <dd><a title="蒸三明治" href="#"><span>蒸三明治</span></a></dd>
                                <dd><a title="铜锣烧" href="#"><span>铜锣烧</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                                <dt><span title="蛋糕">点心</span></dt>
                                <dd><a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a></dd>
                                <dd><a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a></dd>
                                <dd><a title="瑞士卷" href="#"><span>瑞士卷</span></a></dd>
                                <dd><a title="软面包" href="#"><span>软面包</span></a></dd>
                                <dd><a title="马卡龙" href="#"><span>马卡龙</span></a></dd>
                                <dd><a title="千层饼" href="#"><span>千层饼</span></a></dd>
                                <dd><a title="甜甜圈" href="#"><span>甜甜圈</span></a></dd>
                                <dd><a title="蒸三明治" href="#"><span>蒸三明治</span></a></dd>
                                <dd><a title="铜锣烧" href="#"><span>铜锣烧</span></a></dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <b class="arrow"></b>
    </li>
</c:forEach>

