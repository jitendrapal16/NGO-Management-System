<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Our Partners</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css\bootstrap.css">
    <link rel="stylesheet" href="css\all.css">

    <style>
        #body {
            margin: 10px 40px;
        }
        
        body {
            background: rgb(246, 248, 250);
        }
        
        .home-product-new-hldr {
            position: relative;
            width: 1140px;
        }
        
        .home-product-new {
            width: 1140px;
            overflow: hidden;
        }
        
        .home-grid.products-grid.products-grid--max-4 {
            transition: -ms-transform 0.5s ease 0s, -webkit-transform 0.5s ease 0s, transform 0.5s ease 0s;
            position: relative;
            white-space: nowrap;
        }
        
        .item-container {
            display: inline-block;
            margin: 4px;
            vertical-align: top;
            width: 274px;
        }
        
        .slider-btn-hldr-left {
            left: -32px;
        }
        
        .slider-btn-hldr-right {
            right: -32px;
        }
        
        .slider-btn-hldr {
            bottom: 0;
            display: block;
            padding: 0;
            width: 24px;
            position: absolute;
            top: 40%;
            z-index: 1;
        }
        
        .slider-btn {
            background-color: transparent;
            border: 0 none;
            color: buttontext;
            cursor: pointer;
            display: block;
        }
        
        #left-btn {
            display: none;
        }
        
        .slider-btn svg {
            width: 24px;
            height: 24px;
        }
        
        .products-grid .item {
            margin-left: 0;
            background: white;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            float: left;
        }
        
        .copy {
            padding-top: 95px;
        }
    </style>

</head>

<body>
    <h2 class="text-center" style="font-weight: 800; margin-bottom: 20px;">Our Partners</h2>
    <div id="body">
        <div class="home-product-new-hldr">
            <div class="slider-btn-hldr slider-btn-hldr-left">
                <button id="left-btn" class="slider-btn" style="display: none;">
                <svg viewBox="0 0 256 256">
                    <polyline fill="none" stroke="black" stroke-width="16" points="184,16 72,128 184,240"></polyline>
                </svg>
            </button>
            </div>
            <div class="home-product-new">
                <div class="home-grid products-grid products-grid--max-4" style="left: 0px;">
                     <%

                    try{
                    Statement st=DBConnector.getStatement();
                    String query="SELECT * FROM partners";
                    ResultSet rs=st.executeQuery(query);

                    while(rs.next())
                    {
                %>
                    <div class="item-container">
                        <div class="item">
                            <img src="<%="http://localhost:8080/minorProject/partners/"+rs.getString("imgName")%>" title="<%=rs.getString("partnerName")%>" />
                        </div>
                    </div>
                     <%}
                    }
                    catch(Exception e){


                    }
                %>

                </div>
            </div>
            <div class="slider-btn-hldr slider-btn-hldr-right">
                <button id="right-btn" class="slider-btn" style="display: block;">
                <svg viewBox="0 0 256 256">
                    <polyline fill="none" stroke="black" stroke-width="16" points="72,16 184,128 72,240"></polyline>
                </svg>
            </button>
            </div>
        </div>
        <div>
            <p class="copy text-center" style="font-weight: 800;font-size: 16px;">All Rights Reserved &copy; ourNGO</p>
            <script>
                (function() {

                    var listEl = document.querySelector('.home-grid.products-grid.products-grid--max-4');
                    var btnLeftEl = document.querySelector('#left-btn');
                    var btnRightEl = document.querySelector('#right-btn');
                    var count = 0;
                    var t;
                    var c = true;

                    function slideImages(dir) {
                        var totalChildren = listEl.querySelectorAll(".item").length;
                        dir === "left" ? ++count : --count;
                        if (count > -1) {

                            c = !c;
                        }
                        if (count < -(totalChildren - 5)) {

                            c = !c;
                        }

                        listEl.style.left = count * 286 + 'px';
                        btnLeftEl.style.display = count < 0 ? "block" : "none";
                        // Here, 4 is the number displayed at any given time
                        btnRightEl.style.display = count > 4 - totalChildren ? "block" : "none";
                    }

                    btnLeftEl.addEventListener("click", function(e) {
                        slideImages("left");
                    });
                    btnRightEl.addEventListener("click", function(e) {
                        slideImages("right");
                    });

                    if (c) {
                        t = window.setInterval(function(e) {

                            // window.alert(count);
                            // document.addEventListener('change', slideImages("right"));
                            if (c) {
                                //window.clearInterval(t);
                                document.addEventListener('change', slideImages("right"));
                            } else {
                                document.addEventListener('change', slideImages("left"));

                            }
                        }, 2000);
                    }

                })();
            </script>
</body>

</html>
<!--[selectron:done]-->