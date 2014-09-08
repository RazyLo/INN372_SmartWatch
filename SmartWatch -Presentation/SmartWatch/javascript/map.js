google.maps.event.addDomListener(window, 'load', initialize);

var mapcenter;
var marker;
var map;
var defaultLat;
var defaultLngt;
var circleNo;

var newCirclesContainer;
var patientMarkers;
var mycircle;


function initialize() {

    newCirclesContainer = new Array(0);
    patientMarkers = new Array(0);
    circleNo = 0;
    defaultLat = -27.4780;
    defaultLngt = 153.0280;
    generateMap(defaultLat, defaultLngt);


}



function generateMap(lati, lngt) {
    if (lati != undefined && lngt != undefined) {
        var currentlat = lati;
        var currentlgnt = lngt;
        mapcenter = new google.maps.LatLng(currentlat, currentlgnt);
        var mapproperty =
        {
            center: mapcenter,
            zoom: 13,

            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("googleMap"), mapproperty);

        mycircle = new google.maps.Circle({
            //center:mapcenter,
            map: map,
            radius: 1000,
            strokeColor: "#0000FF",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#0000FF",
            fillOpacity: 0.4,
            draggable: true,
            editable: true
        });

        marker = new google.maps.Marker({
            map: map,
            position: mapcenter,
            title: "Hello World!"
        });
        mycircle.bindTo('center', marker, 'position');

        google.maps.event.addListener(map, 'rightclick', function (e) {
            //alert(circleNo);
            if (circleNo < 2) {
                drawCircles(e.latLng);

                //alert(circleMarkers[0].mar.position);
            }
            else {
                alert("Max of 3 geo-fence! Delete others to add this! ");
            }
        });


    }
}//end of generateMap


function drawCircles(location) {
    if (circleNo < 2) {
        var newCircle = new google.maps.Circle({
            center: location,
            map: map,
            radius: 1000,
            fillColor: "#000000",
            fillOpacity: 0.1,
            strokeColor: "#000000",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            draggable: true,
            editable: true
        });
        newCircle.setMap(map);
        map.panTo(location);
        newCirclesContainer.push(newCircle);
        addCircleListener(newCircle);
        circleNo++;
    }
    else {
        alert("Max of 3 geo-fence! Delete others to add this! ");
    }
}



function addCircleListener(circle) {
    google.maps.event.addListener(circle, 'rightclick', function (e) {
        deleteCircleFromContainer(circle);
    });
}

function deleteCircleFromContainer(circle) {
    if (circle != undefined) {
        if (circle != null) {
            circle.setMap(null);
            var index = newCirclesContainer.indexOf(circle);
            newCirclesContainer.splice(index, 1);
            circleNo--;
        }
    }
}

function addFenceViaButton() {
    var lati = document.getElementById("positionx").value;
    var lagn = document.getElementById("positiony").value;
    if (isNaN(lati) || isNaN(lagn)) {
        alert("Location must be a number..");
    }
    else {
        var newlocation = new google.maps.LatLng(lati, lagn);
        drawCircles(newlocation);
    }
    return false;
}

function deleteFenceViaButton() {
    var length = newCirclesContainer.length;
    if (length != null) {
        if (length < 1) {
            alert("Can not delete default fence. Please add some other fence first..");
        }
        else {
            deleteCircleFromContainer(newCirclesContainer[length - 1]);
        }
    }
    return false;
}

var data;

function addPatitentLocation(id) {
    Read_Data(id);
    var str = "";
    for (var i = 0; i < data.length; i++) {
        var patientid = data[i][0];
        var patientLat1 = parseFloat(data[i][1]);
        var patientLogi1 = parseFloat(data[i][2]);
        str += addPatientMarker(patientid, patientLat1, patientLogi1);
    }
    var text = document.getElementById("txt_patientstatus");
    text.innerText = str;
    return false;
}



function Read_Data(id) {
    data = new Array(0);
    var Grid_Table = document.getElementById(id);
    for (var row = 1; row < Grid_Table.rows.length; row++) {
        var patient = new Array(0);
        for (var col = 0; col < Grid_Table.rows[row].cells.length; col++) {
            patient.push(Grid_Table.rows[row].cells[col].innerText);
        }
        data.push(patient);
    }
}


function addPatientMarker(pid, lati, logi) {
    var str = "";
    var patientLocation = new google.maps.LatLng(lati, logi);
    var locationMarker = new google.maps.Marker({
        map: map,
        position: patientLocation,
        title: "<div style = 'height:60px;width:200px'><b>Patient's ID: </b> " + pid + "<br/> <b>Patient's location:</b><br />Latitude: " + lati + "<br />Longitude: " + logi,
        animation: google.maps.Animation.BOUNCE,
        icon: 'blue-dot.png'
    });

    google.maps.event.addListener(locationMarker, 'click', function (e) {
        var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(locationMarker.title);
        infoWindow.open(map, locationMarker);
    });
    patientMarkers.push(locationMarker);
    if (isInCircleBound(pid, patientLocation) == true) {
        str = "Patient " + pid + " is in the fence\n";
    }
    else {
        str = "Patient " + pid + " is out of the fence\n";
    }
    return str;
}



function isInCircleBound(pid, location) {
    var isInCircleBound = false;
    var isInDefaultCircle = false;
    if (mycircle.getBounds().contains(location)) {
        isInDefaultCircle = true;
        isInCircleBound = true;
    }
    if (isInDefaultCircle == false) {
        for (var i = 0; i < newCirclesContainer.length; i++) {
            if (newCirclesContainer[i].getBounds().contains(location)) {
                isInCircleBound = true;
                break;
            }
            else {
                isInCircleBound = false;
            }
        }
    }
    return isInCircleBound;
}
