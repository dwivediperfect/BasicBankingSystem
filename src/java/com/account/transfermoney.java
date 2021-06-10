/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.account;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author HP
 */
public class transfermoney extends HttpServlet {

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
            
            
            String sender=request.getParameter("sender");
            String receiver=request.getParameter("receiver");
            String creceiver=request.getParameter("creceiver");
            String amount=request.getParameter("amount");
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
           
            String date=dtf.format(now);
            String date1=String.valueOf(date);
            //out.println(sender+" "+receiver+" "+amount);
            if(receiver.equals(creceiver))
            {
             try {
                    Thread.sleep(3000);
                    Class.forName("com.mysql.jdbc.Driver");
                   
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","1420");
                    
                    String q1 = "Select accountno,amount from accountopening where accountno='"+sender+"'";
                    String query="insert into transaction(sender,receiver,amount,date) values(?,?,?,?)";
                    PreparedStatement pstmt=con.prepareStatement(query);
                    pstmt.setString(1, sender);
                    pstmt.setString(2,receiver);
                    pstmt.setString(3, amount);
                    pstmt.setString(4, date1);
                    pstmt.executeUpdate();
                    
                    
                    Statement stmt=con.createStatement();
                    ResultSet rs1=null,rs2=null;
         
                    rs1=stmt.executeQuery(q1);
                    long senderamount=0;
                    if(rs1.next())
                    {
                        String senderamount1=rs1.getString("amount");
                        senderamount=Long.parseLong(senderamount1);
                    }
                    rs1.close();
                   
                    String q2 = "Select accountno,amount from accountopening where accountno='" + receiver + "';";
                    rs2=stmt.executeQuery(q2);
                    long receiveramount=0;
                    if(rs2.next())
                    {
                        String receiveramount1=rs2.getString("amount");
                        receiveramount=Long.parseLong(receiveramount1);
                    }
                    rs2.close();
                    
                    //out.println(sender+" "+receiver+" "+amount);
                    long amount1=(long)(Long.parseLong(amount));
                    
                  
                    senderamount=senderamount-amount1;
                    receiveramount=receiveramount+amount1;
                    
                    String q3="update accountopening set amount=? where accountno=?";
                    String q4="update accountopening set amount=? where accountno=?";
                    
                    
                    PreparedStatement pstmt1=con.prepareStatement(q3);
                    PreparedStatement pstmt2=con.prepareStatement(q4);
                    
                    pstmt1.setString(1,String.valueOf(senderamount));
                    pstmt1.setString(2, sender);
                    
                    pstmt2.setString(1,String.valueOf(receiveramount));
                    pstmt2.setString(2, receiver);
                    
                    pstmt1.executeUpdate();
                    pstmt2.executeUpdate();
                    
                    
                    con.close();
                    
                    
                    out.println("done");
                    
                } catch (Exception ex) {
                    out.println("error");
                }
            }
            else
            {
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
