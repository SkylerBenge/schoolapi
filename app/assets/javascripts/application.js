// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

"L.Icon.Default.imagePath = '/assets';"

// Easy way to input a back button on webpage
function goBack() {
	window.history.back()
}

// Function allowing me to create a Leaflet map on my search page
$( function() {
	var map = L.map('map');
	L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
	attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'}).addTo(map); 

	window.addToMap = function(lat,lng){
		var marker = L.marker([lat,lng]).addTo(map);
		// marker.bindPopup("schoolname");
		map.setView([lat,lng],13);
	}	
})