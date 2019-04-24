import "bootstrap";
import { clearNavbarOnPress } from "../components/navbar";

// service worker

 // Mobile Safari in standalone mode
if(("standalone" in window.navigator) && window.navigator.standalone){

    // If you want to prevent remote links in standalone web apps opening Mobile Safari, change 'remotes' to true
    var noddy, remotes = false;

    document.addEventListener('click', function(event) {

        noddy = event.target;

        // Bubble up until we hit link or top HTML element. Warning: BODY element is not compulsory so better to stop on HTML
        while(noddy.nodeName !== "A" && noddy.nodeName !== "HTML") {
            noddy = noddy.parentNode;
        }

        if('href' in noddy && noddy.href.indexOf('http') !== -1 && (noddy.href.indexOf(document.location.host) !== -1 || remotes))
        {
            event.preventDefault();
            document.location.href = noddy.href;
        }

    },false);
}

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


