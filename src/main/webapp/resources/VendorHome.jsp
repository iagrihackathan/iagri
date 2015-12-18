<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Vendors</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function(){
	//$("#commodityDiv,#cityDiv,#commodityPricing").hide();
	$('#buyORSelldetail').text("");
	
	$("#commodityVendor").click(function(){
		 $( "#commodityDiv" ).dialog();
	});
	$("#cancelCommodity").click(function(){
		 $("#CommoditySelectList").val('select commodity');
		 $('#zipCode').val("");
		 $('#CommodityQuantity').val('select Quantity');
		 $('#buyORSelldetail').text("");
		 
				    
	});
	$("#cityVendor").click(function(){
		 $( "#cityDiv" ).dialog();
	});
	$("#cancelCity").click(function(){
		$('#cityDiv').dialog('close');
	    return false;
	});
	$("#pricingVendor").click(function(){
		$("#commodityPricing").dialog();
	});
	$("#cancelPrice").click(function(){
		$('#commodityPricing').dialog('close');
	    return false;
	});
	 
	$('#submitCommodity').click(function(){
		
		var selectedType =	$('#CommoditySelectList :selected').text();
		var selectedQuantity =	$('#CommodityQuantity :selected').text();
		if($('#zipCode').val()=='61701' && selectedType!=='select commodity' && selectedQuantity !== 'select Quantity'){
		
		$('#buyORSelldetail').append("<table border="+"1"+" align="+"center"+">	<tr><th>Vendor</th><th>Web site</th><th>Contact</th><th>Action</th></tr><tr><td>Machinery Vendors</td><td>www.modernvendors.com</td><td>1233444</td><td><a href="+"#"+">Visit</a></td></tr>				<tr><td>Agri Machine Vendors</td><td>ww.agriVendors.com</td><td>45345734</td><td><a href="+"#"+">Visit</a></td></tr>				</table>");
		/* var page = "http://downtownbloomington.org/farmers-market/information-for-vendors/";

	var $dialog = $('<div></div>')
	               .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
	               .dialog({
	                   autoOpen: false,
	                   modal: true,
	                   height: 625,
	                   width: 500,
	                   title: "Vendors for Rice"
	               });
	$dialog.dialog('open'); */
		}
		else{
			alert('Enter all the required values');
		}
	});
	
	$('#submitCity').click(function(){	
		
	var selectedCity =	$('#CommoditySelectCityList :selected').text()
	
	
	$('#selectedDetailWheat').dialog({
        modal: true,
        open: function ()
        {
            $(this).load('VendorsCommodities.html');
        },         
        height: 200,
        width: 500,
        title: 'Vendor Info '+selectedCity   
    });});
});

</script>
</head>
<body  bgcolor="#E6E6FA">

 <p> Welcome to BUY OR SELL ,
 
 			This page enables or provides users with the useful information related to buying or selling of agricultural needs.</p>
<table align="center"><th>Vendors Info</th>

<!-- <tr><td><img src="plus2.jpg" id="commodityVendor"></td><td>Vendor based on commodity -->

<div id="commodityDiv">

<tr><td>	<select id="CommoditySelectList" >
	<option value="select commodity" selected>select commodity</option>
	<option value="rice">Rice</option>
	<option value="wheat">wheat</option>
	<option value="cotton">cotton</option>
	</select>
	<br></td><td>
		<select id="CommodityQuantity" >
	<option value="select Quantity" selected>select Quantity</option>
	<option value="1">1   </option>
	<option value="2">2   </option>
	<option value="3">3   </option>
	</select></td>
	<td>Enter ZIP</td><td><input type="text" id="zipCode"></td></tr>
	<tr><td><button id="submitCommodity">select</button>
	<button id="cancelCommodity">Cancel</button></td></tr>
</div></td></tr>
<tr><td>
<div id="selectedDetailRice">
</div>
<div id="selectedDetailRice1">
</div>
<div id="selectedDetailWheat">
</div>
<div id="selectedDetailCotton">
</div></td></tr>
<!-- <tr><td><img src="plus2.jpg" id="cityVendor"></td><td>Vendor based on city
<div id="cityDiv">
	<select id="CommoditySelectCityList">
	<option value="select city" selected>select city</option>
	<option value="Bloomington">Bloomington</option>
	<option value="clinton">clinton</option>
	<option value="alton">alton</option>
	</select>
	<button id="submitCity">select</button>
	
</div></td></tr> -->
</table>
<br><br>
<div id="buyORSelldetail"></div>
</body>
</html>