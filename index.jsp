<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap" rel="stylesheet">
    <title>Savvy</title>
    <style>
        
    #custom{
        font-family:Poppins; background-color:#3B10E4;background-image: url('Asset/bursts.svg');background-repeat: no-repeat;

        background-repeat: no-repeat;
        background-size: 175%;
        background-position: 46% 4%;
        -webkit-box-pack: center;
        justify-content: center;


        text-align: center;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        flex-direction: column;
        -webkit-box-pack: center;
        justify-content: center;
        overflow-x: hidden;
    }
    .container h1{
        font-size:7em;
        font-weight:500;
    }

    @media only screen and  (max-width:961px){

    #custom{
        background-image: url('Asset/bursts-tablet.svg');
        background-color:#3B10E4;
        background-repeat: no-repeat; 

        background-size: 153%;
        background-position: right 40% center;
        -webkit-box-pack: center;
        justify-content: center;
        
        }
    .container h1{
        font-size:4em;
        font-weight:500;
                }
        
    }

    @media only screen and  (max-width:480px){
    #custom{
        background-image: url('Asset/bursts-mobile.svg');
        background-color:#3B10E4;
        background-repeat: no-repeat;
        background-size: 215%;
        height: 100vh;
          
           
                    
        }
    .container h1{
        font-size:3em;
        font-weight:500;
    }
    }
    

    </style>

</head>
<body  id="custom">
    <%@include file="controller/initLoginStatus.jsp"%>
    <%
        if(isLogin.equals("true")){
            response.sendRedirect("home.jsp");
        }
    %>
    <div class="container-fluid d-flex flex-column min-vh-100 justify-content-center align-items-center"style="height: 100%;">
        <div class="container ">
            <div class="row">
                <div class="col">
                    <h1 class="bg-transparent text-center" style="color:#FFD300;"><strong>Save</strong> it to the next <strong>levels</strong></h1>
                    <p class="bg-transparent text-center" style="color:#FFD300">Lets strategized your financial future today</p>
                    <a class="btn btn-primary" style="background-color: #FFD300; color:#3B10E4;" href="register.jsp"><strong>SIGN UP</strong></a>
                    <a class="btn btn-primary" style="background-color: #FFD300; color:#3B10E4;" href="login.jsp"><strong>LOGIN</strong></a>
                </div>
            </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>