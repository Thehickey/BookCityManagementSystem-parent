<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/4
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach var="books" items="${bookListByCategory}">
    <dd><a title="${books.bookName}" href="#"><span>${books.bookName}</span></a></dd>
</c:forEach>

