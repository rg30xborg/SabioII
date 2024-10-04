using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.sorte.tema0
{
    public partial class Sabio03 : System.Web.UI.Page
    {
        protected int libAps = 0;
        protected int libok = 0;
        protected int libSl = 0;
        protected string libHx = "";
        protected string libTx = "";
        protected string libPr = "";
        protected string libDt = "";    //Premio("PRE_Data")
        protected string libCd = "";    // Premio("PRE_Cod")
        protected Int32 ApPre = 0;

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

            if (Request.QueryString.Count > 0) //QUERIA QUE O REQUEST FOSSE REQUEST.FORM.COUNT (nao cosegui passaem via POST e sim GET
            {
                libAps = Convert.ToInt16(Request["salax"]);
                libHx = Request["salay"];
                libTx = Request["salaz"];

                using (Conexao)
                {
                    string queryString = "SELECT USD_Total, USD_Apts FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                        libok = Convert.ToInt32(UsuarioDados["USD_Total"]);
                        libSl = Convert.ToInt32(UsuarioDados["USD_Apts"]);
                        UsuarioDados.Close();

                        if (libok < libAps || Session["xdemo"].ToString() != "demo01")
                        {
                            Response.Redirect("../../Sabio07.aspx?Err=1");      //http://www.aggora.com.br/sabio/1
                            Response.End();
                        }
                        else
                        {
                            Session["xdemo"] = "";      //para garantia de que não reproduza apostas por repeticao de comando...

                            queryString = "SELECT PRE_Cod, PRE_Desc, PRE_Data, PRE_Apts FROM Premios WHERE HEX(uuid) = '" + libHx + "'";
                            command = new OdbcCommand(queryString, Conexao);

                            OdbcDataReader Premio = command.ExecuteReader();
                            Premio.Read();
                            libPr = Premio["PRE_Desc"].ToString();
                            libDt = Premio["PRE_Data"].ToString();
                            libCd = Premio["PRE_Cod"].ToString();
                            ApPre = Convert.ToInt32(Premio["PRE_Apts"]);
                            Premio.Close();

                            //Adiciono a quantia apostada às apostas no Prêmio
                            queryString = "UPDATE Premios SET PRE_Apts = " + (ApPre + libAps) + " WHERE HEX(uuid) = '" + libHx + "'";
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteReader();

                            //Subtraio a quantia apostada do total do usuário
                            queryString = "UPDATE UserDados SET USD_Total = " + (libok - libAps) + ", USD_Apts = " + (libSl + libAps) + ", USD_Acesso = '" + DateTime.Now + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteReader();

                            //Adiciono a aposta ao Prêmio pelo usuário
                            queryString = "INSERT INTO Premios_Apostas (USR_ID, PRE_Cod, USA_Dez, USA_Apts) VALUES ('" + Session["id"] + "','" + libCd + "','" + libTx + "','" + libAps + "')";
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteReader();
                        }
                        Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        var perg1 = ex.Message;
                    }
                }
                Conexao.Dispose();
            }
        }




    }
}