var weather = [];

var options = {
	enableHighAccuracy : true,
	timeout : 5000,
	maximumAge : 0
};

weather.currentData = function() {
	var options = {
		enableHighAccuracy : true,
		timeout : 5000,
		maximumAge : 0
	};
	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(
						function(position) {
							var address = ""
							if (!position.coords.latitude
									|| position.coords.latitude == "") {
								weather.acceptPinInput();
								address = "http://api.openweathermap.org/data/2.5/weather?zip="
										+ weather.pinCode
										+ ",in&appid=2de143494c0b295cca9337e1e96b00e0";
							} else {
								weather.latitude = position.coords.latitude;
								weather.longtude = position.coords.longtude;
								address = "http://api.openweathermap.org/data/2.5/weather?units=metric&lat="
										+ position.coords.latitude
										+ "&lon="
										+ position.coords.longitude
										+ "&appid=2de143494c0b295cca9337e1e96b00e0";
							}
							$
									.ajax({
										// url :
										// "http://api.openweathermap.org/data/2.5/weather?zip=61701,us&units=metric&appid=2de143494c0b295cca9337e1e96b00e0",
										url : address,
										success : function(result) {
											console.log("result: " + result);

											var current = Math
													.round(result.main.temp);

											$('#current').text(current);
											$('#minimum')
													.text(
															Math
																	.round(result.main.temp_min));
											$('#maximum')
													.text(
															Math
																	.round(result.main.temp_max));
											var city = result.name;
											$("#city").text("Bloomington");
											var status = "";

											var iconImgSrc = "http://openweathermap.org/img/w/"
													+ result.weather[0].icon
													+ ".png";
											$('#weatherIcon').attr("src",
													iconImgSrc);
											var statusImage = "";
											var hours = new Date(
													result.dt * 1000)
													.getHours();
											if (result.weather[0].main == "Mist") {
												$('body')
														.css(
																"background-image",
																"url(https://butchdean.files.wordpress.com/2011/10/272-copy1.jpg)");
												status = "covererd  with fog";
												statusImage = "../resources/images/weather_report/Fog.jpg"
											} else if (result.weather[0].main == "Clouds") {
												$('body')
														.css(
																"background-image",
																"url(http://www.photos-public-domain.com/wp-content/uploads/2012/04/cloudy-overcast-sky.jpg)");
												status = "Cloudy";
												if (hours > 6 && hours <= 18) {
													statusImage = "../resources/images/weather_report/Weather_Icons/Cloudy_sunny_256.png";
												} else {
													statusImage = "../resources/images/weather_report/Weather_Icons/Cloudy_night_256.png";
												}

											} else if (result.weather[0].main == "Sunny"
													|| result.weather[0].main == "Clear") {
												$('body')
														.css(
																"background-image",
																"url(http://phandroid.s3.amazonaws.com/wp-content/uploads/2014/06/bg_weather_sunny_day.jpg)");
												status = "Sunny";

												if (hours > 6 && hours <= 18) {
													statusImage = "../resources/images/weather_report/Weather_Icons/Sunny_256.png";
												} else {
													statusImage = "../resources/images/weather_report/Clear_Night.png";
												}
											} else if (result.weather[0].main == "Rain") {
												$('body')
														.css(
																"background-image",
																"url(http://images4.alphacoders.com/831/83196.jpg)");
												status = "Raining";
												if (hours > 6 && hours <= 18) {
													statusImage = "../resources/images/weather_report/Weather_Icons/Rainy_morning_256.png";
												} else {
													statusImage = "../resources/images/weather_report/Weather_Icons/Rainy_256.png";
												}
											} else if (result.weather[0].main == "Fog"
													|| result.weather[0].main == "Mist") {
												$('body')
														.css(
																"background-image",
																"url(http://www.hdwallpapersnew.net/wp-content/uploads/2014/10/fog-desktop-wallpaper-for-background-wide-free.jpg)");
												status = "Fog";
												statusImage = "../resources/images/weather_report/Fog.png";
											}
											$('#statusImage').attr("src",
													statusImage);
											$('#status').text(status);
										}
									});
						}, function() {
						}, options);
	} else {
		alert("Please enter zip code")
	}

}

