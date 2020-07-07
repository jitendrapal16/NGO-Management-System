<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="..\css\bootstrap.css" rel="stylesheet">
    <link href="..\css\styles.css" rel="stylesheet">
    <link rel="stylesheet" href="about-style.css">
    <!-- <link rel="stylesheet" href="bootstrap.min.q.css">-->
    <link href="..\fontawesome-free-5.12.1-web\css\all.css" rel="stylesheet">
    <link href="..\footer-style.css" rel="stylesheet">
    <link href="..\float-donate.css" rel="stylesheet">
    <title>About Us</title>

</head>

<style>
    /*This complete style is for funFact section or reach and presence*/
    
    @media only screen and (max-width: 1340px) {
        .page-wrapperf {
            overflow: hidden;
        }
    }
    
    @media only screen and (max-width: 1023px) {
        .counter-column-two .inner {
            text-align: center;
        }
    }
    
    @media only screen and (max-width: 767px) {
        .fun-fact-section-two,
        {
            padding: 70px 0 30px;
        }
    }
    /*** 

====================================================================
			Fun Facts Section Two
====================================================================

***/
    
    .fun-fact-section-two {
        position: relative;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        padding: 80px 0 40px;
    }
    
    .fun-fact-section-two:before {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        background-color: #333333;
        opacity: .70;
        content: "";
    }
    
    .fun-fact-section-two .fact-counter {
        position: relative;
        z-index: 9;
    }
    
    .counter-column-two {
        position: relative;
        margin-bottom: 40px;
    }
    
    .counter-column-two .count-box {
        position: relative;
        font-size: 50px;
        color: #ffc75a;
        line-height: 1em;
        font-weight: 900;
        font-family: "Times New Roman", serif;
    }
    
    .counter-column-two .inner {
        position: relative;
    }
    
    .counter-column-two .icon {
        position: relative;
        display: block;
        font-size: 60px;
        line-height: 1em;
        color: #ffffff;
        font-weight: 400;
        margin-bottom: 10px;
    }
    
    .counter-column-two .count-text {
        position: relative;
        display: inline-block;
        font-size: 50px;
        color: orange;
        line-height: 1em;
        font-weight: 900;
        margin-bottom: 5px;
        font-family: "Times New Roman", serif;
    }
    
    .counter-column-two .counter-title {
        position: relative;
        display: block;
        font-size: 20px;
        line-height: 1.2em;
        color: rgb(233, 255, 38);
        font-weight: 700;
        margin-bottom: 12px;
    }
    
    .counter-column-two .text {
        position: relative;
        font-size: 16px;
        line-height: 26px;
        color: #ffffff;
        font-weight: 400;
        font-family: "Lato", sans-serif;
    }
    
    .fun-fact-section-two.style-two .count-box,
    .fun-fact-section-two.style-two .count-text {
        color: orange;
    }
    
    .page-wrapperf {
        position: relative;
        margin: 0 auto;
        width: 100%;
        min-width: 300px;
        overflow: hidden;
        z-index: 99;
    }
    
    .auto-container {
        position: static;
        max-width: 1200px;
        padding: 0px 15px;
        margin: 0 auto;
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
                                <img src="../images/logo4.png" class="img-responsive " alt="logo">
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
                                <a href="..\index.html">Home</a>
                            </li>
                            <li class="dropdown nav-area active">
                                <a href="..\About Us\AboutUs.html">About Us</a>
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
                                <a href="..\ourWork.html">Our Work</a>
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
                                <a href="..\ourCampaign\ourCampaign.html">Campaigns</a>
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
                                <a href="..\Happening.html">Happenings</a>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="..\getInvolve\getInvolve.html">Get Involved</a>
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
                                <a href="..\media.news.html">Media Centre</a>
                                <div class="dropdown-content">
                                    <a href="..\media.news.html">News</a>
                                    <a href="..\imageGallery.html">Image Gallery</a>
                                    <!--   <a href="#">Celebrities & Personalities</a>     -->
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="..\resourceCentre.html">Resource Centre</a>
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
                                <a href="..\contactUs.html">Contact Us</a>
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
        <a style="text-decoration: none;" href="..\donate.html" class="floatDonate" id="menu-donate">
            <div><i class="fas fa-hand-holding-usd my-float"></i></div>
            <small>Donate</small>
        </a>
    </div>
    <!-- /#Floating donation ends from here -->


    <!-- Banner -->
    <div class="page-banner">
        <div class="container">
            <div class="parallax-mask"><img style="height: 230px;width: 100%;" src="Profile.jpg"></div>
            <div class="section-name">
                <h2>About Us</h2>
                <div class="short-text">
                    <h5>Home<i class="fa fa-angle-double-right"></i>About Us</h5>
                </div>
            </div>
        </div>
    </div>

    <div class="container tm-container">
        <!-- #services -->
        <section id="tm-section-2" class="row tm-section">
            <div class="tm-flex-center col-xs-12 col-sm-6 col-md-6 col-lg-5 col-xl-6">
                <img src="ngo-education.jpg" alt="Image" class="img-fluid tm-img">
            </div>

            <div class="tm-white-curve-right col-xs-12 col-sm-6 col-md-6 col-lg-7 col-xl-6">

                <div class="tm-white-curve-right-circle"></div>
                <div class="tm-white-curve-right-rec"></div>

                <div class="tm-white-curve-text">
                    <h2 class="tm-section-header red-text">Overview</h2>
                    <p class="p-tm">Praesent consectetur dictum massa eu tincidunt. Nulla facilisi. Nam tincidunt nex diam eget sollicitudin. Quisque tincidunt ex sit amet metus ultricies, sed lobortis purus finibus.</p>
                    <p class="thin-font p-tm">Morbi nex felis rutrum, faucibus odio sed, ullamcorper risus. Sed id condimentum nequq, at iaculis ex. Praesent faucibus viverra ante id auctor. Pellentesque at risus ut arcu blandit consectetur.</p>
                </div>

            </div>
        </section>
        <!-- #services -->
    </div>

    <!-- Vision and mission -->
    <div class="features-wrapper one">
        <div class="container" style="margin-top: 10px;margin-bottom: 5px; text-align: justify;">
            <div class="section-name one">
                <h2>Vision & Mission</h2>
            </div>
            <div class="card-deck">
                <div class="card">
                    <h4 class="card-header" style="text-align: center;">Vision</h4>
                    <div class="card-body">
                        <p class="card-text">
                            To be an end-to-end community based solutions provider in the areas of education, health and sustainable livelihood for vulnerable communities. Our vision is also to be an enabler bringing together corporates, groups of interested individuals, community
                            organisations and the communities in need to do some meaningful work towards enriching the lives of those in needs.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <h4 class="card-header" style="text-align: center;">Mission</h4>
                    <div class="card-body">
                        <p class="card-text">To empower the underprivileged women, children, elderly and physically challenged individuals by enriching their lives through education, health and sustainable livelihood skills and opportunities.</p>
                        <!--<p class="card-text">We are strong believers in the adage about teaching a man to fish rather than giving him a fish and keeping this in mind, we work with corporates and other partner organisations to provide access to education opportunities, access
                        to affordable and reliable healthcare and industry backed livelihood skills.</p>-->
                        <p class="card-text">We empower these underprivileged children, youth and women to grow ahead in life by giving them applicable education, providing them innovations in healthcare facilities and livelihood programs that are focused on the market.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vision and mission -->

    <!-- What we do -->
    <div class="features-wrapper one">
        <div class="container">
            <div class="section-name one">
                <h2>What We Do</h2>
                <div class="short-text">
                    <h5>Here is all Reasons to Work With Us</h5>
                </div>
            </div>
            <div class="services services-about" style="margin-top: 15px;background: papayawhip;text-align: center;">
                <article class="service-v1 viewme">
                    <figure>
                        <a class="service-tick" href="#"><i class="fa fa-plus fa-2x"></i></a>
                    </figure>
                    <a href="..\ourWork.html">
                        <h5 class="uppercase" style="font-family: Raleway;">Support in health</h5>
                    </a>
                    <p>Donecccumsan et eleifend massa orci, accumsan et eleifend ut, ultrices sit amet lacus. Vestibulum ante ipsum primis in faucibus orci luc+tus et youtube.</p>
                </article>
                <article class="service-v1 viewme">
                    <figure>
                        <a class="service-tick" href="#"><i class="fa fa-book fa-2x"></i></a>
                    </figure>
                    <a href="..\ourWork.html">
                        <h5 class="uppercase" style="font-family: Raleway;">Build Education</h5>
                    </a>
                    <p>Donecccumsan et eleifend massa orci, accumsan et eleifend ut, ultrices sit amet lacus. Vestibulum ante ipsum primis in faucibus orci luc+tus et youtube.</p>
                </article>
                <article class="service-v1 viewme">
                    <figure>
                        <a class="service-tick" href="#"><i class="fa fa-users fa-2x"></i></a>
                    </figure>
                    <a href="..\ourWork.html">
                        <h5 class="uppercase" style="font-family: Raleway;">Women Empowerment</h5>
                    </a>
                    <p>Donecccumsan et eleifend massa orci, accumsan et eleifend ut, ultrices sit amet lacus. Vestibulum ante ipsum primis in faucibus orci luc+tus et youtube.</p>
                </article>
                <article class="service-v1 viewme">
                    <figure>
                        <a class="service-tick" href="#"><i class="fa fa-leaf fa-2x"></i></a>
                    </figure>
                    <a href="..\ourWork.html">
                        <h5 class="uppercase" style="font-family: Raleway;">Enviroment Sustainability</h5>
                    </a>
                    <p>Donecccumsan et eleifend massa orci, accumsan et eleifend ut, ultrices sit amet lacus. Vestibulum ante ipsum primis in faucibus orci luc+tus et youtube.</p>
                </article>
            </div>
        </div>

    </div>
    <!-- What we do -->

    <!-- Features Starts-->
    <div class="features-wrapper one">
        <div class="container">
            <div class="section-name one">
                <h2 style="font-weight: 800;">Join us for Social Welfare</h2>
                <div class="short-text">
                    <h5>Let's Work Together</h5>
                </div>
            </div>
            <div class="row features">
                <div class="col-md-4 col-sm-6 ">
                    <div class="feature feature-ft clearfix">
                        <div class="icon_we"><i class="fas fa-donate"></i></div>
                        <h4>Give Donation</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam</p>
                        <a href="..\donate.html" class="btn btn-min btn-secondary
						"><span>Donate</span></a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="feature  higlight clearfix">
                        <div class="icon_we"><i class="fas fa-tshirt" aria-hidden="true"></i></div>
                        <h4>Become Volunteer</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam</p>
                        <a href="..\index.html" onclick="window.alert('Do SignUp From HomaPage')" class="btn btn-min btn-secondary
						"><span>Join Us</span></a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 hidden-sm ">
                    <div class="feature clearfix">
                        <div class="icon_we"><i class="fas fa-hands-helping" aria-hidden="true"></i></div>
                        <h4>Partnership for devlopment</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam</p>
                        <a href="..\contactUs.html" onclick="window.alert('Drop an Email regarding this.')" class="btn btn-min btn-secondary
						"><span>Join us</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features Ends -->

    <div class="page-wrapperf">
        <div class="container">
            <div class="section-name one">
                <h2 style="font-weight: 800;">Our Reach and Presence</h2>
                <div class="short-text">
                    <h5>About Us</h5>
                </div>
            </div>
        </div>
        <!--Fun Facts Section or reach and presence-->
        <div class="fun-fact-section-two style-two " style="background-image: url(funFact.jpg); ">
            <div class="auto-container">
                <div class="fact-counter">
                    <div class="row clearfix ">
                        <!--Column-->
                        <div class="counter-column-two col-md-3 col-sm-6 col-xs-12 wow fadeIn">
                            <div class="inner ">
                                <div class="count-box ">
                                    <span class="icon"><i class="fas fa-clipboard-check"></i></span>
                                    <span class="count-text" data-stop="15">0</span>
                                    <span class="counter-title">Successful Projects</span>
                                    <div class="text ">Activity to beta test. Override the digital divide with additional clickthroughs from sodales,</div>
                                </div>
                            </div>
                        </div>

                        <!--Column-->
                        <div class="counter-column-two col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-delay="400ms ">
                            <div class="inner ">
                                <div class="count-box ">
                                    <span class="icon"><i class="fas fa-hand-holding-heart"></i></span>
                                    <span class="count-text" data-stop="125">0</span>
                                    <span class="counter-title">People Impacted</span>
                                    <div class="text ">Activity to beta test. Override the digital divide with additional clickthroughs from sodales,</div>
                                </div>
                            </div>
                        </div>

                        <!--Column-->
                        <div class="counter-column-two col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-delay="800ms ">
                            <div class="inner ">
                                <div class="count-box ">
                                    <span class="icon"><i class="fas fa-umbrella"></i></span>
                                    <span class="count-text" data-stop="8">0</span>+
                                    <span class="counter-title">Support in Districts</span>
                                    <div class="text ">Activity to beta test.Our Reach and Presence in most of the districts of various states.</div>
                                </div>
                            </div>
                        </div>

                        <!--Column-->
                        <div class="counter-column-two col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-delay="1200ms ">
                            <div class="inner ">
                                <div class="count-box ">
                                    <span class="icon"><i class="fas fa-people-carry"></i></span>
                                    <%
                                        try{
                                    Statement st=DBConnector.getStatement();
                                    ResultSet rs=st.executeQuery("SELECT count(username) FROM userinfo where role='Volunteer'");
                                    String count="";
                                    while(rs.next()){
                                        count=rs.getString(1);
                                    }
                                    %>
                                    <span class="count-text" data-stop="<%=count%>">0</span>
                                    <%
                                        }
                                        catch(SQLException e){
                                            
                                        }
                                    %>
                                    <span class="counter-title">Total Volunteers</span>
                                    <div class="text ">Activity to beta test. Override the digital divide with additional clickthroughs from sodales,</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Fun Facts Section-->

    </div>

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
                            <a href="" class="footer-styl"><i class="fas fa-angle-double-right"></i>About Us</a>
                            <a href="" onclick="window.alert('Section Coming Soon')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Forum</a>
                            <a href="" onclick="window.alert('Section Coming Soon')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Terms and Conditions</a>
                            <a href="" onclick="window.alert('Section Coming Soon')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Privacy Policy</a>
                            <a href="" onclick="window.alert('Go to Resource Centre>Articles')" class="footer-styl"><i class="fas fa-angle-double-right"></i>Blog</a>
                            <a href="..\ourCampaign\ourCampaign.html" class="footer-styl"><i class="fas fa-angle-double-right"></i>Campaigns</a>
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
                        <form action="/minorProject/subscribe" method="Post">
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
    <script>
        const counter = document.querySelectorAll(".count-text");
        const speed = 200;
        counter.forEach(countText => {
            const updateCount = () => {
                const target = +countText.getAttribute("data-stop");
                const count = +countText.innerText;
                const inc = target / speed;;
                if (count < target) {
                    countText.innerText = Math.ceil(count + inc);
                    setTimeout(updateCount);
                } else {
                    count.innerText = target;
                }
            }
            updateCount();
        });
    </script>
</body>

</html>