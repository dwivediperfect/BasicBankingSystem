/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.account;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;
/**
 *
 * @author HP
 */
@MultipartConfig
public class AccountOpening extends HttpServlet {

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
           
            //getting all the incoming request
            String name=request.getParameter("name");
            String accountno=request.getParameter("user_name");
            int accountno1=Integer.parseInt(accountno);
            String password=request.getParameter("user_password");
            String cpassword=request.getParameter("user_cpassword");
            String email=request.getParameter("user_email");
            String mobile=request.getParameter("user_mobile");
            String amount=request.getParameter("user_pin");
            int amount1=Integer.parseInt(amount);
            
            Part part=request.getPart("image");
            String filename=part.getSubmittedFileName();
           // out.println(filename);
            
            //connection..........
            try
            {
                Thread.sleep(3000);
                Class.forName("com.mysql.jdbc.Driver");
                
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","1420");
                
                //query..
                String q="insert into accountopening(name,accountno,password,email,mobile,amount,imagename) values(?,?,?,?,?,?,?)";
                
                PreparedStatement pstmt=con.prepareStatement(q);
                
                pstmt.setString(1,name);
                pstmt.setString(2,accountno);
                pstmt.setString(3,password);
                pstmt.setString(4,email);
                pstmt.setString(5,mobile);
                pstmt.setString(6,amount);
                pstmt.setString(7, filename);
                
                pstmt.executeUpdate();
                
                //upload file on server
                InputStream is=part.getInputStream();
                byte[] data=new byte[is.available()];
                
                is.read(data);
                String path=request.getRealPath("/")+"image"+File.separator+filename;
                
                FileOutputStream fos=new FileOutputStream(path);
                
                fos.write(data);
                fos.close();
                
                out.println("done");
                
            }
            catch(Exception e){
                out.println("error");
               
            }
            
            
            
            
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
