/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AssignmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import model.Account;
import model.SubmitAssign;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class SubmitAssignment extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubmitAssignment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitAssignment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        Account a = (Account) request.getSession().getAttribute("account");
        request.setAttribute("sa", new AssignmentDAO().getSubmitAssignById(request.getParameter("aid"), a.getId()));
        request.setAttribute("a", new AssignmentDAO().getAssignmentById(request.getParameter("aid")));
        request.getRequestDispatcher("SubmitAssignment.jsp").forward(request, response);
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

        try {
            String cmt = request.getParameter("cmt");
            Part part = request.getPart("file");
            String aid = request.getParameter("aid");
            String said = request.getParameter("said");
            String action = request.getParameter("action");
            Account a = (Account) request.getSession().getAttribute("account");
            AssignmentDAO db = new AssignmentDAO();
            String currentFilePath = getServletContext().getRealPath(request.getServletPath());
            String fileName = extractFileName(part);
            switch (action) {
                case "add":
                    fileName = new File(fileName).getName();
                    part.write(currentFilePath + File.separator + fileName);
                    db.submitAssignment(cmt, a.getId(), fileName, aid);
                    response.sendRedirect("SubmitAssignment?aid=" + aid);
                    break;
                case "edit":
                    SubmitAssign submitted = db.getSubmitAssignById(aid, a.getId());
                    File file = new File(currentFilePath+ File.separator + submitted.getLinkSource());
                    file.delete();
                    
                    fileName = new File(fileName).getName();
                   
                    db.editSubmitAssignment(cmt, a.getId(), fileName, aid, said);
                    response.sendRedirect("SubmitAssignment?aid=" + aid);
                    break;
                case "delete":
                     SubmitAssign submitted1 = db.getSubmitAssignById(aid, a.getId());
                    File file1 = new File(currentFilePath+ File.separator + submitted1.getLinkSource());
                    file1.delete();
                    db.deleteSubmitAssigment(said);
                     response.sendRedirect("SubmitAssignment?aid=" + aid);
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        File folderUpload = new File("D:\\SubmitAssigment");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
