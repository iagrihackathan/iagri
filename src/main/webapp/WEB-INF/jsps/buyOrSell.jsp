<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Buy or Sell</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="../resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="../resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="../resources/css/styles.css" type="text/css" rel="stylesheet"/>
    <link href="../resources/css/styles.css" type="text/css" rel="stylesheet"/>
    <script src="../resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="../resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="../resources/scripts/axure/axQuery.js"></script>
    <script src="../resources/scripts/axure/globals.js"></script>
    <script src="../resources/scripts/axutils.js"></script>
    <script src="../resources/scripts/axure/annotation.js"></script>
    <script src="../resources/scripts/axure/axQuery.std.js"></script>
    <script src="../resources/scripts/axure/doc.js"></script>
    <script src="../resources/scripts/document.js"></script>
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
    <script src="../resources/scripts/data.js"></script>
    <script src="../resources/scripts/axure/legacy.js"></script>
    <script src="../resources/scripts/axure/viewer.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return '../resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return '../resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return '../resources/reload.html'; };
    </script>
    <script type="text/javascript" src="../resources/scripts/jquery-1.11.3.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script type="text/javascript">
	$(document).ready(function(){
		//alert($('#buy').is(':checked')+"jere"); 
		$('#buy').attr('checked','true'); 
		
		 $('input[type=radio][name=buyOrSell]').change(function() {
		        if (this.value == 'Sell') {
		           $('#u49_input').empty();
		           $('#u49_input').append($('<option>', {value:'Select Item', text:'Select Item'}),$('<option>', {value:'Grains', text:'Grains'}),$('<option>', {value:'Pulses', text:'Pulses'}),$('<option>', {value:'Commodities', text:'Commodities'}),$('<option>', {value:'Cereal', text:'Cereal'}));
		        }
		        else if(this.value == 'Buy'){
		        	 $('#u49_input').empty();
		        	  $('#u49_input').append($('<option>', {value:'Select Category', text:'Select Category'}),$('<option>', {value:'Machinery', text:'Machinery'}),$('<option>', {value:'Seeds', text:'Seeds'}),$('<option>', {value:'Fertilisers', text:'Fertilisers'}),$('<option>', {value:'Plants', text:'Plants'}),$('<option>', {value:'Chemicals', text:'Chemicals'}));
		        }
		 });
		 if($('#buy').is(':checked') || $('#Sell').is(':checked'))
		 {
			   // do something
			$('#u49_input').prop('disabled',false);
			}
	$('#submitCommodity').click(function(){
		
		var selectedCommodity =	$( "input:radio[name=buyOrSell]:checked" ).val();
		var selectedType =	$('#u49_input :selected').text();
		
		
		if(selectedType=='Machinery'){
			var page = "http://localhost:8080/Farmers/Vendors.html";

			var $dialog = $('<div></div>')
			               .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
			               .dialog({
			                   autoOpen: false,
			                   modal: true,
			                   height: 300,
			                   width: 700,
			                   title: "Vendors for"+selectedType
			               });
			$dialog.dialog('open');
	
		} 
		else if(selectedType =='Commodities'){
		var page = "http://localhost:8080/iagri/resources/VendorHome.jsp";

		var $dialog = $('<div></div>')
		               .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
		               .dialog({
		                   autoOpen: false,
		                   modal: true,
		                   height: 300,
		                   width: 800,
		                   title: "Vendors for"+selectedCommodity+" of type"+selectedType
		               });
		$dialog.dialog('open');
		}
		else if(selectedType =='Fertilisers'){
			var page = "http://dacnet.nic.in/farmer/new/dac/FertilizerDealersDist.asp?SCod=01&DCod=0107";
			var $dialog = $('<div></div>')
            .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
            .dialog({
                autoOpen: false,
                modal: true,
                height: 400,
                width: 900,
                title: "Vendors for"+selectedCommodity+" of type"+selectedType
            });
			$dialog.dialog('open');
			}
			
			
		else{
			alert("Select a type to buy/sell");
		}
		});
	//}
	});
	</script>
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (Image) -->
      <div id="u0" class="ax_image">
        <img id="u0_img" class="img " src="../resources/images/home/u0.jpg"/>
        <!-- Unnamed () -->
        <div id="u1" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u2" class="ax_shape">
        <img id="u2_img" class="img " src="../resources/images/home/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u4" class="ax_h1">
        <img id="u4_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u5" class="text">
          <p><span>Stay Updated</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u6" class="ax_h1">
        <img id="u6_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u7" class="text">
          <p><span>Trade in or out for the right value...</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u8" class="ax_shape">
        <img id="u8_img" class="img " src="../resources/images/home/u8.png"/>
        <!-- Unnamed () -->
        <div id="u9" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u10" class="ax_h1">
        <img id="u10_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u11" class="text">
          <p><span>News</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u12" class="ax_h1">
        <img id="u12_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u13" class="text">
          <p><span>About Us</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u14" class="ax_h1">
        <img id="u14_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u15" class="text">
          <p><span>Home</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u16" class="ax_h1">
        <img id="u16_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u17" class="text">
          <p><span>Farming</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u18" class="ax_shape">
      
        <img id="u18_img" class="img " src="../resources/images/buy_or_sell/u18.png"/>
        <!-- Unnamed () -->
        <div id="u19" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u20" class="ax_h1">
        <img id="u20_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u21" class="text">
          <p><span>© Copyright iAgri 2015</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u22" class="ax_h1">
        <img id="u22_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u23" class="text">
          <p><span>Share with us</span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u24" class="ax_image">
        <img id="u24_img" class="img " src="../resources/images/buy_or_sell/u24.png"/>
        <!-- Unnamed () -->
        <div id="u25" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u26" class="ax_horizontal_line">
        <img id="u26_start" class="img " src="../resources/images/transparent.gif" alt="u26_start"/>
        <img id="u26_end" class="img " src="../resources/images/transparent.gif" alt="u26_end"/>
        <img id="u26_line" class="img " src="../resources/images/home/u71_line.png" alt="u26_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u27" class="ax_h1">
        <img id="u27_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u28" class="text">
          <p><span>Provide Feedback</span></p>
        </div>
      </div>

      <!-- Unnamed (Vertical Line) -->
      <div id="u29" class="ax_vertical_line">
        <img id="u29_start" class="img " src="../resources/images/transparent.gif" alt="u29_start"/>
        <img id="u29_end" class="img " src="../resources/images/transparent.gif" alt="u29_end"/>
        <img id="u29_line" class="img " src="../resources/images/home/u74_line.png" alt="u29_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u30" class="ax_h1">
        <img id="u30_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u31" class="text">
          <p><span>Contact us</span></p>
        </div>
      </div>

      <!-- Unnamed (Vertical Line) -->
      <div id="u32" class="ax_vertical_line">
        <img id="u32_start" class="img " src="../resources/images/transparent.gif" alt="u32_start"/>
        <img id="u32_end" class="img " src="../resources/images/transparent.gif" alt="u32_end"/>
        <img id="u32_line" class="img " src="../resources/images/home/u74_line.png" alt="u32_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u33" class="ax_h1">
        <img id="u33_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u34" class="text">
          <p><span>iAgri group</span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u35" class="ax_image">
        <img id="u35_img" class="img " src="../resources/images/home/u80.png"/>
        <!-- Unnamed () -->
        <div id="u36" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u37" class="ax_image">
        <img id="u37_img" class="img " src="../resources/images/home/u82.png"/>
        <!-- Unnamed () -->
        <div id="u38" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u39" class="ax_image">
        <img id="u39_img" class="img " src="../resources/images/home/u84.png"/>
        <!-- Unnamed () -->
        <div id="u40" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u41" class="ax_image">
        <img id="u41_img" class="img " src="../resources/images/home/u86.png"/>
        <!-- Unnamed () -->
        <div id="u42" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u43" class="ax_h1">
        <img id="u43_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u44" class="text">
          <p><span>iAgri</span></p>
        </div>
      </div>

      <!-- Unnamed (Hot Spot) -->
      <div id="u45" class="ax_hot_spot">
      </div>
      
      

      <!-- Unnamed (Droplist) -->
      <div id="u46" class="ax_droplist">
        <input type="radio" name="buyOrSell" id ="buy" value="Buy">Buy<br>
		<input type="radio" name="buyOrSell" id="Sell" value="Sell">Sell
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u47" class="ax_h1">
        <img id="u47_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u48" class="text">
          <p><span>Want to Buy or Sell</span></p>
        </div>
      </div>

      <!-- Unnamed (Droplist) -->
      <div id="u49" class="ax_droplist">
        <select id="u49_input">
        <option value="select category" selected>select category</option>
          <option value="Machinery">Machinery</option>
          <option value="seeds">seeds</option>
          <option value="Fertilisers">Fertilisers</option>
          <option value="Plants">Plants</option>
          <option value="Chemicals">Chemicals</option>
        </select>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u50" class="ax_h1">
        <img id="u50_img" class="img " src="../resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u51" class="text">
          <p><span>Purchase category</span></p>
        </div>
      </div>
	
	
	
	
      <!-- Unnamed (Shape) -->
      <div id="u52" class="ax_shape">
        <img id="u52_img" class="img " src="../resources/images/buy_or_sell/u52.png"/>
        <!-- Unnamed () -->
        <div id="u53" class="text">
          <p><button id="submitCommodity">Search</button></p>
        </div>
      </div>
<div id="selectedDetailCotton">
</div>
      <!-- Unnamed (Horizontal Line) -->
      <div id="u54" class="ax_horizontal_line">
        <img id="u54_start" class="img " src="../resources/images/transparent.gif" alt="u54_start"/>
        <img id="u54_end" class="img " src="../resources/images/transparent.gif" alt="u54_end"/>
        <img id="u54_line" class="img " src="../resources/images/buy_or_sell/u54_line.png" alt="u54_line"/>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u55" class="ax_image">
        <img id="u55_img" class="img " src="../resources/images/buy_or_sell/u55.png"/>
        <!-- Unnamed () -->
        <div id="u56" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u57" class="ax_image">
        <img id="u57_img" class="img " src="../resources/images/buy_or_sell/u57.png"/>
        <!-- Unnamed () -->
        <div id="u58" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u59" class="ax_horizontal_line">
        <img id="u59_start" class="img " src="../resources/images/transparent.gif" alt="u59_start"/>
        <img id="u59_end" class="img " src="../resources/images/transparent.gif" alt="u59_end"/>
        <img id="u59_line" class="img " src="../resources/images/buy_or_sell/u59_line.png" alt="u59_line"/>
      </div>
    </div>
    
  </body>
</html>