weather.fiveDaysData = function() {

	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(function(position) {
					var lattitude = position.coords.latitude;
					var longitude = position.coords.longitude;
					var address = "";
					if (!position.coords.latitude
							|| position.coords.longitude == "") {
						weather.acceptPinInput();
						address = "http://api.openweathermap.org/data/2.5/forecast?zip="
								+ weather.pinCode
								+ ",in&&&units=metric&appid=2de143494c0b295cca9337e1e96b00e0";
					} else {

						address = "http://api.openweathermap.org/data/2.5/forecast?units=metric&lat="
								+ position.coords.latitude
								+ "&lon="
								+ position.coords.longitude
								+ "&appid=2de143494c0b295cca9337e1e96b00e0";
					}

					$
							.ajax({
								url : address,
								success : function(result) {
									console.log(result.list);
									var time1, time2, time3, time4;
									var items = result.list;
									var num = 0;
									for (var i = 0; num <= 4; i++) {
										var item = items[i];
										var timeStamp = item.dt;

										var date = new Date(timeStamp * 1000);

										// Hours part from the timestamp
										var hours = date.getHours();

										if (hours % 6 == 0) {

											var today = new Date();
											var time = "";
											if (date.getDay() != today.getDay()) {
												time = "Tomorrow "
											}
											if (hours == 12) {

												time += "Afternoon";
											} else if (hours == 18) {
												time += "Evening";

											} else if (hours == 6) {
												time += "Morning";
											} else if (hours == 0) {
												time = "Night";
											}

											// Minutes part from the timestamp
											var minutes = "0"
													+ date.getMinutes();
											// Seconds part from the timestamp
											var seconds = "0"
													+ date.getSeconds();
											var icon = item.weather[0].icon;
											$("#iconUrl" + (++num))
													.attr(
															"src",
															"http://openweathermap.org/img/w/"
																	+ item.weather[0].icon
																	+ ".png");
											$("#condition" + num)
													.text(
															capitalizeFirstLetter(item.weather[0].description));
											$("#time" + num).text(time);
											$("#temp" + num).text(
													Math.round(item.main.temp));

										}
									}
								}
							});
				});
	}
}

weather.monthData = function() {

	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(function(position) {
					var lattitude = position.coords.latitude;
					var longitude = position.coords.longitude;

					$
							.ajax({
								url : "http://api.openweathermap.org/data/2.5/forecast/daily?lat="
										+ lattitude
										+ "&lon="
										+ longitude
										+ "&cnt=15&units=metric&mode=json&appid=2de143494c0b295cca9337e1e96b00e0",
								success : function(result) {
									var table = "<table border='1px'><th class='weatherHeader'>Next 15 Days.....</th>";
									var rainCount = 15;
									for (i = 0; i < 15; i++) {
										var item = result.list[i];
										if (i % 5 == 0) {
											table += "<tr class='weatherRow'>";

										}
										if (rainCount == 15
												&& item.weather[0].main == "Rain") {
											rainCount = i;
											
										}
										table += "<td class='weatherData' style='padding:8px;text-align:left'>";
										var date = new Date((item.dt) * 1000);
										var temp = Math.round(item.temp.max)
												+ "";
										date.getMonth();
										table += "<span style='margin-bottonm:5px;'>"
												+ date.getDate()
												+ "</span>  <span class='cityName'>"
												+ temp
												+ "</span><sup style='color:blue'>&#8451;</sup><img src='http://openweathermap.org/img/w/"
												+ item.weather[0].icon
												+ ".png' ></img></td>";

										if (i + 1 % 5 == 0) {
											table += "</tr>";
										}

									}
									table += "</table>";
									$("#monthDataDiv").html(table);
									$("#monthDataDiv>table").addClass(
											"monthDataDiv");
									$("#rainDays").text(rainCount);
								}
							});
				});
	}
}

weather.acceptPinInput = function() {

	var dialog = $("#zipCodeModal").dialog({
		resizable : false,
		height : 300,
		width : 600,
		modal : true
	});
	$('#zipCode').keyup(function() {
		var cs = $(this).val().length;
		if (cs == 6) {

			weather.pinCode = $(this).val()
			$(".ui-icon-closethick").click();
		}
	});

}

function capitalizeFirstLetter(string) {
	return string.charAt(0).toUpperCase() + string.slice(1);
}
