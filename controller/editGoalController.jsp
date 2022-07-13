<%@include file="../inc/connect.jsp"%>

<%
  int goalId = request.getParameter("goal-id")!= null? Integer.parseInt(request.getParameter("goal-id")):-1;
  String goalName = request.getParameter("goal-name");
  String goalBudget  = request.getParameter("goal-budget");
  String goalDate = request.getParameter("goal-date");

  if(goalName.isEmpty()){
    response.sendRedirect("../editGoals.jsp?goal-id="+goalId+"&error=Goal name must be filled!");
    return;
  }else if(goalName.length() < 3){
    response.sendRedirect("../editGoals.jsp?goal-id="+goalId+"&error=Goal name length must be at least 3 charactes!");
    return;
  }
  if(!isNumeric(goalBudget)){
    response.sendRedirect("../editGoals.jsp?goal-id="+goalId+"&error=Goal budget must be filled or number!");
    return;
  }

  int goalBudgetInt = Integer.parseInt(goalBudget);

  if(goalBudgetInt <= 0){
    response.sendRedirect("../editGoals.jsp?goal-id="+goalId+"&error=Goal budget must be greater than 0!s");
    return;
  }

  if(goalDate.isEmpty()){
    response.sendRedirect("../editGoals.jsp?goal-id="+goalId+"&error=Goal date must be filled!");
    return;
  }

  String query = String.format("UPDATE goal SET goal_name='%s', goal_nominal=%d, goal_date_end='%s' WHERE goal_id=%d",
                              goalName, goalBudgetInt, goalDate, goalId);
  st.executeUpdate(query);
  response.sendRedirect("../editGoals.jsp?goal-id="+goalId);
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
%>