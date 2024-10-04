using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.sorte.tema2
{
    public partial class Sabio01 : System.Web.UI.Page
    {
        protected int pTotl = 0;
        protected int pSala = 0;
        protected int pCosc = 0;

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
                string queryString = "SELECT USD_Total, USD_Consec, USD_1gm, USD_2gm FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UserDados = command.ExecuteReader();
                    UserDados.Read();
                    pCosc = Convert.ToInt16(UserDados["USD_Consec"].ToString());
                    pTotl = Convert.ToInt32(UserDados["USD_Total"].ToString());
                    pSala = Convert.ToInt32(UserDados["USD_1gm"].ToString());
                    string txt = UserDados["USD_2gm"].ToString();
                    UserDados.Close();

                    if (txt != "new")
                    {
                        if (txt[0] != '?' && txt[0] != '0')
                        {
                            int gparc = Convert.ToInt16(txt.Substring(0, txt.IndexOf("-")));
                            //cred  = Convert.ToInt16(text.Substring(text.IndexOf("!") + 1));
                            if (gparc > 0)
                            {
                                pSala += gparc;
                                pTotl += gparc;
                                txt = "new";
                            }
                        }
                        //GravaSala(Conexao)
                        queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_1gm = " + pSala + ", USD_2gm = '" + txt + "', USD_Acesso = '" + DateTime.Now + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();
                        
                    }
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    var perg1 = ex.Message;
                }
                Conexao.Dispose();
            }

            if (pTotl < 1)
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