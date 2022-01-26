<%@page import = "java.text.*" %>
<%@page import = "java.sql.Date" %>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@page language = "java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <title>Test Bank, Inc. -- Registration Page for Account Holders</title>
    </head>
    <body>
        <p></p>
        <table border="0" width="100%">
            <tr>
                <td width="50%" height="36"><b><font size="5"><i>Test Bank, Inc.</i></font></b></td>
                <td width="50%" height="36"></td>
            </tr>
        </table>
        <%! int ctr = 0; %>
        <%! int flag = 0;
            int flag1 = 0;
            int flag2 = 0;
        %>
        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection connect, connect1;
                connect = DriverManager.getConnection("jdbc:derby://localhost:1527/Bank", "test", "test");
                connect1 = DriverManager.getConnection("jdbc:derby://localhost:1527/Bank", "test", "test");
                Statement state1, state2, state3;
                String str1, str2, str3, str4;
                int num, num1, num2;
                state1 = connect.createStatement();
                num1 = Integer.parseInt(request.getParameter("accNo"));
                String strQuery1 = "select * from LoginInfo";
                ResultSet result1 = state1.executeQuery(strQuery1);

                while (result1.next()) {
                    num = result1.getInt("AccountNo");
                    if (num1 == num) {
                        flag = 1;
                        break;
                    }
                }

                state2 = connect1.createStatement();
                num2 = Integer.parseInt(request.getParameter("id"));

                String strQuery2 = "select * from RegisterInfo where RegisterId=" + num2;
                String fname, frstname, lname, lstname, mname, midname, email, mail, actype, acttype, branch, branchcity;
                frstname = request.getParameter("firstName");
                frstname = frstname.trim();
                lname = request.getParameter("lastName");
                lname = lname.trim();
                mname = request.getParameter("middleName");
                mname = mname.trim();
                email = request.getParameter("email");
                email = email.trim();
                actype = (String) request.getParameter("account");
                actype = actype.trim();
                branch = (String) request.getParameter("branch");
                branch = branch.trim();
                ResultSet result2 = state2.executeQuery(strQuery2);

                while (result2.next()) {

                    fname = result2.getString("FirstName");
                    fname = fname.trim();
                    midname = result2.getString("MiddleName");
                    midname = midname.trim();
                    lstname = result2.getString("LastName");
                    lstname = lstname.trim();
                    mail = result2.getString("EmailID");
                    mail = mail.trim();

                    if ((fname.equals(frstname)) && (lname.equals(lstname)) && (mname.equals(midname)) && (email.equals(mail))) {
                        ctr = 1;
                        flag1 = 2;
                        break;
                    }

                }
                connect1.close();
                connect1 = DriverManager.getConnection("jdbc:derby://localhost:1527/Bank", "test", "test");
                state3 = connect1.createStatement();
                String strQuery3 = "select * from AcHolderInfo where RegisterId=" + num2;
                ResultSet result3 = state3.executeQuery(strQuery3);
                while (result3.next()) {
                    acttype = result3.getString("AccountType");
                    acttype = acttype.trim();
                    branchcity = result3.getString("Branch");
                    branchcity = branchcity.trim();
                    if ((actype.equals(acttype)) && (branch.equals(branchcity))) {
                        ctr = 1;
                        flag2 = 3;
                        break;
                    }
                }
                connect1.close();
                if ((flag != 1) && (flag1 == 2) && (flag2 == 3)) {
                    connect1 = DriverManager.getConnection("jdbc:derby://localhost:1527/Bank", "test", "test");
                    String pwd = request.getParameter("pwd");
                    PreparedStatement stat4 = connect1.prepareStatement("insert into LoginInfo values(?,?,?)");
                    stat4.setInt(1, num2);
                    //stat4.setString(1, str4);
                    stat4.setInt(2, num1);
                    stat4.setString(3, pwd);
                    stat4.executeUpdate();
                    out.println("Congratulations!!!! You are now registered online. Click the login button to login and view your account details.");
        %>
        <input type="button" value="Login" name="Login" onClick="login()">
        <%
                } else {
                    out.println("<b>");
                    out.println("Sorry, your request for registration is rejected. Either you are already registered online or the data supplied doesn’t match with our database.");
                }
            } catch (Exception e) {
                out.println("done exception" + e);
            }
        %>
        <p>
            <%
                out.println("<h4>");
            %>
        </p>
        <p>
            <input type="button" value="Back to Register Page" name="Back" onClick="goBack()">&nbsp; &nbsp;
            <input type="button" value="Cancel" name="Login" onClick="goHome()">
        </p>
        <script Language="JavaScript">
            function goBack() {
                open("registeredUser.html");
            }

            function goHome() {
                open("index.html");
            }
            function login() {
                open("login.html");
            }
        </script>
        <p>&nbsp;</p>
    </body>
</html>
