<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventário - ordens de venda</title>
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
	    <h1>Ordens de Venda</h1>
	    <div class="form-container" align="center">
	        <c:if test="${ordemVenda != null}">
	            <form action="update" method="post">
	        </c:if>
	        <c:if test="${ordemVenda == null}">
	            <form action="insert" method="post">
	        </c:if>
	        
            <div class="form-group">
	            <input type="hidden" id="ordNo" name="ordNo" value="<c:out value='${ordemVenda.getOrdNo()}' />" />
	        </div>
	        <div class="form-group">
	            <label for="purchAmt">Valor da Compra:</label>
	            <input type="text" id="purchAmt" name="purchAmt" value="<c:out value='${ordemVenda.getPurchAmt()}' />" />
	        </div>
	        <div class="form-group">
	            <label for="ordDate">Data da Ordem:</label>
	            <input type="text" id="ordDate" name="ordDate" value="<fmt:formatDate value="${ordemVenda.getOrdDate()}" pattern="dd/MM/yyyy" />" />
	        </div>
	        <div class="form-group">
	            <label for="customerId">ID do Cliente:</label>
	            <input type="text" id="customerId" name="customerId" value="<c:out value='${ordemVenda.getCustomerId()}' />" />
	        </div>
	        <div class="form-group">
	            <label for="salesmanId">ID do Vendedor:</label>
	            <input type="text" id="salesmanId" name="salesmanId" value="<c:out value='${ordemVenda.getSalesmanId()}' />" />
	        </div>
	        <div class="form-group-buttons">
	        	<a href="/Warehouse/ordensVenda" class="button btn-cinza">cancelar</a>
	            <input type="submit" value="Salvar" />
	        </div>
	    </form>
	</div>
	</main>
	
</body>
</html>
