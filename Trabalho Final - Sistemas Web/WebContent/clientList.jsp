<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventário - clientes</title>
<link rel="stylesheet" type="text/css" href="./reset.css">
<link rel="stylesheet" type="text/css" href="./styles.css">

<link rel="stylesheet" type="text/css" href="../reset.css">
<link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
  <div class="menu">
	  <div class="menu-left"><a href="/Warehouse/home">Trabalho Final - SWI5</a></div>
	</div>
        <div class="sidebar">
            <ul>
                <li><a href="/Warehouse/clientes">Clientes</a></li>
                <li><a href="/Warehouse/vendedores">Vendedores</a></li>
                <li><a href="/Warehouse/ordensVenda">Ordens de Venda</a></li>
            </ul>
        </div>

	<main class="container">
		<div class="wrapper">
			<h1 style="text-align: center;">Clientes</h1>
			<a href="/Warehouse/clientes/new" class="button">novo cliente</a>
		</div>
		
		    <table >
        <thead>
            <tr>
              <th>ID do Cliente</th>
			  <th>Nome do Cliente</th>
			  <th>Cidade</th>
			  <th>Classificação</th>
			  <th>ID do Vendedor</th>
			  <th colspan="2">Ações</th>
            </tr>
        </thead>
        <tbody>
        
        	<c:if test="${list.size() > 0}">
	         	<c:forEach var="item" items="${list}">
	                <tr>
	                 	<td><c:out value="${item.customerId}" /></td>
	                 	<td><c:out value="${item.custName}" /></td>
	                 	<td><c:out value="${item.city}" /></td>
	                 	<td><c:out value="${item.grade}" /></td>
	                 	<td><c:out value="${item.salesmanId}" /></td>
		                <td>
	                        <a href="/Warehouse/clientes/delete?id=<c:out value='${item.customerId}' />">Remover</a>   
					    </td>
					    <td>
					    	<a href="/Warehouse/clientes/edit?id=<c:out value='${item.customerId}' />">Editar</a>  
				      	</td>
	                </tr>
	            </c:forEach>    
            </c:if>
            
            <c:if test="${list.size() <= 0}">
	            <tr>
	            	<td colspan="7">Sem clientes cadastrados</td>
	            </tr>
            </c:if>        
        </tbody>
    </table>
	</main>
</body>
</html>