using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1
{
    public partial class Sabio01a : System.Web.UI.Page
    {
        protected string lgg = "0";
        protected string pas = "0";
        protected string usr = "0";
        protected string msgIn = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");         //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (Session["IPUserSab"] != null)
                if (Session["IPUserSab"].ToString() != "")
                {
                    Response.Redirect("sabio05.htm");       //http://www.aggora.com.br/sabio/1/
                    Response.End();
                }

            if (Request.QueryString["log"] != "") lgg = Request.QueryString["log"];
            if (Request.QueryString["pas"] != "") pas = Request.QueryString["pas"];
            if (Request.QueryString["usr"] != "") usr = Request.QueryString["usr"];

            //msgIn = Request.Cookies["Sabichao"]["nome"];
            //if (Session["logmail"] != null && Session["logmail"].ToString() != "") msgIn = Session["logmail"].ToString();
            //userlogon.Text = msgIn;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string senha = userpassw.Text;

            // Calcula a senha com base na string senha e armazena na string senhaCriptografada 
            // Neste caso senha = '123456' retorna string 'E10ADC3949BA59ABBE56E057F20F883E'
            string senhaCriptografada = MD5Hash.CalculaHash(senha);

            //logonForm.Submit();
            string pageInclude = "Sabio10.aspx" + "?userlogon=" + userlogon.Text + "&userpassw=" + senhaCriptografada; // + "'"
            Response.Redirect(pageInclude);
            Response.End();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string senha = userpassw.Text;

            // Calcula a senha com base na string senha e armazena na string senhaCriptografada 
            // Neste caso senha = '123456' retorna string 'E10ADC3949BA59ABBE56E057F20F883E'
            string senhaCriptografada = MD5Hash.CalculaHash(senha);

            //logonForm.Submit();
            string pageInclude = "Sabio10.aspx" + "?userlogon=" + userlogon.Text + "&userpassw=" + senhaCriptografada; // + "'"
            Response.Redirect(pageInclude);
            Response.End();
        }

    }
}