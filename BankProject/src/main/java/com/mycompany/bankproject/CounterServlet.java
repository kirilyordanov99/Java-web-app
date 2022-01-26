/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bankproject;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author comp-TI
 */
@WebServlet(name = "CounterServlet", urlPatterns = {"/CounterServlet"})
public class CounterServlet extends HttpServlet {

    static int counter;

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        counter++;
        out.println("<html>");
        out.println("<head><title>Test Bank, Inc. -- Welcome Page</title>");
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\" />");
        out.println( "</head>");
        out.println("<body>");
        out.println("<p class = \"textTitle\"><b>Welcome to Test Banks, Inc.</b></p>");
        out.println("Test Banks, Inc. welcomes you to the site. Test, Inc. is a leading bank dealing "
                + "and fulfilling the needs of all categories: financial organizations, hospitals, universities,"
                + " and individuals. The services offered by Test Banks, Inc. include bank accounts and "
                + "loans for all needs. You will find complete information regarding various schemes of "
                + "the bank in this site. In addition, the site enables online banking transactions. You "
                + "can view your account details and if not an account holder, you can apply for an "
                + "account online. You'll also find various utilities such as interest calculator and foreign"
                + " exchange calculator on this site.");
        out.println("<p class = \"textLink\"><b><a href=\"index.html\">Click here to continue.</a></b></p>");
        out.println("You are viewer number " + String.valueOf(counter) 
                + " visting our Web site\n");
        out.println("</body>");
        out.println("</html>");
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
        //processRequest(request, response);
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
