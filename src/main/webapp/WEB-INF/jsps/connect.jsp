<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Connect</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="../resources/resources/css/jquery-ui-themes.css"
	type="text/css" rel="stylesheet" />
<link href="../resources/resources/css/axure_rp_page.css"
	type="text/css" rel="stylesheet" />
<link href="data/styles.css" type="text/css" rel="stylesheet" />
<link href="../resources/files/connect/styles.css" type="text/css"
	rel="stylesheet" />
<script src="../resources/scripts/jquery-1.7.1.min.js"></script>
<script src="../resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
<script src="../resources/scripts/axure/axQuery.js"></script>
<script src="../resources/scripts/axure/globals.js"></script>
<script src="../resources/scripts/axutils.js"></script>
<script src="../resources/scripts/axure/annotation.js"></script>
<script src="../resources/scripts/axure/axQuery.std.js"></script>
<script src="../resources/scripts/axure/doc.js"></script>
<script src="data/document.js"></script>
<script src="../resources/scripts/messagecenter.js"></script>
<script src="../resources/scripts/axure/events.js"></script>
<script src="../resources/scripts/axure/action.js"></script>
<script src="../resources/scripts/axure/expr.js"></script>
<script src="../resources/scripts/axure/geometry.js"></script>
<script src="../resources/scripts/axure/flyout.js"></script>
<script src="../resources/scripts/axure/ie.js"></script>
<script src="../resources/scripts/axure/model.js"></script>
<script src="../resources/scripts/axure/repeater.js"></script>
<script src="../resources/scripts/axure/sto.js"></script>
<script src="../resources/scripts/axure/utils.temp.js"></script>
<script src="../resources/scripts/axure/variables.js"></script>
<script src="../resources/scripts/axure/drag.js"></script>
<script src="../resources/scripts/axure/move.js"></script>
<script src="../resources/scripts/axure/visibility.js"></script>
<script src="../resources/scripts/axure/style.js"></script>
<script src="../resources/scripts/axure/adaptive.js"></script>
<script src="../resources/scripts/axure/tree.js"></script>
<script src="../resources/scripts/axure/init.temp.js"></script>
<script src="files/connect/data.js"></script>
<script src="../resources/scripts/axure/legacy.js"></script>
<script src="../resources/scripts/axure/viewer.js"></script>
<script src="http://connect.facebook.net/en_US/all.js"></script>
<script type="text/javascript">
	$axure.utils.getTransparentGifPath = function() {
		return 'resources/images/transparent.gif';
	};
	$axure.utils.getOtherPath = function() {
		return 'resources/Other.html';
	};
	$axure.utils.getReloadPath = function() {
		return 'resources/reload.html';
	};
</script>
<meta property="og:url"
	content="http://localhost:8080/iagri/home/connect" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Your Website Title" />
<meta property="og:description" content="Your description" />
<meta property="og:image"
	content="http://www.your-domain.com/path/image.jpg"/ >

</head>
<body>

	<div id="fb-root"></div>
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '746390985467104',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.2', // use version 2.2,
				oauth : true,
				frictionlessRequests : true,

				channelUrl : 'http://localhost:8080/iagri/home/connect'
			})
		};

		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				iagriAPI();
			} else if (response.status === 'not_authorized') {

				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
				FB.login();
			}
		}

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		function iagriAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me',
							function(response) {
								console.log('Successful login for: '
										+ response.name);
								var str = "<b>Name</b> : " + response.name
										+ "<br>";
								str += "<b>Link: </b>" + response.link + "<br>";
								str += "<b>Username:</b> " + response.username
										+ "<br>";
								str += "<b>id: </b>" + response.id + "<br>";
								str += "<b>Email:</b> " + response.email
										+ "<br>";
								str += "<input type='button' value='Get Photo' onclick='getPhoto();'/>";
								str += "<input type='button' value='Logout' onclick='Logout();'/>";
								document.getElementById("status").innerHTML = str;

							});
			FB
					.ui(
							{
								method : 'pagetab',
								redirect_uri : 'https://www.facebook.com/iagri.23/?skip_nax_wizard=true'
							}, function(response) {
							});

		}

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/all.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<div id="base" class="">

		<!-- Unnamed (Image) -->
		<div id="u0" class="ax_image">
			<img id="u0_img" class="img "
				src="../resources/images/vendor_info/u0.png" />
			<!-- Unnamed () -->
			<div id="u1" class="text">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (Shape) -->
		<div id="u2" class="ax_shape">
			<img id="u2_img" class="img "
				src="../resources/images/vendor_info/u2.png" />
			<!-- Unnamed () -->
			<div id="u3" class="text">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (Shape) -->
		<div id="u4" class="ax_h1">
			<img id="u4_img" class="img "
				src="../resources/images/transparent.gif" />
			<!-- Unnamed () -->
			<div id="u5" class="text">
				<p>
					<span>iAgri</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (Shape) -->
		<div id="u6" class="ax_shape">
			<div class="fb-page"
				data-href="https://www.facebook.com/iagri.23/?skip_nax_wizard=true"
				data-tabs="timeline" data-width="1500" data-height="1500"
				data-small-header="true" data-adapt-container-width="true"
				data-hide-cover="false" data- show-facepile="true">
				<div class="fb-xfbml-parse-ignore">
					<blockquote
						cite="https://www.facebook.com/iagri.23/?

skip_nax_wizard=true">
						<a href="https://www.facebook.com/iagri.23/?skip_nax_wizard=true">Iagri</a>
					</blockquote>
				</div>
			</div>
			</br>
			</br>
			<div style="inline: block;">
				Coonect with us on facebook:
				<fb:login-button scope="public_profile,email, publish_actions"
					onlogin="checkLoginState();">
				</fb:login-button>
			</div>



			<!-- Unnamed () -->
			<div id="u7" class="text">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (Image) -->
		<div id="u8" class="ax_image">
			<img id="u8_img" class="img "
				src="../resources/images/connect/u8.png" />
			<!-- Unnamed () -->
			<div id="u9" class="text">
				<p>
					<span></span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
