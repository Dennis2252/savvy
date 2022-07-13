<%@include file="../inc/connect.jsp"%>
<%
  int transactionId = request.getParameter("transaction-id")!= null? Integer.parseInt(request.getParameter("transaction-id")):-1;
  int goalId = request.getParameter("goal-id")!= null? Integer.parseInt(request.getParameter("goal-id")):-1;
  String query = "DELETE FROM transaction WHERE transaction_id=" + transactionId;
  st.executeUpdate(query);
  response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId);
%>