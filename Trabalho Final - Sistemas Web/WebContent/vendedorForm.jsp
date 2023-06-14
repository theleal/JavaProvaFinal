<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventário - vendedores</title>
<link rel="stylesheet" type="text/css" href="../reset.css">
<link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
  <div class="menu">
	  <div class="menu-left"><a href="/Warehouse/home">Prova 2</a></div>
	</div>
        <div class="sidebar">
            <ul>
                <li><a href="/Warehouse/clientes">Clientes</a></li>
                <li><a href="/Warehouse/vendedores">Vendedores</a></li>
                <li><a href="/Warehouse/ordensVenda">Ordens de Venda</a></li>
            </ul>
        </div>
	<main class="container">
	    <h1>Vendedores</h1>
	    <div class="form-container" align="center">
	        <c:if test="${vendedor != null}">
	            <form action="update" method="post">
	        </c:if>
	        <c:if test="${vendedor == null}">
	            <form action="insert" method="post">
	        </c:if>
	        
             <div class="form-group">
	            <input type="hidden" id="id" name="id" value="<c:out value='${vendedor.getSalesmanId()}' />" />
	        </div>
	        <div class="form-group">
	            <label for="nome">Nome do Vendedor:</label>
	            <input type="text" id="nome" name="nome" value="<c:out value='${vendedor.getName()}' />" />
	        </div>
	        <div class="form-group">
	            <label for="cidade">Cidade:</label>
	            <input type="text" id="cidade" name="cidade" value="<c:out value='${vendedor.getCity()}' />" />
	        </div>
	        <div class="form-group">
	            <label for="comissao">Comissão:</label>
	            <input type="text" id="comissao" name="comissao" value="<c:out value='${vendedor.getCommission()}' />" />
	        </div>
	        <div class="form-group-buttons">
	        	<a href="/Warehouse/vendedores" class="button btn-cinza">cancelar</a>
	            <input type="submit" value="Salvar" />
	        </div>
	    </form>
	</div>
	</main>
	
	
</body>
</html>
