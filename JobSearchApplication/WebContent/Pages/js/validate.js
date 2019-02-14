function loginForm(){
	var email = document.forms["login"]["email"];  
	 var password = document.forms["login"]["psw"];  
	 
	 if (email.value == "")                                   
	    { 
	    	 emailError = "Please enter a valid e-mail address.";
	      	 document.getElementById("log_em_error").innerHTML = emailError;
	        email.focus(); 
	        return false; 
	    } 
	   
	    if (email.value.indexOf("@", 0) < 0)                 
	    { 
	    	 emailError = "Please enter a valid e-mail address";
	      	 document.getElementById("log_em_error").innerHTML = emailError;
	        email.focus(); 
	        return false; 
	    } 
	   
	    if (email.value.indexOf(".", 0) < 0)                 
	    { 
	    	 emailError = "Please enter a valid e-mail address.";
	      	 document.getElementById("log_em_error").innerHTML = emailError;
	        email.focus(); 
	        return false; 
	    } 
	   
	    if (password.value == "")                        
	    { 
	    	 passwordError = "Please enter your password";
	      	 document.getElementById("log_psw_error").innerHTML = passwordError;
	        password.focus(); 
	        return false; 
	    }	 
	 
}


function registerForm()                                    
{ 
    var name = document.forms["signup"]["userName"];               
    var email = document.forms["signup"]["email"];    
    var company =  document.forms["signup"]["companyName"];  
    var designation =  document.forms["signup"]["designation"];  
    var password = document.forms["signup"]["psw"];  
    var confirm = document.forms["signup"]["cpsw"];  
    console.log("validate");
    if (name.value == "")                                  
    { 
  	 nameError = "Please enter your name";
  	 document.getElementById("reg_name_error").innerHTML = nameError;
      //  window.alert("Please enter your name."); 
        name.focus(); 
        return false; 
    } 
    if (email.value == "")                                   
    { 
    	 emailError = "Please enter a valid e-mail address.";
      	 document.getElementById("reg_email_error").innerHTML = emailError;
       // window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf("@", 0) < 0)                 
    { 
    	 emailError = "Please enter a valid e-mail address";
      	 document.getElementById("reg_email_error").innerHTML = emailError;
       // window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf(".", 0) < 0)                 
    { 
    	 emailError = "Please enter a valid e-mail address.";
      	 document.getElementById("reg_email_error").innerHTML = emailError;
        //window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (password.value == "")                        
    { 
    	 passwordError = "Please enter your password";
      	 document.getElementById("reg_psw_error").innerHTML = passwordError;
        //window.alert("Please enter your password"); 
        password.focus(); 
        return false; 
    } 
   
    if (confirm.value == "")                               
    { 
    	 confirmError = "Please reenter your password.";
      	 document.getElementById("reg_cpsw_error").innerHTML = confirmError;
       // window.alert("Please reenter your password."); 
        confirm.focus(); 
        return false; 
    } 
    
    if(password.value !== confirm.value){
    	 matchError = "Both password and Confirm password must match";
      	 document.getElementById("reg_cpsw_error").innerHTML = matchError;
       // window.alert("Please reenter your password."); 
        confirm.focus(); 
        return false; 
    }
       
    if (company.value == "")                  
    { 
    	 companyError = "Please Enter a Company Name";
      document.getElementById("reg_comp_error").innerHTML = companyError;
        //alert("Please select a Company Name."); 
        company.focus(); 
        return false; 
    } 
    
    if (designation.value == "")                  
    { 
    	 designationError = "Please Enter your designation";
      document.getElementById("reg_des_error").innerHTML = designationError;
        //alert("Please select a Company Name."); 
        designation.focus(); 
        return false; 
    }    
    return true; 
}








function validateForm()                                    
{ 
    var name = document.forms["admin"]["userName"];               
    var email = document.forms["admin"]["email"];    
    var what =  document.forms["admin"]["companyName"];  
    var password = document.forms["admin"]["psw"];  
    var confirm = document.forms["admin"]["cpsw"];  
    console.log("validate");
    if (name.value == "")                                  
    { 
  	 nameError = "Please enter your name";
  	 document.getElementById("name_error").innerHTML = nameError;
      //  window.alert("Please enter your name."); 
        name.focus(); 
        return false; 
    } 
    if (email.value == "")                                   
    { 
    	 emailError = "Please enter a valid e-mail address.";
      	 document.getElementById("email_error").innerHTML = emailError;
       // window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf("@", 0) < 0)                 
    { 
    	 emailError = "Please enter a valid e-mail address";
      	 document.getElementById("email_error").innerHTML = emailError;
       // window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf(".", 0) < 0)                 
    { 
    	 emailError = "Please enter a valid e-mail address.";
      	 document.getElementById("email_error").innerHTML = emailError;
        //window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (password.value == "")                        
    { 
    	 passwordError = "Please enter your password";
      	 document.getElementById("psw_error").innerHTML = passwordError;
        //window.alert("Please enter your password"); 
        password.focus(); 
        return false; 
    } 
   
    if (confirm.value == "")                               
    { 
    	 confirmError = "Please reenter your password.";
      	 document.getElementById("cpsw_error").innerHTML = confirmError;
       // window.alert("Please reenter your password."); 
        confirm.focus(); 
        return false; 
    } 
       
    if (what.selectedIndex < 1)                  
    { 
    	 selectError = "Please select a Company Name";
      document.getElementById("select_error").innerHTML = selectError;
        //alert("Please select a Company Name."); 
        what.focus(); 
        return false; 
    } 
   
    return true; 
}

function validatePostJob()                                    
{ 
    var location = document.forms["postjob"]["location"];               
    var description = document.forms["postjob"]["description"]; 
    var what =  document.forms["postjob"]["job"];  
    var salary = document.forms["postjob"]["salary"];  
    var count = document.forms["postjob"]["count"];  
   
    if (what.selectedIndex < 1)                  
    { 
        alert("Please select a job Designation."); 
        what.focus(); 
        return false; 
    } 
   

    if (location.value == "")                                  
    { 
        window.alert("Please enter the location of job."); 
        location.focus(); 
        return false; 
    }

    if (salary.value == "")                               
    { 
        window.alert("Please enter a valid salary amount."); 
        salary.focus(); 
        return false; 
    }

    if (count.value == "")                               
    { 
        window.alert("Please enter a valid vacancy count."); 
        count.focus(); 
        return false; 
    } 

    if (description.value == "")                                  
    { 
        window.alert("Please enter job description."); 
        description.focus(); 
        return false; 
    }       
    
    return true; 
}
function validateRequestVacancy(){
    var location = document.forms["requestvacancy"]["location"];               
    var what =  document.forms["requestvacancy"]["job"];  
    var salary = document.forms["requestvacancy"]["salary"];   
   
    if (what.selectedIndex < 1)                  
    { 
        alert("Please select a job Designation."); 
        what.focus(); 
        return false; 
    } 
   

    if (location.value == "")                                  
    { 
        window.alert("Please enter the location of job."); 
        location.focus(); 
        return false; 
    }

    if (salary.value == "")                               
    { 
        window.alert("Please enter a valid salary amount."); 
        salary.focus(); 
        return false; 
    }
    
    return true; 
}

function updateUser()                                    
{ 
    var name = document.forms["update"]["username"];               
    var email = document.forms["update"]["email"];    
    var cname =  document.forms["update"]["cname"];  
    var password = document.forms["update"]["psw"];  
    var designation = document.forms["update"]["designation"];  
   
    if (name.value == "")                                  
    { 
        window.alert("Please enter your name."); 
        name.focus(); 
        return false; 
    } 
   
    if (designation.value == "")                               
    { 
        window.alert("Please enter your designation."); 
        desiognation.focus(); 
        return false; 
    } 
       
    if (email.value == "")                                   
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf("@", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf(".", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
   
    if (password.value == "")                        
    { 
        window.alert("Please enter your password"); 
        password.focus(); 
        return flase; 
    } 
    if (cname.value == "")                        
    { 
        window.alert("Please enter your company name"); 
        cname.focus(); 
        return flase; 
    } 
   
    
   
    return true; 
}
function applyForJob()                                    
{ 
    var name = document.forms["applyforjob"]["username"];               
    var email = document.forms["applyforjob"]["email"];    
    var count = document.forms["applyforjob"]["years"];  
    var resume = document.forms["applyforjob"]["resume"];
   
    if (name.value == "")                                  
    { 
        window.alert("Please enter your name."); 
        name.focus(); 
        return false; 
    } 
       
    if (email.value == "")                                   
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf("@", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf(".", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (count.value == "")                               
    { 
        window.alert("Please enter a valid input."); 
        count.focus(); 
        return false; 
    } 
    if(resume.value == ""){
        window.alert("Please upload a resume."); 
        resume.focus(); 
        return false;
    }
   
    return true; 
}

