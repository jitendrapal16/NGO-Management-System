
<%@page import="model.MembershipAuthenticator"%>
<%@page import="model.Checker"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="../fontawesome-free-5.12.1-web/css/all.css" />
    <!-- CSS Files -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min1.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
</head>

<style>
    .tttt {
        display: block;
    }
    
    .userProfileInfo .imageap {
        position: relative
    }
    
    .userProfileInfo .imageap .editImage {
        position: absolute;
        bottom: -27px;
        right: 20px;
        background: #fe5621;
        color: #fff;
        text-align: center;
        font-size: 18px;
        font-size: 1.8rem;
        width: 54px;
        height: 54px;
        line-height: 54px;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        -moz-background-clip: padding;
        -webkit-background-clip: padding-box;
        background-clip: padding-box
    }
    
    .userProfileInfo .imageap .editImage:hover {
        background: #fe693a
    }
    
    .userProfileInfo .boxap {
        padding: 0
    }
    
    .userProfileInfo .boxap .infoap,
    .userProfileInfo .boxap .name,
    .userProfileInfo .boxap .socialIcons {
        padding: 15px 20px;
        border-bottom: 1px solid #e6e7ed
    }
    
    .userProfileInfo .boxap .socialIcons {
        border: 0
    }
    
    .userProfileInfo .boxap .infoap>span {
        margin: 10px 0;
        display: block;
        padding: 0 0 0 35px;
        position: relative
    }
    
    .userProfileInfo .boxap .infoap>span .fa {
        position: absolute;
        left: 5px;
        top: 4px;
        color: #9da2a6
    }
    
    .boxHeadlineap {
        margin: 0 0 25px 0;
        font-size: 18px;
        font-size: 1.8rem
    }
    
    .boxHeadlineap+.boxHeadlineSub {
        margin: -18px 0 30px 0
    }
    
    .boxHeader .boxTitleap {
        margin: 22px 0 20px 30px
    }
    
    .boxHeader .boxHeaderOptions {
        margin: 9px 12px 0 0
    }
    
    .boxHeader .boxHeaderOptions .btn {
        color: #9da2a6;
        padding: 0;
        width: 40px;
        height: 40px;
        line-height: 42px;
        text-align: center;
        font-size: 24px;
        font-size: 2.4rem
    }
    
    .boxHeader .boxHeaderOptions .btn:active,
    .boxHeader .boxHeaderOptions .btn:focus,
    .boxHeader .boxHeaderOptions .btn:hover {
        background: #f2f9ff;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none
    }
    
    .boxHeader.pageBoxHeader .boxHeaderOptions {
        margin: 20px 12px 0 0
    }
    
    .boxHeader.boxHeaderBorders {
        border-bottom: 1px solid #e6e7ed
    }
    
    .boxHeader.boxap {
        padding: 30px
    }
    
    .boxHeader.boxap .pageTitle {
        margin: 0 0 6px 0
    }
    
    .boxHeader.boxap .pageTitle+.breadcrumb {
        margin: 0
    }
    
    .boxTitleap {
        font-size: 14px;
        font-size: 1.4rem;
        font-weight: 700;
        text-transform: uppercase;
        margin: 0 0 25px 0
    }
    
    .boxHeadlineSub {
        font-size: 14px;
        font-size: 1.4rem;
        font-weight: 400;
        font-style: italic;
        color: #919599;
        margin: 0 0 25px 0;
        line-height: 18px
    }
    
    .boxHeadlineSub a {
        color: #fe5621
    }
    
    .bgTitle {
        background: url(../../img/bg-sharpen.jpg) no-repeat;
        background-size: 100% 100%
    }
    
    .bgTitle .boxTitleap {
        margin: 0;
        padding: 22px 30px;
        color: #fff
    }
    
    .boxap {
        background: #fff;
        padding: 30px;
        margin: 0 0 24px 0
    }
    
    .boxap.box-without-padding {
        padding: 0
    }
    
    .boxap.box-without-sidepadding {
        padding: 8px 0
    }
    
    .boxap.box-without-sidepadding .boxTitleap {
        margin-left: 30px
    }
    
    .boxap.box-without-bottom-padding {
        padding-bottom: 0
    }
    
    .boxap .tableWrap {
        margin: 0 -30px
    }
    
    .boxap .table-responsive {
        width: auto
    }
    
    .boxap .panel-group:last-of-type {
        margin-bottom: 0
    }
    
    .simpleListingsap {
        padding: 0;
        margin: 0
    }
    
    .simpleListingsap li {
        list-style-type: none;
        padding: 0 0 20px 0;
        margin: 20px 0 0 0;
        border-bottom: 1px solid #e6e7ed;
        position: relative
    }
    
    .simpleListingsap li:first-child {
        margin-top: 0
    }
    
    .simpleListingsap li:only-child {
        border-bottom: 0
    }
    
    .simpleListingsap li .titleap {
        font-size: 14px;
        font-size: 1.4rem;
        font-weight: 700;
        text-transform: uppercase;
        margin: 0 0 2px 0
    }
    
    .simpleListingsap li .titleap span {
        font-weight: 400;
        text-transform: none
    }
    
    .simpleListingsap li .titleap a:hover {
        color: #fe5621
    }
    
    .simpleListingsap li .infoap {
        color: #919599;
        font-style: italic;
        margin-top: -6px;
        font-size: 14px;
    }
    
    .simpleListingsap li p {
        margin: 7px 0 0 0
    }
    
    .simpleListingsap li img {
        margin: 20px 0
    }
    
    .userActivitiesap {
        margin-bottom: 25px
    }
    
    .userActivitiesap+.showMore {
        margin: 0 0 0 70px
    }
    
    .userActivitiesap .i {
        margin-top: 25px;
        position: relative
    }
    
    .userActivitiesap .i:first-child {
        margin-top: 0
    }
    
    .userActivitiesap .i .imageap {
        position: absolute;
        top: 20px;
        left: 0
    }
    
    .userActivitiesap .i .activityContentap {
        margin: 0 0 0 70px;
        border: 1px solid #e6e7ed;
        min-height: 70px
    }
    
    .userActivitiesap .i .activityContentap:after,
    .userActivitiesap .i .activityContentap:before {
        content: '';
        left: 48px;
        top: 40px;
        border: solid transparent;
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none
    }
    
    .userActivitiesap .i .activityContentap:after {
        border-right-color: #fff;
        border-width: 12px;
        margin-top: -12px
    }
    
    .userActivitiesap .i .activityContentap:before {
        border-right-color: #dcdcdc;
        border-width: 11px;
        margin-top: -11px
    }
    
    .userActivitiesap ul {
        padding: 20px 25px
    }
    
    .userActivitiesap ul li .titleap {
        font-size: 16px;
        font-size: 1.6rem;
        text-transform: none
    }
    
    .userActivitiesap .statusap li {
        padding-bottom: 0
    }
    
    .userActivitiesap .statusap li .shareap {
        margin: 20px 0 0 0
    }
    
    .userActivitiesap .statusap li .shareap a {
        color: #fe5621;
        display: inline-block;
        margin: 0 0 0 20px
    }
    
    .userActivitiesap .statusap li .shareap a:first-child {
        margin: 0
    }
    
    .userActivitiesap .statusap li .shareap a .fa {
        color: #9da2a6;
        margin: 0 3px 0 0;
        -webkit-transition: color .3s ease;
        -moz-transition: color .3s ease;
        -ms-transition: color .3s ease;
        -o-transition: color .3s ease
    }
    
    .userActivitiesap .statusap li .shareap a:hover .fa {
        color: #fe5621
    }
    
    .userActivitiesap .commentsap {
        background: #f5f6fa;
        border-top: 1px solid #e6e7ed
    }
    
    .userActivitiesap .commentsap li:last-child {
        border-bottom: 0;
        padding-bottom: 0
    }
    
    .userActivitiesap .commentsap li .imageap {
        position: absolute;
        left: 0;
        top: 0
    }
    
    .userActivitiesap .commentsap li .imageap img {
        margin: 0
    }
    
    .userActivitiesap .commentsap li .c {
        margin: 0 0 0 70px;
        margin-top: -30px;
    }
    
    .userActivitiesap .commentsap li .c .form-controlap {
        border-left: 1px solid #e6e7ed;
        padding: 10px 18px;
        margin: 0 0 10px 0
    }
    
    .userActivitiesap .commentsap li .c .form-controlap:focus {
        border-color: #e6e7ed
    }
    
    .userActivitiesap .commentsap li .caa {
        margin: 0 0 0 70px;
    }
    
    .userActivitiesap .commentsap li .caa .form-controlap {
        border-left: 1px solid #e6e7ed;
        padding: 10px 18px;
        margin: 0 0 10px 0
    }
    
    .userActivitiesap .commentsap li .caa .form-controlap:focus {
        border-color: #e6e7ed
    }
    
    .userActivitiesap .commentsap li.showComments {
        border-bottom: 0;
        padding: 0;
        margin: 0 0 15px 0
    }
    
    .userActivitiesap .commentsap li.showComments .fa {
        color: #9da2a6;
        margin: 0 3px 0 0
    }
    
    .userActivitiesap .commentsap li.showComments a:hover {
        color: #fe5621
    }
    
    @media (min-width: 992px) {
        .userProfileInfo .imageap img {
            width: 100%;
        }
    }
    
    img[src=''],
    img[src=null]{
        display: none;
    }
    
    video[src=''],
    video[src=null]{
        display: none;
    }
    
    .off {
        pointer-events: none;
        color: lightslategray;
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
        <div class="sidebar">

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
                    <li class="nav-item active">
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
                        <a class="nav-link" href="./membership.jsp">
                            <i class="fas fa-table"></i>
                            <p>MemberShip</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./donation.jsp">
                            <i class="fas fa-id-card"></i>
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
                    <a class="navbar-brand" href="#"> Dashboard </a>
                    <button href="" onclick="toggleSidebar(this);" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <span class="d-lg-none">Dashboard</span>
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
                            <li class="nav-item" style="">
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

                <div class="containerap" style="width: 100%;">

                    <div class="row">


                        <div class="col-md-12">
                            <div class="boxap">
                                <h2 style="font-size: 16px;" class="boxTitleap">Post</h2>
                                <!-- Tabs -->
                                <ul class="navap nav-tabsap userProfileTabsap" id="timelineTabs" role="tablist">
                                    <li class="timelineTab off"><a style="color: lightgray;" onclick="navTimelineTabToggle(0);" href="#tab-item-1" aria-controls="tab-item-1" role="tab" data-toggle="tab">About</a></li>
                                    <li class="timelineTab off active"><a onclick="navTimelineTabToggle(1);" href="#tab-item-2" aria-controls="tab-item-2" role="tab" data-toggle="tab">Timeline</a></li>
                                    <li class="timelineTab off"><a style="color: lightgray;" onclick="navTimelineTabToggle(2);" href="#tab-item-3" aria-controls="tab-item-3" role="tab" data-toggle="tab">Activity</a></li>
                                </ul>
                            </div>

                            <div class="boxap">

                                <div class="tab-contentap" id="navTabContainer">
                                    <!-- About -->
                                    <div role="tabpanel" class="tab-paneap fadeap">

                                    </div>

                                    <!-- Timeline -->
                                    <div role="tabpanel" class="tab-paneap fadeap active in">
                                        <div class="the-timelineap boxap">
                                            <h2 style="font-size: 14px;font-weight: 500;margin-bottom: 6px;" class="boxTitleap">&nbsp;Share your insights</h2>
                                            <form role="form" class="post-to-timelineap" action="/minorProject/UploadTimeline" method="POST" enctype="multipart/form-data">
                                                <textarea class="form-controlap" name="description" maxlength="2000" style="height: 70px;margin-bottom:10px;" placeholder="Whats on your mind..."></textarea>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <label class="btn btn-sm btn-default" for="img"><i style="cursor: pointer;" class="fas fa-camera"></i></label>
                                                        <input type="file" id="img" name="image" accept="image/*" onchange="loadFile(event)" style="display: none;">
                                                        <label class="btn btn-sm btn-default" for="vid"><i style="cursor: pointer;" class="fas fa-video"></i></label>
                                                        <input type="file" id="vid" name="video" accept="video/*" onchange="loadFile1(event)" style="display: none;">
                                                    </div>
                                                    <div class="col-sm-6 text-right"><button type="submit" class="btn btn-primary">Post</button></div>
                                                    <div class="row containerap" style="display: block;margin: 0;">
                                                        <img style="width: 100px;height: auto;" id="output" style="display: none;" />
                                                        <video id="output1" style="width: 100px;height: auto;display: none;"></video>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="userActivitiesap" id="timeline">
                                            <%
                                try{
                                Statement st=DBConnector.getStatement();
                                String query="SELECT * FROM timeline ORDER BY sNo DESC";
                                ResultSet rs=st.executeQuery(query);
                                
                                while(rs.next()){
                                    //Checker ck=new Checker();
                                    //String profile=ck.getProfile(rs.getString("username"));
                            %>
                                            <div class="i">
                                                <a href="#" title="#" class="imageap">
                                                    <img src="<%="http://localhost:8080/minorProject/profile/"+rs.getString("profile")%>" alt="#" width="44" height="44">
                                                </a>
                                                <div class="activityContentap">
                                                    <ul class="simpleListingsap statusap">
                                                        <li>

                                                            <div class="titleap">
                                                                <a style="font-size: 18px;font-weight: 600;" href="" title="#"><%=rs.getString("fname")%></a>
                                                            </div>
                                                            <div class="infoap"><%=rs.getString("datetime")%></div>
                                                            <p><%=rs.getString("description")%></p>
                                                            <div class="videoWrapper">
                                                                <%
                                                                String videoName="";
                                                                if(rs.getString("videoName")!=null){
                                                                   videoName="http://localhost:8080/minorProject/timeline/"+rs.getString("videoName");
                                                                }
                                                                %>
                                                                <video ref="video" src="<%=videoName%>" class="videoplayer" style="width: 300px;height: auto;margin-top: 6px;" id="video" controlsList="nodownload" controls poster="">
                                                                        </video>
                                                            </div>
                                                            <div class="imgWrapper">
                                                                <%
                                                                String imgName="";
                                                                if(rs.getString("imgName")!=null){
                                                                   imgName="http://localhost:8080/minorProject/timeline/"+rs.getString("imgName");
                                                                }
                                                                %>
                                                                <img src="<%=imgName%>" alt="Img not found" width="150" height="212" class="img-responsive">
                                                            </div>
                                                            <div class="shareap off">
                                                                <a id="ace" onclick="toggleCommentsVisibility();" title="show" style="cursor: pointer;color: lightgray;"><i class="fa fa-comments"></i> 14 comments</a>
                                                            </div>
                                                        </li>
                                                    </ul>


                                                    <!-- Comments 
                                                    <ul class="simpleListingsap commentsap" id="showCommentToggle" style="display: none;">
                                                        <li class="showComments">
                                                            <a href="#" title="#"><i class="fa fa-comments"></i> Show <strong>all 21 comments</strong></a>
                                                        </li>
                                                        <li>
                                                            <a href="#" title="#" class="itemOptionsap"><i class="fa fa-cog"></i></a>
                                                            <a href="#" title="#" class="imageap">
                                                                <img src="profile.jpg" alt="#" width="44" height="44">
                                                            </a>
                                                            <div class="c">
                                                                <div class="titleap"><a style="font-size: 18px;font-weight: 600;" href="#" title="#">Jessica Whore</a></div>
                                                                <div class="infoap">4 hours ago</div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel sapien at risus commodo varius vel ut sapien. Aenean sodales non ex et venenatis. In hac habitasse platea dictumst. Donec
                                                                    vitae tellus non erat dapibus hendrerit. Class aptent taciti bold text lorem ipsum per conubia nostra, per inceptos.</p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <a href="#" title="#" class="itemOptionsap"><i class="fa fa-cog"></i></a>
                                                            <a href="#" title="#" class="imageap">
                                                                <img src="profile.jpg" alt="#" width="44" height="44">
                                                            </a>
                                                            <div class="c">
                                                                <div class="titleap"><a style="font-size: 18px;font-weight: 600;" href="#" title="#">Muhammad Ali</a></div>
                                                                <div class="infoap">3 hours ago</div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <a href="#" title="#" class="imageap">
                                                                <img src="profile.jpg" alt="#" width="44" height="44">
                                                            </a>
                                                            <div class="caa">
                                                                <form>
                                                                    <textarea rows="1" placeholder="Start typing here..." class="form-controlap js-autogrowap" style="overflow: hidden; word-wrap: break-word; height: 42px;"></textarea>
                                                                    <button type="submit" class="btn btn-sm btn-outline-secondary">Post Comment</button>
                                                                </form>
                                                            </div>
                                                        </li>
                                                    </ul>-->
                                                </div>
                                            </div>
                                            <%}
                            }
                                catch(Exception e){
                                    
                                }
                            %>
                                        </div>
                                        <!-- Show more -->
                                        <a href="" title="Show more" onclick="alert('Coming Soon');" class="btn btn-primary showMore"><i class="fas fa-sync"></i> Show more</a>
                                    </div>

                                    <!-- Activity -->
                                    <div role="tabpanel" class="tab-paneap fadeap">

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
    <script>
        // var a = document.getElementsByClassName(".sidebar");

        function toggleSidebar(e) {
            var a = document.querySelector(".sidebar").classList.toggle("tttt");
            // a.style.display = "block";
            //a.style.left = "-25px";

        }

        function loadFile(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('output');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
            document.getElementById("output").style.display = "inline-block";
        };

        function loadFile1(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('output1');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
            document.getElementById("output1").style.display = "inline-block";
        };

        /* function toggleCommentsVisibility() {
             var pnt = document.getElementById("timeline");
             var navItem = pnt.getElementsByClassName("i");
             for (let i = 0; i < navItem.length; i++) {
                 navItem[i].addEventListener("click", function() {
                     var tan = document.querySelectorAll(".i>.activityContentap>ul>li>div.videoWrapper>video");
                     for (var k = 0; k < tan.length; k++) {
                         tan[k].style.display = "none";
                     }
                     var tav = document.querySelectorAll(".i>.activityContentap>.simpleListingsap.commentsap");
                     for (var j = 0; j < tav.length; j++) {
                         tav[j].style.display = "none";
                     }

                     //document.getElementById(tav[i].id).style.display = "block";
                     pnt.getElementsByClassName("commentsap")[i].style.display = "block";
                 });

             }

         }*/

        function navTimelineTabToggle(index) {
            var tt = document.getElementById("timelineTabs");
            var tv = tt.getElementsByClassName("timelineTab");
            var ntc = document.getElementById("navTabContainer");
            var tp = ntc.getElementsByClassName("tab-paneap");
            var tfa = ntc.querySelectorAll(".tab-paneap.fadeap.active.in");
            for (var i = 0; i < tv.length; i++) {
                tv[i].addEventListener("click", function() {
                    var ct = document.getElementsByClassName(" active");
                    // ct[0].classList.remove("active");
                    [].forEach.call(tv, function(elm) {
                        elm.className = elm.className.replace(" active", "");
                    });
                    //ct[0].className = ct[0].className.replace(" active", "");
                    this.classList.add("active");
                });
                [].forEach.call(tfa, function(elem) {
                    elem.className = elem.className.replace(" active in", "");
                });
                tp[index].className += " active in";
            }
        }
    </script>
</body>


</html>