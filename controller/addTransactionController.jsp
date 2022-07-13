<%@include file="../inc/connect.jsp"%>

<%
  int goalId = request.getParameter("goal-id")!= null? Integer.parseInt(request.getParameter("goal-id")):-1;
  String transactionNominal = request.getParameter("transaction-nominal") != null? request.getParameter("transaction-nominal"):"";
  String transactionDate = request.getParameter("transaction-date") != null?request.getParameter("transaction-date"):"";
  String transactionType = request.getParameter("transaction-type") != null?request.getParameter("transaction-type"):"";
  String transactionCategory  = request.getParameter("transaction-category") != null?request.getParameter("transaction-category"):"";
  String transactionDescription = request.getParameter("transaction-description") != null?request.getParameter("transaction-description"):"";

  if(transactionNominal.isEmpty()){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Amount transaction must be filled!");
    return;
  }else if(!isNumeric(transactionNominal)){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Amount transaction must be numeric!");
    return;
  }
  int transactionNominalInt = Integer.parseInt(transactionNominal);
  if(transactionNominalInt <= 0){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Amount transaction must be greater than 0!");
    return;
  }

  if(transactionDate.isEmpty()){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Transaction date must be filled");
    return;
  }

  if(transactionType.isEmpty()){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Transaction type must be selected");
    return;
  }

  if(transactionCategory.isEmpty()){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Transaction category must be selected");
    return;
  }

  if(transactionDescription.isEmpty()){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Transaction description must be filled");
    return;
  }else if(transactionDescription.length() < 10){
    response.sendRedirect("../goalsTransaction.jsp?goal-id="+goalId+"&error=Transaction description must be greater than 10 characters");
    return;
  }

  String query = String.format("INSERT INTO transaction(goal_id, transaction_nominal, transaction_type, transaction_category, transaction_date, transaction_description) VALUES (%d,%d,'%s','%s','%s','%s')",
                                goalId, transactionNominalInt, transactionType, transactionCategory, transactionDate, transactionDescription);
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