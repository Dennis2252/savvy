<%@include file="../inc/connect.jsp"%>
<%
  String goalName = request.getParameter("goal-name");
  String goalBudget  = request.getParameter("goal-budget");
  String goalDate = request.getParameter("goal-date");
  int userId = request.getParameter("user-id") != null? Integer.parseInt(request.getParameter("user-id")): -1;

  if(goalName.isEmpty()){
    response.sendRedirect("../home.jsp?error=Goal name must be filled!");
    return;
  }else if(goalName.length() < 3){
    response.sendRedirect("../home.jsp?error=Goal name length must be at least 3 charactes!");
    return;
  }
  if(!isNumeric(goalBudget)){
    response.sendRedirect("../home.jsp?error=Goal budget must be filled or number!");
    return;
  }

  int goalBudgetInt = Integer.parseInt(goalBudget);

  if(goalBudgetInt <= 0){
    response.sendRedirect("../home.jsp?error=Goal budget must be greater than 0!s");
    return;
  }

  if(goalDate.isEmpty()){
    response.sendRedirect("../home.jsp?error=Goal date must be filled!");
    return;
  }

  String query = String.format("INSERT INTO goal(user_id, goal_name, goal_nominal, is_completed, goal_date_start, goal_date_end) VALUES (%d,'%s',%d,FALSE,CURDATE(),'%s')",
                              userId, goalName, goalBudgetInt, goalDate);
  st.executeUpdate(query);
  response.sendRedirect("../home.jsp");
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