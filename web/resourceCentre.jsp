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
    <link href="footer-style.css" rel="stylesheet">
    <link href="css/resourceCentre.css" rel="stylesheet">
    <link type="text/css" href="getInvolve/involve.css" rel="stylesheet" />
    <title>Resource Centre</title>

</head>
<style>
    .disabled {
        pointer-events: none; //This makes it not clickable
        opacity: 0.6; //This grays it out to look disabled
    }
    
    .reports {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .reports>ul {
        border: 1px solid #ccc;
        list-style-type: none;
        width: 60%;
        text-align: center;
        font-size: 1.5rem;
        font-weight: bold;
        background-color: #fff;
        color: #111;
    }
    
    .reports>ul>li {
        padding: 1rem;
    }
    
    .reports>ul>li>a {
        cursor: pointer;
    }
    
    .reports>ul>li:nth-child(even) {
        background-color: #eee;
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
                            <li class="dropdown nav-area">
                                <a href="media.news.html">Media Centre</a>
                                <div class="dropdown-content">
                                    <a href="media.news.html">News</a>
                                    <a href="imageGallery.html">Image Gallery</a>
                                    <!--   <a href="#">Celebrities & Personalities</a>     -->
                                </div>
                            </li>
                            <li class="dropdown nav-area active">
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

    <div id="page">
        <section class="wraper">

            <div class="main-container">
                <div class="container" id="manageSidebarContent">
                    <div class="left-sidebar" id="leftInvolveSide">
                        <div class="side-block-title">GET INVOLVED <span style="float: right;cursor: pointer;"><i class="fas fa-angle-down" onclick="LeftToggleInvolveSidebar(this);"></i></span></div>
                        <div class="side-block-content">
                            <div class="menu-get-involved-sidebar-menu-container">
                                <ul id="menu-get-involved-sidebar-menu" class="menu">
                                    <li class="menu-item current-menu-item current_page_item menu-item-has-children">
                                        <a href="#" class="menu-image-title-after menu-image-not-hovered" style="display: inline-flex;text-decoration: none;">
                                            <span class="menu-image-titlef" onclick="LeftToggleNav(0);">Articles </span>
                                        </a>

                                    </li>
                                    <li class="menu-item">
                                        <a href="#" class="menu-image-title-after menu-image-not-hovered" style="display: inline-flex;text-decoration: none;">
                                            <span class="menu-image-titlef" onclick="LeftToggleNav(1);">Annual Reports</span>
                                        </a>
                                    </li>
                                    <li class="menu-item disabled">
                                        <a href="#" class="menu-image-title-after menu-image-not-hovered" style="display: inline-flex;text-decoration: none;">
                                            <span class="menu-image-titlef" onclick="LeftToggleNav(2);">Stories of Change</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="right-content-container">
                        <div class="pagetitle">
                            <h1>Articles</h1>
                        </div>

                        <section class="spacer">
                            <div class="contaner">
                                <div class="para">
                                    <marquee class="movetext">
                                        <p class="lead"><strong>ARTICLES</strong></p>
                                    </marquee>
                                </div>
                            </div>
                        </section>
                        <section>
                            <div class="contaner">
                                <div class="row" id="cards">
                                    <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM articles ORDER BY sNo DESC";
                                ResultSet rs=st.executeQuery(query);
                                
                                
                                while(rs.next()){%>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <a class="card1">
                                            <h3><%=rs.getString("title")%></h3>
                                            <p class="small hidden-xs">
                                                <p1 class="dat-loc"><%=rs.getString("topic")%></p1>- <%=rs.getString("description")%>
                                            </p>
                                        </a>
                                    </div>
                                     <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                                    
                                </div>
                            </div>
                        </section>
                        <div id="my-modal" class="modal modal-outer-bg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <span class="close">&times;</span>
                                    <h2>Modal Header</h2>
                                </div>
                                <div class="modal-body">
                                    <p>This is my modal Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla repellendus nisi, sunt consectetur ipsa velit repudiandae aperiam modi quisquam nihil nam asperiores doloremque mollitia dolor deleniti
                                        quibusdam nemo commodi ab.
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <h3>Modal Footer</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        const modal = document.querySelector('#my-modal');
                        var modalHeader = document.querySelector(".modal-header>h2");
                        var modalBody = document.querySelector(".modal-body>p");
                        var modalFooter = document.querySelector(".modal-footer>h3")
                        var modalHead = document.querySelectorAll('.card1>h3');
                        var modalContent = document.querySelectorAll('.card1>p');
                        var modalType = document.querySelectorAll('.card1>p>p1');
                        const closeBtn = document.querySelector('.close');
                        var newsrow = document.querySelectorAll(".newsrow");
                        var modalHeade = document.querySelectorAll('#cards>div>a.card1');
                        //load only five elements

                        // modalBtn.addEventListener('click', openModal);
                        closeBtn.addEventListener('click', closeModal);
                        window.addEventListener('click', outsideClick);

                        // Open

                        for (let i = 0; i < modalHeade.length; i++) {
                            modalHeade[i].addEventListener("click", function() {
                                // window.alert(modalHeader.innerText + " " + modalHead[i].innerText);
                                modalHeader.innerText = modalHead[i].innerText;
                                modalBody.innerText = modalContent[i].innerText;
                                modalFooter.innerText = modalType[i].innerText;
                                modal.style.display = 'block';
                            });

                        }


                        // Close
                        function closeModal() {
                            modal.style.display = 'none';
                        }

                        // Close If Outside Click
                        function outsideClick(e) {
                            if (e.target == modal) {
                                modal.style.display = 'none';
                            }
                        }
                    </script>



                    <div class="right-content-container hide">
                        <div class="pagetitle">
                            <h1>Annual Reports</h1>
                        </div>
                        <div class="reports">
                            <ul>
                                   <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM annualreport";
                                ResultSet rs=st.executeQuery(query);
                                
                                while(rs.next()){%>
                                <li><a href="<%="http://localhost:8080/minorProject/annualReport/"+rs.getString("reportName")%>" target="_blank">Annual Report <%=rs.getString("year")%></a></li>
                                   <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                            </ul>
                        </div>

                    </div>



                    <div class="right-content-container hide">
                        <div class="pagetitle">
                            <h1>Stories Of Change</h1>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </div>

    <script>
        function LeftToggleInvolveSidebar(x) {
            x.classList.toggle("fa-angle-up");
            var tj = document.getElementById("leftInvolveSide");
            var tt = tj.getElementsByClassName("menu-get-involved-sidebar-menu-container");
            var ts = tj.querySelector(".side-block-title>span>i");
            if (ts.classList.contains("fa-angle-up")) {
                tt[0].classList.add("hide");
            } else {
                tt[0].classList.remove("hide");
            }

        }

        function LeftToggleNav(index) {
            var psa = document.getElementById("menu-get-involved-sidebar-menu");
            var ps = psa.getElementsByClassName("menu-item");
            var pcs = document.getElementById("manageSidebarContent");
            var pc = pcs.getElementsByClassName("right-content-container")
            var tp = pcs.querySelectorAll(".right-content-container");
            for (var i = 0; i < ps.length; i++) {
                ps[i].addEventListener("click", function() {
                    var act = document.getElementsByClassName(" current-menu-item");
                    act[0].className = act[0].className.replace(" current-menu-item", "");
                    this.className += " current-menu-item";
                });
                [].forEach.call(tp, function(elem) {
                    elem.classList.remove("hide");
                    elem.classList.add("hide");
                });
                pc[index].classList.remove("hide");
            }

        }
    </script>


    <!-- Footer -->
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
                                <button class="btn btn-min btn-solid"><span>Subscibe</span></button>
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

</body>

</html>