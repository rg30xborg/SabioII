using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sabio._1.tema2
{
    public partial class Sabio03 : System.Web.UI.Page
    {
        protected string pSala;

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

            pSala = Request["ptSala"];
        }
    }
}