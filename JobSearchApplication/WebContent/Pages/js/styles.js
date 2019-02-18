
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

/*function searchByLocation(){
	  var ul = document.getElementById("parent");
	  var liToKill = ul.childNodes[5];
	  liToKill.parentNode.removeChild( liToKill );
}*/

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

function removeErrors(){
	var elem = document.getElementById('jobError').remove();;
    //elem.parentNode.removeChild(elem);
    return false;
}
function submitFindJob(){

var elem = document.getElementById('jobError').remove();	
document.getElementById("findJob").submit();

}
function removeLocationErrors(){
	var elem1 = document.getElementById('locationError').remove();;
    return false;
}
function submitFindLocation(){

	var elem = document.getElementById('locationError').remove();	
	document.getElementById("findLocation").submit();

	}

function removeCompanyErrors(){
	var elem1 = document.getElementById('companyError').remove();;
    return false;
}
function submitFindCompany(){

	var elem = document.getElementById('companyError').remove();	
	document.getElementById("findCompany").submit();

	}