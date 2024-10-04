using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sabio._1.promo
{
    public partial class Sabio01 : System.Web.UI.Page
    {
        protected string erro = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");         //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (Session["IPUserSab"] == null || (Session["IPUserSab"].ToString() == "" && Session["mail"].ToString() == ""))
            {
                Response.Redirect("../Sabio12.aspx");                 //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            if (Request["err"] == "1") erro = "<b>Seu Amigo já foi Indicado nesta Promoção no nosso Site</b>";
            else if (Request["err"] == "2") erro = "<b>Seu Amigo ja é Usuario do Site Sabichão</b>";
            else if (Request["err"] == "3") erro = "<b>DADOS CADASTRAIS INCOMPLETOS - ATUALIZE-OS EM: <a href='../Sabio04.aspx'>[Dados Usuários]</a>.</b>";
        }
    }
}