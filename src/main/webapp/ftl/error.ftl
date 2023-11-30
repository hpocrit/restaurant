<#include "base.ftl">
<#macro title>Exception details</#macro>
<#macro content>
    <div class="parallax-window" data-parallax="scroll">
        <div class="container mx-auto px-2 tm-intro-width">
            <div class="sm:pb-60 sm:pt-48 py-20">
                <div class="bg-black bg-opacity-70 p-12 mb-5 text-center">
                    <h3>Exception details</h3>

                    <strong>Request uri: </strong> ${uri} <br>
                    <strong>Status code: </strong> ${statusCode} <br>
                    <#if message??> <strong>Message: </strong> ${message} <br> </#if>
                </div>
            </div>
        </div>
    </div>
</#macro>
