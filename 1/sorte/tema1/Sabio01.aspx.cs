using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.sorte.tema1
{
    public partial class Sabio01 : System.Web.UI.Page
    {
        protected int pTotl = 0;
        protected int pSala = 0;

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
                Response.Redirect("../../Sabio12.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UserDados = command.ExecuteReader();
                    UserDados.Read();
                        pTotl = Convert.ToInt32(UserDados["USD_Total"].ToString());
                        pSala = Convert.ToInt32(UserDados["USD_1gm"].ToString());
                    UserDados.Close();
                    Conexao.Close();
                    Conexao.Dispose();
                }
                catch (Exception ex)
                {
                    var perg1 = ex.Message;
                }
            }

            if (pTotl < 2)
            {
                Response.Redirect("../Sabio01.aspx?Err=1");            //http://www.aggora.com.br/sabio/1
                Response.End();
            }
            else
            {
                Session["xdemo"] = "demo01";
                Session["livCav"] = 0;
            }

        }
    }
}