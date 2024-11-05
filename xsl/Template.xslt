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
		<xsl:value-of select="Datos/NombreRestaurant"/>
	</xsl:template>
	
	
</xsl:stylesheet>
