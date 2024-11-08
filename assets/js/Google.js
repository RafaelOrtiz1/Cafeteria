//Compruebo que mi referencia este bien echa

console.log("SCRIPT GOOGLE");

$(document).ready(function () {
    obtenerUbicacion();
})

function obtenerUbicacion() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion, mostrarError);
    } else {
        alert("La geolocalizacion no la soporta este navegador");
    }

    //Funcion para mostrar la direccion

    function mostrarUbicacion(position) {
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;

        console.log("Latitude: " + lat + "Longitud:" + lon);

        obtenerDireccion(lat, lon);
        initMapComponents(lat, lon);
    }

    function mostrarError(error) {
        switch (error.code) {
            case error.PERMISSION_DENIED:
                alert("El usuario nego el permiso de la ubicacion");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("La ubicacion no esta disponible");
                break;
            case error.TIMEOUT:
                alert("Se agoto el tiempo de espera");
                break;
            default:
                alert("Error desconocido" + error.message);
                break;
        }
    }
}

function obtenerDireccion(lat, lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status === 'OK') {
            console.log(results);
            if (results[0]) {

                const direccion = results[0].formatted_address;
                document.getElementById('direccion').innerText = "Direccion: " + direccion;
            } else {
                alert("No se encontraron resoltados en la direccion.");
            }
        } else {
            alert("Geocodificacion fallida: " + status);
        }
    });
}

function initMapComponents(lat, lon) {

    const ubicacion = { lat: lat, lng: lon };

    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    }); 

    //Añadir un marcador en el mapa
    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubicacion Actual"
    });

    //Configurar Street View
    const panorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    }
    );

    mapa.setStreetView(panorama);

}