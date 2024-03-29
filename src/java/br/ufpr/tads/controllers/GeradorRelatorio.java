package br.ufpr.tads.controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import br.ufpr.tads.beans.Login;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.exception.DAOException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import org.joda.time.DateTime;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import java.sql.Timestamp;
import org.joda.time.format.DateTimeFormat;

/**
 *
 * @author junio
 */
@WebServlet(urlPatterns = {"/GeradorRelatorio"})
public class GeradorRelatorio extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AutenticacaoServlet?action=index");
            request.setAttribute("mensagem", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }

        Login login = (Login) session.getAttribute("login");

        if (login.getFuncao().getFuncaoId() != 3) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Você não possui permissão para acessar o conteúdo");
            rd.forward(request, response);
        }
        
        String action = request.getParameter("action");
        String host = "http://" + request.getServerName() + ":" + request.getServerPort();
        
        try ( ConnectionFactory con = new ConnectionFactory()) {
            if ("funcRelatorio".equals(action)) {
                String jasper = request.getContextPath() + "/assets/relatorios/relatorio_funcionarios.jasper";
                
                // URL para acesso ao relatório
                URL jasperURL = new URL(host + jasper);

                HashMap params = new HashMap();

                byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con.getConnection());
                if (bytes != null) {

                    response.setContentType("application/pdf");

                    OutputStream ops = response.getOutputStream();
                    ops.write(bytes);
                }
            } else if ("atendimentoRel".equals(action)) {

                String dataInicio = request.getParameter("startDate");
                String dataFim = request.getParameter("finishDate");

                DateTime date1 = DateTimeFormat.forPattern("yyyy-MM-dd").parseDateTime(dataInicio);
                DateTime date2 = DateTimeFormat.forPattern("yyyy-MM-dd").parseDateTime(dataFim);

                Timestamp tsInicio = new Timestamp(date1.getMillis());
                Timestamp tsFim = new Timestamp(date2.getMillis());

                String jasper = request.getContextPath() + "/assets/relatorios/relatorios_atendimento_data.jasper";

                URL jasperURL = new URL(host + jasper);

                HashMap params = new HashMap();
                params.put("DATAINICIO", tsInicio);
                params.put("DATAFIM", tsFim);

                byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con.getConnection());
                if (bytes != null) {

                    response.setContentType("application/pdf");

                    OutputStream ops = response.getOutputStream();
                    ops.write(bytes);
                }
            } else if ("relReclamados".equals(action)) {
                String jasper = request.getContextPath() + "/assets/relatorios/relatorio_produtos_mais_reclamados.jasper";

                URL jasperURL = new URL(host + jasper);

                HashMap params = new HashMap();

                byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con.getConnection());
                if (bytes != null) {

                    response.setContentType("application/pdf");

                    OutputStream ops = response.getOutputStream();
                    ops.write(bytes);
                }

            } else if ("relTodasReclamacoes".equals(action)) {
                String valor = request.getParameter("select");

                if (valor.equals("todos")) {
                    String jasper = request.getContextPath() + "/assets/relatorios/todas_reclamacoes_z.jasper";

                    URL jasperURL = new URL(host + jasper);

                    HashMap params = new HashMap();
                    byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con.getConnection());
                    if (bytes != null) {

                        response.setContentType("application/pdf");

                        OutputStream ops = response.getOutputStream();
                        ops.write(bytes);
                    }

                } else if (valor.equals("abertos")) {
                    String jasper = request.getContextPath() + "/assets/relatorios/todas_reclamacoes.jasper";

                    URL jasperURL = new URL(host + jasper);

                    HashMap params = new HashMap();
                    params.put("VALOR", 1);
                    byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con.getConnection());
                    if (bytes != null) {

                        response.setContentType("application/pdf");

                        OutputStream ops = response.getOutputStream();
                        ops.write(bytes);
                    }
                } else if (valor.equals("finalizados")) {
                    String jasper = request.getContextPath() + "/assets/relatorios/todas_reclamacoes.jasper";

                    HashMap params = new HashMap();
                    URL jasperURL = new URL(host + jasper);
                    params.put("VALOR", 2);
                    byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con.getConnection());
                    
                    if (bytes != null) {
                        response.setContentType("application/pdf");

                        OutputStream ops = response.getOutputStream();
                        ops.write(bytes);
                    }
                }
            }
        } catch (DAOException e) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Erro de DAO: " + e);
            rd.forward(request, response);
        } catch (JRException e) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Erro no Jasper: " + e);
            rd.forward(request, response);
        } catch (FileNotFoundException e) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Arquivo não encontrado: " + e);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
