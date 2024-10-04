using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.perfil
{
    public partial class Sabio03 : System.Web.UI.Page
    {
        protected int pSala;
        protected string tema;
        protected string resl;
        protected DateTime cData;
        protected DateTime gData;

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

            pSala = Convert.ToInt16(Request["ptSala"]);
            string cTema = Request["cTema"];
            gData = Convert.ToDateTime(Request["cData"]);
            cData = gData.AddDays(7);   //DateAdd("d", 7, CDate(gData));

            string Nivel = "";

            if (pSala < 8)
                Nivel = "Nivel1";
            else
                if (pSala > 14)
                    Nivel = "Nivel3";
                else
                    Nivel = "Nivel2";

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT Tema," + Nivel + " FROM PerfilTema WHERE TPR_Cod = " + cTema;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                command.CommandTimeout = 120;
                try
                {
                    Conexao.Open();
                        OdbcDataReader Perfil = command.ExecuteReader();
                        Perfil.Read();
                            tema = Perfil["Tema"].ToString();
                            resl = Perfil[Nivel].ToString();
                        Perfil.Close();
                    Conexao.Close();
                }
                catch (OdbcException ex)
                {
                    tema = ex.Message;
                    resl = ex.Errors.ToString();
                }
            }
            Conexao.Dispose();
        }
    }
}