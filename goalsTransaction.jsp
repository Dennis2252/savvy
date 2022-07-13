<%@include file="../inc/connect.jsp"%>
<%@ include file = "controller/initLoginStatus.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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
  <body style="font-family: Poppins; background-color: #FEF1E5;">
    <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
    <%@ include file = "headerlogin.jsp" %>
    <%
      rs = null;
      int goalId = request.getParameter("goal-id")!= null? Integer.parseInt(request.getParameter("goal-id")):-1;
      query = "SELECT * FROM goal WHERE goal_id="+goalId;
      rs = st.executeQuery(query);
      String goalName = "";
      int goalTarget = 0;
      Date goalEndDate = null;
      boolean isCompleted = false;
      if(rs.next()){
        goalName = rs.getString("goal_name");
        goalTarget = rs.getInt("goal_nominal");
        goalEndDate = rs.getDate("goal_date_end");
        isCompleted = rs.getBoolean("is_completed");
      }

      query = "SELECT * FROM transaction WHERE goal_id="+goalId;
      rs = st.executeQuery(query);
      int totalIncome = 0;
      int totalExpense = 0;
      int totalProgress = 0;
      while(rs.next()){
        String transactionType = rs.getString("transaction_type");

        if(transactionType.equals("income")){
          totalIncome += rs.getInt("transaction_nominal");
        }else if(transactionType.equals("expense")){
          totalExpense += rs.getInt("transaction_nominal");
        }
      }
      totalProgress = totalIncome - totalExpense;
      String error = request.getParameter("error")!=null? request.getParameter("error"):"";

      if(totalProgress >= goalTarget && !isCompleted){
        String query1 = "UPDATE goal SET is_completed=TRUE WHERE goal_id="+goalId;
        st.executeUpdate(query1);
        response.sendRedirect("goalsTransaction.jsp?goal-id="+goalId);
      }else if(totalProgress < goalTarget && isCompleted){
        String query1 = "UPDATE goal SET is_completed=FALSE WHERE goal_id="+goalId;
        st.executeUpdate(query1);
        response.sendRedirect("goalsTransaction.jsp?goal-id="+goalId);
      }
    %>
    <div id="content-wrap">
    <div class="container mb-3">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-6 bg-white border border-3 border-dark shadow-sm p-3">
          <div class="row justify-content-between">
            <p class="col"><strong>Goals : </strong><%=goalName%></p>
            <p class="col text-end"><strong>End date : </strong><%=goalEndDate%></p>
          </div>
          
          <h2 class="mb-4"><strong>Rp.<%=goalTarget%> </strong></h2>
          <p class="mb-2"><strong>Progress : </strong>Rp.<%=totalProgress%></p>
          <%
            if(totalProgress <= 0){
          %>
          <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: 0%;" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
              0%
            </div>
          </div>
          <%} else if(totalProgress >= goalTarget){%>
          <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: 100%;" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
              Completed
            </div>
          </div>
          <%}else{
              double progressPercent = ((double)totalProgress / goalTarget) * 100;
            %>
          <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width:<%=progressPercent%>%;" role="progressbar" aria-valuenow="<%=progressPercent%>" aria-valuemin="0" aria-valuemax="100">
              <%= (int)progressPercent%>%
            </div>
          </div>
          <%}%>
          <%if(isCompleted){%>
          <p class="text-center mt-3 mb-0">Congratulation, You crushed your goal!</p>
          <%}%>
        </div>
        
      </div>
      <div class="row justify-content-center">
        <div class="col-12 col-lg-6 p-0 mt-2 mb-2">
          <p class="h4 mt-2 mb-2"><strong>Report</strong></p>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-12 col-lg-6">
          <div class="row">
            <div class="col-6 ps-0">
              <div class="border border-3 border-dark shadow-sm p-2" style="background-color: #FFD300;">
                <p class="mb-2">Total Income</p>
                <p class="h3 mb-1" style="color: #3B10E4;"><strong>+Rp.<%=totalIncome%></strong></p>
              </div>
            </div>
            <div class="col-6 pe-0">
              <div class="border border-3 border-dark shadow-sm p-2" style="background-color: #FFD300;">
                <p class="mb-2">Total Expense</p>
                <p class="h3 mb-1" style="color: #3B10E4;"><strong>-Rp.<%=totalExpense%></strong></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-12 col-lg-6 p-0 mt-2 mb-2">
          <p class="h4 mt-2 mb-2"><strong>Saving Goals</strong></p>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-12 col-lg-6 bg-white border border-3 border-dark shadow-sm p-3">
          <%if(!error.isEmpty()){%>
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <%=error%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
          <%}%>
          <div class="row">
            <div class="col-8 my-auto">
              <p class="h4 d-block mb-0">Track Your Transaction</p>
            </div>
            <div class="col-4">
                <%if(isCompleted){%>
                <button disabled type="button" class="btn btn-primary border-0 w-100" style="background-color: #3B10E4;" data-bs-toggle="modal" data-bs-target="#addTransaction">
                <i class="fa-solid fa-plus"></i>
                  Add Transaction
                </button>
                <%}else {%>
                <button type="button" class="btn btn-primary border-0 w-100" style="background-color: #3B10E4;" data-bs-toggle="modal" data-bs-target="#addTransaction">
                <i class="fa-solid fa-plus"></i>
                  Add Transaction
                </button>
                <%}%>
            </div>
          </div>
          <!-- Table Transaction -->
          <table class="table table-borderless mt-3">
            <thead>
              <tr>
                <th scope="col" style="background-color: #f1f1f2;border: 5px solid white;color: #969595;">Date</th>
                <th scope="col" style="background-color: #f1f1f2;border: 5px solid white;color: #969595;">Category</th>
                <th scope="col" style="background-color: #f1f1f2;border: 5px solid white;color: #969595;">Total</th>
              </tr>
            </thead>
            <tbody>
              <%
                rs = st.executeQuery(query);
                while(rs.next()){
                  int transactionId = rs.getInt("transaction_id");
                  int transactionNominal = rs.getInt("transaction_nominal");
                  String transactionType = rs.getString("transaction_type");
                  String transactionCategory = rs.getString("transaction_category");
                  Date transactionDate = rs.getDate("transaction_date");
                  String transactionDesc = rs.getString("transaction_description");

              %>
              <tr>
                <th scope="row" class="p-1"><%=transactionDate%></th>
                <td class="p-1"><%=transactionCategory%></td>
                <%
                  if(transactionType.equals("income")){
                %>
                <td class="p-1" style="color: #018A26;">+Rp.<%=transactionNominal%></td>
                <%}else if(transactionType.equals("expense")){%>
                <td class="p-1" style="color: #F75B5B;">-Rp.<%=transactionNominal%></td>
                <%}%>
                <td class="col-1 py-1">
                  <button type="button" class="btn btn-primary border-0 w-100" style="background-color: #3B10E4;" data-bs-toggle="modal" data-bs-target="#viewDetail"
                    data-bs-id="<%=transactionId%>"
                    data-bs-nominal="<%=transactionNominal%>"
                    data-bs-type="<%=transactionType%>"
                    data-bs-category="<%=transactionCategory%>"
                    data-bs-date="<%=transactionDate%>"
                    data-bs-description="<%=transactionDesc%>"
                    data-bs-goalId="<%=goalId%>"
                  >
                    <i class="fa-solid fa-ellipsis-vertical"></i>
                  </button>
                </td>
              </tr>
              <%}%>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    </div>
    <footer id="footer">
      <%@ include file = "footer.jsp" %>
    </footer>
    <!-- Modal Add-->
    <div class="modal fade" id="addTransaction" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <form action="controller/addTransactionController.jsp" method="get" class="modal-content border border-4 border-dark shadow rounded-0">
          <div class="modal-header px-2 py-1 bg-dark rounded-0">
            <h5 class="modal-title text-white" id="exampleModalLabel">Add Transaction</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="text" name="goal-id" value="<%=goalId%>" hidden>
            <h4 class="mb-0">Add</h4>
            <hr class="mt-2 mb-2">
            <label for="transaction-nominal" class="form-label mb-1">Amount Transaction</label>
            <input type="number" class="form-control rounded-0 border border-2 border-dark shadow-sm" name="transaction-nominal" id="ransaction-nomina" placeholder="Rp. 1.000.000">
            <label for="transaction-date" class="form-label mt-2 mb-1">Date</label>
            <input type="date" max="<%=goalEndDate%>" name="transaction-date" id="transaction-date" class="form-control rounded-0 border border-2 border-dark shadow-sm">
            <label for="transaction-type" class="form-label mt-2 mb-1 ">Type</label>
            <select onchange="populate('transaction-type', 'transaction-category')" class="form-select rounded-0 border border-2 border-dark shadow-sm" name="transaction-type" id="transaction-type">
              <option selected value="">Choose transaction type</option>
              <option value="income">Income</option>
              <option value="expense">Expense</option>
            </select>
            <label for="transaction-category" class="form-label mt-2 mb-1 ">Category</label>
            <select class="form-select rounded-0 border border-2 border-dark shadow-sm" name="transaction-category" id="transaction-category"></select>
            <label for="transaction-description" class="form-label mt-2 mb-1 ">Description</label>
            <div>
              <textarea name="transaction-description" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="transaction-description" placeholder="Description of transaction"></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary" style="background-color: #3B10E4;">Save changes</button>
          </div>
        </form>
      </div>
    </div>

    <!-- Modal View Detail-->
    <div class="modal fade" id="viewDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border border-4 border-dark shadow rounded-0">
          <div class="modal-header px-2 py-1 bg-dark rounded-0">
            <h5 class="modal-title text-white" id="modal-title">31/05/2022</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">  
            <h4 class="mb-0">Transaction Details</h4>
            <hr class="mt-2 mb-2">
            <p class="mb-1"><strong>Total Amount : </strong> Rp. <span id="modal-amount"></span></p>
            <p class="mb-1"><strong>Type : </strong> <span id="modal-type"></span> </p>
            <p class="mb-2"><strong>Category : </strong> <span id="modal-category"></span></p>
            <p class="mb-2"><Strong>Transaction Note</Strong></p>
            <p style="background-color: #FEF1E5;" class="p-2" id="modal-description"></p>
          </div>
          <div class="modal-footer">
          
            <a href="#" class="btn btn-primary" style="background-color: #3B10E4;" id="modal-edit" >Edit</a>
            <a href="#" type="button" class="btn btn-danger "  style="background-color: #F75B5B;" id="modal-delete" >Delete</a>
          </div>

        </div>
      </div>
    </div>
    
    <script src="https://kit.fontawesome.com/5367f5a9ff.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <script src="js/script.js" type="text/javascript"></script>
  </body>
</html>