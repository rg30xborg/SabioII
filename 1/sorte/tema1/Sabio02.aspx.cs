using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.sorte.tema1
{
    public partial class Sabio02 : System.Web.UI.Page
    {
        protected int LibOk = 0;  //Equivale a Libok
        protected int LibSl = 0;  //Equivale a Libsl

        protected string text = "";
        //protected int pTotl = 0;
        //protected int pCosc = 0;
        //protected int pSala = 0;

        public static string[] co = { "P", "R", "Ê", "M", "I", "O", "S" };
        public static string[] cu = { "P", "R", "Ê", "M", "I", "O", "S" };
        protected DateTime Hoje = DateTime.Now;

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

            if (!IsPostBack)
            { 

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
                            LibOk = Convert.ToInt32(UserDados["USD_Total"].ToString());
                            LibSl = Convert.ToInt32(UserDados["USD_1gm"].ToString());
                        //pPrem = Request.QueryString["premio"];
                        UserDados.Close();

                        if (LibOk < 2 || Session["xdemo"].ToString() != "demo01"
                            || Request["dataz"].ToString() == "" || Request["salax"].ToString() == "")
                        {
                            Conexao.Close();
                            Conexao.Dispose();
                            Response.Redirect("../Sabio01.aspx?Err=1");        //http://www.aggora.com.br/sabio/1/sorte
                            Response.End();
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

        protected void LeSala(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UsuarioDados = command.ExecuteReader();
                    UsuarioDados.Read();
                        LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                    UsuarioDados.Close();
                }
                catch (OdbcException ex)
                {
                    text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
            }
        }

        protected void GravaSala(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + " WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                        command.ExecuteNonQuery();
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    text = "Ocorreu uma excessão na consulta GravaSala - Recarregue a Page (" + ex.Message + ")";
                }
            }
        }

        protected void Reg22_Click(object sender, ImageClickEventArgs e)
        {
            if (HFPCert.Value == "0")
            {
                LibOk = 0; LibSl = 0;

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;

                    try
                    {
                        //LeSala(Conexao);
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                        LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                        UsuarioDados.Close();

                        if (LibOk > 1 && Session["xdemo"].ToString() == "demo01")
                        {
                            LibOk -= 1; LibSl -= 1;

                            //GravaSala(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            //return new Array("ok")
                            co[0] = "ok"; HFco0.Value = "ok";
                            co[1] = LibOk.ToString(); HFco1.Value = LibOk.ToString();
                            co[2] = LibSl.ToString(); HFco2.Value = LibSl.ToString();
                        }
                        else
                        {
                            //return new Array("no")
                            co[0] = "no"; HFco0.Value = "no";
                            co[1] = LibOk.ToString(); HFco1.Value = LibOk.ToString();
                            co[2] = LibSl.ToString(); HFco2.Value = LibSl.ToString();
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                    }
                }
                Conexao.Dispose();
            }
        }

        protected void Reg21_Click(object sender, ImageClickEventArgs e)
        {
            if (HFPCert.Value == "1")
            {
                LibOk = 0; LibSl = 0;
                int apost = Convert.ToInt16(HFApost.Value);

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;

                    try
                    {
                        //LeSala(Conexao);
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                            LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                            LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                        UsuarioDados.Close();

                        if (LibOk >= apost && Session["xdemo"].ToString() == "demo01")
                        {
                            LibOk -= apost; LibSl -= apost; Session["livCav"] = "1";

                            //GravaSala(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            //return new Array("ok")
                            co[0] = "ok"; HFco0.Value = "ok";
                            co[1] = LibOk.ToString(); HFco1.Value = LibOk.ToString();
                            co[2] = LibSl.ToString(); HFco2.Value = LibSl.ToString();
                        }
                        else
                        {
                            //return new Array("no")
                            co[0] = "no"; HFco0.Value = "no";
                            co[1] = LibOk.ToString(); HFco1.Value = LibOk.ToString();
                            co[2] = LibSl.ToString(); HFco2.Value = LibSl.ToString();
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                    }
                }
                Conexao.Dispose();
            }
        }

        protected void Reg20_Click(object sender, ImageClickEventArgs e)
        {
            if (HFPCert.Value == "2")
            {
                LibOk = 0; LibSl = 0;
                int lucro = Convert.ToInt16(HFApost.Value);

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;

                    try
                    {
                        //LeSala(Conexao);
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                            LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                            LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                        UsuarioDados.Close();

                        if (Session["xdemo"].ToString() == "demo01" && lucro < 401 && Session["livCav"].ToString() == "1")
                        {
                            LibOk += lucro; LibSl += lucro; Session["livCav"] = null;

                            //GravaSala(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            co[0] = "ok";             HFco0.Value = "ok";
                            co[1] = LibOk.ToString(); HFco1.Value = LibOk.ToString();
                            co[2] = LibSl.ToString(); HFco2.Value = LibSl.ToString();
                        }
                        else
                        {
                            co[0] = "no";             HFco0.Value = "no";
                            co[1] = LibOk.ToString(); HFco1.Value = LibOk.ToString();
                            co[2] = LibSl.ToString(); HFco2.Value = LibSl.ToString();
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                    }
                }
                Conexao.Dispose();
            }
        }

    }
}