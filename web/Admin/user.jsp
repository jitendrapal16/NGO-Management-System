
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin User</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="../fontawesome-free-5.12.1-web/css/all.css" />
    <!-- CSS Files -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
</head>
<style>
    .tttt {
        display: block;
    }
    
    @media (max-width: 991px) {
        #wor {
            flex-direction: column-reverse;
        }
    }
    
    input[type=file] {
        padding: 10px;
        background: rgb(90, 90, 90);
        color: #ffffff;
        width: 100%;
    }
    
    input[type="submit"] {
        margin: 10px;
        -moz-box-shadow: inset -3px -3px 10px #cc870a;
        -webkit-box-shadow: inset -3px -3px 10px #cc870a;
        box-shadow: inset -3px -3px 10px #cc870a;
        background-color: #f7b31c;
        /* Fill color */
        color: white;
        /* Text color */
        border-radius: 15px;
        /* Rounded button edges */
        font-style: italic;
        /* Italicize text */
        padding: 10px 30px;
        cursor: pointer;
    }
</style>

<body>
    <%
            String username=(String)session.getAttribute("username");
            if(username==null)
            {
                response.sendRedirect("/minorProject/index.html");
            }
        %>
    <div class="wrapper">
        <div class="sidebar" data-image="../assets/img/sidebar-5.jpg">

            <div class="sidebar-wrapper">
                <div class="logo">
                     <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT role FROM userinfo where username='"+username+"'";
                                ResultSet rs=st.executeQuery(query);
                                
                                while(rs.next()){
                            %>
                    <a href="" class="simple-text">
                        <%=rs.getString("role")%>
                    </a>
                     <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                </div>
                <ul class="nav active-pro">
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">
                            <i class="fas fa-home"></i>
                            <p>Home</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./user.jsp">
                            <i class="far fa-user-circle"></i>
                            <p>User Profile</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./ourPeoples.jsp">
                            <i class="fas fa-table"></i>
                            <p>Our Peoples</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./partners.jsp">
                            <i class="fas fa-project-diagram"></i>
                            <p>Our Partners</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./happen.jsp">
                            <i class="fas fa-atom"></i>
                            <p>Happening</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./media.jsp">
                            <i class="far fa-newspaper"></i>
                            <p>Media Centre</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./resource.jsp">
                            <i class="fas fa-pager"></i>
                            <p>Resource Centre</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./campaign.jsp">
                            <i class="fas fa-map-signs"></i>
                            <p>Campaign</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./donation.jsp">
                            <i class="fas fa-donate"></i>
                            <p>donation</p>
                        </a>
                    </li>
                    <li class="nav-item d-lg-none">
                        <a class="nav-link" href="/minorProject/logout.jsp">
                            <i class="fas fa-sign-out-alt"></i>
                            <p>LogOut</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> User </a>
                    <button href="" onclick="toggleSidebar(this);" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <span class="d-lg-none">User</span>
                                </a>
                            </li>
                            <!--  <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-planet"></i>
                                    <span class="notification">5</span>
                                    <span class="d-lg-none">Notification</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Notification 2</a>
                                    <a class="dropdown-item" href="#">Notification 3</a>
                                    <a class="dropdown-item" href="#">Notification 4</a>
                                    <a class="dropdown-item" href="#">Another notification</a>
                                </ul>
                            </li>-->
                            <!--  <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Search</span>
                                </a>
                            </li>-->
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <!--   <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Dropdown</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>-->
                            <li class="nav-item">
                                <a class="nav-link" href="/minorProject/logout.jsp">
                                    <button class="no-icon btn-secondary">Log out <i class="fas fa-sign-out-alt"></i></button>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row" id="wor">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Edit Profile</h4>
                                </div>
                                <div class="card-body">
                                    <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM userinfo where username='"+username+"'";
                                ResultSet rs=st.executeQuery(query);
                                
                                
                                if(rs.next()){
                                    //int a=Integer.parseInt(rs.getString("raisedAmt"));
                                    //int b=Integer.parseInt(rs.getString("goalAmt"));
                                    //int c=Utility.getPercent(a,b);
                                    
                            %>
                            <form action="/minorProject/UserUpdate" method="POST">
                                        <div class="row">
                                            <div class="col-md-5 pr-1">
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <input type="text" class="form-control" placeholder="Username" name="username1" value="<%=rs.getString("username")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-3 px-1">
                                                <div class="form-group">
                                                    <label>Email Address</label>
                                                    <input type="email" class="form-control" name="email" value="<%=rs.getString("email")%>" placeholder="Email">
                                                </div>
                                            </div>
                                            <div class="col-md-4 pl-1">
                                                <div class="form-group">
                                                    <label>Phone No.</label>
                                                    <input type="text" class="form-control" name="phone" value="<%=rs.getString("phone")%>" placeholder="Phone">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input type="text" class="form-control" name="fname" placeholder="Company" value="<%=rs.getString("fname")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" class="form-control" name="lname" placeholder="Last Name" value="<%=rs.getString("lname")%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" class="form-control" name="address" placeholder="Home Address" value="<%=rs.getString("address")%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <input type="text" class="form-control" name="city" placeholder="City" value="<%=rs.getString("city")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4 px-1">
                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <input type="text" class="form-control" name="country" placeholder="Country" value="<%=rs.getString("country")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4 pl-1">
                                                <div class="form-group">
                                                    <label>Postal Code</label>
                                                    <input type="number" class="form-control" value="<%=rs.getString("postalCode")%>" name="pc" placeholder="ZIP Code">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>About Me</label>
                                                    <textarea rows="4" cols="80" class="form-control" name="bio" placeholder="Here can be your description" value="<%=rs.getString("bio")%>"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                        <div class="clearfix"></div>
                                    </form>
                                    <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                                    <div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-user">
                                 <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM userinfo where username='"+username+"'";
                                ResultSet rs=st.executeQuery(query);
                                
                                
                                if(rs.next()){
                                    //int a=Integer.parseInt(rs.getString("raisedAmt"));
                                    //int b=Integer.parseInt(rs.getString("goalAmt"));
                                    //int c=Utility.getPercent(a,b);
                                    
                            %>
                                <div class="card-image">
                                    <img src="<%="http://localhost:8080/minorProject/profile/"+rs.getString("profileBg")%>" width="44px" height="auto" alt="...">
                                </div>
                                <div class="card-body">
                                    <div class="author">
                                        <a href="#">
                                            <img class="avatar border-gray" src="<%="http://localhost:8080/minorProject/profile/"+rs.getString("profile")%>" alt="...">
                                            <h5 class="title"><%=rs.getString("fname")+" "+rs.getString("lname")%></h5>
                                        </a>
                                        <p class="description" style="color: grey;margin-top: -10px;">
                                            <%=rs.getString("username")%>
                                        </p>
                                    </div>
                                    <p class="description text-center">
                                        <%=rs.getString("bio")%>
                                    </p>

                                </div>
                                  <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                                <hr>
                                <div class="button-container mr-auto ml-auto" style="text-align: center;">
                                    <form action="/minorProject/ProfileUpload" method="POST" enctype="multipart/form-data">
                                        <label for="backImg">Upload Profile &#8681;</label>
                                        <input type="file" id="backImg" name="backImg" accept="image/*" value="Upload Profile">
                                        <label for="profileImg">Upload Background &#8681;</label>
                                        <input type="file" id="profileImg" name="profileImg" accept="image/*" value="Upload Profile">
                                        <input type="submit" value="Upload Image">
                                    </form>
                                </div>
                                <!--  <div class="button-container mr-auto ml-auto">
                                    <button href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fab fa-facebook-square"></i>
                                    </button>
                                    <button href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fab fa-twitter"></i>
                                    </button>
                                    <button href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fab fa-google-plus-square"></i>
                                    </button>
                                </div>-->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Password</h4>
                                </div>
                                <div class="card-body">
                                    <form action="/minorProject/UpdatePassword" method="POST">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Current Password</label>
                                                    <input type="password" class="form-control" name="currentPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,}" placeholder="Current Password">
                                                    <small><a href="" onclick="alert('Coming Soon');" style="color: lightseagreen;cursor: pointer;">Forgot Password?</a></small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>New Password</label>
                                                    <input type="password" class="form-control" name="newPassword" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,}" title="6 digit password with numbers,uppercase,lowercase and special characters" placeholder="New Password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Confirm Password&nbsp;<small style="color: red;display: none;" id="error">Password not Same</small></label>
                                                    <input type="text" class="form-control" onkeyup='check_pass();' id="confirm_password" placeholder="Confirm Password">
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" id="submit" class="btn btn-info btn-fill pull-right">Update Password</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <script>
        function check_pass() {
            if (document.getElementById('password').value ==
                document.getElementById('confirm_password').value) {
                document.getElementById('submit').disabled = false;
                document.getElementById('error').style.display = "none";
            } else {
                document.getElementById('submit').disabled = true;
                document.getElementById('error').style.display = "block";
            }
        }
        
    </script>
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul class="footer-menu">
                            <li>
                                <a href="..\..\Project1\index.html">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="..\..\Project1\ourWork.html">
                                    Our Work
                                </a>
                            </li>
                            <li>
                                <a href="..\..\Project1\ourCampaign\ourCampaign.html">
                                    Our Campaign
                                </a>
                            </li>
                            <li>
                                <a href="..\..\Project1\donate.html">
                                    Donate
                                </a>
                            </li>
                        </ul>
                        <p class="copyright text-center">
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="#">Our NGO</a>, a NGO Project
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
    <script>
        // var a = document.getElementsByClassName(".sidebar");

        function toggleSidebar(e) {
            var a = document.querySelector(".sidebar").classList.toggle("tttt");
            // a.style.display = "block";
            //a.style.left = "-25px";

        }
    </script>
</body>


</html>