<%@page import="java.io.PrintWriter"%>
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
    <link href="float-donate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="imageGallery.css">
    <title>Image Gallery</title>

</head>
<style>
    body {
        background: #ffffff;
    }
    /* Section Name */
    
    .section-name {
        text-align: center;
    }
    
    .section-name h2 {
        text-transform: uppercase;
        color: #444;
        font-family: 'Raleway', sans-serif;
        font-weight: 900;
        margin-bottom: 0px;
    }
    
    .section-name h5 {
        display: inline-block;
        position: relative;
        z-index: 8888;
        padding: 0 15px;
        font-family: 'Lato', sans-serif;
        font-weight: 400;
        font-size: 16px;
        color: #4a4a4a;
        margin-bottom: 25px;
    }
    
    .section-name .short-text {
        display: inline-block;
        position: relative;
    }
    
    .section-name .short-text .sep {
        display: inline-block;
        position: absolute;
        top: 50%;
        height: 1px;
        width: 22px;
        background: #0aaaa0;
        z-index: 1;
    }
</style>

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
                            <li class="dropdown nav-area">
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
                            <li class="dropdown nav-area active">
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
    <!--Image Gallery section starts from here-->
    <section class="gallery">
        <div class="container">
            <div class="section-name">
                <h2>Image Gallery</h2>
                <div class="short-text">
                    <h5>Alone we can do so little, Together we can do so much.</h5>
                </div>
            </div>
            <div class="gallery-items">
              <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM imgGallery";
                                ResultSet rs=st.executeQuery(query);
                                
                                while(rs.next()){
                            %>
                <div class="item col-sm-3 col-xs-3">
                    <a target="_blank" href="<%="http://localhost:8080/minorProject/imgGallery/"+rs.getString("imgName")%>"><img src="<%="http://localhost:8080/minorProject/imgGallery/"+rs.getString("imgName")%>" alt="gallery" /></a>

                </div>
               <%}
                            }
                                catch(Exception e){
                                    PrintWriter outs=response.getWriter();
                                    out.println("<script type=\"text/javascript\">");
                                    //out.println("alert('Donation Failed !')");
                                    out.println("location='imageGallery.jsp';");
                                    out.println("</script>");
                                }
                            %>
            </div>
            <div class="pagination">
                <div class="prev">Prev</div>
                <div class="page">Page <span class="page-num"></span></div>
                <div class="next">Next</div>
            </div>
        </div>
    </section>


    <!-- /#Floatinf donation starts from here -->
    <div>
        <a style="text-decoration: none;" href="donate.html" class="floatDonate" id="menu-donate">
            <div><i class="fas fa-hand-holding-usd my-float"></i></div>
            <small>Donate</small>
        </a>
    </div>
    <!-- /#Floating donation ends from here -->


    <script src="imageGallery.js"></script>
</body>

</html>