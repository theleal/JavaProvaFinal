package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import daos.*;
import models.*;

/**
 * @author Rodrigo Rebelo e Luiz Gustavo
 */


@WebServlet(name = "ClienteControllerServlet",
	urlPatterns = {"/clientes/*"},
	loadOnStartup = 1)
public class ClienteControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientesDAO _clienteDAO;
 
    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
 
        this._clienteDAO = new ClientesDAO(jdbcURL, jdbcUsername, jdbcPassword);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String action = request.getPathInfo();

    	if(action == null) {
    		action = "";
    	}

    	try {
            switch (action) {
	            case "/new":
	                showNewForm(request, response);
	                break;
	            case "/insert":
	                insert(request, response);
	                break;
	            case "/delete":
	                delete(request, response);
	                break;
	            case "/edit":
	                showEditForm(request, response);
	                break;
	            case "/update":
	                update(request, response);
	                break;
	            default:
	                list(request, response);
	                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
 
    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Cliente> list = _clienteDAO.listAll();
        request.setAttribute("list", list);
        
    	RequestDispatcher dispatcher = request.getRequestDispatcher("clientList.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("clientForm.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cliente = _clienteDAO.getById(id);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("clientForm.jsp");
        request.setAttribute("cliente", cliente);
        dispatcher.forward(request, response);
    }
 
    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String custName = request.getParameter("nome");
        String city = request.getParameter("cidade");
        int grade = Integer.parseInt(request.getParameter("classificacao"));
        int salesmanId = 0;
 
        Cliente entity = new Cliente(custName, city, grade, salesmanId);
        _clienteDAO.insert(entity);
        response.sendRedirect("list");
    }
 
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
         int id = Integer.parseInt(request.getParameter("id")); 
    	 String custName = request.getParameter("nome");
         String city = request.getParameter("cidade");
         int grade = Integer.parseInt(request.getParameter("classificacao"));
         int salesmanId = 0;
  
         Cliente entity = new Cliente(id, custName, city, grade, salesmanId);
 
         _clienteDAO.update(entity);
         response.sendRedirect("list");
    }
 
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
 
        Cliente entity = new Cliente(id);
        _clienteDAO.delete(entity);
        
        response.sendRedirect("list");
    }
}
