using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.sorte.tema0
{
    public partial class Sabio02 : System.Web.UI.Page
    {
        protected int libok = 0;
        protected int libSl = 0;
        protected string libHx = "";
        protected string libPr = "";
        protected string libDt = "";
        protected string libCd = "";

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
                string queryString = "SELECT USD_Total, USD_Apts FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UserDados = command.ExecuteReader();
                    UserDados.Read();
                        libok = Convert.ToInt32(UserDados["USD_Total"].ToString());
                        libSl = Convert.ToInt32(UserDados["USD_Apts"].ToString());
                    //pPrem = Request.QueryString["premio"];
                    UserDados.Close();

                    if (libok < 900 || Session["xdemo"].ToString() != "demo01" || Request["salay"].ToString() == "") 
                    {
                        Conexao.Close();
                        Conexao.Dispose();
                        Response.Redirect("../../Sabio07.aspx?Err=1");        //http://www.aggora.com.br/sabio/1
                        Response.End();
                    }
                    else
                    {
                        //libPr = Left(CStr(Request.Form("salay")), 38) 'se fosse GUID mas é hexadecimal binary(16)
                        libHx = Request["salay"];

                        queryString = "SELECT PRE_Cod, PRE_Desc, PRE_Data FROM Premios WHERE HEX(uuid) = '" + libHx + "'";
                        command = new OdbcCommand(queryString, Conexao);

                        OdbcDataReader Premio = command.ExecuteReader();
                        Premio.Read();
                            libPr = Premio["PRE_Desc"].ToString();
                            libDt = Premio["PRE_Data"].ToString();
                            libCd = Premio["PRE_Cod"].ToString();
                        Premio.Close();
                    }
                    Conexao.Close();
                    Conexao.Dispose();
                }
                catch (Exception ex)
                {
                    var perg1 = ex.Message;
                }
            }

        }


    }
}