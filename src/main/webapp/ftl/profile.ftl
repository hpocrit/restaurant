<#include "base.ftl">
<#macro title>Profile</#macro>
<#macro content>
    <div class="parallax-window" data-parallax="scroll" data-image-src="assets/img/brown_background.jpg">
        <div class="tab-content nav-link" id="editProfileForm" style="padding: 2rem 1rem;">
            <div class="container-fluid px-1 py-5 mx-auto">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                        <div class="card">
                            <h5 class="text-center mb-4">Edit profile details</h5>
                            <form class="form-card" method="POST" action="profile" id="editProfileForm">
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Username:</label>
                                        <input type="text" id="username" name="username" class="form-control" value="${user.username}">
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Email:</label>
                                        <input type="mail" id="mail" name="mail" class="form-control" value="${user.mail}">
                                    </div>
                                </div>
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">First Name:</label>
                                        <input type="text" id="firstName" name="first_name" class="form-control" value="${user.firstName}">
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Last Name:</label>
                                        <input type="text" id="lastName" name="last_name" class="form-control" value="${user.lastName}">
                                    </div>
                                </div>
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Date of Birth:</label>
                                        <input type="date" id="dateOfBirth" name="date_of_birth" class="form-control" value="${user.dateOfBirth?string("yyyy-MM-dd")}">
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Country:</label>
                                        <input type="text" id="country" name="country" class="form-control" value="${user.country}">
                                    </div>
                                </div>
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">City:</label>
                                        <input type="text" id="city" name="city" class="form-control" value="${user.city}">
                                    </div>
                                </div>
                                <div class="form-group col-12 d-flex align-items-center">
                                    <label class="form-control-label px-3">Gender:</label>
                                    <div class="form-check form-check-inline ml-3">
                                        <input class="form-check-input" type="radio" id="male" name="gender" value="M" <#if !user.female>checked</#if>>
                                        <label class="form-check-label" for="male">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline ml-3">
                                        <input class="form-check-input" type="radio" id="female" name="gender" value="F" <#if user.female>checked</#if>>
                                        <label class="form-check-label" for="female">Female</label>
                                    </div>
                                </div>
                                <div class="row justify-content-end">
                                    <div class="text-right">
                                        <button type="submit" class="btn-block btn-primary">Update</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-content nav-link" id="changePasswordForm" data-image-src="assets/img/brown_background.jpg" style="padding: 2rem 1rem;">
            <div class="container-fluid px-1 py-5 mx-auto">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                        <div class="card">
                            <h5 class="text-center mb-4">Change Your Password</h5>
                            <form class="form-card" method="POST" action="profile" id="changePasswordForm">
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Enter new password:</label>
                                        <input type="password" id="newPassword" name="newPassword" class="form-control">
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Confirm new password:</label>
                                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control">
                                    </div>
                                </div>
                                <div class="row justify-content-end">
                                    <div class="form-group col-sm-6">
                                        <button type="submit" class="btn-block btn-primary">Change Password</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <ul class="nav justify-content-center">
            <li class="text-black hover:text-yellow-500 transition" onclick="showTab('editProfileForm')">Edit Profile</li>
            <li class="text-black hover:text-yellow-500 transition" onclick="showTab('changePasswordForm')">Change Password</li>
            <a href="logout">
                <li class="text-black hover:text-yellow-500 transition">Logout</li>
            </a>
        </ul>
    </div>



    <script>

        function showTab(tabId) {
            const tabs = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => tab.style.display = 'none');
            document.getElementById(tabId).style.display = 'block';
        }

        showTab('editProfileForm');

        $("#editProfileForm").submit(function (event) {
            event.preventDefault();

            let username = $("#username").val();
            let mail = $("#mail").val();
            let firstName = $("#firstName").val();
            let lastName = $("#lastName").val();
            let dateOfBirth = $("#dateOfBirth").val();
            let gender = $("input[name='gender']:checked").val();
            let country = $("#country").val();
            let city = $("#city").val();

            $.ajax({
                type: "POST",
                url: "profile",
                data: {
                    "username": username,
                    "mail": mail,
                    "first_name": firstName,
                    "last_name": lastName,
                    "date_of_birth": dateOfBirth,
                    "gender": gender,
                    "country": country,
                    "city": city
                },
                success: function () {
                    alert("Successfully changed user data!")
                }
                ,
                error: function (error) {
                    console.error("Error:", error);
                }
            });
        });

        $("#changePasswordForm").submit(function (event) {
            event.preventDefault();

            let newPassword = $("#newPassword").val()
            let confirmPassword = $("#confirmPassword").val()

            if (newPassword === confirmPassword) {
                $.ajax({
                    type: "POST",
                    url: "profile",
                    data: {
                        "password": newPassword
                    },
                    success: function () {
                        alert("Successfully changed password!")
                        $("input[name='newPassword']").val('');
                        $("input[name='confirmPassword']").val('');

                    }
                    ,
                    error: function (error) {
                        console.error("Error:", error);
                    }
                });
            } else {
                alert("Passwords are not equal!")
            }
        });

        var selectedFile = null;

    </script>
</#macro>
