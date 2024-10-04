using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.tema15
{
    public partial class Sabio03 : System.Web.UI.Page
    {
        protected string pSala;
        protected string perg1 = "";
        protected string btTex = "";
        protected int qPerg;

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

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT Count(USR_ID) as tot FROM Perg0015 WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Enviadas = command.ExecuteReader();
                    if (!Enviadas.HasRows)
                    {
                        qPerg = 0;
                    }
                    else
                    {
                        Enviadas.Read();
                        qPerg = Convert.ToInt16(Enviadas["tot"].ToString());
                        Enviadas.Close();
                    }
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Dispose();
            }
        }



    }
}