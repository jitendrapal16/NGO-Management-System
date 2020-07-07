<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<!DOCTYPE html>
<html>
<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }
    
    * {
        box-sizing: border-box;
    }
    /* Full-width input fields */
    
    input[type=text],
    input[type=password],
    input[type=email],
    input[type=date],
    select {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }
    /* Add a background color when the inputs get focus */
    
    input[type=text]:focus,
    input[type=password]:focus,
    input[type=email]:focus,
    input[type=date]:focus,
    select:focus {
        background-color: #ddd;
        outline: none;
    }
    /* Set a style for all buttons */
    
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }
    
    button:hover {
        opacity: 1;
    }
    /* Float cancel and signup buttons and add an equal width */
    
    .signupbtn {
        float: left;
        width: 100%;
    }
    /* Add padding to container elements */
    
    .container {
        padding: 26px;
    }
    /* The Modal (background) */
    
    .modal {
        position: fixed;
        /* Stay in place */
        z-index: 1;
        /* Sit on top */
        left: 0;
        top: 0;
        width: auto;
        /* Full width */
        height: 100%;
        /* Full height */
        overflow: auto;
        /* Enable scroll if needed */
        background-color: #474e5d;
        padding-top: 50px;
    }
    /* Modal Content/Box */
    
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto;
        /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 80%;
        /* Could be more or less, depending on screen size */
    }
    /* Style the horizontal ruler */
    
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }
    /* Clear floats */
    
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }
    /* Change styles for cancel button and signup button on extra small screens */
    
    @media screen and (max-width: 300px) {
        .signupbtn {
            width: 100%;
        }
    }
    
    @media screen and (min-width: 991px) {
        .modal-content {
            width: 60%;
        }
    }
</style>

<body>
        <%
           Statement st=DBConnector.getStatement();
           String query="select username from membership where username is null";
           ResultSet rs=st.executeQuery(query);
           if(!rs.next()){
               response.sendRedirect("donateMember.html");
           }
         
        %>
    <div id="id01" class="modal">
        <form class="modal-content" action="RegMemberChecker" method="POST">
            <div class="container">
                <h1 style="text-align: center;color: orange;">Sign Up as Member</h1>
                <p style="text-align: center;margin-top: -10px;">Please fill this form for membership</p>
                <hr>
                <label for="fname"><b>First Name</b></label>
                <input type="text" placeholder="Enter First Name" name="fname" required>

                <label for="lname"><b>Last Name</b></label>
                <input type="text" placeholder="Enter Last Name" name="lname" required>

                <label for="dob"><b>Date of Birth</b></label>
                <input type="date" name="dob" required>

                <label for="email"><b>Email</b></label>
                <input type="email" placeholder="Enter Email" name="email" required>

                <label for="phone"><b>Phone</b></label>
                <input type="text" placeholder="Enter Phone" name="phone" required>

                <label for="address"><b>Address</b></label>
                <input type="text" placeholder="Enter Address" name="address" required>

                <label for="profession"><b>Profession</b></label>
                <input type="text" placeholder="Enter Profession" name="profession" required>

                <label for="nationality"><b>Nationality</b></label>
                <input type="text" placeholder="Nationality" name="nationality" required>

                <label for="gender">Gender:</label>
                <select name="gender" id="gender">
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                  <option value="Other">other</option>
                </select>

                <label for="username"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" pattern="[A-Za-z0-9_.]{2,15}" required>

                <label for="Password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,}" title="6 digit password with numbers,uppercase,lowercase and special characters" required>

                <label for="password"><b>Confirm Password</b>&nbsp;<small style="color: red;display: none;" id="error">Password not Same</small></label>
                <input type="password" placeholder="Repeat Password" id="confirm_password" name="confirm_password" onkeyup='check_pass();' required>

                <p>By creating an account you agree to our <a href="" onclick="alert('Coming Soon');" style="color:dodgerblue">Terms & Privacy</a>.</p>

                <div class="clearfix">
                    <button type="submit" id="submit" class="signupbtn">Sign Up</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        function check_pass() {
            if (document.getElementById('password').value ==
                document.getElementById('confirm_password').value) {
                document.getElementById('submit').disabled = false;
                document.getElementById('error').style.display = "none";
            } else {
                document.getElementById('submit').disabled = true;
                document.getElementById('error').style.display = "block";
            }
        }
        
    </script>
</body>

</html>