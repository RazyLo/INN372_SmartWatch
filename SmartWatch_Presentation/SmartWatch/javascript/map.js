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
var patientIDAndMarkerContainer;
var fenceDetails;


function initialize()
{
    newCirclesContainer = new Array(0);
    patientMarkers = new Array(0);
    patientIDAndMarkerContainer = new Array(0);
    fenceDetails = new Array(0);

    circleNo = 0;
    defaultLat = -27.477806;
    defaultLngt = 153.02073;
    generateMap(defaultLat, defaultLngt);
}


function generateMap(lati, lngt)
{
    if (lati != undefined && lngt != undefined)
    {
        var currentlat = lati;
        var currentlgnt = lngt;
        mapcenter = new google.maps.LatLng(currentlat, currentlgnt);
        var mapproperty =
        {
            center: mapcenter,
            zoom: 18,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("googleMap"), mapproperty);

        mycircle = new google.maps.Circle({
            map: map,
            radius: 100,
            strokeColor: "#0000FF",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#0000FF",
            fillOpacity: 0.4,
            draggable: false,
            editable: false
        });

        marker = new google.maps.Marker({
            map: map,
            position: mapcenter,
            title: "Hello World!"
        });
        mycircle.bindTo('center', marker, 'position');

        google.maps.event.addListener(map, 'rightclick', function (e)
        {
            //alert(circleNo);
            if (circleNo < 2)
            {
                var lati = e.latLng.lat();
                var longi = e.latLng.lng();
                drawCircles(e.latLng, lati, longi);
                //alert(circleMarkers[0].mar.position);
            }
            else
            {
                alert("Max of 3 geo-fence! Delete others to add this! ");
            }
        });
    }
}//end of generateMap


