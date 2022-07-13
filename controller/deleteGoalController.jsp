<%@include file="../inc/connect.jsp"%>

<%
  int goalId = request.getParameter("goal-id")!= null? Integer.parseInt(request.getParameter("goal-id")):-1;

  String query = "DELETE FROM goal WHERE goal_id="+goalId;
  st.executeUpdate(query);
  response.sendRedirect("../home.jsp");
%>