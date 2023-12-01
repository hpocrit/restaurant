<#include "base.ftl">
<#macro title>${user.username}'s profile</#macro>
<#macro content>
    <section class="section about-section" id="about">
        <div class="parallax-window" data-parallax="scroll" data-image-src="assets/img/brown_background.jpg">
            <div class="tab-content nav-link" id="editProfileForm" style="padding: 2rem 1rem;">
                <div class="container-fluid px-1 py-5 mx-auto">
                    <div class="row d-flex justify-content-center">
                        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                            <div class="card">
                                <h3 class="text-center mb-4">${user.username}</h3>
                                <div class="row about-list">
                                    <div class="col-md-6">
                                        <div class="media">
                                            <p class="display-8">First name: ${user.firstName}</p>
                                        </div>
                                        <div class="media">
                                            <p class="display-8">Last name: ${user.lastName}</p>
                                        </div>
                                        <div class="media">
                                            <label></label>
                                            <p class="display-8">Address: ${user.country}, ${user.city}</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="media">
                                            <p class="display-8">Age: ${user.age}</p>
                                        </div>
                                        <div class="media">
                                            <p class="display-8">Email: ${user.mail}</p>
                                        </div>
                                        <div class="media">
                                            <p class="display-8">Gender: <#if user.female>Male<#else>Female</#if></p>
                                        </div>
                                        <form action="" method="post">
                                            <button class="btn btn-primary add-friend-button" data-friend-id="${user.userId}"
                                                    id="add-friend-button" style="background-color: #fc5b5b; border-color: #463811;"
                                                    style="background-color: <#if isFriendAdded>#fc5b5b <#else>#463811</#if>;">
                                                <svg fill="#fff" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                                     xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24"
                                                     viewBox="0 0 45.902 45.902" xml:space="preserve">
                                                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round"
                                                       stroke-linejoin="round"></g>
                                                    <g id="SVGRepo_iconCarrier">
                                                        <g>
                                                            <g>
                                                                <path d="M43.162,26.681c-1.564-1.578-3.631-2.539-5.825-2.742c1.894-1.704,3.089-4.164,3.089-6.912 c0-5.141-4.166-9.307-9.308-9.307c-4.911,0-8.932,3.804-9.281,8.625c4.369,1.89,7.435,6.244,7.435,11.299 c0,1.846-0.42,3.65-1.201,5.287c1.125,0.588,2.162,1.348,3.066,2.26c2.318,2.334,3.635,5.561,3.61,8.851l-0.002,0.067 l-0.002,0.057l-0.082,1.557h11.149l0.092-12.33C45.921,30.878,44.936,28.466,43.162,26.681z"></path>
                                                                <path d="M23.184,34.558c1.893-1.703,3.092-4.164,3.092-6.912c0-5.142-4.168-9.309-9.309-9.309c-5.142,0-9.309,4.167-9.309,9.309 c0,2.743,1.194,5.202,3.084,6.906c-4.84,0.375-8.663,4.383-8.698,9.318l-0.092,1.853h14.153h15.553l0.092-1.714 c0.018-2.514-0.968-4.926-2.741-6.711C27.443,35.719,25.377,34.761,23.184,34.558z"></path>
                                                                <path d="M6.004,11.374v3.458c0,1.432,1.164,2.595,2.597,2.595c1.435,0,2.597-1.163,2.597-2.595v-3.458h3.454 c1.433,0,2.596-1.164,2.596-2.597c0-1.432-1.163-2.596-2.596-2.596h-3.454V2.774c0-1.433-1.162-2.595-2.597-2.595 c-1.433,0-2.597,1.162-2.597,2.595V6.18H2.596C1.161,6.18,0,7.344,0,8.776c0,1.433,1.161,2.597,2.596,2.597H6.004z"></path>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </svg>
                                                <span style="vertical-align: middle;"><#if isFriendAdded>Added to friends<#else>Add friend</#if></span>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        $("#add-friend-button").click(function (event) {
            event.preventDefault()

            $.ajax({
                type: "POST",
                url: "user",
                data: {
                    "friendId": $(this).data("friend-id")
                },
                dataType: "json",
                success: function (resp) {
                    var friendIcon = '<svg fill="#fff" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 45.902 45.902" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><g><g><path d="M43.162,26.681c-1.564-1.578-3.631-2.539-5.825-2.742c1.894-1.704,3.089-4.164,3.089-6.912 c0-5.141-4.166-9.307-9.308-9.307c-4.911,0-8.932,3.804-9.281,8.625c4.369,1.89,7.435,6.244,7.435,11.299 c0,1.846-0.42,3.65-1.201,5.287c1.125,0.588,2.162,1.348,3.066,2.26c2.318,2.334,3.635,5.561,3.61,8.851l-0.002,0.067 l-0.002,0.057l-0.082,1.557h11.149l0.092-12.33C45.921,30.878,44.936,28.466,43.162,26.681z"></path><path d="M23.184,34.558c1.893-1.703,3.092-4.164,3.092-6.912c0-5.142-4.168-9.309-9.309-9.309c-5.142,0-9.309,4.167-9.309,9.309 c0,2.743,1.194,5.202,3.084,6.906c-4.84,0.375-8.663,4.383-8.698,9.318l-0.092,1.853h14.153h15.553l0.092-1.714 c0.018-2.514-0.968-4.926-2.741-6.711C27.443,35.719,25.377,34.761,23.184,34.558z"></path><path d="M6.004,11.374v3.458c0,1.432,1.164,2.595,2.597,2.595c1.435,0,2.597-1.163,2.597-2.595v-3.458h3.454 c1.433,0,2.596-1.164,2.596-2.597c0-1.432-1.163-2.596-2.596-2.596h-3.454V2.774c0-1.433-1.162-2.595-2.597-2.595 c-1.433,0-2.597,1.162-2.597,2.595V6.18H2.596C1.161,6.18,0,7.344,0,8.776c0,1.433,1.161,2.597,2.596,2.597H6.004z"></path></g></g></g></svg>';

                    if (resp === true) {
                        // Если myBooleanParam равен true, меняем цвет кнопки
                        $("#add-friend-button").html(friendIcon + ' Added to friends').css("background-color", "#fc3f00");
                    } else {
                        $("#add-friend-button").html(friendIcon + ' Add friend').css("background-color", "#463811");
                    }
                },
                error: function (error) {
                    // Обработка ошибки (если необходимо)
                    console.error("Error:", error);
                }
            });
        })
    </script>
</#macro>
