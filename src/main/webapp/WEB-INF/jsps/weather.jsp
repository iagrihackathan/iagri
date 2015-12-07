<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style type="text/css">
.cityName{
font-size: x-large;
}
.status{
font-size: xx-large;
}
</style>
<title>IAgri</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
$(document).ready(function(){

	 $.ajax({
		 url: "http://api.openweathermap.org/data/2.5/weather?zip=61701,us&&units=metric&appid=2de143494c0b295cca9337e1e96b00e0",
		 success: function(result){
// 	 alert(result.main.temp);
var current=Math.round(result.main.temp);
// var current_array=current.split(".");
// if(current_array[1]>50){
// 	current=current_array[0]+1;
// }else{
// 	current=current_array[0];
// }
	      $('#current').text(current);
	      $('#minimum').text(Math.round(result.main.temp_min));
	      $('#maximum').text(Math.round(result.main.temp_max));
	      var city=result.name;
	      $("#city").text(city);
	      var status="";
// 	      alert(result.weather[0].main=="Clouds");
	      if(result.weather[0].main=="Mist"){
	    	  $('#temperature').css("background-image", "url(https://butchdean.files.wordpress.com/2011/10/272-copy1.jpg)"); 
	    	  status="covererd  with fog";
	    	  
	      }
	      else if(result.weather[0].main=="Clouds"){
		    	  $('#temperature').css("background-image", "url(http://www.photos-public-domain.com/wp-content/uploads/2012/04/cloudy-overcast-sky.jpg)"); 
		    	  status="Cloudy";   
	      }else if(result.weather[0].main=="Sunny"){
	    	  $('#temperature').css("background-image", "url(http://phandroid.s3.amazonaws.com/wp-content/uploads/2014/06/bg_weather_sunny_day.jpg)"); 
	    	  status="Sunny";  
	      }else if(result.weather[0].main=="Rain"){
	    	  $('#temperature').css("background-image", "url(http://images4.alphacoders.com/831/83196.jpg)"); 
	    	  status="Raining";  
	      }
	      
	      $('#status').text(status);
		 }});
});
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div   id="temperature"  style="text-align: center; height: 100%;width: 100%; background-position: 100% 100%; ">
	<table align="center">
	<tr><td> <span id="city" class="cityName"> </span> </td><td></td></tr>
	<tr><td><span class="status">Currently </span><span id="status" class="status"> </span> </td><td></td></tr>
	<tr>
	<td style=" "><span style="font-weight: bold;font-size: 100px;" id="current"></span><span style="font-weight: bold;font-size: 50px;">&#8451;</span></td><td></td>
	</tr>
	<tr>
	<td>Minimum:<span id="minimum" style="font-weight: bold;font-size: 20px;"></span>&#8451; </td><td >Maximum:<span id="maximum" style="font-weight: bold;font-size: 20px;"></span>&#8451; </td>
	<tr>
	</table>
	</div>

	
</body>
</html>