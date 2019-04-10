import "bootstrap";

window.onload = function() {
  var startPos;
  var geoSuccess = function(position) {
    startPos = position;
    document.querySelector("input#eq_form_longitude").value = startPos.coords.latitude;
    document.querySelector("input#eq_form_latitude").value = startPos.coords.longitude;
  };
  navigator.geolocation.getCurrentPosition(geoSuccess);
};



