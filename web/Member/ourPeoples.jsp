

<%@page import="model.MembershipAuthenticator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin Our Peoples</title>
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
    
    div.paginate {
        padding: 5px 0px;
        margin: auto;
    }
    
    div.paginate input[type='button']:hover {
        cursor: pointer;
    }
    
    div.paginate input[type='button'] {
        margin: 0px 2px;
        border: none;
        color: #03A9F4;
        background-color: transparent;
        border-radius: 50%;
        min-width: 1.5rem;
        min-height: 1.5rem;
        outline: none;
    }
    
    div.paginate input[type='button'].active {
        background-color: #17a2b8;
        color: #fff;
        font-weight: bold;
    }
    
    div.paginate input[type='button']:disabled {
        color: grey!important;
        cursor: not-allowed;
    }
    
    div.paginate input[type='number']#paginate_page_to_go {
        max-width: 3rem;
        text-align: center;
        border-radius: 4px;
        border: 1px solid rgba(128, 128, 128, 0.65);
        padding: 3px;
    }
    
    .panel {
        margin-bottom: 20px;
        background-color: var(--white);
        border: 1px solid transparent;
        border-radius: 4px;
    }
    
    .panel.bordered {
        border-color: var(--semi-light-grey);
        -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    }
    
    .panel>.head {
        color: #333;
        background-color: var(--light-grey);
        border-color: var(--semi-light-grey);
    }
    
    .panel>.head {
        padding: 10px 15px;
        border-bottom: 1px solid transparent;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
    }
    
    .panel .body {
        padding: 15px;
    }
    
    .panel .body label {
        font-size: large;
        font-weight: bold;
        margin-top: 10px;
    }
    
    .panel.small {
        max-width: 40%;
    }
    
    .panel.medium {
        max-width: 60%;
    }
    
    .panel .head.primary {
        color: var(--white);
        background-color: var(--primary-blue);
        border-color: var(--primary-blue);
    }
    
    .panel .head.danger {
        color: var(--white);
        background-color: var(--danger-red);
        border-color: var(--danger-red);
    }
    
    .panel .head.success {
        color: var(--white);
        background-color: var(--success-green);
        border-color: var(--success-green);
    }
    
    .input-group label {
        font-weight: bold;
        color: var(--black);
    }
    
    .input-group input[type='search'] {
        padding: 10px;
        border: 1px solid rgba(128, 128, 128, 0.45);
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        outline: 0px;
        -webkit-transition: 0.2s;
        -moz-transition: 0.2s;
        -ms-transition: 0.2s;
        -o-transition: 0.2s;
        transition: 0.2s;
    }
    
    .input-group input[type='search']:focus,
    .input-group input[type='search']:active {
        border-color: rgba(33, 150, 243, 0.8);
        -webkit-box-shadow: 0px 0px 2px 1px rgba(33, 150, 243, 0.6);
        -moz-box-shadow: 0px 0px 2px 1px rgba(33, 150, 243, 0.6);
        box-shadow: 0px 0px 2px 1px rgba(33, 150, 243, 0.6);
    }
    
    [type="search"] {
        -webkit-appearance: textfield;
        outline-offset: -2px;
    }
    
    [type="search"]::-webkit-search-decoration {
        -webkit-appearance: none;
    }
    
    .paginatione {
        width: 100%;
        float: left;
        padding: 15px;
        text-align: center;
    }
    
    .paginatione div {
        display: inline-block;
        margin: 0 10px;
    }
    
    .paginatione .page {
        color: gray;
    }
    
    .paginatione .prev,
    .paginatione .next {
        color: #000;
        border: 1px solid #000;
        font-size: 15px;
        padding: 7px 15px;
        cursor: pointer;
    }
    
    .paginatione .prev.disabled,
    .paginatione .next.disabled {
        border-color: gray;
        color: gray;
        pointer-events: none;
    }
    
    tbody tr.hide {
        display: none;
    }
    
    tbody tr.show {
        animation: show .5s ease;
    }
    
    @keyframes show {
        0% {
            opacity: 0;
            transform: scale(0.9);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }
</style>

<body>
    <%
            String username=(String)session.getAttribute("username");
            if(username==null)
            {
                response.sendRedirect("/minorProject/index.html");
            }
             else if(!MembershipAuthenticator.getStatus(username)){
                response.sendRedirect("membership.jsp");
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
                    <li class="nav-item active">
                        <a class="nav-link" href="./ourPeoples.jsp">
                            <i class="fas fa-table"></i>
                            <p>Our Peoples</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./membership.jsp">
                            <i class="fas fa-id-card"></i>
                            <p>MemberShip</p>
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
                    <a class="navbar-brand" href="#"> Our Peoples </a>
                    <button href="" onclick="toggleSidebar(this);" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <span class="d-lg-none">Table</span>
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
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title" style="font-weight: bold;text-align: center;">Our Volunteers</h4>
                                    <p class="card-category" style="text-align: center;">Our People who Works for Society</p>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <!--<table class="myTable table table-hover table-striped">-->
                                    <div class="panel">
                                        <div class="body">
                                            <div class="input-group">
                                                <label for="searchBox">Filter</label>&nbsp;
                                                <input type="search" id="searchBox" placeholder="Filter...">
                                            </div>
                                        </div>
                                    </div>
                                    <table class="myTable table hover table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>City</th>
                                                <th>Gender</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                            <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM userinfo where role='Volunteer'";
                                ResultSet rs=st.executeQuery(query);
                                
                                while(rs.next()){
                                    
                            %>
                                            <tr>
                                                <td><%=rs.getString("username")%></td>
                                                <td><%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%></td>
                                                <td><%=rs.getString("email")%></td>
                                                <td><%=rs.getString("city")%></td>
                                                <td><%=rs.getString("gender")%></td>
                                            </tr>
                                             <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="card card-plain table-plain-bg">
                                <div class="card-header ">
                                    <h4 class="card-title" style="font-weight: bold;text-align: center;">Our Members</h4>
                                    <p class="card-category" style="text-align: center;">Our People who Contribute for Society</p>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <div class="panel">
                                        <div class="body">
                                            <div class="input-group">
                                                <label for="searchBoxe">Filter</label>&nbsp;
                                                <input type="search" id="searchBoxe" onkeyup="searchBoxe();" placeholder="Search by Names...">
                                                <label for="searchBoxes">Filter</label>&nbsp;
                                                <input type="search" id="searchBoxes" onkeyup="searchBoxes();" placeholder="Search by City...">&nbsp;
                                            </div>
                                        </div>
                                    </div>
                                    <table class="ourTable table hover table-striped table-hover" id="ourTable" style="width: 100%;">

                                        <tbody>
                                            <tr>
                                                <th>Username</th>
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>City</th>
                                                <th>Gender</th>
                                            </tr>
                                            <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM userinfo where role='Member'";
                                ResultSet rs=st.executeQuery(query);
                                
                                while(rs.next()){
                                    
                            %>
                                            <tr>
                                                <td><%=rs.getString("username")%></td>
                                                <td><%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%></td>
                                                <td><%=rs.getString("email")%></td>
                                                <td><%=rs.getString("city")%></td>
                                                <td><%=rs.getString("gender")%></td>
                                            </tr>
                                             <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                                           
                                        </tbody>
                                    </table>
                                    <div class="paginatione">
                                        <div class="prev">Prev</div>
                                        <div class="page">Page <span class="page-num"></span></div>
                                        <div class="next">Next</div>
                                    </div>
                                </div>
                            </div>
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
    <script src="../js/paginate.js"></script>
    <script>
        let options = {
            numberPerPage: 5, //Cantidad de datos por pagina
            goBar: true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
            pageCounter: true, //Contador de paginas, en cual estas, de cuantas paginas
        };

        let filterOptions = {
            el: '#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
        };


        paginate.init('.myTable', options, filterOptions);
    </script>
    <script>
        // var a = document.getElementsByClassName(".sidebar");

        function toggleSidebar(e) {
            var a = document.querySelector(".sidebar").classList.toggle("tttt");
            // a.style.display = "block";
            //a.style.left = "-25px";

        }
        const galleryItems = document.querySelectorAll(".ourTable>tbody>tr:not(:first-child)");
        const prev = document.querySelector(".prev");
        const next = document.querySelector(".next");
        const page = document.querySelector(".page-num");
        const maxItem = 5;
        let index = 1;

        const pagination = Math.ceil(galleryItems.length / maxItem);
        console.log(pagination)

        prev.addEventListener("click", function() {
            index--;
            check();
            showItems();
        });
        next.addEventListener("click", function() {
            index++;
            check();
            showItems();
        });

        function check() {
            if (index == pagination) {
                next.classList.add("disabled");
            } else {
                next.classList.remove("disabled");
            }

            if (index == 1) {
                prev.classList.add("disabled");
            } else {
                prev.classList.remove("disabled");
            }
        }

        function showItems() {
            for (let i = 0; i < galleryItems.length; i++) {
                galleryItems[i].classList.remove("show");
                galleryItems[i].classList.add("hide");


                if (i >= (index * maxItem) - maxItem && i < index * maxItem) {
                    // if i greater than and equal to (index*maxItem)-maxItem;
                    // means  (1*8)-8=0 if index=2 then (2*8)-8=8
                    galleryItems[i].classList.remove("hide");
                    galleryItems[i].classList.add("show");
                }
                page.innerHTML = index + "/" + pagination;
            }


        }

        window.onload = function() {
            showItems();
            check();
        }

        function searchBoxe() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchBoxe");
            filter = input.value.toUpperCase();
            table = document.getElementById("ourTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        function searchBoxes() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchBoxes");
            filter = input.value.toUpperCase();
            table = document.getElementById("ourTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[3];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</body>


</html>