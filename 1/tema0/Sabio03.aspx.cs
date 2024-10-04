using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.tema0
{
    public partial class Sabio03 : System.Web.UI.Page
    {
        protected Int16 libAps = 0;
        protected Int16 libok = 0;
        protected Int16 libSl = 0;
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
            if (local.IndexOf("www.aggora.com.br") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                  //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (Session["IPUserSab"].ToString() == "" || Session["mail"].ToString() == "")
            {
                Response.Redirect("Sabio12.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);

            if (Request.Form.Count > 0)
            {
                libAps = Convert.ToInt16(Request.Form["salax"]);
                libHx = Request.Form["salay"];
                libTx = Request.Form["salaz"];

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
                        libok = Convert.ToInt16(UsuarioDados["USD_Total"]);
                        libSl = Convert.ToInt16(UsuarioDados["USD_Apts"]);
                        UsuarioDados.Close();

                        if (libok < libAps || Session["xdemo"] != "demo01") {
                            Response.Redirect "http://www.aggora.com.br/sabio/1/sabio07.asp?Err=1"
                            Response.End
                        } else { 

                            Session("xdemo") = ""   'para garantia de que não reproduza apostas por repeticao de comando...

                            Set Premio = Server.CreateObject("ADODB.Recordset")

                            Premio.Open "SELECT PRE_Cod, PRE_Desc, PRE_Data, PRE_Apts FROM Premios WHERE HEX(uuid) = '" & libHx & "'", Conexao
                                libPr = Premio("PRE_Desc")

                                libDt = Premio("PRE_Data")

                                libCd = Premio("PRE_Cod")

                                ApPre = CInt(Premio("PRE_Apts"))

                            Premio.Close
                            Set Premio = Nothing


                        'Adiciono a quantia apostada às apostas no Prêmio

                            Conexao.Execute "UPDATE Premios SET PRE_Apts = " & CInt(ApPre + libAps) & " WHERE HEX(uuid) = '" & libHx & "'"


                        'Subtraio a quantia apostada do total do usuário

                            Conexao.Execute "UPDATE UserDados SET USD_Total = " & CInt(libok - libAps) & ", USD_Apts = " & CInt(libSl + libAps) & " WHERE USR_ID = " & Session("id")


                        'Adiciono a aposta ao Prêmio pelo usuário

                            Conexao.Execute "INSERT INTO Premios_Apostas (USR_ID, PRE_Cod, USA_Dez, USA_Apts) VALUES ('" & Session("id") & "','" & libCd & "','" & libTx & "','" & libAps & "')"


                        }

                        //Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        var perg1 = ex.Message;
                    }
                }
                //Conexao.Dispose();
            }
        }




    }
}