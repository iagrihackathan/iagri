<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
      <title>Market Prices</title>
      
      <script type = "text/javascript" 
         src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link  rel="stylesheet" href="/iagri/resources/css/common.css">
      
   </head>
	
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
				<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/weather"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u60.png"> <figcaption>
						<span class="class="linkText" ">Weather Report</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/farmWiki"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u56.png"> <figcaption>
						<span class="class="linkText" ">Farm Wiki</span></figcaption> </figure></a></td>
						<td style="vertical-align: top; text-align: top;"><a
					href="/iagri/home/weather"> <figure> <img id="u60_img"
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
						<td style="vertical-align: top; text-align: top;"><figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u50.png"> <figcaption>
						<span class="class="linkText" ">Market Rates</span></figcaption> </figure></td>
			</tr>
		</table>

		<!-- Unnamed () -->
		<!--         <div id="u61" class="text" style="top: 30px; transform-origin: 28.5px 0.5px 0px;"> -->
		<!--           <p><span></span></p> -->
	</div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type = "text/javascript" language = "javascript">

var findCommoditiesString = "http://api.dataweave.in/v1/commodities/findByCommodity/?api_key=21e24b303666da082362e703d9b1962813a8fd7f";
        $(document).ready(function() {
        	$("#displayTable").hide();
              $.getJSON('http://api.dataweave.in/v1/commodities/listAllCommodities/?api_key=21e24b303666da082362e703d9b1962813a8fd7f', function(commodities) {
                 
            	  $.each(commodities.data, function (index, item) {
            	        $('#dropDownList').append(
            	             $('<option></option>').val(item).html(item)
            	          );
            	     });
            	  $("#dropDownList").change(function () {
                       var selectedText =$(this).find("option:selected").text();
                       var selectedValue =$(this).val();
                     findCommoditiesStringWithCommodity =  findCommoditiesString.concat("&commodity="+selectedValue);
                  
            	   });
            	  
           	  	$('#clickButton').on('click', function() {
           	  	var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1;

                var yyyy = today.getFullYear();
                if(dd<10){
                    dd='0'+dd
                } 
                if(mm<10){
                    mm='0'+mm
                } 
                var today = yyyy.toString().concat(mm.toString()).concat(dd.toString());
                findCommoditiesStringWithStartDate = findCommoditiesStringWithCommodity.concat("&start_date=").concat(today);
                findCommoditiesStringWithEndDate = findCommoditiesStringWithStartDate.concat("&end_date=").concat(today).concat("&page=1&per_page=10");
           	  	
           	  	$.getJSON(findCommoditiesStringWithEndDate, function(output) {
           	  	 if (output.status_code==200) {
                $.each(output.data,function(key,val){
                	var tr = $('<tr></tr>');
                	$.each(val,function(k,v){
                		$('<td>'+v+'</td>').appendTo(tr);
                	});
                	tr.appendTo('#displayTable');
                	});
                removeDuplicateRows($('#displayTable'));
                $("#displayTable").show();
                submitDetailsForm();
               	 }
           	  	}); 
           	  	});
       	  	});
          });
      
        function submitDetailsForm() {
            $("#marketsForm").submit();
            
         }     
        function removeDuplicateRows($table){
            function getVisibleRowText($row){
                return $row.find('td:visible').text().toLowerCase();
            }

            $table.find('tr').each(function(index, row){
                var $row = $(row);
                $row.nextAll('tr').each(function(index, next){
                    var $next = $(next);
                    if(getVisibleRowText($next) == getVisibleRowText($row))
                        $next.remove();
                })
            });
        }

        
      </script>
<form id="marketsForm">

<h1>Market Rates</h1><br/>
Commodities:<select id='dropDownList' name='Commodities' >
<option> Choose a Commodity </option>
</select>

<p><input type="button" id="clickButton" name="submit" value="submit"></p>
<div>
<table id="displayTable" align = center border='1' width='600' cellpadding='2' cellspacing='1'>
<tr>
<th>date</th>
<th>commodity</th>
<th>state</th>
<th>market</th>
<th>Arrivals_Tonnes</th>
<th>origin</th>
<th>variety</th>
<th>Minimum_Price</th>
<th>Maximum_Price</th>
<th>Modal_Price</th>
<th>unit</th>
</tr>
</table>
</div>
</form>

</body>
</html>
