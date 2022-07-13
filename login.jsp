<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap">
    <style type="text/css">
        body{
            background-color: #FEF1E5;
            font-family: 'Poppins', sans-serif;
        }
        .container{
            padding-top: 50px;
            max-width: 680px;
        }
        .form-register{
            padding: 24px;
            background-color: white;
            margin: 0 auto;
            max-width: 680px;
        }
        .container2{
            padding-top: 100px;
            padding-bottom: 20px;
        }
        
    </style>
</head>
<body>
    <%
        String error = request.getParameter("error") != null? request.getParameter("error") : "";
        String success = request.getParameter("success_register") != null? request.getParameter("success_register"): "";
    %>
    <div class="container">
        <div class="container2">
            <h1 style="font-size: 70px; font-weight: 600; line-height: 15px;"><span style="color: #10172E;;">Welcome </span><span style="color: #3B10E4;">back!</span></h1>
            <h1 style="font-size: 70px; font-weight: 600;"><span style="color: #10172E;;">to sa</span><span style="color: #FFD300;">vv</span><span style="color: #10172E;;">y</span></h1>
        </div>
        <form action="controller/loginController.jsp" method="post" class="form-register border border-3 border-dark shadow-sm">
            <h3 class="mb-4">Sign in</h3>
            <input type="email" name="user-email" class="form-control border border-dark mb-3 rounded-0" id="user-email" placeholder="Enter Email">
            <input type="password" name="user-password" class="form-control border border-dark mb-3 rounded-0" id="user-password" placeholder=" Enter Password">
            <%if(!error.isEmpty()){%>
            <div class="alert alert-danger p-1 mb-3 rounded-0"  role="alert">
                <%=error%>
            </div>
            <%}%>
            <%if(!success.isEmpty()){%>
            <div class="alert alert-success p-1 mb-3  rounded-0" role="alert">
                <%=success%>
            </div>
            <%}%>
            <div class="text-center">
                <div class="form-group">
                    <button type="submit" class="btn btn-dark" style="background-color: #3B10E4; width: 100px;">Login</button>
                </div>
                <br>
                <p class="h6">Not a user? <a href="register.jsp"><span style="color: #3B10E4;">Sign up</span></a></p>
            </div>

            
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>