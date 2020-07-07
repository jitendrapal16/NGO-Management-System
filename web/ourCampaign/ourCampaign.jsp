<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConnector"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/styles.css" rel="stylesheet">
    <link href="../fontawesome-free-5.12.1-web\css\all.css" rel="stylesheet">
    <link href="../footer-style.css" rel="stylesheet">
    <link href="../float-donate.css" rel="stylesheet">
    <link rel='stylesheet' id='style_css-css' href='oc.style.css' />
    <link rel='stylesheet' id='responsive_css-css' href='oc.risponsive.css' />
    <link rel="stylesheet" href="../About Us/about-style.css">
    <title>Our Campaign</title>

</head>
<style>
    /* -- Theme Color -- */
    
    .colr,
    .colrhvr:hover,
    .services article:hover figure a,
    .services article:hover h5 {
        color: #29688a !important;
    }
    /* -- Theme Background Color -- */
    
    .bgcolr,
    .pagination ul li a.active:before {
        background-color: #29688a !important;
    }
    /* -- Theme Border Color -- */
    
    .pagination ul li a.active {
        border-color: #29688a !important;
    }
    /* -- Theme transparent Border Color -- */
    
    .services article:hover figure a:before {
        border-color: transparent #29688a;
    }
    
    #main a {
        color: #333333;
    }
</style>

