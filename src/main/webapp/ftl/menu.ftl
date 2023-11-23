<#include "base.ftl">
<#macro title>Menu</#macro>

<#macro content>

    <div id="menu" class="parallax-window" data-parallax="scroll" data-image-src="assets/img/antique-cafe-bg-02.jpg">
        <div class="container mx-auto tm-container py-24 sm:py-48">
            <div class="text-center mb-16">
                <h2 class="bg-white tm-text-brown py-6 px-12 text-4xl font-medium inline-block rounded-md">Our Cafe Menu</h2>
            </div>
            <div class="flex flex-col lg:flex-row justify-around items-center">
                <div class="flex-1 rounded-xl p-12 pb-14 m-5 bg-black bg-opacity-50 tm-item-container">
                    <#list all_news as article>
                        <div class="flex items-start mb-6 tm-menu-item">
                            <img src="${article.imageUrl}" alt="Image" class="rounded-md" style="height: 200px;weight: 350px">
                            <div class="ml-3 sm:ml-6">
                                <a href="article?title=${article.title}" class="text-decoration-none">
                                    <h2 class="card-title h4" style="color: #000; transition: all .2s ease-out 0s;"
                                        onmouseover="this.style.color='#fc3f00';"
                                        onmouseout="this.style.color='#000';">${article.title}</h2>
                                    <div class="text-white text-md sm:text-lg font-light mb-1">S ${article.price_s}</div>
                                    <div class="text-white text-md sm:text-lg font-light">L ${article.price_l}</div>
                                </a>
                            </div>
                        </div>
                    </#list>

                </div>
            </div>



        </div>
    </div>


</#macro>

