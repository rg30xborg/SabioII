using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.empre
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

            string refC = Request["ref"];
            string Lref = "";

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT * FROM Patrocinio WHERE PAT_Cod = " + refC;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Clicks = command.ExecuteReader();
                    Clicks.Read();
                        Lref = Clicks["PAT_Link"].ToString();
                        string Eref = Clicks["PAT_Nome"].ToString();
                        int clik = Convert.ToInt16(Clicks["PAT_Click"]) + 1;
                    Clicks.Close();

                    queryString = "UPDATE Patrocinio SET PAT_Click = " + clik + " WHERE PAT_Cod = " + refC;
                    command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    command.ExecuteNonQuery();

                    queryString = "SELECT USD_Total, USD_1em, USD_ClickP FROM UserDados WHERE USR_ID = " + Session["id"];
                    command = new OdbcCommand(queryString, Conexao);
                    OdbcDataReader Bonus = command.ExecuteReader();
                    Bonus.Read();
                        string text = Bonus["USD_1em"].ToString();
                        int pTotl = (int)Bonus["USD_Total"] + 100;
                        int pPrem = (int)Bonus["USD_ClickP"] + 100;
                    Bonus.Close();

                    string pClik = text.Substring(text.IndexOf("Clik:") + 5);   //cPerg:1Sala:0Data:28/05/2008Qtde:1Clik:no
                    if (pClik == "no") {
                        string pResp = text.Substring(0, 1);
                        string pPerg = text.Substring(text.IndexOf("Perg:") + 5, (text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5)));
                        int pSala = Convert.ToInt16(text.Substring(text.IndexOf("Sala:") + 5, (text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5))));
                        string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));
                        string pQtde = text.Substring(text.IndexOf("Qtde:") + 5, (text.IndexOf("Clik:") - (text.IndexOf("Qtde:") + 5)));

                        text = pResp + "Perg:" + pPerg + "Sala:" + pSala + "Data:" + pData + "Qtde:" + pQtde + "Clik:ok";
                        string msg = Session["IPUserSab"] + " voce faturou 100 PONTOS EXTRAS por seu Clique no Banner da (" + Eref + "). Nota! - Prêmio disponível apenas uma vez por dia.";

                        queryString = "UPDATE UserDados SET USD_1em = '" + text + "', USD_Total = " + pTotl + ", USD_ClickP = " + pPrem + ", USD_Acesso = '" + DateTime.Now + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        queryString = "INSERT INTO Eventos (USR_ID, EVN_Email, EVN_Desc, EVN_Tipo) VALUES (" + Session["id"] + ",'" + Session["mail"] + "','" + msg + "','Clique Premiado')";
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                    }
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    Conexao.Close();
                    Conexao.Dispose();
                    Response.Redirect(ex.HelpLink);         //http://www.aggora.com.br/sabio/1/empre/
                    Response.End();
                }
                Conexao.Dispose();
            }
            Response.Redirect(Lref);
            Response.End();
        }
    }
}