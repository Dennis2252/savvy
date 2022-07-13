<%@include file="../inc/connect.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Goals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap" rel="stylesheet">
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
  <body style="background-color: #FEF1E5; font-family: Poppins;">
  <%@ include file = "controller/initLoginStatus.jsp" %>
  <%@ include file = "headerlogin.jsp" %>
  <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
  <%
    int goalId = request.getParameter("goal-id") != null? Integer.parseInt(request.getParameter("goal-id")):-1;

    query = "SELECT * FROM goal WHERE goal_id="+goalId;
    rs = st.executeQuery(query);
    String goalName = "";
    int goalTarget = -1;
    Date goalDate = null;
    if(rs.next()){
      goalName = rs.getString("goal_name");
      goalTarget = rs.getInt("goal_nominal");
      goalDate = new Date(rs.getDate("goal_date_end").getTime());
    }

  %>
  <div id="content-wrap">
    <div class="container justify-content-center align-self-center  mt-5" style="margin-bottom: 50px;">
        <div class="row justify-content-center align-self-center">
            <div class="col-12 col-md-6">
              <div class="row">
                <div class="col">
                  <p class="fs-3 fw-bold ">
                    Goal Detail
                  </p>
                </div>
                <div class="col text-end"> 
                  <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteGoal"><i class="fa-solid fa-trash-can"></i> Delete this goal</button>
                </div>
              </div>
                <div class="border-bottom border-dark mb-2"></div>
                <p class="mb-0"> <span class="fw-bold">Goal Name:</span> <%=goalName%></p>
                <p class="mb-0"><span class="fw-bold">Goal target:</span> Rp. <%=goalTarget%></p>
                <p class="mb-5"><span class="fw-bold">End Date:</span> <%=goalDate%></p>
                
                <div class="p-3 border border-3 border-dark shadow-sm mb-5">
                  <p class="fw-bold h4 mb-1">Edit Goal</p>
                  <form method="get" action="controller/editGoalController.jsp">
                    <input type="text" name="goal-id" value="<%=goalId%>" hidden>
                    <div class="mb-3">
                        <label for="inputGoals" class="form-label">Goals Title</label>
                        <input value="<%=goalName%>" type="text" name="goal-name" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputGoals" rows="3">
                    </div>
                    <div class="mb-3">
                      <label for="inputBudget" class="form-label">Total Budget</label>
                      <input name="goal-budget" value="<%=goalTarget%>" type="number" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputBudget" placeholder="(Rp)">
                    </div>
                      <div class="form-group" >
                        <label for="">End Date</label>
                        <input value="<%=goalDate%>" min="<%= df.format(new java.util.Date()) %>" type="date" class="form-control rounded-0 border border-2 border-dark shadow-sm mb-3" id="goal-date" name="goal-date" placeholder="Total Budget (Rp)">
                      </div>
                    <div class="d-flex bd-highlight  mb-3 ">
                      <div class="me-auto p-2 bd-highlight"></div>
                      <a href="home.jsp" class="p-2 bd-highlight btn btn-secondary mt-3 me-3" >Cancel</a>
                      <button type="submit" class="p-2 bd-highlight btn btn-primary mt-3" style="background-color: #3B10E4;">Save Changes</button>
                    </div>
                  </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    <footer id="footer">
        <%@ include file = "footer.jsp" %>
    </footer>

      <!-- Modal Delete-->
      <div class="modal fade" id="deleteGoal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div action="#" class="modal-content border border-4 border-dark shadow rounded-0">
            <div class="modal-header px-2 py-1 bg-dark rounded-0">
              <h5 class="modal-title text-white" id="exampleModalLabel">Delete Goal</h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">  
              <p class="mb-0">are you sure you want to delete this goal? Deleted goal cannot be recovered!</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
              <a href="controller/deleteGoalController.jsp?goal-id=<%=goalId%>" class="btn btn-danger">Yes</a>
            </div>
          </div>
        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>