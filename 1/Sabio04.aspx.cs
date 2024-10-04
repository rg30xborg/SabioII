using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1
{
    public partial class Sabio04 : System.Web.UI.Page
    {
        //protected string nome = "";
        //protected string sexo = "";
        protected string dia = "";
        protected string mes = "";
        protected string ano = "";
        //protected string rua = "";
        //protected string bairro = "";
        //protected string cidade = "";
        //protected string estado = "";
        //protected string cep = "";
        //protected string fone = "";
        //protected string cor0 = "";
        //protected string cor1 = "";
        //protected string cor2 = "";
        protected int idade = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                 //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (Session["IPUserSab"] == null || (Session["IPUserSab"].ToString() == "" && Session["mail"].ToString() == ""))
            {
                Response.Redirect("Sabio12.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            if (!IsPostBack)
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT * FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID and U.USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader Usuarios = command.ExecuteReader();
                        Usuarios.Read();
                        nome_cliente.Text = Session["IPUserSab"].ToString();

                        string sexo = Usuarios["sexo_usuario"].ToString();
                        if (sexo == "H") sexo_cliente.Items[0].Selected = true;
                        else
                            if (sexo == "M") sexo_cliente.Items[1].Selected = true;
                        else
                            sexo_cliente.Items[2].Selected = true;

                        dia = dia_cliente.SelectedValue = Usuarios["dia_usuario"].ToString();
                        //dia_cliente.SelectedValue = dia;
                        mes = mes_cliente.SelectedValue = Usuarios["mes_usuario"].ToString();
                        //mes_cliente.SelectedValue = mes;
                        ano = ano_cliente.SelectedValue = Usuarios["ano_usuario"].ToString();
                        //ano_cliente.SelectedValue = ano;

                        rua_cliente.Text = Usuarios["rua_usuario"].ToString();
                        bairro_cliente.Text = Usuarios["bairro_usuario"].ToString();
                        cidade_cliente.Text = Usuarios["cidade_usuario"].ToString();
                        estado_cliente.SelectedValue = Usuarios["estado_usuario"].ToString();
                        cep_cliente.Text = Usuarios["cep_usuario"].ToString();
                        fone_cliente.Text = Usuarios["telefone_usuario"].ToString();
                        email_cliente.Value = Session["mail"].ToString();
                        string cor = Usuarios["opcoes_usuario"].ToString();
                        c0.Value = cor.Substring(0, 1);
                        c1.Value = cor.Substring(2, 1);
                        c2.Value = cor.Substring(4, 1);

                        Usuarios.Close();
                        Conexao.Close();
                        Conexao.Dispose();
                        DateTime DataNasce = new DateTime(year: Convert.ToInt16(ano), month: Convert.ToInt16(mes), day: Convert.ToInt16(dia));
                        DateTime Hoje = DateTime.Today;
                        idade = (Hoje.Year - DataNasce.Year);
                        if (Hoje.Month < DataNasce.Month || (Hoje.Month == DataNasce.Month && Hoje.Day < DataNasce.Day))
                        {
                            idade--;
                        }
                        Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        var perg1 = ex.Message;
                    }
                    Conexao.Dispose();
                }
            }
        }

        protected void Atualizar_Click(object sender, EventArgs e)
        {
            //Se conseguir pelo metodo POST dispensa essa porcaria aki
            string strGet = "Atualizar=ok";
            strGet = strGet + "&nome=" + nome_cliente.Text;

            string sexo = "";
            if (sexo_cliente.Items[0].Selected) sexo = "H";
            else
                if (sexo_cliente.Items[1].Selected) sexo = "M";
            else
                sexo = "O";

            strGet = strGet + "&sexo=" + sexo;
            strGet = strGet + "&dia=" + dia_cliente.SelectedItem.Text;
            strGet = strGet + "&mes=" + mes_cliente.SelectedItem.Text;
            strGet = strGet + "&ano=" + ano_cliente.SelectedItem.Text;
            strGet = strGet + "&rua=" + rua_cliente.Text;
            strGet = strGet + "&bairro=" + bairro_cliente.Text;
            strGet = strGet + "&cidade=" + cidade_cliente.Text;
            strGet = strGet + "&estado=" + estado_cliente.SelectedItem.Text;
            strGet = strGet + "&cep=" + cep_cliente.Text;
            strGet = strGet + "&fone=" + fone_cliente.Text;
            strGet = strGet + "&email=" + email_cliente.Value;
            strGet = strGet + "&c0=" + c0.Value;
            strGet = strGet + "&c1=" + c1.Value;
            strGet = strGet + "&c2=" + c1.Value;
            strGet = strGet + "&senha=";

            string senha = senha_cliente.Text;
            // Calcula a senha com base na string senha e armazena na string senhaCriptografada 
            // Neste caso senha = '123456' retorna string 'E10ADC3949BA59ABBE56E057F20F883E'

            string senhaCriptografada = MD5Hash.CalculaHash(senha);
            strGet = strGet + senhaCriptografada;

            //logonForm.Submit();
            string pageInclude = "Sabio11.aspx?" + strGet; //
            Response.Redirect(pageInclude);
            Response.End();
        }

        
    }
}