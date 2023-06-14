<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventário - vendedores</title>
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
			<h1>Vendedores</h1>
			<a href="/Warehouse/vendedores/new" class="button">novo vendedor</a>
		</div>
		
		    <table >
        <thead>
            <tr>
              <th>ID do Vendedor</th>
			  <th>Nome do Vendedor</th>
			  <th>Cidade</th>
			  <th>Comissão</th>
			  <th colspan="2">Ações</th>
            </tr>
        </thead>
        <tbody>
        
        	<c:if test="${list.size() > 0}">
	         	<c:forEach var="item" items="${list}">
	                <tr>
	                 	<td><c:out value="${item.getSalesmanId()}" /></td>
	                 	<td><c:out value="${item.getName()}" /></td>
	                 	<td><c:out value="${item.getCity()}" /></td>
	                 	<td><c:out value="${item.getCommission()}" /></td>
		                <td>
	                        <a href="/Warehouse/vendedores/delete?id=<c:out value='${item.getSalesmanId()}' />">Remover</a>   
					    </td>
					    <td>
					    	<a href="/Warehouse/vendedores/edit?id=<c:out value='${item.getSalesmanId()}' />">Editar</a>  
				      	</td>
	                </tr>
	            </c:forEach>    
            </c:if>
            
            <c:if test="${list.size() <= 0}">
	            <tr>
	            	<td colspan="6">Sem vendedores cadastrados</td>
	            </tr>
            </c:if>        
        </tbody>
    </table>
	</main>
</body>
</html>
