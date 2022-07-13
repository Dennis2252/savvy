<%
  Cookie my_cookie = null;
  Cookie[] my_cookies = null;
  my_cookies = request.getCookies();
  
  if( my_cookies != null ) {
    for (int i = 0; i < my_cookies.length; i++) {
      my_cookie = my_cookies[i];
      my_cookie.setMaxAge(0);
      response.addCookie(my_cookie);
    }
  }

  response.sendRedirect("index.jsp");
%>