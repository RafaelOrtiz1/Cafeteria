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
											<a href="{@Url}" >
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
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><em>
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</em> Puebla</h4>
                  </div>
                  <div class="item">
                    <ul> 
                    </ul>
                  </div>
                  <div class="item">
                    <ul>
                      <li>
						  <img src="assets/images/game-02.jpg" alt="" class="templatemo-item"></img>
					  </li>
                      <li><h4>Fortnite</h4><span>Sandbox</span></li>
                      <li><h4>Date Added</h4><span>22/06/2036</span></li>
                      <li><h4>Hours Played</h4><span>740 H 52 Mins</span></li>
                      <li><h4>Currently</h4><span>Downloaded</span></li>
                      <li><div class="main-border-button"><a href="#">Donwload</a></div></li>
                    </ul>
                  </div>
                  <div class="item last-item">
                    <ul>
                      <li>
						  <img src="assets/images/game-03.jpg" alt="" class="templatemo-item"></img>
					  </li>
                      <li><h4>CS-GO</h4><span>Sandbox</span></li>
                      <li><h4>Date Added</h4><span>21/04/2036</span></li>
                      <li><h4>Hours Played</h4><span>892 H 14 Mins</span></li>
                      <li><h4>Currently</h4><span>Downloaded</span></li>
                      <li><div class="main-border-button border-no-active"><a href="#">Donwloaded</a></div></li>
                    </ul>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="main-button">
                    <a href="profile.html">View Your Library</a>
                  </div>
                </div>
              </div>
              <!-- ***** Gaming Library End ***** -->
            </div>
          </div>
        </div>
      </div>


		<!--<xsl:choose>
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
		</xsl:choose>-->
		
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


      </body>

    </html>

	</xsl:template>
	
	
</xsl:stylesheet>
