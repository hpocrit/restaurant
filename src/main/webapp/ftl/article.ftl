<#include "base.ftl">
<#macro title>${article.title}</#macro>
<#macro content>
    <div id="menu" class="parallax-window" data-parallax="scroll" data-image-src="assets/img/antique-cafe-bg-02.jpg">
        <div class="container mx-auto tm-container py-24 sm:py-48">
            <div class="article">
                <div class="text-center mb-16">
                    <h2 class="bg-white tm-text-brown py-6 px-12 text-4xl font-medium inline-block rounded-md">${article.title}</h2>
                </div>
                <div class="flex flex-col lg:flex-row justify-around items-center">
                    <div class="flex-1 rounded-xl p-12 pb-14 m-5 bg-black bg-opacity-50 tm-item-container">
                        <div class="flex items-start mb-6 tm-menu-item">
                            <img src="${article.imageUrl}" alt="Image" class="rounded-md" style="height: 400px;">
                            <div class="ml-3 sm:ml-6">
                                <h3 class="text-lg sm:text-xl mb-2 sm:mb-3 tm-text-yellow">${article.title}</h3>
                                <div class="text-white text-md sm:text-lg font-light mb-1">S ${article.price_s}</div>
                                <div class="text-white text-md sm:text-lg font-light">L ${article.price_l}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <form action="" method="post">
                    <button type="submit" id="articleLikeButton" href="article?title=${article.title}"
                            class="btn btn-primary" style="background-color: #fc5b5b; border-color: #463811;" <#if isArticleLiked> style="background-color: #fc5b5b;"</#if>>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-heart">
                                <path d="M20 4.58C18.62 3.2 16.76 2.48 14.8 2.97C14.05 3.18 13.35 3.55 12.74 4.04L12 4.74L11.26 4.04C10.65 3.55 9.95 3.17 9.2 2.96C7.24 2.47 5.38 3.19 4 4.57C2.3 6.29 2.3 9.72 4 11.44L12 19.41L20 11.44C21.7 9.72 21.7 6.29 20 4.58z"></path>
                            </svg>
                            <h2 id="likesCount">${article.likes}</h2>

<#--                        <div class="row justify-content-between text-left">-->
<#--                            <div class="form-group col-sm-6 flex-column d-flex">-->
<#--                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"-->
<#--                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"-->
<#--                                class="feather feather-heart">-->
<#--                                <path d="M20 4.58C18.62 3.2 16.76 2.48 14.8 2.97C14.05 3.18 13.35 3.55 12.74 4.04L12 4.74L11.26 4.04C10.65 3.55 9.95 3.17 9.2 2.96C7.24 2.47 5.38 3.19 4 4.57C2.3 6.29 2.3 9.72 4 11.44L12 19.41L20 11.44C21.7 9.72 21.7 6.29 20 4.58z"></path>-->
<#--                                </svg>-->
<#--                            </div>-->
<#--                            <div class="form-group col-sm-6 flex-column d-flex">-->
<#--                                <h2 id="likesCount">${article.likes}</h2>-->
<#--                            </div>-->
<#--                        </div>-->

                    </button>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div id="commentsSection">
                    <#if comments?has_content>
                        <#list comments as comment>
                            <div class="comment"
                                 style="border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
                                <a href="user?userId=${comment.userId}">
                                    <div class="user-avatar" style="display: flex;">
                                        <img src="<#if comment.profilePictureUrl?has_content>${comment.profilePictureUrl}<#else>https://assets.bananastreet.ru/unsafe/2498x2498/https://bananastreet.ru/system/user/avatar/38/382/382231/7e7ab91539.png</#if>"
                                             alt="User Avatar" width="40" height="40" style="vertical-align: middle;" class="rounded-circle">
                                        <span class="user-id font-weight-bold"
                                              style="vertical-align: middle; color: #000;">${comment.username}</span>
                                    </div>
                                </a>
                                <div class="comment-details">
                                    <div class="d-flex justify-content-between text-wrap">
                                        <p class="comment-text text-break text-justify"
                                           style="color: #000;">${comment.text}</p>
                                        <p class="timestamp font-weight-light"
                                           style="font-size: 12px;">${comment.sendingTime?string("dd MMMM yyyy, HH:mm")}</p>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <form action="" method="post">
                    <div class="form-group">
                        <textarea class="form-control" id="comment" name="comment" rows="3"
                                  placeholder="Send your comment :)" style="resize: none"></textarea>
                    </div>

                    <div class="text-center">
                        <button type="submit" id="submit-btn" class="btn btn-primary" style="background-color: #fc5b5b; border-color: #463811">Send</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
    <#if errorMessage??>
        <p>${errorMessage}</p>
    </#if>
</#macro>
