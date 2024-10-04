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
    public partial class Sabio05 : System.Web.UI.Page
    {
        protected Exception Err = null;
        protected string ax = "";
        protected string nome = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                 //http://www.aggora.com.br/sabio
                Response.End();
            }

            if (!IsPostBack)
            {
                Session["logmail"] = null;
                string startPage = "Sabio01.aspx";                   //http://www.aggora.com.br/sabio/1/
                ax = Request["email"].ToString().Trim();
                if (ax == "")
                    Response.Redirect(startPage);
                if (ax.IndexOf("@") < 0 || ax.IndexOf(" ") >= 0 || ax.Length < 7)
                    ax = "";
                else
                    Session["logmail"] = ax;
                if (ax == "")
                    Response.Redirect(startPage + "?log=1");

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT USR_Nome FROM Users WHERE USR_Email = '" + ax + "'";
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UserExist = command.ExecuteReader();
                        if (!UserExist.HasRows)
                        {
                            Conexao.Close();
                            Conexao.Dispose();
                            //O USUÁRIO NÃO EXISTE E ESTA SENDO SOLICITADO LEMBRAR SENHA
                            Response.Redirect("Sabio01.aspx?log=" + ax + "&pas=nill");          //http://www.aggora.com.br/sabio/1/
                            Response.End();
                        }
                        else
                        {
                            Random rnd = new Random();
                            string bx = "New" + rnd.Next(100, 999) + "Pass";
                            string bxCripto = MD5Hash.CalculaHash(bx);

                            queryString = "UPDATE Users SET USR_Senha = '" + bxCripto + "' WHERE USR_Email = '" + ax + "'";
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();
                            Conexao.Close();
                            Conexao.Dispose();

                            string HTML = "<html><head></head><body bgcolor=#ffffff><center>";
                            HTML = HTML + "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>";
                            HTML = HTML + "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>";
                            HTML = HTML + "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>";
                            HTML = HTML + "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>";
                            HTML = HTML + "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>";
                            HTML = HTML + "</font></p><p><font face=arial size=2>Esta é uma mensagem do seu Site Sabichão sobre Lembrar Senha de Acesso. ";
                            HTML = HTML + "Se não foi você que solicitou esta mensagem, entre em contato imediatamente com nosso suporte.";
                            HTML = HTML + "<br>Acumule quantos pontos conseguir, que em breve voce poderá ";
                            HTML = HTML + "arrisca-los no <a href=http://www.aggora.com.br/sabio>Sabichão Web</a> e obter grandes prêmios.</p>";
                            HTML = HTML + "<hr><p>Ola <b>" + nome + "</b>, sua solicitação de Lembrar Senha foi atendida ";
                            HTML = HTML + "com sucesso em " + DateTime.Now + ".<br>Acesse o Site Sabichão Web <a href=http://www.aggora.com.br/sabio>";
                            HTML = HTML + "http://www.aggora.com.br/sabio</a>, quando desejar, com:<p>E-mail do Usuario = [ <b><big>" + ax + "</big></b> ].";
                            HTML = HTML + "<br>Senha de acesso Provisória = [ <b><big>" + bx + "</big></b> ].<br>Altere esta senha assim que entrar novamente no Site em [Dados Usuário].</p><hr><p>Agradecemos sua Visita</font>";
                            HTML = HTML + "</p><p></p></center><font face=verdana size=1><p>Copyright &copy;2000 by ";
                            HTML = HTML + "<a href=mailto:contato@aggora.com.br>RG Sabichão Web</a><br>Todos os direitos reservados</p></body></font></html>";

                            MailAddress from = new MailAddress("contato@aggora.com.br", "(º_º) Sabichão - Um desafio aos seus Conhecimentos");
                            MailAddress to = new MailAddress(ax, nome + " (User Sabichão)");
                            MailMessage message = new MailMessage(from, to);
                            message.IsBodyHtml = true;
                            message.Subject = "Solicitação de Lembrar Senha do Site RG Sabichão Web";
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
                    }
                    catch (Exception ex)
                    {
                        Err = ex;   //.Message
                    }

                }
            }
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