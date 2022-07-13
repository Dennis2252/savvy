<%@include file="../inc/connect.jsp"%>

<%
  String userEmail = request.getParameter("user-email");
  String userPassword = request.getParameter("user-password");
  String userRePassword = request.getParameter("user-repassword");

  // Validasi Email
  if(userEmail.isEmpty()){
    response.sendRedirect("../register.jsp?error=User Email must be filled!");
    return;
  }else if(!isValidEmailAddress(userEmail)){
    response.sendRedirect("../register.jsp?error=User Email format is wrong!");
    return;
  }

  ResultSet rs = null;
  String query = "SELECT * FROM user";
  rs = st.executeQuery(query);
  while (rs.next()){
    if(userEmail.equalsIgnoreCase(rs.getString("user_email"))){
      response.sendRedirect("../register.jsp?error=Email has been registered! Please <a href='login.jsp'>Sign In</a>.");
      return;
    }
  }

    // Validasi Password
  if(userPassword.isEmpty()){
    response.sendRedirect("../register.jsp?error=Password must be filled");
    return;
  }else if(userPassword.length() < 6){
    response.sendRedirect("../register.jsp?error=Password length must be at least 6 characters!");
    return;
  }else if(!isCharNumeric(userPassword)){
    response.sendRedirect("../register.jsp?error=Password must contains at least one alphabet and one number!");
    return;
  }

  // Validasi confirm password
  if(!userRePassword.equals(userPassword)){
    response.sendRedirect("../register.jsp?error=Confirm password must match with password!");
    return;
  }

  query = String.format("INSERT INTO user (user_email,  user_password) VALUES ('%s','%s')",
                        userEmail, userPassword);
  st.executeUpdate(query);

  response.sendRedirect("../login.jsp?success_register=Congratulation you have been succesfully registered! Please sign in.");
%>

<%!
// https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
  public boolean isValidEmailAddress(String email) {
    String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
    java.util.regex.Matcher m = p.matcher(email);
    return m.matches();
  }

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