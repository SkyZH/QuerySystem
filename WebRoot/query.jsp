<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${productList }" var="product">
<tr>
<td>${product.p_name }</td>
<td>${product.p_input }</td>
<td>${product.p_capacity }</td>
<td>${product.p_current }</td>
<td>${product.p_motorpower }</td>
<td>${product.p_weight }</td>
</tr>
</c:forEach>
