/* custom-css */

/* copbook test stuff */

/* remove "powered by Jive" */

.j-poweredby-activity {
	   display: none;
}

/* remove "Connection" stream */

#j-as-nav-links {
	display: none;
}

/* remove jive announcements from "Overview" page (#j-dynamic-pane is the parent of the alert element there) */

#j-dynamic-pane #jive-alert {
	display: none;
}

#j-dynamic-pane #jive-alert .jive-alert-announcement {
	display: none;
}

.jive-alert-count {
	display: none;
}

/* remove "Get Started" */

.j-onb-nav-link {
	display: none;
}

.jive-icon-getstarted {
	display: none;
}

/* remove "tasks" from Actions */

.j-aq-tasks {
	display: none;
}

/* remove "Follow all 15" button */

.js-follow-these {
	   display: none;
}

/* copbook logo and header */

.jive-body-formpage-login #j-header-wrap {
	background: #000000;
	height: 103px;
	overflow: hidden;	/* Added by HEDLOC */
}

.jive-body-formpage-login p.mission {
	display: inline-block;
	font-size: 1.0em;
	font-style: italic;
	// float:	center;
	color: #FFFFFF;
	position: absolute;
	top: 30px;
	left: 31%;
	width: auto;

}
.jive-body-formpage-login .j-header-cb-image{
	background: url('${themePath}/images/Left-Banner-with-logo.png');
	width: 632px;
	height: 105px;
	background-repeat: no-repeat;
	margin-bottom: -46px;
	display: block;
	position: absolute;
	z-index: 10;
	top: 0px;
	left: 0;
}
.jive-body-formpage-login .j-header-cb-right-image{
	background: url('${themePath}/images/Right-banner-2.png');
	position: absolute;
	right: 0;
	width: 343px;
	height: 105px;
	top: -1px;
}

.jive-body-formpage-login #j-footer-poweredBy{
	margin-right: 10%;
}
.jive-body-formpage-login #j-footer-poweredBy #j-footer-cb{
	background: url('${themePath}/images/Ngage-logo-SMALL.png');
	background-repeat: no-repeat;
	float: right;
	width: 98px;
	height: 28px;
	margin-right: 15px;
}
.jive-body-formpage-login #j-footer-poweredBy p{
	visibility:hidden;
}

.jive-body-formpage-login #j-footer{
	bottom: 10px;
	position: absolute;
	width: 98%;
	height: 59px;
	z-index: 9999;
	min-width: 950px;

}
.jive-body-formpage-login #j-header .j-header-logo{
	display:none;
}

.jive-body-formpage-emailpassword .j-header-cb-image{
	background: url('${themePath}/images/Left-Banner-with-logo.png');
	width: 632px;
	height: 105px;
	background-repeat: no-repeat;
	margin-bottom: -46px;
	display: block;
	position: absolute;
	z-index: 10;
	top: 0px;
	left: 0;
}

.jive-body-formpage-emailpassword .j-header-cb-right-image{
	background: url('${themePath}/images/Right-banner-2.png');
	position: absolute;
	right: 0;
	width: 343px;
	height: 105px;
	top: -1px;
}

.jive-body-formpage-emailpassword  #j-footer-poweredBy{
	margin-right: 10%;
}
.jive-body-formpage-emailpassword #j-footer-poweredBy #j-footer-cb{
	background: url('${themePath}/images/Ngage-logo-SMALL.png');
	background-repeat: no-repeat;
	float: right;
	width: 98px;
	height: 28px;
	margin-right: 15px;
}
.jive-body-formpage-emailpassword #j-footer-poweredBy p{
	visibility:hidden;
}

.jive-body-formpage-emailpassword #j-footer{
	bottom: 10px;
	position: absolute;
	width: 98%;
	height: 59px;
	z-index: 9999;
	min-width: 950px;

}
.jive-body-formpage-emailpassword #j-header .j-header-logo{
	display:none;
}



/* remove mission statement from all pages except the CopBook login page */

.j-body-place p.mission,
.jive-body-formpage-discussion p.mission,
.jive-body-formpage-document p.mission,
.jive-body-formpage-doc-upload p.mission,
.j-body-home p.mission,
.jive-view-profile p.mission,
.j-view-profile p.mission,  
.j-view-profile-nonself p.mission,
.jive-body-content p.mission,
.jive-body-formpage-socialgroup p.mission,
.jive-body-group-manage p.mission,
.jive-body-formpage-place p.mission,
.jive-body-content p.mission,
.j-thread p.mission, 
.jive-body-content-thread p.mission,
.jive-body-search p.mission,
.jive-body-warn p.mission,
.jive-body-unathorized p.mission,
.j-body-preferences p.mission,
.jive-body-profile-edit p.mission,
.jive-body-formpage-changepassword p.mission,
.j-body-yourconnections p.mission,
.j-body-yourplaces p.mission
{
	display: none;
}

.jive-body-formpage-login #j-main {
	margin-top: -15px;
	padding: 0px;
}