function drawCircles(location, circle_lat, circle_long)
{
    if (circleNo < 2)
    {
        var newCircle = new google.maps.Circle({
            center: location,
            map: map,
            radius: 100,
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

        var arr = { Latitude: circle_lat, Longitude: circle_long };
        fenceDetails.push(arr);
    }
    else
    {
        alert("Max of 3 geo-fence! Delete others to add this! ");
    }
}

function getCirclesValue()
{
    var circle1_lati = document.getElementById("lbl_circle1_lat_id");
    var circle1_long = document.getElementById("lbl_circle1_log_id");
    var circle1_radius = document.getElementById("lbl_circle1_radius_id");

    var circle2_lati = document.getElementById("lbl_circle2_lat_id");
    var circle2_long = document.getElementById("lbl_circle2_log_id");
    var circle2_radius = document.getElementById("lbl_circle2_radius_id");
    
    if (fenceDetails.length == 0)
    {
        circle1_lati.innerText = " ";
        circle1_long.innerText = " ";
        circle1_radius.innerText = " ";

        circle2_lati.innerText = " ";
        circle2_long.innerText = " ";
        circle2_radius.innerText = " ";
    }
    if (fenceDetails.length == 1)
    {
        circle1_lati.innerText = fenceDetails[0]["Latitude"];
        circle1_long.innerText = fenceDetails[0]["Longitude"];
        circle1_radius.innerText = newCirclesContainer[0].radius;

        circle2_lati.innerText = "";
        circle2_long.innerText = "";
        circle2_radius.innerText = "";
    }
    if (fenceDetails.length == 2)
    {
        circle1_lati.innerText = fenceDetails[0]["Latitude"];
        circle1_long.innerText = fenceDetails[0]["Longitude"];
        circle1_radius.innerText = newCirclesContainer[0].radius;

        circle2_lati.innerText = fenceDetails[1]["Latitude"];
        circle2_long.innerText = fenceDetails[1]["Longitude"];
        circle2_radius.innerText = newCirclesContainer[1].radius;
    }
    return true;
}



function addCircleListener(circle)
{
    google.maps.event.addListener(circle, 'rightclick', function (e)
    {
        deleteCircleFromContainer(circle);
    });
}

function deleteCircleFromContainer(circle)
{
    if (circle != undefined)
    {
        if (circle != null)
        {
            circle.setMap(null);
            var index = newCirclesContainer.indexOf(circle);
            newCirclesContainer.splice(index, 1);
            fenceDetails.splice(index, 1);
            circleNo--;
            alert((fenceDetails.length + 1) + " fences have left.....");
        }
    }
}

function addFenceViaButton()
{
    var lati = document.getElementById("positionx").value;
    var lagn = document.getElementById("positiony").value;
    if (lati.length != 0 && lagn.length != 0)
    {
        if (isNaN(lati) || isNaN(lagn))
        {
            alert("Location must be a number..");
        }
        else
        {
            var newlocation = new google.maps.LatLng(lati, lagn);
            drawCircles(newlocation, lati, lagn);
        }
    }
    else
    {
        alert("Location is empty....");
    }
    return false;
}

function deleteFenceViaButton()
{
    var length = newCirclesContainer.length;
    if (length != null)
    {
        if (length < 1)
        {
            alert("Can not delete default fence. Please add some other fence first..");
        }
        else
        {
            deleteCircleFromContainer(newCirclesContainer[length - 1]);
        }
    }
    return false;
}

var data;

function addPatitentLocation(id)
{
    Read_Data(id);
    var str = "";
    setContainerDefault();      // clear all markers in the map

    for (var i = 0; i < data.length; i++)
    {
        var patientid = data[i][0];
        var patientLat1 = parseFloat(data[i][1]);
        var patientLogi1 = parseFloat(data[i][2]);
        str += addPatientMarker(patientid, patientLat1, patientLogi1);
    }
    var text = document.getElementById("txt_patientstatus");
    text.innerText = str;
    return false;
}



function Read_Data(id)
{
    data = new Array(0);
    var Grid_Table = document.getElementById(id);
    for (var row = 1; row < Grid_Table.rows.length; row++)
    {
        var patient = new Array(0);
        for (var col = 0; col < Grid_Table.rows[row].cells.length; col++)
        {
            patient.push(Grid_Table.rows[row].cells[col].innerText);
        }
        data.push(patient);
    }
}


function addPatientMarker(pid, lati, logi)
{
    var str = "";
    var patientLocation = new google.maps.LatLng(lati, logi);
    var locationMarker = new google.maps.Marker({
        map: map,
        position: patientLocation,
        title: "<div style = 'height:80px;width:150px'><b>Patient's ID: </b> " + pid + "<br/> <b>Patient's location:</b><br />Latitude: " + lati + "<br />Longitude: " + logi,
        animation: google.maps.Animation.BOUNCE,
        icon: 'blue-dot.png'
    });

    google.maps.event.addListener(locationMarker, 'click', function (e)
    {
        var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(locationMarker.title);
        infoWindow.open(map, locationMarker);
    });
    patientMarkers.push(locationMarker);
    /*
    var id_location = { p_id: pid, marker: locationMarker };
    patientIDAndMarkerContainer.push(id_location);
    */
    if (isInCircleBound(pid, patientLocation) == true)
    {
        str = "Patient " + pid + " is in the fence\n";
    }
    else
    {
        str = "Patient " + pid + " is out of the fence\n";
    }
    return str;
}



function isInCircleBound(pid, location)
{
    var isInCircleBound = false;
    var isInDefaultCircle = false;
    if (mycircle.getBounds().contains(location))
    {
        isInDefaultCircle = true;
        isInCircleBound = true;
    }
    if (isInDefaultCircle == false)
    {
        for (var i = 0; i < newCirclesContainer.length; i++)
        {
            if (newCirclesContainer[i].getBounds().contains(location))
            {
                isInCircleBound = true;
                break;
            }
            else
            {
                isInCircleBound = false;
            }
        }
    }
    return isInCircleBound;
}

function trackingThePatient(gridid)
{
    initialAllMarker(gridid);
    var flag = false;
    var patient_id = document.getElementById("inputpid").value.toUpperCase();

    if (patient_id.length != 0)
    {
        for (var i = 0; i < patientIDAndMarkerContainer.length; i++)
        {
            if (patient_id == patientIDAndMarkerContainer[i].p_id.toUpperCase())
            {
                flag = true;
                break;
            }
        }
    }       
    if (flag == false)
    {
        alert("Patient not found");
    }
    return flag;
}

function initialAllMarker(gridid)
{
    setContainerDefault();
    Read_Data(gridid);
    var str = 0;
    for (var i = 0; i < data.length; i++)
    {
        var pid = data[i][0];
        var patientLat1 = parseFloat(data[i][1]);
        var patientLogi1 = parseFloat(data[i][2]);
        //str += pid;
        var patientLocation = new google.maps.LatLng(patientLat1, patientLogi1);
        var location = new google.maps.Marker({
            position: patientLocation,
            title: "<div style = 'height:80px;width:150px'><b>Patient's ID: </b> " + pid + "<br/> <b>Patient's location:</b><br />Latitude: " + patientLat1 + "<br />Longitude: " + patientLogi1,
            animation: google.maps.Animation.BOUNCE,
            icon: 'blue-dot.png'
        });
        var id_location = { p_id: pid, marker: location };
        patientIDAndMarkerContainer.push(id_location);
    }
}


function setContainerDefault()
{
    for (var j = 0; j < patientMarkers.length; j++)
    {
        patientMarkers[j].setMap(null);
    }
    for (var i = 0; i < patientIDAndMarkerContainer.length; i++)
    {
        patientIDAndMarkerContainer[i].marker.setMap(null);
    }
    patientMarkers.splice(0, patientMarkers.length);
    patientIDAndMarkerContainer.splice(0, patientIDAndMarkerContainer.length);
}

function trackingRecord(id)
{
    var data = new Array(0);
    var patient = new Array(0);
    var Grid_Table = document.getElementById(id);
    var lineCoordinates = new Array(0);
    for (var row = 1; row < Grid_Table.rows.length; row++)
    {
        var patient = new Array(0);
        for (var col = 0; col < Grid_Table.rows[row].cells.length; col++)
        {
            patient.push(Grid_Table.rows[row].cells[col].innerText);
        }
        data.push(patient);
    }

    for (var i = 0; i < data.length; i++)
    {
        
        var pid = data[i][0];
        var patientLat1 = parseFloat(data[i][1]);
        var patientLogi1 = parseFloat(data[i][2]);
        var patientLocation = new google.maps.LatLng(patientLat1, patientLogi1);
        var location = new google.maps.Marker({
            map:map,
            position: patientLocation,
            title: "<div style = 'height:80px;width:150px'><b>Patient's ID: </b> " + pid + "<br/> <b>Patient's location:</b><br />Latitude: " + patientLat1 + "<br />Longitude: " + patientLogi1,
            icon: 'blue-dot.png'
        });
        lineCoordinates.push(patientLocation);
        /*
        google.maps.event.addListener(location, 'click', function (e)
        {
            var infoWindow = new google.maps.InfoWindow();
            infoWindow.setContent(location.title);
            infoWindow.open(map, location);
        });
        */
    }
    var line = new google.maps.Polyline({
        path: lineCoordinates,
        geodesic: true,
        strokeColor: '‪#‎FF0000‬',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });
    line.setMap(map);
    return false;
}



/*
function fenceBrenceWarning(location_ori, location_des)
{


}

function distance()
{

}
*/
/*
function keyboardListener()
{
    document.onkeydown = function (evt)
    {
        evt = evt || window.event;
        switch (evt.keyCode)
        {
            case 37:
                //leftArrowPressed();
                alert("37");
                break;
            case 39:
                //rightArrowPressed();
                alert("39");
                break;
        }
    };
}
*/