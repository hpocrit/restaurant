<#include "base.ftl">
<#macro title>Registration</#macro>
<#macro content>
<#--    <div id="editProfileForm" class="parallax-window relative" data-parallax="scroll" data-image-src="assets/img/antique-cafe-bg-04.jpg">-->
<#--        <div class="container mx-auto tm-container pt-24 pb-48 sm:py-48">-->
<#--            <div class="flex flex-col lg:flex-row justify-around items-center lg:items-stretch">-->
<#--                <div class="text-center mb-16">-->
<#--                    <h2 class="bg-white tm-text-brown py-6 px-12 text-4xl font-medium inline-block rounded-md">Edit Profile</h2>-->
<#--                </div>-->

<#--                <div class="flex-1 rounded-xl p-12 pb-14 m-5 bg-black bg-opacity-50 tm-item-container">-->
<#--                    <form action="" method="POST" class="text-lg">-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Username:</label>-->
<#--                            <input type="text" name="username" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Name"/>-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Mail:</label>-->
<#--                            <input type="email" name="email" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Mail"/>-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">New password:</label>-->
<#--                            <input type="password" name="password" id="password" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Password" />-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">First Name:</label>-->
<#--                            <input type="text" name="first_name" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="First Name"/>-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Last Name:</label>-->
<#--                            <input type="text" name="last_name" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Last Name"/>-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Country:</label>-->
<#--                            <input type="text" name="country" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Country"/>-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">City:</label>-->
<#--                            <input type="text" name="city" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="City"/>-->
<#--                        </div>-->
<#--                        <div class="ml-3 sm:ml-">-->
<#--                            <label class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">Date of Birth:</label>-->
<#--                            <input type="date" name="date_of_birth" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="City" />-->
<#--                        </div>-->
<#--                        <div class="form-group col-12 d-flex align-items-center">-->
<#--                            <label class="form-control-label px-3">Gender:</label>-->
<#--                            <div class="form-check form-check-inline ml-3">-->
<#--                                <input class="form-check-input" type="radio" id="male" name="gender" >-->
<#--                                <label class="form-check-label" for="male">Male</label>-->
<#--                            </div>-->
<#--                            <div class="form-check form-check-inline">-->
<#--                                <input class="form-check-input" type="radio" id="female" name="gender">-->
<#--                                <label class="form-check-label" for="female">Female</label>-->
<#--                            </div>-->
<#--                        </div>-->

<#--                        <div class="text-right">-->
<#--                            <button type="submit" class="text-white hover:text-yellow-500 transition">Submit</button>-->
<#--                        </div>-->

<#--                    </form>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->

    <div class="parallax-window" data-parallax="scroll" data-image-src="assets/img/brown_background.jpg">
        <div class="tab-content nav-link" id="editProfileForm" style="padding: 2rem 1rem;">
            <div class="container-fluid px-1 py-5 mx-auto">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                        <div class="card">
                            <h5 class="text-center mb-4">Registration</h5>
                            <form method="POST" action="">
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Username:</label>
                                        <input type="text" id="username" name="username" class="form-control">
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Email:</label>
                                        <input type="email" id="email" name="email" class="form-control" >
                                    </div>
                                </div>
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">First Name:</label>
                                        <input type="text" id="first_name" name="first_name" class="form-control" >
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Last Name:</label>
                                        <input type="text" id="last_name" name="last_name" class="form-control">
                                    </div>
                                </div>
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Date of Birth:</label>
                                        <input type="date" id="date_of_birth" name="date_of_birth" class="form-control" >
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Country:</label>
                                        <input type="text" id="country" name="country" class="form-control">
                                    </div>
                                </div>
                                <div class="row justify-content-between text-left">
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">City:</label>
                                        <input type="text" id="city" name="city" class="form-control" >
                                    </div>
                                    <div class="form-group col-sm-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Password:</label>
                                        <input type="password" id="password" name="password" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group col-12 d-flex align-items-center">
                                    <label class="form-control-label px-3">Gender:</label>
                                    <div class="form-check form-check-inline ml-3">
                                        <input class="form-check-input" type="radio" id="male" name="gender" >
                                        <label class="form-check-label" for="male">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline ml-3">
                                        <input class="form-check-input" type="radio" id="female" name="gender">
                                        <label class="form-check-label" for="female">Female</label>
                                    </div>
                                </div>
                                <div class="row justify-content-end">
                                    <div class="text-right">
                                        <button type="submit" class="btn-block btn-primary">Submit</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>
