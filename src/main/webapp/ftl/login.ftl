<#include "base.ftl">
<title>Login</title>

<div id="contact" class="parallax-window relative" data-parallax="scroll" data-image-src="assets/img/antique-cafe-bg-04.jpg">
    <div class="container mx-auto tm-container pt-24 pb-48 sm:py-48">
        <div class="flex flex-col lg:flex-row justify-around items-center lg:items-stretch">

            <div class="flex-1 rounded-xl p-12 pb-14 m-5 bg-black bg-opacity-50 tm-item-container">
                <form action="" method="POST" class="text-lg">
                    <input type="text" name="username" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Username" required="" />
                    <input type="password" name="password" class="input w-full bg-black border-b bg-opacity-0 text-white px-0 py-4 mb-4 tm-border-gold" placeholder="Password" required="" />
                    <input type="checkbox" id="remember_me" name="remember_me"
                           class="form-check-input">
                    <label for="remember_me"
                           class="text-white hover:text-yellow-500 transition" >Remember me
                    </label>
                    <div class="text-right">
                        <button type="submit" class="text-white hover:text-yellow-500 transition">Log In</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


