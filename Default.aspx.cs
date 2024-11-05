using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;

public partial class _Default : System.Web.UI.Page
{
    //Declarar una variable global
    public string tipomenu = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Recuperar variable validando si existe en URL (xml)

        if (Request.QueryString["id"] == null) {
            tipomenu = "0";
        }else {
            tipomenu = Request.QueryString["id"];
        }

        TranformarXML();
    }


    //Procesador de XSLT
    private void TranformarXML() {
        //Recuperamos rutas de XML Y XSL

        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/menu.xml";
        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xsl/Template.xslt";

        //Necesitamos inyeccion de dependencia colocar arriba en dependencias "using Sistem.xml"
        XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);

        //Configuramos las credenciales para resolver recursos externos como XSLT

        XmlUrlResolver resolver = new XmlUrlResolver();
        resolver.Credentials = CredentialCache.DefaultCredentials;

        //Credenciales para poder acceder XSLT
        //true son para ser tratados como un documento

        XsltSettings settings = new XsltSettings(true, true);

        //Leemos el archivo slt y lo cargamos para su transformacion

        XslCompiledTransform xslt = new XslCompiledTransform();
        xslt.Load(xsltPath, settings, resolver);

        //Almacenamos el resultado de la informacion

        StringBuilder stringBuilder = new StringBuilder();
        TextWriter textwriter = new StringWriter(stringBuilder);

        //Configuramos los argumentos para la trasnformacion

        XsltArgumentList xsltArgumentList = new XsltArgumentList();

        //Pasamos la variable de tipo menu a xslt
        xsltArgumentList.AddParam("TipoMenu", "", tipomenu);

        //Trasnformamos el XML A HTML usando XSLT

        xslt.Transform(xmlTextReader, xsltArgumentList, textwriter );
        
        //Obtenemos el resultado de la transformacion en una sola cadena
        
        string resultado = stringBuilder.ToString();

        //escribimos el resultado como una respuesta HTTP
        Response.Write( resultado );

    }

}