<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="fontawesome-free-5.12.1-web\css\all.css" rel="stylesheet">
    <link href="footer-style.css" rel="stylesheet">
    <link href="float-donate.css" rel="stylesheet">
    <link rel="stylesheet" href="css/happening.css">
    <script type="text/javascript" src="js/paginate.js"></script>
    <title>Happenings</title>

</head>

<body>

    <div class="main sticky-top">
        <nav class="navbar navbar-default" style="box-shadow: 5px 5px 10px 5px rgba(216, 216, 216, 0.603);background: rgb(253, 253, 238);">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <a class="navbar-brand home" href="#" data-animate-hover="bounce">
                            <div class="logo">
                                <img src="images/logo4.png" class="img-responsive " alt="logo">
                            </div>
                        </a>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  </button>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav nav-pills">
                            <li class="dropdown nav-area">
                                <a href="index.html">Home</a>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="About Us\AboutUs.html">About Us</a>
                                <div class="dropdown-content">
                                    <a href="">Overview</a>
                                    <a href="">Vision & Mission</a>
                                    <!--    <a href="#">Leadership</a>      -->
                                    <a href="" class="display-none">What we do</a>
                                    <!-- submenu start 
                                    <ul class="">
                                        <li class="dropdown-submenu">
                                            <a href="#" data-toggle="dropdown">Working Model</a>
                                            <div class="dropdown-content submenu">
                                                <a href="#">Social Venture Philanthropy</a>
                                                <a href="#">Outreach </a>
                                            </div>
                                        </li>
                                    </ul>
                                     <submenu end>  -->
                                    <!--     <a href="#">Civic Driven Change</a>         -->
                                    <a href="" class="display-none">Join us for Social Welfare</a>
                                    <!--    <a href="#">Good Governance</a>                     -->
                                    <a href="" class="display-none">Our Reach and Presence</a>
                                    <!--    <a href="#" class="display-none">Stakeholders Speak</a>     -->
                                    <a href="">Our People</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="ourWork.html">Our Work</a>
                                <div class="dropdown-content">
                                    <a href="">Overview</a>
                                    <a href="">Education</a>
                                    <a href="">Health</a>
                                    <a href="">Livelihood</a>
                                    <a href="">Women Empowerment</a>
                                    <a href="" class="display-none">Disaster Response</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="ourCampaign\ourCampaign.html">Campaigns</a>
                                <div class="dropdown-content">
                                    <a href="">Every Child in School</a>
                                    <a href="">Plate Half-Full</a>
                                    <a href="">She Can Fly</a>
                                    <a href="">Health Cannot Wait</a>
                                    <!--    <a href="#">Help Disabled</a>
                                    <a href="#">Adopt GrandParents</a>      -->
                                </div>
                            </li>
                            <li class="dropdown nav-area active">
                                <a href="Happening.html">Happenings</a>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="getInvolve\getInvolve.html">Get Involved</a>
                                <div class="dropdown-content">
                                    <!-- submenu start -->
                                    <ul class="">
                                        <li class="dropdown-submenu">
                                            <a href="" data-toggle="dropdown">Individual Support</a>
                                            <!--   <div class="dropdown-content submenu">
                                                <a href="#">Donate</a>
                                                <a href="#">Campaigns </a>
                                                <a href="#">Volunteering</a>
                                                <a href="#">Internship </a>
                                            </div>-->
                                        </li>
                                    </ul>
                                    <!-- <submenu end>  -->
                                    <a href="">Corporate Partnerships</a>
                                    <a href="" class="display-none">Institutional Alliances</a>

                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="media.news.html">Media Centre</a>
                                <div class="dropdown-content">
                                    <a href="media.news.html">News</a>
                                    <a href="imageGallery.html">Image Gallery</a>
                                    <!--   <a href="#">Celebrities & Personalities</a>     -->
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="resourceCentre.html">Resource Centre</a>
                                <div class="dropdown-content">
                                    <a href="">Articles</a>
                                    <!-- submenu start 
                                    <ul class="">
                                        <li class="dropdown-submenu">
                                            <a href="#" data-toggle="dropdown">Perspective</a>
                                            <div class="dropdown-content dropdown-content-right dropdown-content-right submenu">
                                                <a href="#">Child Rights</a>
                                                <a href="#">Children in India</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <submenu end>  -->
                                    <a href="">Annual Report</a>
                                    <a href="">Stories of Change</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="contactUs.html">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </nav>

    </div>

    <!-- /#Floatinf donation starts from here -->
    <div>
        <a style="text-decoration: none;" href="donate.html" class="floatDonate" id="menu-donate">
            <div><i class="fas fa-hand-holding-usd my-float"></i></div>
            <small>Donate</small>
        </a>
    </div>
    <!-- /#Floating donation ends from here -->


    <section style="background: #444444 !important;">
        <div style="background: rgb(250, 248, 248);">
            <div class="container">
                <div class="section-name one">
                    <h2>Happenings</h2>
                    <div class="short-text">

                    </div>
                </div>
            </div>
        </div><br/>
        <div class="container">
            <div class="section-name one">
                <div class="short-text">
                    <h5 style="color: aliceblue;font-size: 22px;font-weight: bold;">Popular and Latest Events</h5>
                </div>
            </div>
        </div>
        <div class="slider">
            <div class="slider-items">
                <%

                    try{
                    Statement st=DBConnector.getStatement();
                    String query="SELECT * FROM happencause";
                    ResultSet rs=st.executeQuery(query);

                    while(rs.next())
                    {
                %>
                <div class="item active">
                    <img src="<%="http://localhost:8080/minorProject/HappeningImg/"+rs.getString("imgName")%>" style="width: 100%;height: 100%;" />
                    <div class="caption">
                        <%=rs.getString("title")%>
                    </div>
                </div>
                <%}
                    }
                    catch(Exception e){


                    }
                %>
            </div>
            <!-- slider controls -->
            <div class="left-slide">
                <</div>
                    <div class="right-slide">></div>
                    <!-- slider controls -->
            </div>
            <br/>
    </section>
    <div class="container" style="margin-bottom: 20px;margin-top: 20px;">

        <div class="section-name one" style="margin-top: -25px;">
            <h2>Activity Table</h2>
            <div class="short-text">

            </div>
        </div>
        <div class="panel">
            <div class="body">
                <div class="input-group">
                    <label for="searchBox">Filter&nbsp;&nbsp;</label>
                    <input type="search" id="searchBox" placeholder="Filter...">
                </div>
            </div>
        </div>

        <table class="myTable table hover">
            <thead>
                <tr>
                    <th>Events and Activities</th>
                    <th>Location</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%

                    try{
                    Statement st=DBConnector.getStatement();
                    String query="SELECT * FROM activity";
                    ResultSet rs=st.executeQuery(query);

                    while(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getString("eventName")%></td>
                    <td><%=rs.getString("location")%></td>
                    <td><%=rs.getString("eventOn")%></td>
                </tr>
                 <%}
                    }
                    catch(Exception e){


                    }
                %>

            </tbody>
        </table>
    </div>
    <script>
        let options = {
            numberPerPage: 5, //Amount of data per page
            goBar: true, //Bar where you can type the number of the page you want to go to
            pageCounter: true, //Counter of pages, in which you are, of how many pages
        };

        let filterOptions = {
            el: '#searchBox' //Text box to filter, can be a class or an ID
        };

        paginate.init('.myTable', options, filterOptions);
    </script>
    <script src="js/Happening.js"></script>



    <!-- /#Footer Section starts from here -->
    <footer class="fot-er">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="about widgetf clearfix">
                        <h4 class="footer_title large_title footer-styl h4-footer" style="color: wheat;font-size: 26px;">Our NGO</h4>
                        <p class="footer-styl p-footer">
                            So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved us lan Gathering thing us land years living.
                        </p>

                        <div class="social-media-icons">
                            <a href="#" class="footer-styl"><i class="fab fa-twitter"></i><span>Twitter</span></a>
                            <a href="#" class="footer-styl"><i class="fab fa-facebook-f"></i><span>Facebook</span></a>
                            <a href="#" class="footer-styl"><i class="fab fa-instagram"></i><span>Instagram</span></a>
                            <a href="#" class="footer-styl"><i class="fab fa-linkedin"></i><span>Linkedin</span></a>
                            <a href="#" class="footer-styl"><i class="fab fa-youtube"></i><span>Youtube</span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="quick-linksf widgetf clearfix">
                        <h4 class="title footer-styl h4-footer" style="color: wheat;">Quick links</h4>
                        <div class="linksf" style="font-size: 14px;">
                            <a href="About Us\AboutUs.html" class="footer-styl"><i class="fas fa-angle-double-right"></i>About Us</a>
                            <a href="" onclick="window.alert('Section Coming Soon')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Forum</a>
                            <a href="" onclick="window.alert('Section Coming Soon')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Terms and Conditions</a>
                            <a href="" onclick="window.alert('Section Coming Soon')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Privacy Policy</a>
                            <a href="" onclick="window.alert('Go to Resource Centre>Articles')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Blog</a>
                            <a href="ourCampaign\ourCampaign.html" class="footer-styl"><i class="fas fa-angle-double-right"></i>Campaigns</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 ">
                    <div class="tags-outer widgetf clearfix">
                        <h4 class="footer_title h4-footer" style="color: wheat;">Contact Us</h4>
                        <div class="ml-40">
                            <p class="sm-head footer-styl" style="font-size: 14px;">
                                <span class="fa fa-location-arrow"></span> Head Office
                            </p>
                            <p style="color: white;" class="footer-styl p-footer">123, Main Street, Your City</p>

                            <p class="sm-head footer-styl" style="font-size: 14px;">
                                <span class="fa fa-phone"></span> Phone Number
                            </p>
                            <p style="color: white;" class="footer-styl p-footer">
                                +123 456 7890 <br> +123 456 7890
                            </p>

                            <p class="sm-head" class="footer-styl">
                                <span class="fa fa-envelope"></span> Email
                            </p>
                            <p style="color: white;font-size: 14px;" class="footer-styl p-footer">
                                info@ourNGO.com <br> www.infoOurNGO.com
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="subcribe widgetf clearfix">
                        <h4 class="title h4-footer" style="color: wheat;" class="footer-styl">Subscribe</h4>
                        <p class="footer-styl p-footer">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate provident amet reprehenderit!</p>
                        <form action="subscribe" method="Post">
                            <div class="field">
                                <input type="email" class="footer-subscrib" name="e-mail" placeholder="Your E-mail" required>
                            </div>
                            <div class="field">
                                <button class="btn btn-min btn-solid"><span>Subscribe</span></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bar">
            <div class="container">
                <h5 class="h5-footer">Copyright ©2020 Our NGO. All Rights Reserved</h5>
            </div>
        </div>
    </footer>

    <!-- /#Footer Section ends from here -->

    <script src="js/jquery.min.js "></script>
    <script src="js/bootstrap.min.js "></script>
</body>

</html>