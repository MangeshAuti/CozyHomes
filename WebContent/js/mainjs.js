//For Rent Range Selector	
function updateTextInput(val) {
      document.getElementById('textInput').value=val; 
    }
	
	/*Autocomplete address from google api*/
	var placeSearch, autocomplete;

  function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
        {types: ['geocode']});
    autocomplete.addListener('place_changed', fillInAddress);
  }

  function fillInAddress() {
    var place = autocomplete.getPlace();
  }
  function geolocate() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var geolocation = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        var circle = new google.maps.Circle({
          center: geolocation,
          radius: position.coords.accuracy
        });
        autocomplete.setBounds(circle.getBounds());
      });
    }
  }
  
  
$(document).ready(function(){ 
	
	 /*Slider Value*/
	function updateTextInput(val) {
      document.getElementById('textInput').value=val; 
    }
	
	$('.navbar-right li').click(function(){ 
		$(this).addClass('active').siblings().removeClass('active');
	});
	
	
	/*$('#register_tab').hide();

	 

	$("#pill_login,#pill_registration").click(function(){
		$("#login_tab").toggle();
		$("#register_tab").toggle();
	});

	$("#forgot_password").on(" active",function(){
		$("#forgotModal").modal();
	});
*/
/*	$('#forgot_form').on("submit",function(e){
    e.preventDefault();
     $("#forgotModal").modal("hide");
     $("#forgot_form").trigger('reset');
      $("#forgotModal_response").modal();
		//alert("Your Password Recovery link Has Been Sent To Your Email Address.\nPlease Check your Mail..");
  });

	$('#signup_form').on("submit",function(e){
		e.preventDefault();
		$("#pill_login").trigger("click");
	});

	$("#tenant_type").on("change",function(){
		var val = $(this).val();
		if (val == "b"||val == "g") {
			$("#acc_type").html("<option value='p'>Private Room</option><option value='s'>Shared Room</option><option value='e'>Entire House</option>");
		} else if (val == "f") {
			$("#acc_type").html("<option value='e'>Entire House</option>");
		} 
	});*/

	/*$('#forgot_form').on('show.bs.modal hide.bs.model', function (event) {
		$('#forgot_form #submit').show();
		$("#wait").html("");
		$('#forgot_form').trigger("reset");
	});*/
	/* Forgot password ajax*/
	/*$('#forgot_form').on("submit",function(e){
	    e.preventDefault();
		var d="forgot_email="+$("#forgot_email").val();
				$.ajax({
			type:"POST",
			url:$("#forgot_form").attr( "action"),
			data:d,
			success:function(data){
				$("#forgotModal").modal("hide");
				
				$("#forgot_form").trigger('reset');
				$("#forgotModal_response").modal();
				if(data==="valid")
				
					$("#response").html("Your Password Recovery link Has Been Sent To Your Email Address.<br>Please Check your Mail..")
					else
						{
						$("#response").html("Invalid Username");
						$("#forgot_form").trigger("reset");
						}
			},
			error:function(xhr,status,data){
				$('#response').html(data)
			},
		});
	});*/
	
	/*password recovery form
	$("#password_recovery_form").on("submit",function(e){
	    e.preventDefault();
		var d="newpassword="+$("#confirmpassword").val();
		$.ajax({
			type:"POST",
			url:$("#password_recovery_form").attr( "action"),
			data:d,
			success:function(data){
				if(data=="required_field")
					{
					$("#newpassword").attr('autofocus','true');
					$("#passresponse").html("*field Required");
					}
				else if(data=="success")
					{
					$("#password_recovery_form").trigger("reset");
					$("#password_recovery_form").hide();
					$("#response").html("<div class='alert alert-success' role='alert'>Password changed Successfully.<br><a href='login'>click here</a> for login</div>");
					}
				else
				{
					$("#response").html("<div class='alert alert-danger' role='alert'>Session Timeout</div>");
					$("#password_recovery_form").trigger("reset");
					$("#password_recovery_form").hide();
					}
			},
			error:function(xhr,status,data){
				$('#response').html(data)
			},
		});
	});*/
});