<%@include file="../inc/connect.jsp"%>

<%
  String userEmail = request.getParameter("user-email");
  String userPassword = request.getParameter("user-password");

  // Validasi Email
  if(userEmail.isEmpty()){
    response.sendRedirect("../login.jsp?error=User Email must be filled!");
    return;
  }else if(!isValidEmailAddress(userEmail)){
    response.sendRedirect("../login.jsp?error=User Email format is wrong!");
    return;
  }
  // Validasi Password
  if(userPassword.isEmpty()){
    response.sendRedirect("../login.jsp?error=Password must be filled");
    return;
  }

  ResultSet rs = null;
  String query = "SELECT * FROM user WHERE user_email = '"+ userEmail +"'";
  rs = st.executeQuery(query);
  while (rs.next()){
    if(userEmail.equalsIgnoreCase(rs.getString("user_email")) && userPassword.equals(rs.getString("user_password"))){
      Cookie userEmailCookie = new Cookie("user_email", rs.getString("user_email"));
      Cookie isLogingCookie =  new Cookie("user_isLogin", "true");
      userEmailCookie.setPath("/savvy");
      isLogingCookie.setPath("/savvy");
      response.addCookie(userEmailCookie);
      response.addCookie(isLogingCookie);

      response.sendRedirect("../home.jsp");

      return;
    }
  }
  response.sendRedirect("../login.jsp?error=Email or password wrong!");

%>
<%!
// https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
  public boolean isValidEmailAddress(String email) {
    String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
    java.util.regex.Matcher m = p.matcher(email);
    return m.matches();
  }
%>