var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form...
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
            //... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                document.getElementById("nextBtn").innerHTML = "Submit";
            } else {
                document.getElementById("nextBtn").innerHTML = "Next";
            }
            //... and run a function that will display the correct step indicator:
            fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            // Exit the function if any field in the current tab is invalid:
            if (n == 1 && !validateForm()) return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form...
            if (currentTab >= x.length) {
                // ... the form gets submitted:
                document.getElementById("signup-form").submit();
                //document.getElementById("nextBtn").type = "submit";


                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, z, valid = true;
            x = document.getElementsByClassName("tab");
            y = x[currentTab].getElementsByTagName("input");
            z = x[currentTab].getElementsByClassName("input-box");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                var s = z[i].getElementsByTagName("i");
                var pattern = y[i].getAttribute("pattern");
                var re = new RegExp(pattern);
                if (y[i].value.trim() == "" || !re.test(y[i].value)) {
                    // add an "invalid" class to the field:
                    s[1].style.visibility = "hidden";
                    s[0].style.visibility = "visible";
                    y[i].className += " invalid";
                    // and set the current valid status to false
                    valid = false;
                } else if (re.test(y[i].value)) {
                    s[0].style.visibility = "hidden";
                    s[1].style.visibility = "visible";
                    if (checkPassword() == false && currentTab >= x.length - 1) {
                        //document.getElementById("checkpassword").addEventListener("keyup", checkPassword);
                        valid = false;
                    }

                }

            }


            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }
        //document.addEventListener("focusout", validateForm); //for refreshing on keyup
        //  document.getElementById("fname").addEventListener("input", validateForm);
        //document.getElementById("lname").addEventListener("keyup", validateForm);


        function fixStepIndicator(n) {
            // This function removes the "active" class of all steps...
            var i, x = document.getElementsByClassName("step");
            for (i = 0; i < x.length; i++) {
                x[i].className = x[i].className.replace(" active", "");
            }
            //... and adds the "active" class on the current step:
            x[n].className += " active";
        }

        function eyeHideShow() {
            var x = document.getElementById("myInput");
            var y = document.getElementById("hide1");
            var z = document.getElementById("hide2");
            if (x.type === 'password') {
                x.type = "text";
                y.style.display = "block";
                z.style.display = "none";
            } else {
                x.type = "password";
                y.style.display = "none";
                z.style.display = "block";
            }
        }

        function checkPassword() {
            var s = document.getElementById("password").value;
            var t = document.getElementById("checkpassword").value;
            var u = document.getElementById("checkpassword1");
            var v = document.getElementById("checkpassword2");
            if (s != t) {
                v.style.visibility = "hidden";
                u.style.visibility = "visible";
                //document.getElementById("nextBtn").type = "button";
                return false;
            } else {
                u.style.visibility = "hidden";
                v.style.visibility = "visible";
                //document.getElementById("nextBtn").type = "submit";
                return true;
            }

        }

        function swap(referTo) {
            var signup = document.getElementById("signup-form");
            var login = document.getElementById("login-form");
            if (referTo.getAttribute("data-tab") == "login") {
                document.getElementById("form-body").classList.remove('active');
                referTo.parentNode.classList.remove('signup');
                signup.style.display = "none";
                login.style.display = "block";


            } else {
                document.getElementById("form-body").classList.add('active');
                referTo.parentNode.classList.add('signup');
                login.style.display = "none";
                signup.style.display = "block";

            }
        }