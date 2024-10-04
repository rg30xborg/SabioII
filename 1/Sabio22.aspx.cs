using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sabio._1
{
    public partial class Sabio22 : System.Web.UI.Page
    {

        protected string Salas(int Sala) {
            string nSala = "";
            switch (Sala) {
                case 1:  nSala = "Esportes I"; break;
                case 2:  nSala = "Enforcado"; break;
                case 3:  nSala = "Incógnita"; break;
                case 4:  nSala = "Temporal"; break;
                case 5:  nSala = "Informática"; break;
                case 6:  nSala = "Variedades"; break;
                case 7:  nSala = "Televisão"; break;
                case 8:  nSala = "Esportes II"; break;
                case 9:  nSala = "Cinema"; break;
                case 10: nSala = "Trânsito"; break;
                case 11: nSala = "Atualidades"; break;
                case 12: nSala = "Na Escola"; break;
                case 13: nSala = "Dicionário"; break;
                case 14: nSala = "Seu Talento"; break;
                case 15: nSala = "De Usuários"; break;
                default: nSala = "Esportes I"; break;
            }
            return nSala;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                  //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (Session["IPUserSab"] == null || (Session["IPUserSab"].ToString() == "" && Session["mail"].ToString() == ""))
            {
                Response.Redirect("Sabio12.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();
            }


        }
    }
}