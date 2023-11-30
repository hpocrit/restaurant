<#include "base.ftl">
<#macro title>Profile</#macro>
<#macro content>
<#--    <div id="editProfileForm" class="parallax-window relative" data-parallax="scroll" data-image-src="assets/img/antique-cafe-bg-04.jpg">-->
<#--        <div class="container mx-auto tm-container pt-24 pb-48 sm:py-48">-->
<#--            <div class="flex flex-col lg:flex-row justify-around items-center lg:items-stretch">-->
<#--                <div id="editProfileForm">-->
<#--                    <div class="card">-->
<#--                        <form action="" method="POST" class="text-lg">-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Username:</label>-->
<#--                                <input type="text" name="username" id="username" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="Name" value="${user.username}"/>-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Mail:</label>-->
<#--                                <input type="email" name="email" id="email" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="Mail" value="${user.mail}"/>-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">First Name:</label>-->
<#--                                <input type="text" name="firstName" id="firstName" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="First Name" value="${user.firstName}"/>-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Last Name:</label>-->
<#--                                <input type="text" name="lastName" id="lastName" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="Last Name" value="${user.lastName}"/>-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Country:</label>-->
<#--                                <input type="text" name="country" id="country" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="Country" value="${user.country}"/>-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">City:</label>-->
<#--                                <input type="text" name="city" id="city" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="City" value="${user.city}"/>-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Date of Birth:</label>-->
<#--                                <input type="date" name="dateOfBirth" id="dateOfBirth" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="City" value="${user.dateOfBirth?string("yyyy-MM-dd")}"/>-->
<#--                            </div>-->
<#--                            <div class="form-group col-12 d-flex align-items-center">-->
<#--                                <label class="form-control-label px-3">Gender:</label>-->
<#--                                <div class="form-check form-check-inline ml-3">-->
<#--                                    <input class="form-check-input" type="radio" id="male" name="gender" value="M" <#if !user.female>checked</#if>>-->
<#--                                    <label class="form-check-label" for="male">Male</label>-->
<#--                                </div>-->
<#--                                <div class="form-check form-check-inline ml-3">-->
<#--                                    <input class="form-check-input" type="radio" id="female" name="gender" value="F" <#if user.female>checked</#if>>-->
<#--                                    <label class="form-check-label" for="female">Female</label>-->
<#--                                </div>-->
<#--                            </div>-->

<#--                            <div class="text-right">-->
<#--                                <button type="submit" class="text-black hover:text-yellow-500 transition">Update</button>-->
<#--                            </div>-->

<#--                        </form>-->
<#--                    </div>-->
<#--                </div>-->
<#--                <div id="changePasswordForm">-->
<#--                    <div class="card">-->
<#--                        <form action="" method="POST" class="text-lg">-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">New password:</label>-->
<#--                                <input type="password" name="password" id="password" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="Password" />-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Confirm new password:</label>-->
<#--                                <input type="password" name="confirmPassword" id="confirmPassword" class="input w-full bg-black border-b bg-opacity-0 text-black px-0 py-4 mb-4 tm-border-gold" placeholder="Confirm Password" />-->
<#--                            </div>-->

<#--                            <div class="text-right">-->
<#--                                <button type="submit" class="text-black hover:text-yellow-500 transition">Update</button>-->
<#--                            </div>-->
<#--                        </form>-->
<#--                    </div>-->
<#--                </div>-->

<#--                <div id="changeProfilePictureForm">-->
<#--                    <div class="card">-->
<#--                        <form action="" method="POST" class="text-lg">-->
<#--                            <div class="form-group col-12">-->
<#--                                <img id="profileImage" src="<#if user.profilePicture?has_content>${user.profilePicture}<#else>https://assets.bananastreet.ru/unsafe/2498x2498/https://bananastreet.ru/system/user/avatar/38/382/382231/7e7ab91539.png</#if>" alt="Profile Picture" width="300" height="300">-->
<#--                            </div>-->
<#--                            <div class="ml-3 sm:ml-">-->
<#--                                <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">New profile picture:</label>-->
<#--                                <input type="file" name="profilePicture" id="profilePicture" class="form-control" accept="image/*" />-->
<#--                            </div>-->

