using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.promo
{
    public partial class Sabio05 : System.Web.UI.Page
    {
        protected string cod;
        protected string perg = "";
        protected string resA = "";
        protected string resB = "";
        protected string resC = "";
        protected string resD = "";
        protected string resE = "";
        protected string spec = "";
        protected int ok = 0;
        protected int err1 = 0;

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

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);

            if (Request["codR"] != null)
            {
                cod = Request["codR"];
                perg = Request["perg"];
                resA = Request["res1"];
                resB = Request["res2"];
                resC = Request["res3"];
                resD = Request["res4"];
                resE = Request["res5"];
                spec = Request["spec"];

                if (perg != "" && resA != "" && resB != "" && resC != "" && resD != "" && resE != "")
                {
                    ok = 1;
                    using (Conexao)
                    {
                        string queryString = "UPDATE Perg0015 SET Pergunta = '" + perg + "',a = '" + resA + "',b = '" + resB + "',c = '" + resC + "',d = '" + resD + "',e = '" + resE + "',Resposta = '" + spec + "' WHERE Codigo = " + cod;
                        OdbcCommand command = new OdbcCommand(queryString, Conexao);
                        // Open the connection in a try/catch block.
                        try
                        {
                            Conexao.Open();
                                command.ExecuteNonQuery();
                            Conexao.Close();
                        }
                        catch (Exception err)
                        {
                            var Erro = err.Message;
                        }
                    }
                }
                else
                    err1 = 1;
            }
            else
            {
                cod = Request["cod"].ToString();
                //Le informacoes no banco de dados
                using (Conexao)
                {
                    string queryString = "SELECT * FROM Perg0015 WHERE Codigo = " + cod;
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader Pergunta = command.ExecuteReader();
                        Pergunta.Read();
                            spec = Pergunta["Resposta"].ToString();
                            perg = Pergunta["Pergunta"].ToString();
                            resA = Pergunta["a"].ToString();
                            resB = Pergunta["b"].ToString();
                            resC = Pergunta["c"].ToString();
                            resD = Pergunta["d"].ToString();
                            resE = Pergunta["e"].ToString();
                        Pergunta.Close();
                        Conexao.Close();
                    }
                    catch (Exception err)
                    {
                        var Erro = err.Message;
                    }
                }

            }
        }
    }
}