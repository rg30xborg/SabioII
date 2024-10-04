using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sabio._1
{
    public partial class Sabio18 : System.Web.UI.Page
    {
        protected string fig = "";
        protected string msgIn = "";
        protected string perg0 = "";
        protected string orig = "";
        protected int cod = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                     //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (!IsPostBack)
            {
                cod = Convert.ToInt16(Request["ID"].ToString());
                if (cod < 10) orig = "000" + cod; else orig = "00" + cod;
                if (cod == 1) fig = cod.ToString();

                switch (orig)
                {
                    case "0001": perg0 = "OLIMPÍADAS"; break;
                    case "0005": perg0 = "INFORMÁTICA"; break;
                    case "0006": perg0 = "VARIEDADES"; break;
                    case "0007": perg0 = "TELEVISÃO"; break;
                    case "0008": perg0 = "ESPORTES"; break;
                    case "0009": perg0 = "CINEMA"; break;
                    case "0010": perg0 = "TRANSITO"; break;
                    case "0011": perg0 = "ATUALIDADES"; break;
                    case "0012": perg0 = "NA ESCOLA (Geografia, História...)"; break;
                    case "0013": perg0 = "DICIONÁRIO"; break;
                    case "0014": perg0 = "SEU TALENTO"; break;
                    case "0015": perg0 = "DE USUÁRIOS"; break;
                    default: perg0 = "OLIMPIADAS"; break;
                }

                //      msgIn = Request.Cookies["Sabichao"]["nome"];
                //      if (Session["logmail"].ToString() != "") msgIn = Session["logmail"].ToString();
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string senha = userpassw.Text;

            // Calcula a senha com base na string senha e armazena na string senhaCriptografada 
            // Neste caso senha = '123456' retorna string 'E10ADC3949BA59ABBE56E057F20F883E'
            string senhaCriptografada = MD5Hash.CalculaHash(senha);

            //logonForm.Submit();
            string pageInclude = "Sabio10.aspx" + "?userlogon=" + userlogon.Text + "&userpassw=" + senhaCriptografada; // + "'"
            Response.Redirect(pageInclude);
            Response.End();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string senha = userpassw.Text;

            // Calcula a senha com base na string senha e armazena na string senhaCriptografada 
            // Neste caso senha = '123456' retorna string 'E10ADC3949BA59ABBE56E057F20F883E'
            string senhaCriptografada = MD5Hash.CalculaHash(senha);

            //logonForm.Submit();
            string pageInclude = "Sabio10.aspx" + "?userlogon=" + userlogon.Text + "&userpassw=" + senhaCriptografada; // + "'"
            Response.Redirect(pageInclude);
            Response.End();
        }

    }
}