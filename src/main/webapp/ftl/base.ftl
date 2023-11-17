<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Antique Bakery Cafe HTML Template by Tooplate</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&family=Oswald:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/all.min.css"> <!-- fontawesome -->
    <!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="assets/css/tailwind.css">
    <link rel="stylesheet" href="assets/css/tooplate-antique-cafe.css">


</head>
<body>
<header>
    <div data-parallax="scroll">
        <nav id="tm-nav" class="fixed w-full">
            <div class="tm-container mx-auto px-2 md:py-6 text-right">
                <button class="md:hidden py-2 px-2" id="menu-toggle"><i class="fas fa-2x fa-bars tm-text-gold"></i></button>
                <ul id="navigation" class="mb-3 md:mb-0 text-2xl font-normal flex justify-end flex-col md:flex-row">
                    <li class="inline-block mb-4 mx-4"><a href="intro" class="tm-text-gold py-1 md:py-3 px-4">Intro</a></li>
                    <li class="inline-block mb-4 mx-4"><a href="menu" class="tm-text-gold py-1 md:py-3 px-4">Menu</a></li>
                    <li class="inline-block mb-4 mx-4"><a href="about" class="tm-text-gold py-1 md:py-3 px-4">About</a></li>
                    <li class="inline-block mb-4 mx-4"><a href="login" class="tm-text-gold py-1 md:py-3 px-4">Login</a></li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/parallax.min.js"></script>
<script src="assets/js/jquery.singlePageNav.min.js"></script>


<script>

    function checkAndShowHideMenu() {
        if(window.innerWidth < 768) {
            $('#tm-nav ul').addClass('hidden');
        } else {
            $('#tm-nav ul').removeClass('hidden');
        }
    }

    $(function(){
        var tmNav = $('#tm-nav');


        checkAndShowHideMenu();
        window.addEventListener('resize', checkAndShowHideMenu);


        $(document).scroll(function() {
            var distanceFromTop = $(document).scrollTop();

            if(distanceFromTop > 100) {
                tmNav.addClass('scroll');
            } else {
                tmNav.removeClass('scroll');
            }
        });


    });
</script>
</body>
</html>