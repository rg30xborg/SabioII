using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.promo
{
    public partial class Sabio04 : System.Web.UI.Page
    {
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

            if (Session["IPUserSab"].ToString() == ":Anonimo:")
            {
                Response.Redirect("Sabio03.aspx?err=3");            //http://www.aggora.com.br/sabio/1/promo/
                Response.End();
            }

            //Pega os dados de cliente
            string perg = Request["perg"];
            string resA = Request["res1"];
            string resB = Request["res2"];
            string resC = Request["res3"];
            string resD = Request["res4"];
            string resE = Request["res5"];
            string spec = Request["spec"];
            string startPage = "";

            if (perg == "" || resA == "" || resB == "" || resC == "" || resD == "" || resE == "")
            {
                Response.Redirect("Sabio03.aspx?err=1");     //http://www.aggora.com.br/sabio/1/promo/
                Response.End();
            }
            else
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string ax = Request["email_indicado"];
                    //Checa se Indicado ja é usuário
                    string queryString = "SELECT MAX(Codigo) AS max_Cod FROM Perg0015";
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        int nPerg = 0;
                        Conexao.Open();
                        OdbcDataReader NPergunta = command.ExecuteReader();
                        if (!NPergunta.HasRows)
                            nPerg = 1;
                        else
                        {
                            NPergunta.Read();
                                nPerg = Convert.ToInt16(NPergunta["max_Cod"].ToString()) + 1;
                            NPergunta.Close();
                        }

                        string ex = Session["mail"].ToString();
                        perg = nPerg + ". " + perg + " - (por: " + Session["IPUserSab"] + ")";
                        string ip = "InternoIP";
                        if (local.IndexOf("localhost") < 0)
                            ip = Request.ServerVariables["REMOTE_HOST"];
                        string msg = Session["IPUserSab"] + ": Parabéns por sua participação na Promoção Perguntas de Usuários (nº " + nPerg + "). Você já faturou 50 pts. Dica! - Envie quantas desejar.";

                        queryString = "INSERT INTO Perg0015(USR_ID, Pergunta, a, b, c, d, e, Resposta, ip, valido) VALUES(" + Session["id"] + ",'" + perg + "','" + resA + "','" + resB + "','" + resC + "','" + resD + "','" + resE + "','" + spec + "','" + ip + "','" + 1 + "')";
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        queryString = "INSERT INTO Eventos(USR_ID, EVN_Email, EVN_Desc, EVN_Tipo) VALUES (" + Session["id"] + ",'" + ex + "','" + msg + "','Promoção Perguntas')";
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        queryString = "SELECT * FROM UserDados WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader Pontos = command.ExecuteReader();
                        Pontos.Read();
                            int pTotl = Convert.ToInt32(Pontos["USD_Total"].ToString()) + 50;
                            int pPerg = Convert.ToInt16(Pontos["USD_Pergunta"].ToString()) + 50;
                        Pontos.Close();

                        //Adiciono os pontos pela pergunta valida -depois posso retirar este ponto se a pergunta não for (TO DO)
                        queryString = "UPDATE UserDados SET USD_TOTAL = " + pTotl + ", USD_Pergunta = " + pPerg + ", USD_Acesso = '" + DateTime.Now + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        startPage = "Sabio03.aspx?ok=1";      //http://www.aggora.com.br/sabio/1/promo/

                    }
                    catch (Exception err)
                    {
                        var Erro = err.Message;
                    }
                    Conexao.Close();
                    Conexao.Dispose();
                }

                if (startPage != "")
                {
                    Response.Redirect(startPage);
                    Response.End();
                }
            }

        }


    }
}