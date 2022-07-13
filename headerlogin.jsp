<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5367f5a9ff.js" crossorigin="anonymous"></script>
    <style>
    .active{
    border-bottom: 4px solid #10172E;
    font-weight:500;}
  
    .navbar-brand {
      margin-right:24px;
    }
    
    @media only screen and (max-width: 991px) {
  .active, .nav-item {
    border-bottom: 1px solid #10172E;
    font-weight:500;}
    
    }
    #navbarText ul{
      margin:0;
      padding:0;
    }
    </style>
    <title>Document</title>
</head>
<body>
  <%
    ResultSet rs = null;
    String query = "SELECT * FROM user WHERE user_email='"+userEmail+"'";
    rs = st.executeQuery(query);
    int userId = -1;
    String password = "";
    if(rs.next()){
      userId = rs.getInt("user_id");
      password = rs.getString("user_password");
    }
  %>
    <body style="font-family:Poppins">
      <div class="container-fluid shadow-sm mb-5 p-0 bg-white sticky-top">

        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-md-6 p-0">
              <nav class="navbar navbar-expand-lg">
                <div class="container-fluid m-0 p-0">
                  <a href="home.jsp" class="navbar-brand " href="#"> <img src="Asset/logo.png" alt="" height="20"></a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav-sm me-auto mb-2 mb-lg-0" id="NavbarDrop">
                      <li class="nav-item"style="list-style-type: none;">
                        <a class="nav-link active" aria-current="page" href="home.jsp">Dashboard</a>
                      </li>
                    </ul>
                    <span class="navbar-text-sm">
                      
                      <a href="profile.jsp" class="btn" style="background-color:  #3B10E4; color: white;" >
                        <i class="fa-solid fa-user"></i>
                      Profile 
                      </a>
                      <button type="button" class="btn" style="background-color:  #3B10E4; color: white;" data-bs-toggle="modal" data-bs-target="#logoutModal">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                      Log Out
                      </button>
                    </span>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>

      </div>

        <!-- Modal Add-->
        <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div action="#" class="modal-content border border-4 border-dark shadow rounded-0">
              <div class="modal-header px-2 py-1 bg-dark rounded-0">
                <h5 class="modal-title text-white" id="exampleModalLabel">Log Out</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">  
                <p class="mb-0">are you sure you want to leave? We'll miss you :(</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <a href="logoutController.jsp" class="btn btn-danger" >Yes</a>
              </div>
            </div>
          </div>
        </div>
    </body>
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>