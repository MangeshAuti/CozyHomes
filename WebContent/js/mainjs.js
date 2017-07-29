
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
	
	$(".noti_panel").click(function(){
		$(this).siblings().slideToggle();
	})
	
});