<#--                            <div class="text-right">-->
<#--                                <button type="submit" class="text-black hover:text-yellow-500 transition">Update</button>-->
<#--                            </div>-->
<#--                        </form>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->

<#--    <div id="changeProfilePictureForm" class="parallax-window relative" data-parallax="scroll" data-image-src="assets/img/antique-cafe-bg-04.jpg">-->
<#--        <div class="container mx-auto tm-container pt-24 pb-48 sm:py-48">-->
<#--            <div class="flex flex-col lg:flex-row justify-around items-center lg:items-stretch">-->

<#--                <div class="card">-->
<#--                    <form action="" method="POST" class="text-lg">-->
<#--                        <div class="form-group col-12">-->
<#--                            <img id="profileImage" src="<#if user.profilePicture?has_content>${user.profilePicture}<#else>https://assets.bananastreet.ru/unsafe/2498x2498/https://bananastreet.ru/system/user/avatar/38/382/382231/7e7ab91539.png</#if>" alt="Profile Picture" width="300" height="300">-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">New profile picture:</label>-->
<#--                            <input type="file" name="profilePicture" id="profilePicture" class="form-control" accept="image/*" />-->
<#--                        </div>-->

<#--                        <div class="text-right">-->
<#--                            <button type="submit" class="text-black hover:text-yellow-500 transition">Update</button>-->
<#--                        </div>-->
<#--                    </form>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->

    <div class="parallax-window" data-parallax="scroll" data-image-src="assets/img/brown_background.jpg">
        <div class="tab-content nav-link" id="editProfileForm" >
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
        <div class="tab-content nav-link" id="changePasswordForm" data-image-src="assets/img/brown_background.jpg">
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

        <div class="tab-content nav-link" id="changeProfilePictureForm" data-image-src="assets/img/brown_background.jpg">
            <div class="container-fluid px-1 py-5 mx-auto">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                        <div class="card">
                            <h5 class="text-center mb-4">Change Your Profile Picture</h5>
                            <form class="form-card" method="POST" action="profile" enctype="multipart/form-data" id="changeProfilePictureForm">
                                <div class="row justify-content-center text-center">
                                    <div class="form-group col-12">
                                        <img id="profileImage" src="<#if user.profilePicture?has_content>${user.profilePicture}<#else>https://dummyimage.com/400x400/dee2e6/6c757d.jpg</#if>" alt="Profile Picture" width="300" height="300">
                                    </div>
                                </div>
                                <div class="row justify-content-center">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Upload New Profile Picture:</label>
                                        <input type="file" id="profilePicture" name="profilePicture" class="form-control" accept="image/*">
                                    </div>
                                </div>
                                <div class="row justify-content-end">
                                    <div class="form-group col-sm-6">
                                        <button type="submit" class="btn-block btn-primary">Change Profile Picture</button>
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
            <li class="text-black hover:text-yellow-500 transition" onclick="showTab('changeProfilePictureForm')">Change Profile Picture</li>
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

        $("#profilePicture").change(function () {
            if (this.files.length > 0) {
                selectedFile = this.files[0];
            }
        });

        $("#changeProfilePictureForm").submit(function (event) {
            event.preventDefault();

            if (selectedFile) { // Проверяем, был ли выбран файл
                var formData = new FormData();
                formData.append("profilePicture", selectedFile);

                $.ajax({
                    type: "POST",
                    url: "profile",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (resp) {
                        $("#profileImage").attr("src", resp);
                    },
                    error: function () {
                        console.error("Error changing profile picture.");
                    }
                });
            } else {
                alert("Please select a file to upload.");
            }
        });

    </script>
</#macro>
