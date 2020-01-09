//1. set ul width 
//2. image when click prev/next button
var ul;
var liItems;
var imageNumber;
var imageWidth;
var prev, next;
var currentPostion = 0;
var currentImage = 0;


function init(){
	ul = document.getElementById('image_slider');
	liItems = ul.children;
	imageNumber = liItems.length;
	imageWidth = liItems[0].children[0].clientWidth;
	ul.style.width = parseInt(imageWidth * imageNumber) + 'px';
	prev = document.getElementById("prev");
	next = document.getElementById("next");
	generatePager(imageNumber, liItems);
	//.onclike = slide(-1) will be fired when onload;
	/*
	prev.onclick = function(){slide(-1);};
	next.onclick = function(){slide(1);};*/
	prev.onclick = function(){ onClickPrev();};
	next.onclick = function(){ onClickNext();};
}

function animate(opts){
	var start = new Date;
	var id = setInterval(function(){
		var timePassed = new Date - start;
		var progress = timePassed / opts.duration;
		if (progress > 1){
			progress = 1;
		}
		var delta = opts.delta(progress);
		opts.step(delta);
		if (progress == 1){
			clearInterval(id);
			opts.callback();
		}
	}, opts.delay || 17);
	//return id;
}

function slideTo(imageToGo){
	var direction;
	var numOfImageToGo = Math.abs(imageToGo - currentImage);
	// slide toward left

	direction = currentImage > imageToGo ? 1 : -1;
	currentPostion = -1 * currentImage * imageWidth;
	var opts = {
		duration:1000,
		delta:function(p){return p;},
		step:function(delta){
			ul.style.left = parseInt(currentPostion + direction * delta * imageWidth * numOfImageToGo) + 'px';
		},
		callback:function(){currentImage = imageToGo;}	
	};
	animate(opts);
}

function onClickPrev(){
	if (currentImage == 0){
		slideTo(imageNumber - 1);
	} 		
	else{
		slideTo(currentImage - 1);
	}		
}

function onClickNext(){
	if (currentImage == imageNumber - 1){
		slideTo(0);
	}		
	else{
		slideTo(currentImage + 1);
	}		
}

function generatePager(imageNumber, liItems){	
	var pageNumber;
	var pagerDiv = document.getElementById('pager');
	pagerDiv.classList.add("pagerdivclass");
	for (i = 0; i < imageNumber; i++){
		var insiderdiv = document.createElement('div');
		insiderdiv.classList.add("insiderdivclass");
		//var p = document.createElement('p');
		pageNumber = document.createTextNode(parseInt(i + 1));
		var textnode = document.createTextNode(liItems[i].children[0].getAttribute('alt'));
		insiderdiv.appendChild(textnode);
		pagerDiv.appendChild(insiderdiv);
		// add event inside a loop, closure issue.
		insiderdiv.onclick = function(i){
			return function(){
				slideTo(i);
			}
		}(i);
	}	
	//var computedStyle = document.defaultView.getComputedStyle(insiderdiv, null);
	//border width 1px; offsetWidth = 22
	//var insiderdivWidth = parseInt(insiderdiv.offsetWidth);
	//var insiderdivMargin = parseInt(computedStyle.margin.replace('px',""));
	//pagerDiv.style.width = parseInt((insiderdivWidth + insiderdivMargin * 2) * imageNumber) + 'px';
}
window.onload = init;
