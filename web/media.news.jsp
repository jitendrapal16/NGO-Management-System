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
    <link href='https://fonts.googleapis.com/css?family=Merriweather+Sans:700,300italic,400italic,700italic,300,400' rel='stylesheet' type='text/css'>
    <link type="text/css" href="media.news.css" rel="stylesheet" />
    <title>Media Centre News</title>

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



    <!-- /#Floatinf donation starts from here -->
    <div>
        <a style="text-decoration: none;" href="donate.html" class="floatDonate" id="menu-donate">
            <div><i class="fas fa-hand-holding-usd my-float"></i></div>
            <small>Donate</small>
        </a>
    </div>
    <!-- /#Floating donation ends from here -->

    <!-- /#News section starts from here -->
    <div id="page">

        <section class="wraper">

            <div class="main-container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="pagetitle">
                                <h1>News</h1>
                            </div>
                            <p class="Newsp">Read about the latest news in the development sector and the most recent updates from Our NGO.</p>
                            <div class="selectrow">
                                <form method="POST" action="updateNewsCat">
                                    <div class="selectbox"> 
                                        <select name="newsCat" id="news_cat" onchange="this.form.submit();">
                                            <option value="">News Category</option>
                                            <option value="National" >National</option>
                                            <option value="Political" >Political</option>
                                            <option value="International" >International</option>
                                            <option value="Development" >Development</option>
                                            <option value="Global" >Global</option> 
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="newssection">
                                <div class="itinerarieslistrow" id="list">
                                    <%
                                       String newsCat=request.getParameter("newsCat");
                                        try{
                                        Statement st=DBConnector.getStatement();
                                        String query="SELECT * FROM media ORDER BY sNo DESC";
                                         if(newsCat!=null){
                                             //String cat=NewsUpdation.Category();
                                            query="SELECT * FROM media where type='"+newsCat+"'";
                                        }
                                         else{
                                            query="SELECT * FROM media ORDER BY sNo DESC";
                                        }
                                        ResultSet rs=st.executeQuery(query);
                                        
                                        while(rs.next())
                                        {
                                    %>
                                   
                                    <div class="newsrow">
                                        <div class="datebox"><span class="date"><%=rs.getString("uploadDay")%></span><span class="year"><%=rs.getString("uploadMonth")%></span></div> <span class="news-type"><em><i class="fas fa-list-ul" style="color: grey;"></i></em><%=rs.getString("type")%></span>
                                        <h2><a href="#" onclick="openModal();"><%=rs.getString("title")%></a></h2>
                                        <p style="height: 3em;line-height: 1.5em;overflow: hidden;">
                                           <%=rs.getString("description")%>
                                        </p>
                                    </div>
                                    <%}
                                    }
                                    catch(Exception e){


                                    }
                            %>
                                </div>
                                <div class="pagenumbers" id="pagination">
                                    <button style="float: left;" class="btn btn-secondary btn-lg">&laquo; prev</button>
                                    <button style="float: right;" class="btn btn-secondary btn-lg">next &raquo;</button>
                                </div>
                                <!-- <div id="more_posts" class="btnrow loadmore"><a class="showmore">Show More <i class="fa fa-angle-down"></i></a></div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
    <!--Modal PopUp start-->
    <div id="my-modal" class="modal modal-outer-bg">
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h2>Modal Header</h2>
            </div>
            <div class="modal-body">
                <p style="font-size: 16px;">This is my modal Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla repellendus nisi, sunt consectetur ipsa velit repudiandae aperiam modi quisquam nihil nam asperiores doloremque mollitia dolor deleniti quibusdam nemo commodi
                    ab.
                </p>
            </div>
            <div class="modal-footer">
                <h3>Modal Footer</h3>
            </div>
        </div>
    </div>


    <!--Modal PopUp end-->
    <script>
        // Get DOM Elements
        const modal = document.querySelector('#my-modal');
        var modalHeader = document.querySelector(".modal-header>h2");
        var modalBody = document.querySelector(".modal-body>p");
        var modalFooter = document.querySelector(".modal-footer>h3")
        var modalHead = document.querySelectorAll('.newsrow>h2');
        var modalContent = document.querySelectorAll('.newsrow>p');
        var modalType = document.querySelectorAll('.newsrow>span.news-type');
        const closeBtn = document.querySelector('.close');
        var newsrow = document.querySelectorAll(".newsrow");
        var yea = document.querySelectorAll(".newsrow>div>span.year");

        //load only five elements


        // modalBtn.addEventListener('click', openModal);
        closeBtn.addEventListener('click', closeModal);
        window.addEventListener('click', outsideClick);

        // Open
        function openModal() {
            for (let i = 0; i < modalHead.length; i++) {
                modalHead[i].addEventListener("click", function() {
                    modalHeader.innerText = modalHead[i].innerText;
                    modalBody.innerText = modalContent[i].innerText;
                    modalFooter.innerText = modalType[i].innerText;
                });


                modal.style.display = 'block';
            }
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

        function UpdateCat(e) {
            // window.alert(modalType[0].innerText == e.value + " News");
            for (let i = 0; i < newsrow.length; i++) {
                if (modalType[i].innerText == e.value) {
                    newsrow[i].style.display = "block";
                } else {
                    newsrow[i].style.display = "none";
                }
            }
        }
        const list_element = document.getElementById('list');
        let list_items = list_element.querySelectorAll(".newsrow");
        //list_items = Array.prototype.slice.call(list_items, 0);
        const pagination_element = document.getElementById('pagination');
        let current_page = 1;
        let rows = 5;
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

                //console.log(item_element);
                wrapper.appendChild(item);
            }

        }


        pagination_element.firstElementChild.addEventListener("click", function() {
            //current_page = page;
            if (current_page == 1) {
                // current_page = pg_count + 1; //to get back to last from first page
            }
            if (current_page > 1) {
                DisplayList(list_items, list_element, rows, current_page - 1);
            }

            //window.alert(current_page);
            // button.classList.add('active');
            //this.classList.add("active");
            if (current_page != 1) {
                current_page--;
            }


        });
        pagination_element.lastElementChild.addEventListener("click", function() {
            //current_page = page;
            if (current_page == pg_count) {
                //current_page = 0;     //to get back to first from last page
            }
            if (current_page < pg_count) {
                DisplayList(list_items, list_element, rows, current_page + 1);
            }

            if (current_page != pg_count) {
                current_page++;
            }


        });

        DisplayList(list_items, list_element, rows, current_page);
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