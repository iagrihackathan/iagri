
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<style type="text/css">
.ui-dialog-titlebar, .ui-widget-header {
	background: none !important;
	background-color: #75850D !important;
	background-image: none;
	color: #000;
}

.cityName {
	font-size: x-large;
	color: blue;
}

.status {
	font-size: xx-large;
}

/* For  dtaes*/
.weathersTable {
	border-collapse: collapse;
	width: 100%;
}

.weatherHeader, .weatherData {
	text-align: left;
	padding: 8px;
}

.weatherRow:nth-child(even) {
	background-color: #f2f2f2
}

.weatherRow:nth-child(odd) {
	background-color: #EBF2F1
}

.weatherHeader {
	background-color: #4CAF50;
	color: white;
}

.time, .condition {
	font-weight: bold;
	font-family: serif;
}

.monthDataDiv {
	width: 100%;
	border-collapse: collapse;
	background-color: #9CAB98;
}

body {
	background-repeat: no-repeat;
	background-position: left;
	background-position-y: inherit;
	background-attachment: fixed;
	filter: brightness(50%);
}

#zipCodeModal {
	display: none;
	width: 70%;
	!
	importnat;
}



.notification{
font-family: 'Arial Regular', 'Arial';
	font-weight: 400;
	font-style: normal;
	font-size: 13px;
	color: #333333;
	text-align: center;
	line-height: normal;
	width: 50%;
	height: 60px;
	background-color: #FCE7AC;
    border: 7px solid #095939;
    

}
</style>
<title>IAgri</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript"
	src="/iagri/resources/scripts/weather.ready.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css" />
<link  rel="stylesheet" href="/iagri/resources/css/common.css">
<script>
	$(document).ready(function() {

		weather.currentData();
		weather.fiveDaysData();
		weather.monthData();
	});
</script>
</head>
<body>
	<div id="u8" class="ax_shape">
		<!--         <img id="u8_img" class="img " src="resources/images/weather_report/u8.png"> -->
		<!-- Unnamed () -->
		<table>
			<tr><td style="width:40%;text-align: left" ><div id="u91" class="text">
          <span class="logo">iAgri</span>
         
        </div>
        <div style="font-style: italic; font-weight: bold;color:green"> Decision for Nature</div>
        </td>
				<td style="vertical-align: top; text-align: top;"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u60.png"> <figcaption>
						<span class="class="linkText" ">Weather Report</span></figcaption> </figure></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/farmWiki"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u56.png"> <figcaption>
						<span class="class="linkText" ">Farm Wiki</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/buyorsell"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u64.png"> <figcaption>
						<span class="class="linkText" ">Buy or Sell</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/weather"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u68.png"> <figcaption>
						<span class="class="linkText" ">Policies</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/weather"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u52.png"> <figcaption>
						<span class="class="linkText" ">Advisory Board</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/connect"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u74.png"> <figcaption>
						<span class="class="linkText" ">Connect</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/market"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u50.png"> <figcaption>
						<span class="class="linkText" ">Market Rates</span></figcaption> </figure></a></td>
			</tr>
		</table>

		<!-- Unnamed () -->
		<!--         <div id="u61" class="text" style="top: 30px; transform-origin: 28.5px 0.5px 0px;"> -->
		<!--           <p><span></span></p> -->
	</div>
	<div id="temperature"
		style="float: left; text-align: center; height: 100%; width: 50%; background-position: 100% 100%;">
		<table align="center">
			<tr>
				<td><span id="city" class="cityName"> </span></td>
			</tr>
			<tr>
				<td><span class="status">Currently </span><span id="status"
					class="status"> </span></td>
			</tr>
			<tr>
				<td style=""><span
					style="font-weight: bold; font-size: 100px; color: #1C87E6;"
					id="current"></span><span
					style="font-weight: bold; font-size: 70px; color: #1C87E6;"><sup>&#8451;</sup></span></td>
				<td><img id="weatherIcon" src="" /></td>
			</tr>
			<tr>
				<td><span
					style="font-weight: bold; font-size: 40px; color: #402B03;">Minimum:</span><span
					id="minimum"
					style="font-weight: bold; font-size: 40px; color: #402B03;"></span><sup
					style="font-size: 20px; color: #402B03;">&#8451;</sup></td>
				<td><span
					style="font-weight: bold; font-size: 40px; color: #402B03;">Maximum:</span><span
					id="maximum"
					style="font-weight: bold; font-size: 40px; color: #402B03;"></span><sup
					style="font-size: 20px; color: #402B03;">&#8451;</sup></td>
			<tr>
				</ta
		ble>
	</div>
	<div id="imageDiv"
		style="float: right; height: 100%; width: 50%; background-position: 100% 100%">

		<img alt="" src="" id="statusImage">
	</div>
	<div class="notification">
	<h3 style="font-style: italic;">There is no rain for the next <span id="rainDays"></span> days</h3>
	</div>
	<br />
	<div
		style="float: left; text-align: center; height: 100%; width: 50%; background-position: 100% 100%;">
		<table id="dayForecastTable" class="weathersTable">
			<tr class="weatherRow">
				<th class="weatherHeader">Time</th>
				<th class="weatherHeader">Condition</th>
				<th class="weatherHeader"></th>
				<th class="weatherHeader">Temperature</th>
			</tr>
			<tr class="weatherRow">
				<td class="weatherData"><span class="time" id="time1"></span></td>
				<td class="weatherData"><span class="condition" id="condition1"></span></td>
				<td class="weatherData"><img id="iconUrl1"></img></td>
				<td class="weatherData"><span id="temp1"></span><span>&#8451;</span></td>
				<td></td>

			</tr>



			<tr class="weatherRow">
				<td class="weatherData"><span class="time" id="time2"></span></td>
				<td class="weatherData"><span class="condition" id="condition2"></span></td>
				<td class="weatherData"><img id="iconUrl2"></img></td>
				<td class="weatherData"><span id="temp2"></span><span>&#8451;</span></td>
			</tr>
			<tr class="weatherRow">
				<td class="weatherData"><span class="time" id="time3"></span></td>
				<td class="weatherData"><span class="condition" id="condition3"></span></td>
				<td class="weatherData"><img id="iconUrl3"></img></td>
				<td class="weatherData"><span id="temp3"></span><span>&#8451;</span></td>
				<td></td>
			</tr>
			<tr class="weatherRow">
				<td class="weatherData"><span class="time" id="time4"></span></td>
				<td class="weatherData"><span class="condition" id="condition4"></span></td>
				<td class="weatherData"><img id="iconUrl4"></img></td>
				<td class="weatherData"><span id="temp4"></span><span>&#8451;</span></td>
				<td></td>
			</tr>

		</table>
	</div>
	<div id="monthDataDiv" style="float: right; text-align: center; height: 100%; width: 50%; background-position: 100% 100%;">

	</div>


	<div id="zipCodeModal">
		<table>
			<tr style="width: 60%; text-align: center;">
				<td><h1>Enter Pin code:</h1></td>
				<td><input type="text" id="zipCode" /></td>
		</table>
	</div>

</body>
</html>