/* Conflicts with HEDLOC CSS

#j-header, #j-compact-header {
	background: #000000;
}

#j-header .j-header-logo {
	margin: 5px 0 0 32px;
}

#j-header h1#logo .j-header-logo {
	background: url("${themePath}/images/copbook-logo.png") no-repeat scroll left top transparent !important;
	display: block;
	// font-size: 2.2em;
	height: 40px;
	// line-height: 1em;
	margin-bottom: 5px;
	margin-left: 32px;
	margin-top: 7px;
	overflow: hidden;
	text-indent: -2000px;
	width: 164px;
}

#j-header h1#logo {
   width: 31%;
}

#j-globalNav-bg {
	background: #000000;
	height: 38px;
	padding: 0 20px 0 15px;
	position: relative;
}*/

/* settings for j-box on Copbook login page */

.jive-body-formpage-login .j-box.j-enhanced {
	background: transparent;
	border: none;
	border-radius: none;
	margin-bottom: 30px;
}

#center {
	display: inline-block;
	border-left: 1px solid #DADADA;
	padding-left: 20px;
	width: 67%;
}

#center-welcome-text {
	// position: relative;
	// left: 25px;
}

#center-copbook-text {
	display: inline-block;
	position: relative;
	margin-top: 25px;
	width: 45%;
	margin-right: 40px;
}

#center-copbook-image {
	display: inline-block;
	vertical-align: top;
	width: 48%;
}

#right {
	display: inline-block;
	width: 35%;
}

#right p {
	align: top;
}


.jive-login-reg-formblock #jive-login-formblock {
	border-right: none;
   // margin-right: 20px;
	width: 25%;
}

.jive-login-reg-formblock #jive-login-formblock, .jive-login-reg-formblock #jive-validate-formblock {
	float: left;
	padding: 0 20px 0 18px;
	// width: 300px;
}

.jive-login-short-width #jive-login-formblock .j-form {
	width: 80%;
}

.jive-login-short-width {
   // width: 355px;
}
.jive-login-reg-formblock {
	margin: 30px auto;
	padding: 10px 0;
	width: auto;
}

h1#copbook-welcome {
	font-size: 36px;
}

#sign-up {
	background: url("${themePath}/images/sign_up_now.png");
	display: block;
	float: right;
	height: 35px;
	margin-right: 22%;
	width: 175px;
}

#jive-login-button #sign-up {		/** HEDLOC **/
	margin-right: 10px;
	zoom: 0.85;
}

#buttons {
	position: relative;
	left: 25px;
	width: 100%;
}

.j-body-formpage-login #j-footer {
	display: block;
	width: 100%;
}

#video {
   padding-top: 25px;
   width: auto;
}

#video iframe.redlands-video {
   padding-top: 5px;
}

p.video-title {
	padding-top: 20px;
	color: blue;
	font-style: bold;
	font-size: 11pt;
}

/* hide those stupid fing links in the j-footer */

a.do-not-display {
	display: none;
}

/* fix for "shrinkage" issue in Jive login form */

.jive-login-short-width #jive-login-username input, .jive-login-short-width #jive-login-password input, .jive-login-short-width #jive-password-username input, .jive-login-short-width #jive-password-passwordtoken input, .jive-login-short-width #jive-password-newpassword input, .jive-login-short-width #jive-password-confirmnewpassword input, .jive-login-short-width #jive-login-captcha input, .jive-login-short-width ul li input {
	width: 95%;
}

#jive-nav-link-help {
	display: none;
}

/* "hide" create Documents and create Discussions links from Activity Stream page.  requested by Efiia 1-13-13 */

#j-activity-page #j-as-create-menu-items .js-legacy-create { display: none; }

/* Hide the "Find things to follow" button from connections stream when member has no connections */
.j-js-edit-stream {
	display: none;
}

/* Hide the "Trending Content" element from home page */
#trendy {
	display: none;
}

/* Hide recommended people widget */
#recommended-people-module {
	display: none !important;
}
	
/* Hide tabs within profile page */
#jive-content-tab,
#jive-places-tab,
#jive-tasks-tab,
#jive-bookmarks-tab {
	display: none;
}

/* HEDLOC CSS START */

#jive-nav-link-work,
#jive-nav-link-conx,
#jive-nav-link-places,
.j-nav-create.j-nav-apps,
li.j-nav-create {
	display: none;
}
#jive-nav-link-activity a, #jive-nav-link-activity a span.nav-link {
	height: 34px;
}
#j-header .j-header-logo {
	background:url('<@s.url value="${themePath}/images/Left-Banner.png" />');
	width: 615px;
	margin: 0;
	min-height: 82px;
	background-repeat: no-repeat;
	margin-bottom: -46px;
	height: 105px;
	display: inline-block;
}
#j-header, #j-compact-header {
	/**background: #386e9c;		This one changes? **/
	background-color: #333333;
	padding: 0;
	height: 105px;
}
h1#jive-global-header-title {
	margin: 0;
}
#j-links {
	margin: -50px 0 0;
}
#j-satNav-wrap {
	position: absolute;
	right: 0px;
	top: -1px;
	font-size: 11px;
	background:url('<@s.url value="${themePath}/images/Right-Banner.png" />');
	width: 350px;
	height: 105px;
	margin-top: 1px;
}


