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
	var mes = now.getMonth() + 1;
	var anio = now.getFullYear();

	mes = mes < 10 ? "0" + mes : mes;
	dia = dia < 10 ? "0" + dia : dia;

	fechaFormated = anio + "-" + mes + "-" + dia;

	console.log(fechaFormated)

	$('#contact_fecha').attr('value', fechaFormated);

});


function enviar_formulario() {

	var fecha_seleccionada = document.getElementById('contact_fecha');

	var fechaObjeto = new Date(fecha_seleccionada.value);

	var dia = fechaObjeto.getDate() + 1;
	var mes = fechaObjeto.getMonth() + 1;
	var anio = fechaObjeto.getFullYear();

	mes = mes < 10 ? "0" + mes : mes;
	dia = dia < 10 ? "0" + dia : dia;

	fecha_seleccionada = anio + "-" + mes + "-" + dia;

	var hora_seleccionada = document.getElementById('contact_hora').value;



	var partes = hora_seleccionada.split(":");
	var horas = parseInt(partes[0]);
	var minutos = parseInt(partes[1]);

	// Crear un objeto Date con la hora actual y ajustar horas y minutos
	let horaObjeto = new Date();
	horaObjeto.setHours(horas);
	horaObjeto.setMinutes(minutos);
	horaObjeto.setSeconds(0); // Ajustar los segundos a 0
	horaObjeto.setMilliseconds(0); // Ajustar los milisegundos a 0

	var horas = horaObjeto.getHours() - 1;
	var minutos = horaObjeto.getMinutes();

	horas = horas < 10 ? "0" + horas : horas;
	minutos = minutos < 10 ? "0" + minutos : minutos;

	hora_seleccionada = horas + ":" + minutos;

	var fecha, hora, personas, personas_add, medio_dia;

	if (fecha_seleccionada < fechaFormated) {
		//succcess
		Swal.fire({
			position: "center",
			icon: "warning",
			title: "La fecha que intentas seleccionar ya ha pasado",
			showConfirmButton: false,
			timer: 1500
		});
	}

	if (hora_seleccionada < formated) {
		//succcess
		Swal.fire({
			position: "center",
			icon: "warning",
			title: "La hora que intentas seleccionar ya ha pasado",
			showConfirmButton: false,
			timer: 1500
		});
	}

	if (fecha_seleccionada == fechaFormated) {
		if (formated == "12:00") {
			if (hora_seleccionada >= "02:00") {
				if (hora_seleccionada >= "08:00" && hora_seleccionada < "19:00") {
					medio_dia = true;
				} else {
					Swal.fire({
						title: "No puede realizarce el registro",
						text: "Solo se puede reservar en horario de 8 a.m - 7:00 p.m",
						icon: "error"
					});
				}
			} else {
				medio_dia = false;
				//No puede realizarce antes de las 2
				Swal.fire({
					title: "No puede realizarce el registro",
					text: "Debe solictar la reservacion a partir de las 2",
					icon: "error"
				});
			}
		}
	}

	if (fechaFormated == fecha_seleccionada) {
		if (formated >= "19:00") {
			Swal.fire({
				title: "No puede realizarce el registro",
				text: "Lo sentimos, por hoy el servicio ya no esta disponible puedes agendar a partir de mañana en un horario de 8 a.m - 7:00 p.m",
				icon: "error"
			});
		} else {
			if (hora_seleccionada >= formated + 2 || medio_dia) {
				if (hora_seleccionada >= "08:00" && hora_seleccionada < "19:00") {
					fecha = true;
					hora = true;
				} else {
					Swal.fire({
						title: "No puede realizarce el registro",
						text: "Solo se puede reservar en horario de 8 a.m - 7:00 p.m",
						icon: "error"
					});
				}
			} else {
				//No puede realizarce la reservacion
				Swal.fire({
					title: "No puede realizarce el registro",
					text: "tiene que crearce con minimo 2 horas de anticipacion",
					icon: "error"
				});
			}
		}
	}

	if (fecha_seleccionada > fechaFormated) {
		if (hora_seleccionada >= "08:00" && hora_seleccionada < "19:00") {
			hora = true;
			fecha = true;
		} else {
			Swal.fire({
				title: "No puede realizarce el registro",
				text: "Solo se puede reservar en horario de 8 a.m - 7:00 p.m",
				icon: "error"
			});
		}
	}

	var total_personas = document.getElementById('contact_people').value;

	if (total_personas >= 1 && total_personas <= 8) {
		personas = true;
	} else {
		//No pueden haber mas de 8 personas en este campo de personas iniciales
		Swal.fire({
			title: "No puede realizarce el registro",
			text: "Debe ser un numero entre 1 y 8 personas iniciales",
			icon: "error"
		});
	}

	var total_personas_add = document.getElementById('contact_add').value;

	if (total_personas_add >= 0 && total_personas_add <= 4) {
		personas_add = true;
	} else {
		//No pueden haber mas de 4 personas en este campo
		Swal.fire({
			title: "No puede realizarce el registro'",
			text: "Debe ser un numero entre 0 y 4 personas adicionales",
			icon: "error"
		});
	}

	if (hora == true && fecha == true && personas == true && personas_add == true) {
		//succcess
		Swal.fire({
			position: "center",
			icon: "success",
			title: "La reservacion ha sido correcta, te esperamos.",
			showConfirmButton: false,
			timer: 1500
		});
	}
}

function suma() {
	var participantes = document.getElementById("contact_people").value;
	var invitados = document.getElementById("contact_add").value;
	let input = document.getElementById("contact_suma");

	participantes = +participantes;
	invitados = +invitados;
	var suma = participantes + invitados;

	input.value = suma.toString();
}