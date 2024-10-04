using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sabio._1
{
    public partial class Sabio12 : System.Web.UI.Page
    {
        protected string msgIn = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            msgIn = (Request.Cookies["Sabichao"] != null ? Request.Cookies["Sabichao"]["nome"] : "");
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