using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Net.Mail;
using System.Net;

namespace Sabio._1
{
    public partial class Sabio11 : System.Web.UI.Page
    {

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
                Response.Redirect("Sabio12.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            Session["IPUserSab"] = null;
            string startPage = "Sabio01.aspx";                  //http://www.aggora.com.br/sabio/1/
            if (Request["Atualizar"] == null) Response.Redirect(startPage);

            //Pega os dados de endereco
            string nome =   Request["nome"];
            string sexo =   Request["sexo"];
            string dia =    Request["dia"];
            string mes =    Request["mes"];
            string ano =    Request["ano"];
            string rua =    Request["rua"];
            string bairro = Request["bairro"];
            string cidade = Request["cidade"];
            string estado = Request["estado"];
            string cep =    Request["cep"];
            string opcoes = Request["c0"] + "," + Request["c1"] + "," + Request["c2"];
            string fone =   Request["fone"];
            string email =  Request["email"];
            string senha =  Request["senha"];

            if (email != Session["mail"].ToString())
            {
                Session["logmail"] = email;
                Response.Redirect("Sabio01.aspx?usr=1 target=top.frames.inicial");          //http://www.aggora.com.br/sabio/1/
                Response.End();
            }
            else
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "UPDATE Users SET USR_Nome = '" + nome + "'";
                    queryString = queryString + ", USR_Senha = '" + senha + "'";
                    queryString = queryString + ", sexo_usuario = '" + sexo + "'";
                    queryString = queryString + ", dia_usuario = " + dia;
                    queryString = queryString + ", mes_usuario = " + mes;
                    queryString = queryString + ", ano_usuario = " + ano;
                    queryString = queryString + ", cidade_usuario = '" + cidade + "'";
                    queryString = queryString + ", estado_usuario = '" + estado + "'";
                    queryString = queryString + ", opcoes_usuario = '" + opcoes + "'";

                    //Grava opcionais se houver
                    if (rua != "") queryString = queryString + ", rua_usuario = '" + rua + "'";
                    if (bairro != "") queryString = queryString + ", bairro_usuario = '" + bairro + "'";
                    if (cep != "") queryString = queryString + ", cep_usuario = '" + cep + "'";
                    if (fone != "") queryString = queryString + ", telefone_usuario = '" + fone + "'";
                    queryString = queryString + " WHERE USR_ID = " + Session["id"];

                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                            command.ExecuteNonQuery();
                        Conexao.Close();

                        string HTML = "<html><head></head><body bgcolor=#ffffff><center>";
                        HTML = HTML + "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>";
                        HTML = HTML + "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>";
                        HTML = HTML + "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>";
                        HTML = HTML + "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>";
                        HTML = HTML + "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>";
                        HTML = HTML + "</font></p><p><font face=arial size=2>Esta é uma mensagem do seu Site Sabichão sobre ";
                        HTML = HTML + "Atualização Cadastral de Usuário.<br>Acumule quantos pontos conseguir, que em breve voce poderá ";
                        HTML = HTML + "arrisca-los no <a href=http://www.aggora.com.br/sabio>Sabichão Web</a> e obter grandes prêmios.</p>";
                        HTML = HTML + "<hr><p>Ola <b>" + nome + "</b>, a atualização de sua inscriçao foi feita com sucesso em " + DateTime.Now;
                        HTML = HTML + ".<br>Acesse o Site Sabichão Web <a href=http://www.aggora.com.br/sabio>http://www.aggora.com.br/sabio</a>, ";
                        HTML = HTML + "quando desejar, com:<p>E-mail do Usuario = [ <b><big>" + email + "</big></b> ].<br>";
                        HTML = HTML + "</p><hr><p>Agradecemos sua Visita</font>"; //Senha de acesso = [ <b><big>" + senha + "</big></b> ].
                        HTML = HTML + "</p><p></p></center><font face=arial size=1><p>Copyright &copy;2000 by ";
                        HTML = HTML + "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>";

                        MailAddress from = new MailAddress("contato@aggora.com.br", "(º_º) Sabichão - Um desafio aos seus Conhecimentos");
                        MailAddress to = new MailAddress(email, nome + " (User Sabichão)");
                        MailMessage message = new MailMessage(from, to);
                        message.IsBodyHtml = true;
                        message.Subject = "Cadastro Atualizado com Sucesso!";
                        message.Body = @HTML;
                        // Add a carbon copy recipient.
                        MailAddress copy = new MailAddress("contato@aggora.com.br");
                        message.CC.Add(copy);
                        SmtpClient client = new SmtpClient("www.aggora.com.br");
                        //O TRY abaixo foi comentado aki pois já esta dentro de um bloco TRY
                        //try
                        //{
                        string user = "contato@aggora.com.br"; string pass = "dadedade02";
                        using (SmtpClient smtp = new SmtpClient("smtp.aggora.com.br", 587))
                        {
                            smtp.Credentials = new NetworkCredential(user, pass);
                            smtp.Send(message);
                        }
                        //}
                        //catch (Exception ex)
                        //{
                        //    string Exceção = ex.ToString();
                        //}

                    }
                    catch (Exception ex)
                    {
                        var perg1 = ex.Message;
                    }
                }
                Conexao.Dispose();

                Session["IPUserSab"] = nome;
                Session["mail"] = email;
                Response.Cookies["Sabichao"]["nome"] = email;
                Response.Cookies["Sabichao"].Expires = DateTime.Today.AddDays(1000);

                Response.Redirect("Sabio03.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();

            }
        }



    }
}