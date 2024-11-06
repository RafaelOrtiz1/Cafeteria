<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

	<!--La etiqueta output para determinar el metodo de salida-->
	<xsl:output method="html" indent="yes"/>

	<!--creamos variable que reciba parametro desde el procesador-->
	<!--name el nombre de la variable-->
	<!--selec establece el origen-->

	<xsl:param name = "TipoMenu" select="TipoMenu"></xsl:param>

	<!--El primer template que haga match con el nood padre de XML-->

	<xsl:template match="Menu">
		<html lang="en">

			<head>

				<meta charset="utf-8"></meta>
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>

				<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900" rel="stylesheet"></link>

				<title>Cyborg - Awesome HTML5 Template</title>

				<!-- Bootstrap core CSS -->
				<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>


				<!-- Additional CSS Files -->
				<link rel="stylesheet" href="assets/css/fontawesome.css"></link>
				<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css"></link>
				<link rel="stylesheet" href="assets/css/owl.css"></link>
				<link rel="stylesheet" href="assets/css/animate.css"></link>
				<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
		
		<!--
		

    TemplateMo 579 Cyborg Gaming

    https://templatemo.com/tm-579-cyborg-gaming

    -->
			</head>

			<body>

				<!-- ***** Preloader Start ***** -->
				<div id="js-preloader" class="js-preloader">
					<div class="preloader-inner">
						<span class="dot"></span>
						<div class="dots">
							<span></span>
							<span></span>
							<span></span>
						</div>
					</div>
				</div>
				<!-- ***** Preloader End ***** -->

				<!-- ***** Header Area Start ***** -->
				<header class="header-area header-sticky">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<nav class="main-nav">
									<!-- ***** Logo Start ***** -->
									<a href="index.html" class="logo">
										<img src="assets/images/logo.png" alt=""></img>
									</a>
									<!-- ***** Logo End ***** -->
									<!-- ***** Search End ***** -->
									<div class="search-input">
										<form id="search" action="#">
											<input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
											<i class="fa fa-search"></i>
										</form>
									</div>
									<!-- ***** Search End ***** -->
									<!-- ***** Menu Start ***** -->
									<ul class="nav">
										<xsl:for-each select="Opciones/Opcion">
											<li>
												<xsl:choose>
													<xsl:when test="expression">
														<a href="{@Url}" class="active" style="color: #F99">
															<xsl:value-of select="@Texto" />
														</a>
													</xsl:when>
													<xsl:otherwise>
														<a href="{@Url}" >
															<xsl:value-of select="@Texto"/>
														</a>
													</xsl:otherwise>
												</xsl:choose>

											</li>
										</xsl:for-each>

									</ul>
									<a class='menu-trigger'>
										<span>Menu</span>
									</a>
									<!-- ***** Menu End ***** -->
								</nav>
							</div>
						</div>
					</div>
				</header>
				<!-- ***** Header Area End ***** -->

				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="page-content">

								<!-- ***** Banner Start ***** -->

								<!-- ***** Gaming Library Start ***** -->
								<div class="gaming-library">
									<div class="col 12">
										<xsl:choose>
											<xsl:when test="$TipoMenu = 0">
												<xsl:call-template name="Home"></xsl:call-template>
											</xsl:when>
											<xsl:when test="$TipoMenu = 1">
												<xsl:call-template name="Carta"></xsl:call-template>
											</xsl:when>
											<xsl:when test="$TipoMenu = 2">
												<xsl:call-template name="Contacto"></xsl:call-template>
											</xsl:when>
											<xsl:when test="$TipoMenu = 3">
												<xsl:call-template name="PlayRoom"></xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="Home"></xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>

									</div>
									<div class="col-lg-12">
										<div class="main-button">
											<a href="profile.html">Volver arriba</a>
										</div>
									</div>
								</div>
								<!-- ***** Gaming Library End ***** -->
							</div>
						</div>
					</div>
				</div>




				<footer>
					<div class="container">
						<div class="row">
							<div class="col-lg-12">

							</div>
						</div>
					</div>
				</footer>


				<!-- Scripts -->
				<!-- Bootstrap core JavaScript -->
				<script src="vendor/jquery/jquery.min.js"></script>
				<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

				<script src="assets/js/isotope.min.js"></script>
				<script src="assets/js/owl-carousel.js"></script>
				<script src="assets/js/tabs.js"></script>
				<script src="assets/js/popup.js"></script>
				<script src="assets/js/custom.js"></script>
				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>


			</body>

		</html>

	</xsl:template>


	<!--Templates-->

	<xsl:template name="Home">
		<div class="item" align="Center" >

			<div class="heading-section">
				<h4>
					<em>Platillos principales</em> del día
				</h4>
			</div>

			<!--Platillos exepto bebidas-->
			<xsl:for-each select="Platillos/Tipo[@Nombre != 'Bebidas']/Platillo[@Orden=1]">
				<ul>
					<div align="center">
						<li>
							<h2>
								<xsl:value-of select="../@Nombre"></xsl:value-of>
							</h2>
						</li>
					</div>
					<div class="">
						<li>
							<img src="{Imagen}" alt="Imagen relativa" class="templatemo-item"></img>
						</li>
						<li>
							<h4>
								<xsl:value-of select="@Nombre"></xsl:value-of>
							</h4>
							<span>Platillo</span>
						</li>
						<li>
							<h4>
								<xsl:value-of select="Descripcion"></xsl:value-of>
							</h4>
							<span>Descricion</span>
						</li>
						<li>
							<h4>
								<xsl:value-of select="Precio"></xsl:value-of>
							</h4>
							<span>Precio</span>
						</li>
						<li>
							<div class="main-border-button">
								<a href="#">Ordenar</a>
							</div>
						</li>
					</div>
				</ul>

			</xsl:for-each>

			<div class="most-popular">
				<div class="row">
					<div class="col-lg-12">
						<div class="heading-section">
							<h4>
								<em>Más popular</em> Especialidad
							</h4>
						</div>
						<xsl:for-each select="Platillos/Tipo/Platillo[@Especialidad='SI']">
							<ul>
								<div align="center">
									<li>
										<h2>
											<xsl:value-of select="../@Nombre"></xsl:value-of>
										</h2>
									</li>
								</div>
								<div class="">
									<li>
										<img src="{Imagen[position()=1]}" alt="Imagen relativa" class="templatemo-item"></img>
									</li>
									<li>
										<h4>
											<xsl:value-of select="@Nombre"></xsl:value-of>
										</h4>
										<span>Platillo</span>
									</li>
									<li>
										<h4>
											<xsl:value-of select="Descripcion"></xsl:value-of>
										</h4>
										<span>Descricion</span>
									</li>
									<li>
										<h4>
											<xsl:value-of select="Precio"></xsl:value-of>
										</h4>
										<span>Precio</span>
									</li>
									<li>
										<div class="main-border-button">
											<a href="#">Ordenar</a>
										</div>
									</li>
								</div>
							</ul>
							<br></br>
							<div class="col-lg-3 col-sm-6">
								<h4>
									<xsl:value-of select="TextoEspecial"></xsl:value-of>
								</h4>
							</div>
							<br></br>
							<div class="col-lg-3 col-sm-6">
								<h4>Ingredientes:</h4>
								<br></br>
								<xsl:for-each select="Ingredientes/Ingrediente[position()>1]">
									<h2>

										<xsl:value-of select="@Nombre"></xsl:value-of>
									</h2>
									<p>

										<xsl:value-of select="Ingredientes/Ingrediente[position()=1]"></xsl:value-of>
									</p>
									<img src="{@Imagen}" alt="Imagen relativa" class="templatemo-item"></img>
									<br></br>
									<br></br>
								</xsl:for-each>

							</div>
						</xsl:for-each>


					</div>
				</div>
			</div>


			<!-- ======= Specials Section ======= -->

			<div>

				<div class="section-title">
					<h2>Bebidas</h2>
					<p>Puedes acompañar tu comida con..</p>
				</div>

				<ul >
					<li >
						<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
							<xsl:choose>
								<xsl:when test="@Orden = 1">
									<a href="#tab-{@Orden}" class="active">
										<xsl:value-of select="@Nombre"></xsl:value-of>
									</a>
								</xsl:when>
								<xsl:otherwise>
									<a href="#tab-{@Orden}">
										<xsl:value-of select="@Nombre"></xsl:value-of>
									</a>
								</xsl:otherwise>
							</xsl:choose>

						</xsl:for-each>
					</li>
				</ul>


				<ul >
					<li >
						<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
							<xsl:choose>
								<xsl:when test="@Orden = 1">
									<div class="tab-content">
										<div class="tab-pane active show" id="tab-1">
											<div class="row">
												<div class="col-lg-8 details order-2 order-lg-1">
													<h3>
														<xsl:value-of select="@Nombre"></xsl:value-of>
													</h3>
													<h3>
														<xsl:value-of select="Descripcion"></xsl:value-of>
													</h3>
													<h3>
														<xsl:value-of select="Precio"></xsl:value-of>
													</h3>
												</div>
												<div class="col-lg-4 text-center order-1 order-lg-2">
													<img src="{Imagen}" alt="" class="img-fluid"></img>
												</div>
											</div>
										</div>
									</div>
									</xsl:when>
								<xsl:otherwise>
									<div class="tab-content">
										<div class="tab-pane show" id="tab-1">
											<div class="row">
												<div class="col-lg-8 details order-2 order-lg-1">
													<h3>
														<xsl:value-of select="@Nombre"></xsl:value-of>
													</h3>
													<h3>
														<xsl:value-of select="Descripcion"></xsl:value-of>
													</h3>
													<h3>
														<xsl:value-of select="Precio"></xsl:value-of>
													</h3>
												</div>
												<div class="col-lg-4 text-center order-1 order-lg-2">
													<img src="{Imagen}" alt="" class="img-fluid"></img>
												</div>
											</div>
										</div>
									</div>
								</xsl:otherwise>
							</xsl:choose>

						</xsl:for-each>
					</li>
				</ul>



				<!-- End testimonial item -->

			</div>

		</div>

	</xsl:template>

	<xsl:template name="Carta">
		<div class="item" align="Center" >

			<div class="heading-section">
				<h4>
					<em>Prueba nuestros platillos</em> del día
				</h4>
			</div>

			<!--Platillos exepto bebidas-->
			<xsl:for-each select="Platillos/Tipo">
				<ul>
					<li data.filter=".filter-{@Nombre}"></li>
					<div align="center">
						<li data.filter=".filter-{@Nombre}">
							<h2>
								<xsl:value-of select="@Nombre"></xsl:value-of>
							</h2>
						</li>
					</div>
				</ul>

			</xsl:for-each>

			<xsl:for-each select="Platillos/Tipo/Platillo">
				<div class="filter-{@Nombre}">
					<div class="tab-content">
						<div class="tab-pane show filter{../@Nombre}" id="tab-1">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<h3>
										<xsl:value-of select="@Nombre"></xsl:value-of>
									</h3>
									<p>
										<xsl:value-of select="Descripcion"></xsl:value-of>
									</p>
									<p>
										<xsl:value-of select="Precio"></xsl:value-of>
									</p>
								</div>
								<div class="col-lg-4 text-center order-1 order-lg-2">
									<img src="{Imagen}" alt="" class="img-fluid" width="100"></img>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:for-each>
			
		</div>

	</xsl:template>

	<xsl:template name="Contacto">
		<section id="contact" class="contact">
			<div data-aos="fade-up">
				<style>
					#map{
					border:0;
					width:100%;
					height: 350px;
					}

					#container2{
					background-color: blue;
					}
				</style>
				<div id="googlw-map">
					<div id="map"></div>
				</div>
				<text id="direccion">Ubicacion</text>
				<div class="col-lg12 margin-bottom-30" id="street"></div>

				<div class="container2" data-aos="fade-up">
					<div class="row mt-5">
						<!--Datos de contacto-->
						<div class="col-lg-4">
							<div class="info">
								<div class="address">
									<i class="bi bi-geo.alt"></i>
									<h4>Direccion</h4>
									<h5>
										<xsl:value-of select="Datos/Direccion"></xsl:value-of>
									</h5>
								</div>
								<br></br>
								<div class="open-hours">
									<i class="bi bi-geo.alt"></i>
									<h4>Horario</h4>
									<h5>
										<xsl:for-each select="Datos/Horarios/Horario">
											<div>
												<xsl:value-of select="."></xsl:value-of>
											</div>	
										</xsl:for-each>
										
									</h5>
								</div>
								<br></br>
								<div class="email">
									<i class="bi bi-geo.alt"></i>
									<h4>Correo</h4>
									<h5>
										<xsl:value-of select="Datos/correo"></xsl:value-of>
									</h5>
								</div>
								<br></br>
								<div class="phone">
									<i class="bi bi-geo.alt"></i>
									<h4>Telefono</h4>
									<h5>
										<xsl:value-of select="Datos/Telefono"></xsl:value-of>
									</h5>
								</div>
							</div>
						</div>
						
					</div>
					<!--Formulario-->
					<div class="col-lg-8 mt-5 mt-lg-0">
						<form action="#" method="post" role="form" class="php-email-form">
							<div class="row">
								<div class="col-md-6 form-group">
									<input type="text" name="contact_name" class="form-control" id="contact-name" placeholder="Ingresa tu nombre" required="true"></input>
								</div>
								<div class="col-md-6 form-group">
									<input type="email" name="Email" class="form-control" id="contact-email" placeholder="Ingresa tu correo" required="true"></input>
								</div>
								<div class="col-md-6 form-group">
									<input type="number" name="contact_people" class="form-control" id="contact-people" max="4" min="0"  placeholder="Numero de personas" required="true"></input>
								</div>
								<div class="col-md-6 form-group">
									<input type="number" name="contact_add" class="form-control" id="contact-add" max="4" min="0" placeholder="Numero de personas adicionales" required="true"></input>
								</div>
								<div class="col-md-6 form-group">
									<input type="date" name="contact_fecha" class="form-control" id="contact-fecha"  required="true"></input>
								</div>
								<div class="col-md-6 form-group">
									<input type="time" name="contact_hora" class="form-control" id="contact-hora" required="true" max="10:00:00" min="08:00:00"></input>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<output id="total" class="form-control" disable="true"></output>
								</div>
							</div>

							<div class="text-center">
								<a class="book-a-table-btn" id="miBoton" onclick="enviar_formulario()" >Presionar</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<script>
			$(document).ready(function(){
				console.log("Hola desde JQuery");
				var now = new Date(Date.now());
				var timecontrol = document.getElementById("contexat_hora");
				var horas = now.getHours();
				var minutos = now.getMinutes();
			
				console.log("La fecha es: "+ now);
				console.log("La hora actual es: " + horas + ":" + minutos);
				console.log("La hora es: "+ horas);
				console.log("Los minutos es: "+ minutos);
			});
			
			<!--rFecha del servido-->
			
			
		
		</script>
	</xsl:template>

	<xsl:template name="PlayRoom">
		<h1>PlayRoom</h1>
	</xsl:template>

</xsl:stylesheet>

