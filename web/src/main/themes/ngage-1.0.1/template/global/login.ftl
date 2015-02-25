<html>
<head>
    <title><@s.text name="login.user_login.title"/></title>
    <meta name="nouserbar" content="true"/>
    <meta name="nofooter" content="true"/>

    <#if externalLoginEnabled>
        <link rel="stylesheet" type="text/css" href="<@s.url value="/styles/jive-external-login.css" />" />
        <script type="text/javascript">
            jive.i18n.addMsgs({
                'sso.openid.invalid_url': '<@s.text name="sso.openid.invalid_url"/>',
                'sso.openid.implicit_upgrade': '<@s.text name="sso.openid.implicit_upgrade"/>',
                'sso.openid.implicit_downgrade': '<@s.text name="sso.openid.implicit_downgrade"/>'
            });
        </script>
        <@resource.javascript file="/resources/scripts/sso/external-login.js" />

        <#if facebookEnabled>
            <script src="https://connect.facebook.net/${locale}/all.js"></script>
            <script type="text/javascript">
                var appId = '${facebookApplicationID}';
            </script>
        </#if>
    </#if>

    <#-- The approved email domain list tooltip uses this -->
    <@resource.javascript file="/resources/scripts/jquery/jquery.tooltip.js" />

    <style type="text/css">
        a.tooltip {
            text-decoration: none;
            border-bottom: dotted 1px;
            font-size: 11px;
        }
        #tooltip {
            position:absolute;
            border:1px solid #dadada;
            background:#ffc;
            padding:8px 12px;
            color:#333;
            display:none;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            z-index: 99;
            width: 180px;
            text-align: left;
            font-size: 11px;
        }
    </style>
</head>
<body class="jive-body-formpage jive-body-formpage-login">

    <script type="text/javascript">
        $j(function () {

            $j("input#login-submit").prop('disabled', false);
            $j("form#loginform").submit( function() {
                $j("input#login-submit").val("<@s.text name="login.processing.text"/>");
                $j("input#login-submit").prop('disabled', true);
            });
            $j("input#register-submit").prop('disabled', false);
            $j("form#registerform").submit( function() {
                $j("input#register-submit").val("<@s.text name="login.processing.text"/>");
                $j("input#register-submit").prop('disabled', true);
            });
        });

    </script>

    <!-- BEGIN layout -->
    <div class="j-layout j-layout-l clearfix">

        <!-- BEGIN large column -->
        <div class="j-column-wrap-l">
            <div class="j-column j-column-l">

            <#assign showRegisterForm = (newAccountCreationEnabled && !jive.isSeatStatusBlocked())/>
            <#if showRegisterForm || externalLoginEnabled>
                <#if customIntro??>
                ${customIntro}
                <#else>
                <section id="j-login-intro">
                    <h2><@s.text name="login.intro.header"/></h2>
                    <p><@s.text name="login.intro.text"/></p>
                </section>
                </#if>
            </#if>

            <!-- BEGIN login form -->

            <div class="j-box j-enhanced jive-box jive-box-form jive-standard-formblock-container jive-login-reg-formblock clearfix <#if (!showRegisterForm || registerOnly) && (!externalLoginEnabled)>jive-login-short-width</#if>">
                <#include "/template/global/include/form-message.ftl" />
                <div class="jive-box-body jive-standard-formblock clearfix">

                    <#if approvalRequired>
                    <div class="jive-info-box" aria-live="polite" aria-atomic="true">
                        <div>
                            <span class="jive-icon-med jive-icon-redalert"></span>
                            <@s.text name="login.info.acctNotApproved.text" />
                        </div>
                    </div>
                    </#if>

                    <#if accountExists>
                    <div class="jive-info-box" aria-live="polite" aria-atomic="true">
                        <div>
                            <span class="jive-icon-med jive-icon-redalert"></span>
                            <@s.text name="login.info.acctAlreadyExists.text" />
                        </div>
                    </div>
                    </#if>

                    <#if !registerOnly>
                    <div id="jive-login-formblock" <#if (!showRegisterForm) && (!externalLoginEnabled)>class="jive-login-only-box"</#if>>

                        <h1><@s.text name="login.user_login.title"/></h1>
                        <p><@s.text name="login.description.text"/></p>

                        <#if JiveGlobals.getJiveBooleanProperty("jive.auth.forceSecure", false)>
                        <#assign loginURI><@s.url value="/cs_login" scheme="https"/></#assign>
                        <#else>
                        <#assign loginURI><@s.url value="/cs_login"/></#assign>
                        </#if>

                        <form action="${loginURI}" id="loginform" method="post" class="j-form" name="loginform01" autocomplete="off">
                            
                            <#if (successURL?exists)>
                            <input type="hidden" name="successURL" value="${successURL?html}"/>
                            </#if>
                            <#if (cancelURL?exists)>
                            <input type="hidden" name="cancelURL" value="${cancelURL?html}"/>
                            </#if>

                            <#-- Username -->
                            <div id="jive-login-username" class="clearfix">
                                <#if usernameIsEmail>
                                    <label for="username01" class="font-color-meta"><@s.text name="global.email_address"/></label>
                                <#else>
                                    <label for="username01" class="font-color-meta"><@s.text name="global.username"/></label>
                                </#if>
                                <input type="text" name="username" size="30" maxlength="150" value="" id="username01"/>
                                <@macroFieldErrors name="username"/>
                            </div>

                            <#-- Password: -->
                            <div id="jive-login-password" class="clearfix">
                                <label for="password01" class="font-color-meta"><@s.text name="global.password"/></label>
                                <input type="password" name="password" size="30" maxlength="150" value="" id="password01" autocomplete="off" />
                                <@macroFieldErrors name="password"/>
                            </div>

                            <#if captchaImageUrl?has_content>
                            <#-- Captcha: -->
                            <div id="jive-login-captcha" class="clearfix">
                                <img src="${captchaImageUrl}" alt="">
                                <label for="user_guess" class="font-color-meta"><@s.text name="login.captcha.text" /></label>
                                <input type="text" name="user_guess" size="30" maxlength="150" value="" id="user_guess">
                                <@macroFieldErrors name="password"/>
                            </div>
                            </#if>

                            <#-- Remember Me -->
                            <#if action.isRememberMeEnabled() >
                            <div id="jive-login-rememberme" class="clearfix">
                                <input type="checkbox" name="autoLogin" id="autoLoginCb" value="true"/>
                                <label for="autoLoginCb"><@s.text name="global.remember_me"/></label>
                            </div>
                            </#if>

                            <div id="jive-login-button" class="clearfix">
                                <#-- Login -->
                                <input type="submit" name="login" id="login-submit"
                                       class="jive-form-button-submit j-btn-callout" <#if action.isLoginThrottled()>
                                       disabled='disabled' </#if> value="<@s.text name="global.login" />"/>
                            </div>

                            <#if (JiveGlobals.getJiveBooleanProperty("passwordReset.enabled", true))>
                                <#-- I forgot my password -->
                                <div id="jive-login-forgotpwd" class="jive-login-forgotpwd">
                                    <a href="<@s.url action='emailPasswordToken' method='input'/>"><@s.text name="login.forgot_pwd.link"/></a>
                                </div>
                            </#if>
                            <#if (JiveGlobals.getJiveBooleanProperty("forgot.username.enabled", true))>
                                <#-- I forgot my username -->
                                <div id="jive-login-forgot-username" class="jive-login-forgot-username">
                                    <a href="<@s.url action='forgot-username' method='input'/>"><@s.text name="login.forgot_username.link"/></a>
                                </div>
                            </#if>

                        </form>
                        
                    </div>
                    </#if>
 <!-- adding a new div (styled in custom-css.ftl) to display an 
                         some text and an image to the right of login form box -->

                    <div id="center" style="display: inline-block;">
                        
                        <div id="center-welcome-text">
                            <h1 id="copbook-welcome">Welcome to N-gage</h1>
                        </div>
                        
                        <div id="center-copbook-text">
                            
                            <span style="color: #000000; font-size: 1.0em;">
                                N-gage is a secure, invitation-only collaboration tool for law enforcement organizations throughout the US and Canada.  Access is restricted to those agencies approved by Nlets.  Each Ngage user manages access to the information they share, along with their sponsoring organization.&nbsp;&nbsp;
                                <!--
                                <br />
                                <br />CopBook provides users in the field and at headquarters access to mission critical information in a timely manner, enabling distributed real-time information sharing.
                                -->
                                <br />
                                <br />
                                N-gage is accessible using any smartphone, tablet, or desktop computing device, using a familiar interface, reducing the overhead associated with training and adoption.
                                <br />
                                <br />
                                N-gage is used to improve coordination within law enforcement organizations, as well as across agencies - connecting users spanning geographies and disciplines.
                                <br />
                                <br />
                                For more information please contact <a href="mailto:support@nlets.org">support@nlets.org</a>
                            </span>
                        </div>
                        
                        <div id="center-copbook-image">
                            <img alt="${themePath}/images/Mobile-devices.png" class="jive-image" src="${themePath}/images/Mobile-devices.png" style="display: block; float: right; padding: 15px 0px 5px 0px;margin-right: 40px;width=277px; height=322px;" margin-right: 2%; />
