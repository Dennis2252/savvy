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
    <link rel="stylesheet" href="custom.css">
</head>
  <body style="background-color: #FEF1E5; font-family: Poppins;">
  <%@ include file = "headerlogin.jsp" %>
  
    <div class="container justify-content-center align-self-center vh-100">
        <div class="row justify-content-center align-self-center">
            <div class="col-12 col-md-6">


                <p class="fs-3 fw-bold border-bottom border-dark pb-2 mt-5">
                  Profile
                </p>

                <p class="fw-bold mb-1">Profile Details</p>
                <p >Email: <%=userEmail%></p>

                <p class="fw-bold mb-1">Change Password</p>
                <form class="mt-1" action="controller\changePasswordController.jsp" method="get">
                  <div class="mb-3">
                    <label for="inputOldPassword" class="form-label">Old Password</label>
                    <input type="password" name="old-password" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputOldPassword" placeholder="Old Password">
                  </div>
                  <div class="mb-3">
                    <label for="inputNewPassword" class="form-label">New Password</label>
                    <input type="password" name="new-password" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputNewPassword" placeholder="New Password">
                  </div>
                  <div class="mb-3">
                    <label for="inputConfirmPassword" class="form-label">Confirm New Password</label>
                    <input type="password" name="confirm-password" class="form-control rounded-0 border border-2 border-dark shadow-sm" id="inputConfirmPassword" placeholder="Confirm Password">
                  </div>
                  <div class="d-flex bd-highlight mt-5 mb-3 border-top border-dark">
                    <div class="me-auto p-2 bd-highlight"></div>
                    <a href="home.jsp" class="p-2 bd-highlight btn btn-secondary mt-3 me-3">Cancel</a>
                    <button type="submit" class="p-2 bd-highlight btn btn-primary mt-3" style="background-color: #3B10E4;">Save Changes</button>
                  </div>
                </form>
            </div>
        </div>
    </div>
    <footer >
      <%@ include file = "footer.jsp" %>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>