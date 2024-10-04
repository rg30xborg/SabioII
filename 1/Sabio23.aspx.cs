using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1
{
    public partial class Sabio23 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                     //http://www.aggora.com.br/sabio
                Response.End();
            }

            string senha = "sabioquiz";
            string ip = Request.ServerVariables["REMOTE_HOST"];
            string nome = ":Anonimo:";
            string email = "0000" + (local.IndexOf("localhost") >= 0 ? "Interno" : ip);

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT * FROM Users WHERE USR_Email='" + email + "'";
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UserExist = command.ExecuteReader();
                    if (!UserExist.HasRows)
                    {
                        int NewCod = 0;
                        queryString = "INSERT INTO Users(USR_Nome, USR_Email, USR_Senha, USR_IP) VALUES('" + nome + "','" + email + "','" + senha + "','" + ip + "')";
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        command1.ExecuteReader();           //OdbcDataReader UserNew = 

                        queryString = "SELECT MAX(USR_ID) AS max_cod FROM Users";
                        OdbcCommand command2 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader UserMax = command2.ExecuteReader();
                        UserMax.Read();
                            NewCod = Convert.ToInt16(UserMax["max_cod"]);
                        UserMax.Close();

                        queryString = "INSERT INTO UserDados (USR_ID, USR_Email) VALUES('" + NewCod + "','" + email + "')";
                        OdbcCommand command3 = new OdbcCommand(queryString, Conexao);
                        command3.ExecuteReader();       //OdbcDataReader UserDdd = 

                        Session["id"] = NewCod;
                    }
                    else
                    {
                        UserExist.Read();
                        Session["id"] = UserExist["USR_ID"];
                        UserExist.Close();
                    }

                    if (email.IndexOf("Interno") < 0)
                    {
                    queryString = "Insert Into Demos(DEM_Tipo, DEM_IP) values('1','" + ip + "')";
                    OdbcCommand command4 = new OdbcCommand(queryString, Conexao);
                    command4.ExecuteReader();
                    }

                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    var perg1 = ex.Message;
                }
            }
            Conexao.Dispose();
            Session["IPUserSab"] = nome;
            Session["mail"] = email;

            Response.Redirect("sabio05.htm");               //http://www.aggora.com.br/sabio/1/
            Response.End();

        }


    }
}