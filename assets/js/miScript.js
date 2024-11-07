//console.log("estoy en mi js")
//function llego() { 
console.log("si llego a java");
//	Swal.fire({
//		position: "top-end",
//		icon: "success",
//		title: "La reservacion ha sido correcta, te esperamos.",
//		showConfirmButton: false,
//	});

//}

var fechaFormated;
var formated;
$(document).ready(function () {
	console.log("Hola desde JQuery");
	var now = new Date(Date.now());
	var timecontrol = document.getElementById("contexat_hora");
	var horas = now.getHours();
	var minutos = now.getMinutes();

	console.log("La fecha es: " + now);
	console.log("La hora actual es: " + horas + ":" + minutos);
	console.log("La hora es: " + horas);
	console.log("Los minutos es: " + minutos);

	if (horas < 10) {
		horas = "0" + horas;
	}
	if (minutos < 10) {
		minutos = "0" + minutos;
	}

	formated = horas + ":" + minutos;

	$('#contact_hora').attr('value', formated);


	var dia = now.getDate();
	var mes = now.getMonth();
	var anio = now.getFullYear();

	mes = mes  > 10 ? "0" + mes : mes;
	dia = dia > 10 ? "0" + dia : dia;

	fechaFormated = anio + "-" + mes + "-" + (dia+1);

	console.log(fechaFormated)

	$('#contact_fecha').attr('value', fechaFormated);

});

function enviar_formulario() {

	var fecha_seleccionada = document.getElementById('contact_fecha');

	if (fechaFormated == fecha_seleccionada && formated < fomated + 2) {
		//No puede realizarce la reservacion
		Swal.fire({
			title: "No puede realizarce la reservacion, tiene que ser con 2 horas de anticipacion",
			text: "Aceptar",
			icon: "error"
		});
	}

	if (formated == 1 && fecha_seleccionada.value >= fechaFormated) {
		var hora_seleccionada = document.getElementById('contact_hora');
		if (hora_seleccionada >= 2) {
			var hora = true;
		} else {
			//No puede realizarce antes de las 2
			Swal.fire({
				title: "No puede realizarce la reservacion antes de las 2",
				text: "Aceptar",
				icon: "error"
			});
		}
	}

	console.log(fecha_seleccionada.value);
	console.log(fechaFormated);

	if (fecha_seleccionada.value > fechaFormated) {
		var hora_seleccionada = document.getElementById('contact_hora');
		if (hora_seleccionada > 8 && hora_seleccionada < 19) {
			var hora = true;
		}
	} else {
		//Solo se puede reservar en horario de 8 a.m - 7:00 p.m
		Swal.fire({
			title: "Solo se puede reservar en horario de 8 a.m - 7:00 p.m",
			text: "Aceptar",
			icon: "error"
		});
	}

	var total_personas = document.getElementById('contact_people');

	if (total_personas.value >= 1 && total_personas.value <= 8) {
		var personas = true;
	} else {
		//No pueden haber mas de 8 personas en este campo de personas iniciales
		Swal.fire({
			title: "No pueden haber mas de 8 personas en este campo de personas iniciales",
			text: "Aceptar",
			icon: "error"
		});
	}

	var total_personas_add = document.getElementById('contact_add');

	if (total_personas_add.value >= 0 && total_personas_add.value <= 4) {
		var personas_add = true;
	} else {
		//No pueden haber mas de 4 personas en este campo
		Swal.fire({
			title: "No pueden haber mas de 4 personas en el campo 'personas adicionales'",
			text: "Debe ser un numero entre 1 y 4 personas adicionales",
			icon: "error"
		});
	}

	if (hora == true && personas == true && total_personas_add == true) {
		//succcess
		Swal.fire({
			position: "top-end",
			icon: "success",
			title: "La reservacion ha sido correcta, te esperamos.",
			showConfirmButton: false,
			timer: 1500
		});
	}
}