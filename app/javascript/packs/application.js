import "bootstrap";
import { clearNavbarOnPress } from "../components/navbar";

// clearNavbarOnPress();
// get user position

window.onload = function() {
  var startPos;
  var geoSuccess = function(position) {
    startPos = position;
    // store in disasters form
    // earthquake
    document.querySelector("input#eq_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#eq_form_latitude").value = startPos.coords.latitude;
    // tsunami
    document.querySelector("input#tsu_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#tsu_form_latitude").value = startPos.coords.latitude;
    // mudslides
    document.querySelector("input#mud_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#mud_form_latitude").value = startPos.coords.latitude;
    // flood
    document.querySelector("input#flood_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#flood_form_latitude").value = startPos.coords.latitude;
    // tide
    document.querySelector("input#tide_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#tide_form_latitude").value = startPos.coords.latitude;
    // fire
    document.querySelector("input#fire_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#fire_form_latitude").value = startPos.coords.latitude;
    // pipe
    document.querySelector("input#pipe_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#pipe_form_latitude").value = startPos.coords.latitude;
    // volcano
    document.querySelector("input#volcano_form_longitude").value = startPos.coords.longitude;
    document.querySelector("input#volcano_form_latitude").value = startPos.coords.latitude;
  };
  navigator.geolocation.getCurrentPosition(geoSuccess);
};


