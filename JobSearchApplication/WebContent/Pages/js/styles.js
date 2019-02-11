
function openNav() {
  // document.getElementById("main").style.marginLeft = "250px";
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  // document.getElementById("main").style.marginLeft = "0";
  document.getElementById("mySidenav").style.width = "0";
}


function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}


//////////////////////modal////////////////////////////////
function displaymodal(id) {
  var modal = document.getElementById('myModal');
  var btn = document.getElementById(id);
  var span = document.getElementsByClassName("close")[0];
  btn.onclick = function () {
    modal.style.display = "block";
  }
  span.onclick = function () {
    modal.style.display = "none";
  }
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}

function displayjobs(cl) {
  var x = document.getElementsByClassName("cl");
  console.log(x);
  x.style.display ="block";

}

function displaymenu(id) {
  var x = document.getElementById("rightside");
  x.style.display ="none";
}