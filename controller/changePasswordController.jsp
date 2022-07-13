<%@include file="../inc/connect.jsp"%>
<%@ include file = "initLoginStatus.jsp" %>
<%
  String oldPassword = request.getParameter("old-password");
  String newPassword = request.getParameter("new-password");
  String confirmPassword = request.getParameter("confirm-password");

  // Validasi Old Password
  if(oldPassword.isEmpty()){
    response.sendRedirect("../profile.jsp?error=Old password must be filled!");
    return;
  }

  ResultSet rs = null;
  String query = "SELECT * FROM user WHERE user_email = '"+ userEmail +"'";
  rs = st.executeQuery(query);
  String userPassword = "";
  while (rs.next()){
    userPassword = rs.getString("user_password");
  }

  if(!userPassword.equals(oldPassword)){
    response.sendRedirect("../profile.jsp?error=Old password wrong!");
    return;
  }

  // Validasi new password
  if(newPassword.isEmpty()){
      response.sendRedirect("../profile.jsp?error=New password must be filled");
      return;
  }else if(newPassword.length() < 6){
      response.sendRedirect("../profile.jsp?error=New password length must be at least 6 characters!");
      return;
  }else if(!isCharNumeric(newPassword)){
      response.sendRedirect("../profile.jsp?error=Password must contains at least one alphabet and one number!");
      return;
  }

  // Validasi confirm password
  if(!confirmPassword.equals(newPassword)){
      response.sendRedirect("../profile.jsp?error=Confirm password must match with new password!");
      return;
  }


  query = String.format("UPDATE user SET user_password='%s' WHERE user_email = '%s'", newPassword, userEmail);
  st.executeUpdate(query);
  response.sendRedirect("../home.jsp");

%>

<%!
  public boolean isCharNumeric(String s){
    int i =0, j=0;
    boolean isChar = false, isNum = false;
    for(Character ch : s.toCharArray()){
      if (Character.isAlphabetic(ch)){
        i++; isChar = true;
      }
      else if (Character.isDigit(ch)){
        j++; isNum = true;
      }
    }
    return i + j == s.length() && isChar && isNum;
  }

%>