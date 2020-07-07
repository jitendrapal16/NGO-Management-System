
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin Campaign</title>
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
    
    td {
        overflow: auto;
        width: 200px;
    }
    
    table {
        border: 2px gray;
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
                    <li class="nav-item">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="./campaign.jsp">
                            <i class="fas fa-map-signs"></i>
                            <p>Campaign</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./donation.jsp">
                            <i class="fas fa-donate"></i>
                            <p>Donation</p>
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
                    <a class="navbar-brand" href="#"> Campaign </a>
                    <button href="" onclick="toggleSidebar(this);" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <span class="d-lg-none">Campaign</span>
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
                    <div class="row">
                        <div class="col-md-12">
                            <div style="background: #ffffff;padding: 20px;text-align: center;">
                                <h3 style="text-align: center;font-weight: bold;color: rgb(255, 115, 1);padding-bottom: 10px;">Currently active Campaigns</h3>
                                <p style="text-align: center;color: gray;margin-top: -20px;margin-bottom: 20px;">You can also Remove or make unactive the Campaigns on Completion</p>
                                <table id="tan" border="1" style="background: white;">
                                   
                                    <tr>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Type</th>
                                        <th>Goal Amount</th>
                                        <th>Raised Amount</th>
                                        <th>Donors</th>
                                        <th>Action</th>
                                    </tr>
                                <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM campaigns";
                                ResultSet rs=st.executeQuery(query);
                                
                                
                                while(rs.next()){%>
                                    <tr>
                                        <td><%=rs.getString("name")%></td>
                                        <td><%=rs.getString("description")%></td>
                                        <td><%=rs.getString("type")%></td>
                                        <td><%=rs.getString("goalAmt")%></td>
                                        <td><%=rs.getString("raisedAmt")%></td>
                                        <td><%=rs.getString("donors")%></td>
                                        <td><a href="/minorProject/DeleteCampaign?row=<%=rs.getString("imgName")%>"><button>Delete</button></a></td>
                                    </tr>
                                     <%}
                            }
                                catch(Exception e){
                                    response.sendRedirect("campaign.jsp");
                                }
                                
                            %>

                                </table>
                                <script>
                                    
                                   
                                </script><br/>
                                <h3 style="text-align: center;font-weight: bold;color: rgb(255, 115, 1);padding-bottom: 10px;">Raise campaigns</h3>
                                <form action="/minorProject/Campaign" method="POST" enctype="multipart/form-data">
                                    <table>
                                        <tr>
                                            <td><label for="name"> Name </label></td>
                                            <td><input type="text" name="name" id="name" required/></td>
                                        </tr>
                                        <tr>
                                            <td><label for="description"> Description </label></td>
                                            <td><input type="text" name="description" id="description" max="120" required/></td>
                                        </tr>
                                        <tr>
                                            <td><label for="type"> Type </label></td>
                                            <td><input type="text" name="type" id="type" required/></td>
                                        </tr>
                                        <tr>
                                            <td><label for="g_amt"> Goal Amt </label></td>
                                            <td><input type="number" name="g_amt" id="g_amt" min="1000" step="100" required/></td>
                                        </tr>
                                        <tr>
                                            <td><label for="coverImg"> Upload Cover Image </label></td>
                                            <td><input type="file" name="coverImg" id="r_amt" accept="image/*" required/></td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td><button type="submit">Raise Campaign</button></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h3 style="text-align: center;font-weight: bold;color: rgb(255, 115, 1);padding-bottom: 10px;">Completed Campaigns</h3>

                            <table id="mod" border="1" style="background: white;">

                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Type</th>
                                    <th>Goal Amount</th>
                                    <th>Raised Amount</th>
                                    <th>Donors</th>

                                </tr>
                                 <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM decampaigns";
                                ResultSet rs=st.executeQuery(query);
                                while(rs.next()){%>
                                <tr>
                                        <td><%=rs.getString("name")%></td>
                                        <td><%=rs.getString("description")%></td>
                                        <td><%=rs.getString("type")%></td>
                                        <td><%=rs.getString("goalAmt")%></td>
                                        <td><%=rs.getString("raisedAmt")%></td>
                                        <td><%=rs.getString("donors")%></td>
                                </tr>
                                <%}
                            }
                                catch(Exception e){
                                    response.sendRedirect("campaign.jsp");
                                }
                                
                            %>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
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