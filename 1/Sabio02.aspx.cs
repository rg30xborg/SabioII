using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1
{
    public partial class Sabio02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");             //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (Request["ID"] == "") {
                Response.Redirect("Sabio01.aspx");             //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            string refC = Request["ID"];
            string voto = Request["Voto"];
            int tvot = 0; int clik = 0;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT * FROM Enquetes WHERE ENQ_Cod = " + refC;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                        OdbcDataReader reader = command.ExecuteReader();
                        reader.Read();
                            tvot = Convert.ToInt16(reader[voto].ToString()) + 1;
                            clik = Convert.ToInt16(reader["ENQ_Total"].ToString()) + 1;
                        reader.Close();

                        queryString = "UPDATE Enquetes SET ENQ_Total = " + clik + ", " + voto + " = " + tvot + " WHERE ENQ_Cod = " + refC;
                        command = new OdbcCommand(queryString, Conexao);
                        // Open the connection in a try/catch block.
                        command.ExecuteReader();
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    var perg1 = ex.Message;
                }

                Conexao.Dispose();
            }

            Response.Redirect("Sabio01.aspx");         //http://www.aggora.com.br/sabio/1/
            Response.End();

        }
    }
}