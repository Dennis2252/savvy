<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
            max-width: 680px;
        }
        .container2{
            padding-top: 190px;
            padding-left: 50px;
            padding-bottom: 260px;
        }
        
    </style>
</head>
<body>
    <%
        String error = request.getParameter("error") != null? request.getParameter("error"): "";
    %>
    <div class="row">
        <div class="col-sm-7">
            <div class="container">
                <h1 class="mb-4" style="font-size: 70px; font-weight: 550; color: #10172E;">Create your <span style="color: #3B10E4;">Account</span></h1>
                
                <form action="controller/registerController.jsp" method="post" class="form-register border border-3 border-dark shadow-sm">
                    <h3>Sign Up</h3> <br>
                    <div class="form-group">
                        <input type="email" name="user-email" class="form-control border border-dark rounded-0" id="user-email" placeholder="Enter email">
                    </div> <br>
        
                    <div class="form-group">
                        <input type="password" name="user-password" class="form-control border border-dark rounded-0" id="user-password" placeholder="Password">
                    </div> <br>
        
                    <div class="form-group mb-3">
                        <input type="password" name="user-repassword" class="form-control border border-dark rounded-0" id="password" placeholder="Re-enter Password">
                    </div>
                    <%if(!error.isEmpty()){%>
                    <div class="alert alert-danger p-1 mb-3 rounded-0"  role="alert">
                        <%=error%>
                    </div>
                    <%}%>
                    <div class="text-center">
                        <div class="form-group">
                            <button type="submit" class="btn btn-dark" style="background-color: #3B10E4; width: 100px;">Sign up</button>
                        </div>
                        <br>
                        <h6>Already have an account? <a href="login.jsp"><span style="color: #3B10E4;">Sign in</span></a></h6>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-sm-5" style="background-color: #3B10E4;">
            <div class="container2">
                <h1 style="font-size: 45px; font-weight: 600;"><span style="color: #FEFEFF;">Gain </span><span style="color: #FFD300;">Total Control</span></h1>
                <h1 style="font-size: 45px; font-weight: 600;"><span style="color: #FEFEFF;">of </span> <span style="color: #FFD300;">your money</span></h1>
            </div>
            
            <a href="index.jsp" style="font-size: 85px; font-weight: 600; text-decoration: none;"><span style="color: #FEFEFF;">sa</span><span style="color: #FFD300;">vv</span><span style="color: #FEFEFF;">y</span></a>
        </div>
    </div>
    

</body>
</html>