<!--                            <input id="sign-up" type="button" onClick="window.location='https://register.copbook.com';"/> -->
                        </div>
                        
                   <!-- Removed Account creation form -->

                    <#if externalLoginEnabled>
                        <div class="j-login-ext-login <#if (!showRegisterForm || registerOnly)>j-login-ext-login-noreg</#if>">
                            <h3><@s.text name="sso.external-login.login" />:</h3>
                            <form id="external-login-choice" method="post" action="<@s.url value="/openid/sso" />" class="j-form">
                                <p class="font-color-meta"><@s.text name="sso.external-login.provider" /></p>

                                <div class="openid_provider_btns clearfix">
                                    <#list externalLogins as extLogin>
                                        <a href="${extLogin.URL}" class="${extLogin.name} ext_login_large_btn"></a>
                                    </#list>
                                </div>

                                <div class="js-openid-login-row">
                                    <div class="j-form-row js-openid-url-row">
                                        <label for="openid_url"><@s.text name="sso.openid.url" /></label>
                                        <input type="text" disabled="disabled" id="openid_url" />
                                    </div>
                                    <div class="j-form-row">
                                        <label for="openid_username" id="openid_username_label"><@s.text name="global.username" /></label>
                                        <input id="openid_username" type="text" />
                                    </div>
                                    <div class="j-form-row">
                                        <input type="submit" class="jive-form-button-submit j-btn-callout" value="<@s.text name="global.login" />" />
                                        <input type="submit" class="cancel" value="<@s.text name="global.cancel" />" />
                                    </div>
                                </div>

                                <input type="hidden" id="openid_identifier" name="openid_identifier" />
                            </form>
                        </div>
                    </#if>

                    <script type="text/javascript" language="JavaScript">
                        $j('#username01').focus();
                        <#if action.isLoginThrottled()>
                        var delay = ${loginDelay};
                        setTimeout(function() {
                            $j('#jive-error-box').fadeOut("fast");
                            $j('#login01').prop('disabled', false);
                        }, delay * 1000);
                        </#if>
                    </script>

                </div>
            </div>
            <!-- END login form -->


            </div>
        </div>
        <!-- END large column -->

    </div>
    <!-- END layout -->


</body>
</html>
