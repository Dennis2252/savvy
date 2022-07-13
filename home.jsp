<%@ page import="java.io.*" %>
<%@include file="../inc/connect.jsp"%>
<%@ include file = "controller/initLoginStatus.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5367f5a9ff.js" crossorigin="anonymous"></script>
    <title>Savvy</title>
    <style>
        #page-container {
            position: relative;
            min-height: 100vh;
        }

        #content-wrap {
            padding-bottom: 2.5rem;    /* Footer height */
        }

        #footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 2.5rem;            /* Footer height */
        }
    </style>
</head>


<body style="background-color: #FEF1E5; font-family:'Poppins';">
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
    <%@ include file = "headerlogin.jsp" %>
    <%
        if(isLogin.equals("false")){
            response.sendRedirect("index.jsp");
        }
        String error = request.getParameter("error") != null? request.getParameter("error") : "";
        
    %>

    <div id="page-container">
        <div id="content-wrap">
            
            
            <div class="container mt-5">
                <div class="row">
                    <div class="col">
                        <h1 class="text-center">set <span style="color: #3B10E4;"><strong>goals</strong></span> crush them</h1>
                        <h1 class="text-center mb-5">then <span style="color: #3B10E4;"><strong>repeat</strong></span></h1>
                    </div>
                </div>
            </div>
            <div class="container" >
                <div class="row justify-content-center mb-4">
                    <div class="col-12 col-md-6 bg-white border border-3 border-dark shadow-sm p-3" >
                        <h3 class="mb-3">Set your goals</h3>
                        <form action="controller/addGoalController.jsp" method="get">
                            <input type="text" value="<%=userId%>" hidden name="user-id">
                            <div class="form-group" >
                                <input type="text" class="form-control rounded-0 border border-2 border-dark shadow-sm mb-3" id="goal-name" name="goal-name" placeholder="Name of your Goal">
                            </div>
                            <div class="form-group" >
                                <input type="number" class="form-control rounded-0 border border-2 border-dark shadow-sm mb-3" id="goal-budget" name="goal-budget" placeholder="Your Goal Target (Rp)">
                            </div>
                            <div class="form-group" >
                                <label for="">End Date</label>
                                <input type="date" min="<%= df.format(new java.util.Date()) %>" class="form-control rounded-0 border border-2 border-dark shadow-sm mb-3" id="goal-date" name="goal-date" placeholder="Total Budget (Rp)">
                            </div>
                            <div class="col-md-12 mb-2" style="color: red;">
                            </div>
                            <%if(!error.isEmpty()){%>
                                <div class="alert alert-danger p-1 mb-3 rounded-0"  role="alert">
                                    <%=error%>
                                </div>
                            <%}%>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" style="background-color: #3B10E4;">set goals</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6 p-0">
                        <p class="h4"><strong>Goals</strong></p>
                    </div>
                </div>
                <%
                    query = "SELECT * FROM goal WHERE user_id="+userId;
                    rs = st.executeQuery(query);
                    while(rs.next()){
                        int goalId = rs.getInt("goal_id");
                %>
                <%-- ROW GOALS --%>
                
                <div class="row justify-content-center" onclick="location.href='goalsTransaction.jsp?goal-id=<%=goalId%>';" style="cursor: pointer;">
                    <div class="col-12 col-md-6 p-3 border border-3 border-dark shadow-sm mb-4" style="background-color: #FFD300; cursor: pointer;" >
                        <div class="row justify-content-center align-items-center">
                            <div class="col-10">
                                <p class="mb-2"><strong>Goals : </strong><span><%=rs.getString("goal_name")%></span></p>
                                <p class="h3 mb-1" style="color: #3B10E4;"><strong>Rp. <%=rs.getInt("goal_nominal")%></strong></p>
                                <p class="mb-0">End Date: <%=rs.getDate("goal_date_end")%></p>
                            </div>
                            <div class="col text-end ">
                                    
                                    <a href="editGoals.jsp?goal-id=<%=goalId%>" class="btn btn-primary" style="background-color: #3B10E4;">
                                        <i class="fas fa-edit"></i>
                                    </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <footer id="footer">
            <%@ include file = "footer.jsp" %>
        </footer>
    </div>
    
    <script src="https://kit.fontawesome.com/5367f5a9ff.js" crossorigin="anonymous"></script>
    
</body>
</html>

