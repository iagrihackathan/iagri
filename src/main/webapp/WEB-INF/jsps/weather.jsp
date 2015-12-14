
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style type="text/css">
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
	background-position: center;
	background-position-y: inherit;
	background-attachment: fixed;
}
</style>
<title>IAgri</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="/iagri/resources/scripts/weather.ready.js"></script>

<script>
	$(document).ready(function() {
		var options = {
			enableHighAccuracy : true,
			timeout : 5000,
			maximumAge : 0
		};
		var lattitude = "";
		var longitude = "";
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				lattitude = position.coords.latitude;
				longitude = position.coords.longitude;
				console.log(lattitude);
				console.log(longitude);
			});
		}

		// 		weather.getLocation();
		weather.currentData();
		weather.fiveDaysData();
		weather.monthData();
	});
</script>
</head>
<body>
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
					style="font-weight: bold; font-size: 40px; color: #ff0000;">Minimum:</span><span
					id="minimum"
					style="font-weight: bold; font-size: 40px; color: #ff0000;"></span><sup
					style="font-size: 20px; color: #ff0000;">&#8451;</sup></td>
				<td><span
					style="font-weight: bold; font-size: 40px; color: #ff0000;">Maximum:</span><span
					id="maximum"
					style="font-weight: bold; font-size: 40px; color: #ff0000;"></span><sup
					style="font-size: 20px; color: #ff0000;">&#8451;</sup></td>
			<tr>
		</table>
	</div>
	<div id="imageDiv" style="float: right; height: 100%;width:50%;background-position: 100% 100%">
	
	<img alt="" src="" id="statusImage">
	</div>

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
	<div id="monthDataDiv"
		style="float: right; text-align: center; height: 100%; width: 50%; background-position: 100% 100%;">

	</div>

</body>
</html>