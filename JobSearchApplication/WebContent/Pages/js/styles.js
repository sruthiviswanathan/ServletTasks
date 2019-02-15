
function openNav() {
 
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {

  document.getElementById("mySidenav").style.width = "0";
}


function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}



function displaymodal(id) {
	
	  console.log(id);
	  var btn = document.getElementById(id);
	  var modal = document.getElementsByClassName(id);
	  console.log(modal);
	  
	
	  for (var i = 0; i < modal.length; i++) {
		  console.log(modal[i]);
		  modal[i].style.display ="block";
		}
}

function closeModal(cl) {
	 	
	var x = document.getElementsByClassName("modal");
	for(var i=0;i<x.length;i++){
		 x[i].style.display ="none";
	}
	}

function displayjobs(id) {
	console.log(id);
	var y = document.getElementsByClassName("rightside");
	for (var i = 0; i < y.length; i++) {
		  console.log(y[i]);
		  y[i].style.display ="none";
		}
  var x = document.getElementsByClassName(id);
  console.log(x);
  for (var i = 0; i < x.length; i++) {
	  console.log(x[i]);
	  x[i].style.display ="block";
	}

}

function displaymenu(id) {
  var x = document.getElementsByClassName("rightside");
  for (var i = 0; i < x.length; i++) {
	  console.log(x[i]);
	  x[i].style.display ="none";
	}
}