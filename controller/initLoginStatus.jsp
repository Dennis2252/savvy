<%
  String userEmail = "";
  String isLogin = "false";
  // HANDLING COOKIES 
  // Reference: https://data-flair.training/blogs/cookies-handling-in-jsp/
  Cookie my_cookie = null;
  Cookie[] my_cookies = null;
  my_cookies = request.getCookies();
  
  if( my_cookies != null ) {
    for (int i = 0; i < my_cookies.length; i++) {
      my_cookie = my_cookies[i];
      if(my_cookie.getName().equals("user_email")){
        userEmail = my_cookie.getValue();
      }else if(my_cookie.getName().equals("user_isLogin")){
        isLogin = my_cookie.getValue();
      }
    }
  }
%>