<body style="background: #fff;">

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
                            <li class="dropdown nav-area">
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
                            <li class="dropdown nav-area active">
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
            <div class="parallax-mask"><img style="height: 230px;width: 100%;" src="../image/campaign.jpg"></div>
            <div class="section-name">
                <h2 style="color: rgb(255, 130, 28);">Our Campaign</h2>
                <div class="short-text">
                    <h5 style="color: black">Home<i class="fa fa-angle-double-right"></i>Our Campaign</h5>
                </div>
            </div>
        </div>
    </div>


    <div style="background: rgb(250, 248, 248);">
        <div class="container">
            <div class="section-name one">
                <h2>Our Camapigns</h2>
                <div class="short-text">
                    <h5>Big Problems are best Solved in small pieces</h5>
                </div>
            </div>
        </div>
    </div><br/>


    <!-- /#Our campaign starts from here -->

    <div id="main" role="main">

        <!-- Container Start -->

        <div class="container">


            <!-- Row Start -->

            <div class="row">

                <div class="col-md-12 ">

                    <div class="element_size_100" id="every">

                        <!--  <header class="cs-heading-title">

                            <h2 class="cs-section-title float-left">Our Cause</h2>

                            <a href="#" class="btnshowmore float-right" style="display: none;"> <em class="fa fa-th-large"></em> Visit The Causes
                            </a>

                        </header>-->

                        <div class="our_causes fullwidth" id="list">

                            <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM campaigns";
                                ResultSet rs=st.executeQuery(query);
                                
                                int i=0;
                                while(rs.next()){
                                    //int a=Integer.parseInt(rs.getString("raisedAmt"));
                                    //int b=Integer.parseInt(rs.getString("goalAmt"));
                                    //int c=Utility.getPercent(a,b);
                                    i++;
                            %>
                            <article class="status-publish has-post-thumbnail hentry">

                                <figure>

                                    <img src="<%="http://localhost:8080/minorProject/campaign/"+rs.getString("imgName")%>" alt="">
                                    <figcaption>

                                        <div class="text">

                                            <h2 class="cs-post-title">

                                                <a href="#" class="colrhvr"><%=rs.getString("name")%></a>

                                            </h2>

                                            <div class="progress-bar-charity" data-loadbar="100" data-loadbar-text="100%">

                                                <div class="bgcolr" id="p<%=i%>" style="width: 0%">

                                                    <span></span>
                                                    <div style="top: -5px;color: yellow;font-weight: bolder;float: right;">50%</div>

                                                </div>

                                            </div>

                                            <div class="progress-desc fullwidth">

                                                <span class="progress-box"> <strong><em class="fas fa-rupee-sign"></em>&nbsp;<%=rs.getString("raisedAmt")%></strong>
    
                                Raised
                            </span>

                                                <span class="progress-box"><strong><%=rs.getString("donors")%></strong>
    
                                Donors
                            </span>

                                                <span class="progress-box">
    
                                <strong><em class="fas fa-rupee-sign"></em>&nbsp;<%=rs.getString("goalAmt")%></strong>
    
                                Goal
                            </span>

                                            </div>

                                            <div class="desc fullwidth">

                                                <p><%=rs.getString("description")%></p>
                                                <form action="/minorProject/donateCampaign.jsp" method="POST">
                                                    <input type="hidden" value="<%=rs.getString("name")%>" name="name">
                                                    <input type="hidden" value="<%=rs.getString("type")%>" name="type">
                                                    <div class="post-category-list"><em class="fa fa-list"></em><button type="submit" class="btn btn-outline-secondary" rel="tag">Donate</button> <a rel="tag"><%=rs.getString("type")%></a></div>
                                                <!--<a class="btnshare-post addthis_button_compact"><em class="fas fa-share-square"></em></a>-->
                                                </form>
                                            </div>

                                        </div>

                                    </figcaption>

                                </figure>

                            </article>
                            <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                        </div>
                        <section style="text-align: center;">
                            <div class="pagenumbers" id="pagination">
                                <button>prev</button>
                                <button>next</button>
                            </div>
                        </section>

                    </div>
                </div>

            </div>

            <!-- Row End -->

        </div>

        <div class="clear"></div>

        <!-- Container End -->

    </div>
    <!-- Wrapper End -->


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
                            <a href="..\About Us\AboutUs.html" class="footer-styl"><i class="fas fa-angle-double-right"></i>About Us</a>
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
                <h5 class="h5-footer" style="color: #fff;">Copyright ©2020 Our NGO. All Rights Reserved</h5>
            </div>
        </div>
    </footer>

    <!-- /#Footer Section ends from here -->


    <script>
        var sd = document.querySelectorAll(".bgcolr");
        var ssd = document.querySelectorAll(".bgcolr>div");


        var ab = document.querySelectorAll(".progress-desc");
        for (let i = 0; i < ab.length; i++) {
            // console.log(ab[i].innerText);
            let jp = ab[i].querySelectorAll(".progress-box>strong");
           
            // console.log(jp[j].textContent.trim());
            let xx = Number.parseInt(jp[0].textContent.trim());
            let xy = Number.parseInt(jp[2].textContent.trim());
            let rslt = (xx / xy) * 100;
            
            if (rslt >= 10) {
                //console.log(rslt.toPrecision(2));
                document.getElementById(sd[i].id).style.width = rslt.toPrecision(2) + "%";
                ssd[i].innerText = rslt.toPrecision(2) + "%";
                //console.log(rslt.toPrecision(2));
            } else if (rslt < 10) {
                //console.log(rslt.toPrecision(1));
                document.getElementById(sd[i].id).style.width = rslt.toPrecision(1) + "%";
                ssd[i].innerText = rslt.toPrecision(1) + "%";
                //console.log(rslt.toPrecision(1));
            } else {
                //console.log(rslt.toPrecision(3));
                document.getElementById(sd[i].id).style.width = rslt.toPrecision(3)+"%";
                ssd[i].innerText = rslt.toPrecision(3) + "%";
                //console.log(rslt.toPrecision(3));
            }


        }
    </script>
    <script>
        const list_element = document.getElementById('list');
        let list_items = list_element.querySelectorAll(".hentry");
        //list_items = Array.prototype.slice.call(list_items, 0);
        const pagination_element = document.getElementById('pagination');
        let current_page = 1;
        let rows = 8;
        let pg_count = Math.ceil(list_items.length / rows);

        function DisplayList(items, wrapper, rows_per_page, page) {
            wrapper.innerHTML = "";
            page--;
            let start = rows_per_page * page;
            let end = start + rows_per_page;
            //Array.prototype.slice.call(myvar, 3,5);
            let paginatedItems = Array.prototype.slice.call(items, start, end);

            for (let i = 0; i < paginatedItems.length; i++) {
                let item = paginatedItems[i];

                //  let item_element = document.createElement('div');
                //  item_element.classList.add('item');
                var item_element = item.innerText;

                // console.log(item_element);
                wrapper.appendChild(item);
            }

        }

        function SetupPagination(items, rows_per_page) {
            //wrapper.innerHTML = "";

            let page_count = Math.ceil(items.length / rows_per_page);
            for (let i = page_count; i > 0; i--) {
                /*let btn =*/
                PaginationButton(i, items);
                //wrapper.appendChild(btn);
            }
        }

        function PaginationButton(page, items) {
            let button = document.createElement('button');
            button.innerText = page;
            pagination_element.insertBefore(button, pagination_element.childNodes[3]);
            if (current_page == page) button.classList.add('active');

            button.addEventListener('click', function() {
                current_page = page;
                DisplayList(items, list_element, rows, current_page);
                let current_btn = document.querySelector('.pagenumbers button.active');
                current_btn.classList.remove('active');
                // window.alert(current_page);
                button.classList.add('active');
                //var cp = Array.from(button.parentNode.children).indexOf(button);
            });


            //pagination_element.appendChild(button);
            //return button;
        }
        pagination_element.firstElementChild.addEventListener("click", function() {
            //current_page = page;
            if (current_page == 1) {
                current_page = pg_count + 1;
            }
            DisplayList(list_items, list_element, rows, current_page - 1);
            let current_btn = document.querySelector('.pagenumbers button.active');
            current_btn.classList.remove('active');
            let scurrent = document.querySelectorAll('.pagenumbers button');
            scurrent[current_page].classList.remove("active");
            scurrent[current_page - 1].classList.add("active");
            //window.alert(current_page);
            // button.classList.add('active');
            //this.classList.add("active");
            current_page--;
            /* if (current_page > 2) {
                 current_page--;
             } else {
                 current_page = 6;
             }*/
            //if(current_page==)
            // window.alert(Array.from(button.parentNode.children).indexOf(button));

        });
        pagination_element.lastElementChild.addEventListener("click", function() {
            //current_page = page;
            if (current_page == pg_count) {
                current_page = 0;
            }
            DisplayList(list_items, list_element, rows, current_page + 1);
            let current_btn = document.querySelector('.pagenumbers button.active');
            current_btn.classList.remove('active');
            let scurrent = document.querySelectorAll('.pagenumbers button');
            scurrent[current_page].classList.remove("active");
            scurrent[current_page + 1].classList.add("active");
            //window.alert(current_page);
            // button.classList.add('active');
            //this.classList.add("active");
            current_page++;
            /* if (current_page > 2) {
                 current_page--;
             } else {
                 current_page = 6;
             }*/
            //if(current_page==)
            // window.alert(Array.from(button.parentNode.children).indexOf(button));

        });

        DisplayList(list_items, list_element, rows, current_page);
        SetupPagination(list_items, rows);
    </script>
</body>

</html>
