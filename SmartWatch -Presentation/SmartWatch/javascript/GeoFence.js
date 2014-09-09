var map;
var marker;

function initialize() {
    var optns = {
        zoom: 6,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.HYBRID
    }
    map = new google.maps.Map(document.getElementById("myMap"), optns);
    google.maps.event.addListener(map, 'click', function (event) {
        setCurrentLocation(event.latLng, 10);
    });
}

function setCurrentLocation(location, crcl_radius) {
    if (marker)
        marker.setMap(null);

    var opts = {
        map: map,
        position: location,
        clickable: false
    };
    marker = new google.maps.Marker(opts);

    var circle = new google.maps.Circle({
        map: map,
        radius: crcl_radius,
        fillColor: '#efefef',
        fillOpacity: 0.5,
        strokeColor: '#ff0000',
        strokeWeight: 2
    });
    circle.bindTo('center', marker, 'position');
}