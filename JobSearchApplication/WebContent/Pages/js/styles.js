
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

function removeSuccessMessage(){
	 var x = document.getElementById("snackbar");
	  x.className = "show";
	  setTimeout(function(){ x.className = x.className.replace("show", "hide"); }, 3000);
	
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
	var elem1 = document.getElementById('companyError');
	if(elem1){
		console.log(elem1);	
		elem1.parentNode.removeChild(elem1);
	}
 /*   return false;*/
}
function submitFindCompany(){

	var elem = document.getElementById('companyError');	
	//document.getElementById("findCompany").submit();
	if(elem){
		console.log(elem);	
		elem.parentNode.removeChild(elem);
  }
}

function apply(event){
	console.log(event);

	    var formEl = $(event);
	    var submitButton = $('input[type=submit]', formEl);

	    $.ajax({
	      type: 'POST',
	      url: formEl.prop('action'),
	      accept: {
	        javascript: 'application/javascript'
	      },
	      data: formEl.serialize(),
	      beforeSend: function() {
	        submitButton.prop('disabled', 'disabled');
	      }
	    }).done(function(data) {
	      submitButton.prop('disabled','disabled');
	     // submitButton.innerHTML("APPLIED");
	     /* $(".submit-btn").html("Accepted"); */
	    });

return false;
}