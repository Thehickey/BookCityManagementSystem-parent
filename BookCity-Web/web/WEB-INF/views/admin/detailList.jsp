<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/29
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <c:forEach var="orderDetails" items="${orderDetails}">
            <tr>
                <td>
                    <img src="${orderDetails.detailBookPicUrl}">
                </td>
                <td>${orderDetails.detailBookName}</td>
                <td>${orderDetails.detailBookCnt}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
