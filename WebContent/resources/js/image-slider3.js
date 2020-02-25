var prev, next;
var images;
var imagenumber;
var currentimage;
var player;
var playchecker;
$(document).ready(function() {
	playchecker=false;
	images = $('#cf7').children('img').get();
	imagesnumber = images.length;
	currentimage = 0;
	$("#prev").on('click', function() {
		if (currentimage == 0){
			$("#cf7 img").removeClass("opaque");
		    $("#cf7 img").eq(imagesnumber-1).addClass("opaque");
		    $("#cf7_controls span").removeClass("selected");
		    $("#cf7_controls span").eq(imagesnumber-1).addClass("selected");
		    currentimage = imagesnumber-1;
		} 		
		else{
			$("#cf7 img").removeClass("opaque");
		    $("#cf7 img").eq(currentimage-1).addClass("opaque");
		    $("#cf7_controls span").removeClass("selected");
		    $("#cf7_controls span").eq(currentimage-1).addClass("selected");
		    currentimage = currentimage-1;
		}
		if(currentimage > 24){
			document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (هـ)";
		}else{
			document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (و)";
		}
	});
	
	$("#next").on('click', function() {
		if (currentimage == imagesnumber - 1){
			$("#cf7 img").removeClass("opaque");
		    $("#cf7 img").eq(0).addClass("opaque");
		    $("#cf7_controls span").removeClass("selected");
		    $("#cf7_controls span").eq(0).addClass("selected");
		    currentimage = 0;
		}		
		else{
			$("#cf7 img").removeClass("opaque");
		    $("#cf7 img").eq(currentimage+1).addClass("opaque");
		    $("#cf7_controls span").removeClass("selected");
		    $("#cf7_controls span").eq(currentimage+1).addClass("selected");
		    currentimage = currentimage+1;
		}
		if(currentimage > 24){
			document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (هـ)";
		}else{
			document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (و)";
		}
	});
	
	$("#play").on('click', function() {
		if(playchecker == true){
			playchecker = false;
			document.getElementById('play').style.backgroundImage = "url('resources/images/ts_play.png')";
			clearInterval(player);  
		}else{
			playchecker = true;
			document.getElementById('play').style.backgroundImage = "url('resources/images/ts_pause.png')";
			player = setInterval(function(){ 
				if (currentimage == imagesnumber - 1){
					$("#cf7 img").removeClass("opaque");
				    $("#cf7 img").eq(0).addClass("opaque");
				    $("#cf7_controls span").removeClass("selected");
				    $("#cf7_controls span").eq(0).addClass("selected");
				    currentimage = 0;
				}		
				else{
					$("#cf7 img").removeClass("opaque");
				    $("#cf7 img").eq(currentimage+1).addClass("opaque");
				    $("#cf7_controls span").removeClass("selected");
				    $("#cf7_controls span").eq(currentimage+1).addClass("selected");
				    currentimage = currentimage+1;
				}
				if(currentimage > 24){
					document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (هـ)";
				}else{
					document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (و)";
				}
		 }, 1000); 
		}
	});
	
	$("#pause").on('click', function() {
		clearInterval(player);
	});
	
  $("#cf7_controls").on('click', 'span', function() {
    $("#cf7 img").removeClass("opaque");
    var newImage = $(this).index();
    $("#cf7 img").eq(newImage).addClass("opaque");
    $("#cf7_controls span").removeClass("selected");
    $(this).addClass("selected");
    currentimage = newImage;
    if(currentimage > 24){
		document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (هـ)";
	}else{
		document.getElementById('floatingimagetitleid').innerHTML = "التسلسل الزمني-المنطقة (و)";
	}
  });
  
});