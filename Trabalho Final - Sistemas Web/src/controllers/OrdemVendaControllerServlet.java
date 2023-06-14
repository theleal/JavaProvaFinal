package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import daos.OrdemVendaDAO;
import daos.VendedorDAO;
import models.OrdemVenda;
import models.Vendedor;

/**
 * @author Rodrigo Rebelo e Luiz Gustavo
 */


@WebServlet(name = "OrdemVendaControllerServlet",
	urlPatterns = {"/ordensVenda/*"},
	loadOnStartup = 1)
public class OrdemVendaControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrdemVendaDAO _ordemVendaDAO;
    
    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
 
        this._ordemVendaDAO = new OrdemVendaDAO(jdbcURL, jdbcUsername, jdbcPassword);
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
        } catch (ParseException ex) {
            throw new ServletException(ex);
        }
    }
 
    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<OrdemVenda> list = _ordemVendaDAO.listAll();
        request.setAttribute("list", list);
        
    	RequestDispatcher dispatcher = request.getRequestDispatcher("ordemVendaList.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ordemVendaForm.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        OrdemVenda ordemVenda = _ordemVendaDAO.getById(id);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("ordemVendaForm.jsp");
        request.setAttribute("ordemVenda", ordemVenda);
        dispatcher.forward(request, response);
    }
 
    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException { 
     	
    	 double purchAmt = Double.parseDouble(request.getParameter("purchAmt"));
    	 String ordDateStr = request.getParameter("ordDate");
    	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    	 Date ordDate = dateFormat.parse(ordDateStr);
         int customerId = Integer.parseInt(request.getParameter("customerId"));
         int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));
         
         OrdemVenda entity = new OrdemVenda(purchAmt, ordDate, customerId, salesmanId);
        _ordemVendaDAO.insert(entity);
        response.sendRedirect("list");
    }
 
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
    	 int id = Integer.parseInt(request.getParameter("ordNo")); 
    	 double purchAmt = Double.parseDouble(request.getParameter("purchAmt"));
    	 String ordDateStr = request.getParameter("ordDate");
    	 SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
    	 Date ordDate = inputFormat.parse(ordDateStr);
         int customerId = Integer.parseInt(request.getParameter("customerId"));
         int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));
         
         OrdemVenda entity = new OrdemVenda(id, purchAmt, ordDate, customerId, salesmanId);
         _ordemVendaDAO.update(entity);
         response.sendRedirect("list");
    }
 
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
 
        OrdemVenda entity = new OrdemVenda(id);
        _ordemVendaDAO.delete(entity);
        
        response.sendRedirect("list");
    }

}
