<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventário - clientes</title>
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
	    <h1>Clientes</h1>
	    <div class="form-container" align="center">
	        <c:if test="${cliente != null}">
	            <form action="update" method="post">
	        </c:if>
	        <c:if test="${cliente == null}">
	            <form action="insert" method="post">
	        </c:if>
	        
             <div class="form-group">
	            <input type="hidden" id="id" name="id" value="<c:out value='${cliente.customerId}' />" />
	        </div>
	        <div class="form-group">
	            <label for="nome">Nome do Cliente:</label>
	            <input type="text" id="nome" name="nome" value="<c:out value='${cliente.custName}' />" />
	        </div>
	        <div class="form-group">
	            <label for="cidade">Cidade:</label>
	            <input type="text" id="cidade" name="cidade" value="<c:out value='${cliente.city}' />" />
	        </div>
	        <div class="form-group">
	            <label for="classificacao">Classificação:</label>
	            <input type="text" id="classificacao" name="classificacao" value="<c:out value='${cliente.grade}' />" />
	        </div>
	        <div class="form-group-buttons">
	        	<a href="/Warehouse/clientes" class="button btn-cinza">cancelar</a>
	            <input type="submit" value="Salvar" />
	        </div>
	    </form>
	</div>
	</main>
	
	
</body>
</html>