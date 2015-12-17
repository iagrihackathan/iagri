<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../resources/files/farm_wiki/assets/css/main.css" />
		<link  rel="stylesheet" href="/iagri/resources/css/common.css">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.js"></script> 
		<script src="https://www.google.com/jsapi?key=AIzaSyBH4jbwqz7nejofqUVmRuOIM7r_vlLjws8"></script>
	<!-- Scripts for Google Transliteration -->	
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> 
	<script type="text/javascript">
	google.load("elements", "1", {packages: "transliteration"});
	</script> 
	<script>
	function OnLoad() {
	var currValue = document.getElementById("text1");	 
	var options = {
	sourceLanguage:
	google.elements.transliteration.LanguageCode.ENGLISH,
	destinationLanguage:
	['ta','te','hi'],
	shortcutKey: 'ctrl+g',
	transliterationEnabled: true
	};
	var control = new
	google.elements.transliteration.TransliterationControl(options);
	control.makeTransliteratable(["text1"]);
	control.showControl('translControl');
	}
	google.setOnLoadCallback(OnLoad);
	</script> 
	<!-- Scripts for input changes -->
	<script type="text/javascript">  	 
		$(document).ready(function(){
		$("#languageselect").change(function(){
		var keyword = $('input:radio[name=topicname]:checked').val();
		articleContent(keyword);
		});	
		});     
	</script>
	<script type="text/javascript">  	 
		$(document).ready(function(){
		$("#radioSelection input[name='topicname']").click(function(){
		var keyword = $('input:radio[name=topicname]:checked').val();
		articleContent(keyword);
		});	
		});     
	</script>	
	<script type="text/javascript">  	 
		$(document).ready(function(){
		var keyword = "Agriculture$வேளாண்மை$వ్యవసాయం$कृषि";
		articleContent(keyword);		
		});	     
	</script>
	<script>  	 
		function searchKeyword(){
		var keyword = document.getElementById("text1");
		searchArticleContent(keyword.value);		
		}	     
	</script>

	<!-- Wikipedia API Call -->
	<script type="text/javascript"> 
	function articleContent(keyword){
		var searchKeyword = keyword.split("$");
		var wikiUrl;
		if($("#languageselect").val() == "en"){
		wikiUrl = "http://en.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + searchKeyword[0] + "&callback=?";
		}else if($("#languageselect").val() == "ta"){
		wikiUrl = "http://ta.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + searchKeyword[1] + "&callback=?";
		}else if($("#languageselect").val() == "te"){
		wikiUrl = "http://te.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + searchKeyword[2] + "&callback=?";
		}else if($("#languageselect").val() == "hi"){
		wikiUrl = "http://hi.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + searchKeyword[3] + "&callback=?";
		}
		$.ajax({		
			type: "GET",
			url: wikiUrl,
			contentType: "application/json; charset=utf-8",
			async: false,
			dataType: "json",
			success: function (data, textStatus, jqXHR) {			
			var markup = data.parse.text["*"];
			var i = $('<div></div>').html(markup);			
			// remove links as they will not work
			i.find('a').each(function() { $(this).replaceWith($(this).html()); });			
			// remove any references
			i.find('sup').remove();			
			// remove cite error
			i.find('.mw-ext-cite-error').remove();			
			$('#article').html($(i).find('p'));					
			},
			error: function (errorMessage) {
			}
		}); 
	}
	</script>
		<script type="text/javascript"> 
	function searchArticleContent(keyword){
		var wikiUrl;
		if($("#languageselect").val() == "en"){
		wikiUrl = "http://ta.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + keyword + "&callback=?";
		}else if($("#languageselect").val() == "ta"){
		wikiUrl = "http://ta.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + keyword + "&callback=?";
		}else if($("#languageselect").val() == "te"){
		wikiUrl = "http://te.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + keyword + "&callback=?";
		}else if($("#languageselect").val() == "hi"){
		wikiUrl = "http://hi.wikipedia.org/w/api.php?action=parse&format=json&prop=text&page=" + keyword + "&callback=?";
		}
		$.ajax({		
			type: "GET",
			url: wikiUrl,
			contentType: "application/json; charset=utf-8",
			async: false,
			dataType: "json",
			success: function (data, textStatus, jqXHR) {			
			var markup = data.parse.text["*"];
			var i = $('<div></div>').html(markup);			
			// remove links as they will not work
			i.find('a').each(function() { $(this).replaceWith($(this).html()); });			
			// remove any references
			i.find('sup').remove();			
			// remove cite error
			i.find('.mw-ext-cite-error').remove();			
			$('#article').html($(i).find('p'));					
			},
			error: function (errorMessage) {
			}
		}); 
	}
	</script>

	<!-- Google Translate API Call -->
	<!--<script>
    function googletranslate()
    {
        $.get("https://www.googleapis.com/language/translate/v2",
            {
            key:"API_KEY",
            source:"en",
            target:$("#languageselect").val(),
            q:$("#article").text().replace(/[^a-z0-9\s]/gi, '')
            },
            function(response)
            {
                $("#article").html(response.data.translations[0].translatedText);
 
            },"json") .fail(function(jqXHR, textStatus, errorThrown) 
            {
                alert( "error :"+errorThrown );
            });
    }
    </script>-->
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
						<td style="vertical-align: top; text-align: top;"> <figure> <img id="u60_img"
							class="linkImage" src="resources/images/home/u56.png"> <figcaption>
						<span class="class="linkText" ">Farm Wiki</span></figcaption> </figure></td>
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
		<!-- SideBar -->
			<div id="header">
				<div class="top">
					<!-- Page Title -->
						<div id="logo" position = "static">
							<h1 id="title" align="left">FARM WIKI</h1>
							<p align="left">Complete Reference for Farmers</p>
						</div>
					<!-- Topics -->
						<nav id="nav">
							<div id = "radioSelection" align="left">
							<input type="radio" value="Agriculture$வேளாண்மை$వ్యవసాయం$कृषि" name="topicname">Agriculture<br/>
							<input type="radio" value="Fertilizer$உரம்$ఎరువు$उर्वरक" name="topicname">Fertilizer<br/>
							<input type="radio" value="Irrigation$நீர்ப்பாசனம்$సాగునీరు$सिंचाई" name="topicname">Irrigation<br/>
							<input type="radio" value="Deforestation$காடழிப்பு$అటవీ నిర్మూలన$वनोन्मूलन" name="topicname">Deforestation<br/>
							<input type="radio" value="Rain$மழை$వర్షం$वर्षा" name="topicname">Rain<br/>
							</div>														
						</nav>
				</div>
			</div>

		<!-- Main -->
			<div id="main">
				<!-- Banner Image -->
					<section id="top" class="one dark cover">					
					</section>
					<br/>												
				<!-- Article Section -->
					<div class="container">	
						Press Ctrl+g to toggle between English and Regional Languages<br/>
						<input type="text" placeholder="Search KeyWord" name="searchkeyword" id="text1"><br/>
						<div id='translControl'></div><br/>
						<button onClick="searchKeyword()">Search</button><br/><br/>
	
						<!-- Language Section -->
						<select id="languageselect">
							<option value="en">English</option>
							<option value="ta">Tamil</option>
							<option value="te">Telugu</option>
							<option value="hi">Hindi</option>
						</select>
						<br/><br/>
						<div id="article"></div>
					</div>
			</div>

		<!-- Footer -->
			<div id="footer">
					<ul class="copyright">
						<li>Source - Wikipedia</li>
					</ul>
			</div>

		<!-- JS Files -->
			<script src="../resources/files/farm_wiki/assets/js/jquery.min.js"></script>
			<script src="../resources/files/farm_wiki/assets/js/jquery.scrolly.min.js"></script>
			<script src="../resources/files/farm_wiki/assets/js/jquery.scrollzer.min.js"></script>
			<script src="../resources/files/farm_wiki/assets/js/skel.min.js"></script>
			<script src="../resources/files/farm_wiki/assets/js/util.js"></script>
			<script src="../resources/files/farm_wiki/assets/js/main.js"></script>
	</body>
</html>