#j-satNav-wrap a.j-feedbackNavLink {
	height: 30px;
	font-size: 11px;
	display: inline-block;
	overflow: hidden;
	line-height: 26px;
	padding: 6px 35px 0 0;
	font-weight: 500;
	color: white;
}

#j-header #j-satNav-wrap {
	overflow: hidden;
}
#j-header #j-satNav-wrap > li {
	display: inline;
	zoom: 1;
	top: 66px;
	left: 50px;
	position: relative;
	z-index: 10;
}
#j-globalNav-bg {
	background: transparent;
}
#j-globalNav a {
	display: block;
	padding: 6px 10px 0;
	width: 70px;
}
#jive-nav-link-home a {
	width: 60px;
}
#jive-nav-link-profile a {
	width: 90px;
}
#jive-nav-link-connections a {
	width: 140px;
}
#jive-nav-link-home .j-update-count {
	position: relative;
	top: -38px;
	right: -30px;
	color: white;
	line-height: 18px;
}
#navCreate .j-create-icon {
	display: none;
}
#j-globalNav .j-ui-elem.j-nav-more {
	display: none;
}
.j-globalNav > li.active {
	background-position: none;
}
.j-globalNav li a span.nav-link {
	display: block;
	border: 1px solid #C8C8C8;
	border-radius: 5px;
	padding: 0px 10px;
	line-height: 19px;
	font-weight: normal;
	text-align: center;
}
.j-nav-create .j-globalNavLink span.nav-link {
	height: auto;
	padding: 0 10px;
}
.j-nav-create .j-globalNavLink span.nav-link .j-navLabel {
	padding: 0;
}
#appsQuickLaunchLink {
	background: none;
}
#navCreate {
	background: none;
}
.j-globalNav > li.active {
	background: none;
}
.j-globalNav li:hover a span.nav-link {
	/*background-color: #464646;*/
	font-weight: bold;
	padding: 0;
}
/*.j-globalNav li.active a span.nav-link {
	font-weight: normal;
}*/


.feedback_icon{
	background:url('<@s.url value="${themePath}/images/Feedback-icon.png" />') 0 -2px;
	width: 19px;
	height: 21px;
	display: inline-block;
	vertical-align: middle;
	padding-right: 5px;
	background-repeat: no-repeat;
}

#j-satNav .j-navLabel {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 130px;
	float: left;
}
#j-satNav .jive-avatar {
	float:left;
}
.j-header-company-logo{
	width: 156px;
	position: relative;
	height: 38px;
	margin-top: 20px;
	margin-left: 26px;
}
.j-act-like:not(.sidebar),
.j-act-social-news:not(.sidebar) {
	display: none !important;
}
#j-discovery .j-act-entry {
	padding: 0;
	border: none;
}
#j-discovery .j-act-entry:not(:last-child) {
	padding-bottom: 40px;
}
#j-discovery * ul.j-act-g-list {
	padding: 0;
}
#j-discovery * .j-updated-marker,
#j-discovery * .j-expand-comments {
	display: none;
}
.j-js-footer-wrap {
	margin-top: -16px;
}
.j-updated-marker {
	display: none;
}

body.jive-body-formpage-login.mobile {
	min-width: 0;
	zoom: 1.5;
}
body.jive-body-formpage-login.mobile.hires {
	zoom: 2;
}
body.jive-body-formpage-login.mobile * #loginform {
	width: 100%;
}
body.jive-body-formpage-login.mobile * #j-main {
	width: 330px;
	margin: 0;
}
body.jive-body-formpage-login.mobile * .j-column {
	min-height: 0;
}
body.jive-body-formpage-login.mobile * #jive-login-formblock {
	width: 90%;
}
body.jive-body-formpage-login.mobile * #j-footer {
	min-width: 300px;
	position: relative;
}
body.jive-body-formpage-login.mobile * #j-footer-poweredBy {
	margin-right: 0;
}

#iphone-app-popup-container {
	position: fixed;
	top: 100px;
	left: 35px;
	width: 350px;
	z-index: 9999;
	background: white;
	border-radius: 10px;
	box-shadow: 0px 0px 20px 5px #414141;
}
#iphone-app-popup-container > * {
	margin: 20px;
}
#iphone-app-popup-container header {
	font-size: 20px;
}
#iphone-app-image-container img {
	width: 80px;
	height: 80px;
}
#iphone-app-image-container span {
	display: inline-block;
	vertical-align: top;
	width: 220px;
	margin: 10px 0 0 10px;
}
#iphone-app-button-container input {
	display: inline-block;
	margin-right: 0;
	height: 30px;
}
input#iphone-app-button-download {
	display: block;
	width: 100%;
	margin-bottom: 10px;
	height: 40px;
}
input#iphone-app-button-installed {
	width: 210px;
	margin-right: 10px;
}
input#iphone-app-button-cancel {
	width: 90px;
}

a.j-globalNavLink.j-ui-elem {
	margin-bottom:26px;
}

/* HEDLOC CSS END */