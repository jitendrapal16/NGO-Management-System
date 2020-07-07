<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="fontawesome-free-5.12.1-web\css\all.css" rel="stylesheet">
    <link href="float-donate.css" rel="stylesheet">
    <link href="footer-style.css" rel="stylesheet">
    <link href="css/billing.css" rel="stylesheet">
    <title>Billing</title>

</head>



                <%
                    String type=request.getParameter("type");
                    String amount=request.getParameter("amount");
                    HttpSession sesion=request.getSession(true);
                    sesion.setAttribute("type",type);
                    sesion.setAttribute("amount",amount);
                %>
                
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
                                <a href="#">Home</a>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">About Us</a>
                                <div class="dropdown-content">
                                    <a href="#">Overview</a>
                                    <a href="">Vision & Mission</a>
                                    <!--    <a href="#">Leadership</a>      -->
                                    <a href="#" class="display-none">What we do</a>
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
                                    <a href="#" class="display-none">Join us for Social Welfare</a>
                                    <!--    <a href="#">Good Governance</a>                     -->
                                    <a href="#" class="display-none">Our Reach and Presence</a>
                                    <!--    <a href="#" class="display-none">Stakeholders Speak</a>     -->
                                    <a href="#">Our People</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Our Work</a>
                                <div class="dropdown-content">
                                    <a href="#">Overview</a>
                                    <a href="#">Education</a>
                                    <a href="#">Health</a>
                                    <a href="#">Livelihood</a>
                                    <a href="#">Women Empowerment</a>
                                    <a href="#" class="display-none">Disaster Response</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Campaigns</a>
                                <div class="dropdown-content">
                                    <a href="#">Every Child in School</a>
                                    <a href="#">Plate Half-Full</a>
                                    <a href="#">She Can Fly</a>
                                    <a href="#">Health Cannot Wait</a>
                                    <!--    <a href="#">Help Disabled</a>
                                    <a href="#">Adopt GrandParents</a>      -->
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Happenings</a>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Get Involved</a>
                                <div class="dropdown-content">
                                    <!-- submenu start -->
                                    <ul class="">
                                        <li class="dropdown-submenu">
                                            <a href="#" data-toggle="dropdown">Individual Support</a>
                                            <div class="dropdown-content submenu">
                                                <a href="#">Donate</a>
                                                <a href="#">Campaigns </a>
                                                <a href="#">Volunteering</a>
                                                <a href="#">Internship </a>
                                            </div>
                                        </li>
                                    </ul>
                                    <!-- <submenu end>  -->
                                    <a href="#">Corporate Partnerships</a>
                                    <a href="#" class="display-none">Institutional Alliances</a>
                                    <a href="#" class="display-none">Schools</a>
                                    <a href="#">Volunteers</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Media Centre</a>
                                <div class="dropdown-content">
                                    <a href="#">News</a>
                                    <a href="#">Image Gallery</a>
                                    <!--   <a href="#">Celebrities & Personalities</a>     -->
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Resource Centre</a>
                                <div class="dropdown-content">
                                    <a href="#">Articles</a>
                                    <!-- submenu start -->
                                    <ul class="">
                                        <li class="dropdown-submenu">
                                            <a href="#" data-toggle="dropdown">Perspective</a>
                                            <div class="dropdown-content dropdown-content-right dropdown-content-right submenu">
                                                <a href="#">Child Rights</a>
                                                <a href="#">Children in India</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <!-- <submenu end>  -->
                                    <a href="#">Newsletter</a>
                                    <a href="#">Annual Report</a>
                                    <a href="#">Films</a>
                                    <a href="#">Stories of Change</a>
                                </div>
                            </li>
                            <li class="dropdown nav-area">
                                <a href="#">Contact Us</a>
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
    <br/><br/>
    <!-- /#billing section starts from here -->
    <script type="text/javascript" src="countries.js"></script>
    <section class="billing">
        <div class="row">
            <div class="col-75">
                <div class="container">

                    <form action="DonateChecker" method="POST" class="donorInfo">
                        <fieldset class="selectDonor">
                            <input type="radio" name="IM" id="a" value="indian" checked onchange="change(this)" />
                            <label for="a">Indian</label>
                            <input type="radio" name="IM" id="b" value="nri" onchange="change(this)" />
                            <label for="b">NRI</label>
                            <input type="radio" name="IM" id="c" value="foreignNational" onchange="change(this)" />
                            <label for="c">Foreign National</label>
                        </fieldset>
                        <h2 class="h2-head">Billing Information</h2>
                        <div class="row">

                            <div class="col-50">

                                <label for="fname"> Full Name</label>
                                <input type="text" id="fname" name="fname" placeholder="Full Name*..." required>
                                <label for="email"></i> Email</label>
                                <input type="email" id="email" name="email" placeholder="Email Address" required>
                                <label for="phone"> Phone</label>
                                <input type="text" id="phone" name="phone" placeholder="Phone Number*" pattern="^\d(?:[0-9] ?){8,12}[0-9]$" required>
                                <label for="dob"> Date of Birth</label>
                                <input type="date" id="dob" name="dob" placeholder="Date Of Birth*" required>
                                <label for="adr"> Address</label>
                                <input type="text" id="adr" name="adr" placeholder="Enter address*" required>
                            </div>

                            <div class="col-50">


                                <label for="pcnum"> PAN Card Number</label>
                                <input type="text" id="pcnum" name="pcnum" placeholder="PAN Card Number*" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}">
                                <label for="country"> country</label>
                                <input type="text" id="country" name="country" value="India" placeholder="INDIA" readonly>
                                <label for="state"> State</label>
                                <select type="text" id="state" name="state" placeholder="select State*" required></select>
                                <label for="city"> City</label>
                                <input type="text" id="city" name="city" placeholder="Enter City*" required>
                                <label for="pc"> Postal Code</label>
                                <input type="text" id="pc" name="pc" placeholder="Postal code*" pattern="^\d{6}$" required>

                            </div>

                        </div>
                        <div>
                            <strong>NOTE:</strong>
                            <small>If you need tax exemption, then please provide PAN Card number.</small>
                        </div><br/>

                        <input type="submit" value="Donate Now" class="btn">
                    </form>
                    <form action="DonateCheckerMultipart" method="POST" enctype="multipart/form-data" class="donorInfo" style="display: none;">
                        <h2 class="h2-head">Billing Information</h2>

                        <label for="returnFilling" class="eee"> Filing Return in India* </label>
                        <select name='returnFilling' id='return' class="eeee" required="required"> 
                        <option value='' selected=''>Select</option> 
                        <option value='no'>No</option> 
                        <option value='yes'>Yes</option> 
                    </select>

                        <div class="row">

                            <div class="col-50">
                                <input type="hidden" name="donorFrom" value="nri">
                                <label for="fname"> Full Name</label>
                                <input type="text" id="fname" name="fname" placeholder="Full Name*..." required>
                                <label for="email"></i> Email</label>
                                <input type="email" id="email" name="email" placeholder="Email Address" required>
                                <label for="phone"> Phone</label>
                                <input type="text" id="phone" name="phone" placeholder="Phone Number*" pattern="^\d(?:[0-9] ?){8,12}[0-9]$" required>
                                <label for="dob"> Date of Birth</label>
                                <input type="date" id="dob" name="dob" placeholder="Date Of Birth*" required>
                                <label for="adr"> Address</label>
                                <input type="text" id="adr" name="adr" placeholder="Enter address*" required>
                            </div>

                            <div class="col-50">


                                <label for="pcnum"> Upload Passport*</label>
                                <input type="file" id="pcnum" name="pcnum" placeholder="Upload Passport*" accept="application/pdf, image/*" required>
                                <label for="countrys"> Country</label>
                                <select type="text" id="countrys" name="countries" placeholder="select Country*" required></select>
                                <label for="states"> State</label>
                                <select type="text" id="states" name="statess" placeholder="select State*" required></select>
                                <label for="city"> City</label>
                                <input type="text" id="city" name="city" placeholder="Enter City*" required>
                                <label for="pc"> Postal Code</label>
                                <input type="text" id="pc" name="pc" placeholder="Postal code*" pattern="(?i)^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$" required>
                                <!--Every postal code system uses only A-Z and/or 0-9 and sometimes space/dash

                            Not every country uses postal codes (ex. Ireland outside of Dublin), but we'll ignore that here.

                            The shortest postal code format is Sierra Leone with NN

                            The longest is American Samoa with NNNNN-NNNNNN

                            You should allow one space or dash.

                            Should not begin or end with space or dash-->
                            </div>

                        </div>
                        <div>
                            <strong>NOTE:</strong>
                            <small>I confirm that funds donated have been done out of my free will and I understand these will be used by OUR NGO towards its objectives. These funds are free
                            of any illegality and comply with <a href="https://www.un.org/sc/suborg/en/sanctions/1267/aq_sanctions_list" target="_blank"><strong>UN Sanctions List</strong></a>. I hereby declare that the details
                            furnished above are true and correct to the best of my knowledge. Uploading a copy of passport towards identification of my citizenship status.</small>
                        </div><br/>

                        <input type="submit" value="Donate Now" class="btn">
                    </form>
                    <form action="DonateCheckerMultipart1" method="POST" enctype="multipart/form-data" class="donorInfo" style="display: none;">
                        <h2 class="h2-head">Billing Information</h2>

                        <div class="row">

                            <div class="col-50">
                                <input type="hidden" name="donorFrom" value="foreignNational">
                                <label for="fname"> Full Name</label>
                                <input type="text" id="fname" name="fname" placeholder="Full Name*..." required>
                                <label for="email"></i> Email</label>
                                <input type="email" id="email" name="email" placeholder="Email Address" required>
                                <label for="phone"> Phone</label>
                                <input type="text" id="phone" name="phone" placeholder="Phone Number*" pattern="^\d(?:[0-9] ?){8,12}[0-9]$" required>
                                <label for="dob"> Date of Birth</label>
                                <input type="date" id="dob" name="dob" placeholder="Date Of Birth*" required>
                                <label for="adr"> Address</label>
                                <input type="text" id="adr" name="adr" placeholder="Enter address*" required>
                            </div>

                            <div class="col-50">


                                <label for="pcnum"> Upload Passport*</label>
                                <input type="file" id="pcnum" name="pcnum" placeholder="Upload Passport*"  accept="application/pdf, image/*" required>
                                <label for="countries"> Country</label>
                                <select type="text" id="countries" name="countries" placeholder="select Country*" required></select>
                                <label for="states"> State</label>
                                <select type="text" id="statess" name="statess" placeholder="select State*" required></select>
                                <label for="city"> City</label>
                                <input type="text" id="city" name="city" placeholder="Enter City*" required>
                                <label for="pc"> Postal Code</label>
                                <input type="text" id="pc" name="pc" placeholder="Postal code*" pattern="(?i)^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$" required>
                                <!--Every postal code system uses only A-Z and/or 0-9 and sometimes space/dash

                            Not every country uses postal codes (ex. Ireland outside of Dublin), but we'll ignore that here.

                            The shortest postal code format is Sierra Leone with NN

                            The longest is American Samoa with NNNNN-NNNNNN

                            You should allow one space or dash.

                            Should not begin or end with space or dash-->
                            </div>

                        </div>
                        <div>
                            <strong>NOTE:</strong>
                            <small>I confirm that funds donated have been done out of my free will and I understand these will be used by OUR NGO towards its objectives. These funds are free
                            of any illegality and comply with <a href="https://www.un.org/sc/suborg/en/sanctions/1267/aq_sanctions_list" target="_blank"><strong>UN Sanctions List</strong></a>. I hereby declare that the details
                            furnished above are true and correct to the best of my knowledge. Uploading a copy of passport towards identification of my citizenship status.</small>
                        </div><br/>

                        <input type="submit" value="Donate Now" class="btn">
                    </form>
                </div>
            </div>

        </div>
    </section>
    <br/>
  
    <script language="javascript">
        // populateCountries("country", "state"); // first parameter is id of country drop-down and second parameter is id of state drop-down
        //populateCountries("country2");
        // populateCountries("country2");
        populateState("state");
        populateCountries("countrys", "states");
        populateCountries("countries", "statess");
    </script>
    <script>
        var donorFrom=null;
        function change(element) {
            var divs = document.querySelectorAll("form.donorInfo");
            if (element.id == 'a' && element.checked) {
                divs[0].style.display = "block";
                divs[1].style.display = "none";
                divs[2].style.display = "none";
            } else if (element.id == 'b' && element.checked) {
                divs[1].style.display = "block";
                divs[0].style.display = "none";
                divs[2].style.display = "none";
            } else if (element.id == 'c' && element.checked) {
                divs[2].style.display = "block";
                divs[0].style.display = "none";
                divs[1].style.display = "none";
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





