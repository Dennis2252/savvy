<%@include file="../inc/connect.jsp"%>

<%
  int goalId = request.getParameter("goal-id")!= null? Integer.parseInt(request.getParameter("goal-id")):-1;
  int transactionId = request.getParameter("transaction-id") != null? Integer.parseInt(request.getParameter("transaction-id")):-1;
  String transactionNominal = request.getParameter("transaction-nominal") != null? request.getParameter("transaction-nominal"):"";
  String transactionDate = request.getParameter("transaction-date") != null?request.getParameter("transaction-date"):"";
  String transactionType = request.getParameter("transaction-type") != null?request.getParameter("transaction-type"):"";
  String transactionCategory  = request.getParameter("transaction-category") != null?request.getParameter("transaction-category"):"";
  String transactionDescription = request.getParameter("transaction-description") != null?request.getParameter("transaction-description"):"";

  if(transactionNominal.isEmpty()){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Amount transaction must be filled!");
    return;
  }else if(!isNumeric(transactionNominal)){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Amount transaction must be numeric!");
    return;
  }
  int transactionNominalInt = Integer.parseInt(transactionNominal);
  if(transactionNominalInt <= 0){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Amount transaction must be greater than 0!");
    return;
  }

  if(transactionDate.isEmpty()){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Transaction date must be filled");
    return;
  }

  if(transactionType.isEmpty()){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Transaction type must be selected");
    return;
  }

  if(transactionCategory.isEmpty()){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Transaction category must be selected");
    return;
  }

  if(transactionDescription.isEmpty()){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Transaction description must be filled");
    return;
  }else if(transactionDescription.length() < 10){
    response.sendRedirect("../editTransaction.jsp?goal-id="+goalId+"&transaction-id="+transactionId+"&error=Transaction description must be greater than 10 characters");
    return;
  }

  String query = String.format("UPDATE transaction SET transaction_nominal=%d, transaction_type='%s',transaction_category='%s',transaction_date='%s',transaction_description='%s' WHERE transaction_id=%d",
                                transactionNominalInt, transactionType, transactionCategory, transactionDate, transactionDescription, transactionId);
  st.executeUpdate(query);
  response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId);

  
%>

<%!
  public boolean isNumeric(String strNum) {
    if (strNum == null) {
      return false;
    }
    try {
      int  d = Integer.parseInt(strNum);
    } catch (NumberFormatException nfe) {
      return false;
    }
    return true;
  }
%>