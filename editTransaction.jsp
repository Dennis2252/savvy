<%@include file="../inc/connect.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="custom.css">
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
<%
  int transactionId = request.getParameter("transaction-id") != null? Integer.parseInt(request.getParameter("transaction-id")):-1;
  int goalId = request.getParameter("goal-id") != null? Integer.parseInt(request.getParameter("goal-id")):-1;
  query = "SELECT * FROM transaction WHERE transaction_id="+transactionId;
  rs = st.executeQuery(query);
  int transactionNominal = -1;
  String transactionType = "";
  String transactionCategory = "";
  Date transactionDate = null;
  String transactionDesc = "";
  if(rs.next()){
    transactionNominal   = rs.getInt("transaction_nominal");
    transactionType      = rs.getString("transaction_type");
    transactionCategory  = rs.getString("transaction_category");
    transactionDate      = rs.getDate("transaction_date");
    transactionDesc      = rs.getString("transaction_description");
  }

  query = "SELECT * FROM goal WHERE goal_id="+goalId;
  rs = st.executeQuery(query);
  Date goalEndDate = null;
  if(rs.next()){
    goalEndDate = rs.getDate("goal_date_end");
  }
  String error = request.getParameter("error") != null? request.getParameter("error") : "";
%>
<div id="content-wrap">
  <div class="container justify-content-center align-self-center  mt-5">
      <div class="row justify-content-center align-self-center">
          <div class="col-12 col-md-6">
              <p class="fs-3 fw-bold border-bottom border-dark mb-0 pb-2">
                Edit Your Transaction
              </p>
              <div class="row">
                <div class="col mt-3 fw-bold">Transaction Details</div>
              </div>
              <form method="get" action="controller/editTransactionController.jsp" class="mt-3">
                <input type="text" value="<%=goalId%>" hidden name="goal-id">
                <input type="text" value="<%=transactionId%>" hidden name="transaction-id">
                <div class="mb-3">
                  <label for="inputExpense" class="form-label">Amount Transaction</label>
                  <input name="transaction-nominal" type="number" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputExpense" placeholder="(Rp)" value="<%=transactionNominal%>">
                </div>
                <div class="mb-3">
                  <label for="inputDate" class="form-label">Date</label>
                  <input name="transaction-date" max="<%=goalEndDate%>" type="date" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputDate" value="<%=transactionDate%>">
                </div>
                <div class="mb-3">
                  <label for="transaction-type" class="form-label mb-1 ">Type</label>
                  <select onchange="populate('transaction-type', 'transaction-category')" class="form-select rounded-0 border border-2 border-dark shadow-sm" name="transaction-type" id="transaction-type">
                    <option selected value="">Choose transaction type</option>
                    <option value="income">Income</option>
                    <option value="expense">Expense</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="transaction-category" class="form-label mt-2 mb-1 ">Category</label>
                  <select class="form-select rounded-0 border border-2 border-dark shadow-sm" name="transaction-category" id="transaction-category"></select>
                </div>
                <div class="mb-3">
                  <label for="inputNote" class="form-label">Transaction Note</label>
                  <textarea name="transaction-description" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="exampleFormControlTextarea1" rows="3"><%=transactionDesc%></textarea>
                </div>
                <%if(!error.isEmpty()){%>
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <%=error%>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
                <%}%>
                <div class="d-flex bd-highlight mb-3 border-top border-dark">
                  <div class="me-auto p-2 bd-highlight"></div>
                  <a class="p-2 bd-highlight btn btn-secondary mt-3 me-3" href="goalsTransaction.jsp" >Cancel</a>
                  <button type="submit" class="p-2 bd-highlight btn btn-primary mt-3" style="background-color: #3B10E4;">Save Changes</button>
                </div>

              </form>
          </div>
      </div>
  </div>
  </div>
  <footer id="footer">
    <%@ include file = "footer.jsp" %>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  <script src="js/script.js" type="text/javascript"></script>
</body>
</html>