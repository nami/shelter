import GMaps from 'gmaps/gmaps.js';
// import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  const myLat = mapElement.dataset.mylat;
  const myLong = mapElement.dataset.mylong;
  map.addMarkers(markers);

  console.log(myLat)
  console.log(myLong)

  if ((typeof myLat === 'string' && myLat != "") && (typeof myLong === 'string' && myLong != "")){
    map.addMarker({
      lat: myLat,
      lng: myLong,
      title: 'User',
      icon: "https://res.cloudinary.com/dpttkxync/image/upload/v1555312626/user-map2.png"
    });
  }

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else if ((typeof myLat === 'string' && myLat != "") && (typeof myLong === 'string' && myLat != ""))  {
    map.setCenter(myLat, myLong);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
// autocomplete();
