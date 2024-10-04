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
    public partial class Sabio10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;

            string local = Request.ServerVariables["HTTP_HOST"];
            if (local.IndexOf("aggora") < 0 && local.IndexOf("localhost") < 0)
            {
                Response.Redirect("/help.htm");                 //http://www.aggora.com.br/sabio
                Response.End();
            }

            Session["IPUserSab"] = null;
            string startPage = "Sabio01.aspx";                  //http://www.aggora.com.br/sabio/1/
            if (Request["userlogon"] == null) Response.Redirect(startPage);

            string ax = Request["userlogon"];
            if (ax.IndexOf("@") < 0 || ax.IndexOf(" ") >= 0 || ax.Length < 10) ax = ""; else Session["logmail"] = ax;
            
            string bx = Request["userpassw"];
            if (bx.Length < 5) bx = "";

            if (ax == "" && bx == "") Response.Redirect(startPage);
            if (ax == "") Response.Redirect(startPage + "?log=1&pas=" + (bx == "" ? 1 : 0));
            if (bx == "") Response.Redirect(startPage + "?pas=1&log=" + (ax == "" ? 1 : 0));

            ax = ax.ToLower();

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string queryString = "SELECT * FROM Users WHERE USR_Email='" + ax + "'";
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UserExist = command.ExecuteReader();
                    if (!UserExist.HasRows) {
                        string nome = ":Anonimo:";
                        string email = ax;
                        string senha = bx;
                        int NewCod = 0;
                        string ip = Request.ServerVariables["REMOTE_HOST"];

                        queryString = "INSERT INTO Users(USR_Nome, USR_Email, USR_Senha, USR_IP) VALUES('" + nome + "','" + email + "','" + senha + "','" + ip + "')";
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        command1.ExecuteReader();           //OdbcDataReader UserNew = 

                        queryString = "SELECT MAX(USR_ID) AS max_cod FROM Users";
                        OdbcCommand command2 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader UserMax = command2.ExecuteReader();
                        UserMax.Read();
                            NewCod = Convert.ToInt16(UserMax["max_cod"]);
                        UserMax.Close();

                        queryString = "INSERT INTO UserDados (USR_ID, USR_Email) VALUES('" + NewCod + "','" + email + "')";
                        OdbcCommand command3 = new OdbcCommand(queryString, Conexao);
                        command3.ExecuteReader();       //OdbcDataReader UserDdd = 

                        nome = "New User";
                        string HTML = "<html><head></head><body bgcolor=#ffffff><center>";
                        HTML = HTML + "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>";
                        HTML = HTML + "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>";
                        HTML = HTML + "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>";
                        HTML = HTML + "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>";
                        HTML = HTML + "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>";
                        HTML = HTML + "</font></p><p><font face=arial size=2>Esta é uma mensagem do seu Site Sabichão sobre ";
                        HTML = HTML + "Cadastro de Novo Usuário.<br>Acumule quantos pontos conseguir, que em breve voce poderá ";
                        HTML = HTML + "arrisca-los no <a href=http://www.aggora.com.br/sabio>Sabichão Web</a> e obter grandes prêmios.</p>";
                        HTML = HTML + "<hr><p>Ola <b>" + nome + "</b>, sua inscrição foi feita com sucesso em " + DateTime.Now;
                        HTML = HTML + ".<br>Acesse o Site Sabichão Web <a href=http://www.aggora.com.br/sabio>http://www.aggora.com.br/sabio</a>, ";
                        HTML = HTML + "quando desejar, com:<p>E-mail do Usuario = [ <b><big>" + email + "</big></b> ].<br>";
                        HTML = HTML + "</p><hr><p>Agradecemos sua Inscrição</font>";    //Senha de acesso = [ <b><big>" + senha + "</big></b> ].
                        HTML = HTML + "</p><p></p></center><font face=arial size=1><p>Copyright &copy;2000 by ";
                        HTML = HTML + "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>";

                        MailAddress from = new MailAddress("contato@aggora.com.br", "(º_º) Sabichão - Um desafio aos seus Conhecimentos");
                        MailAddress to = new MailAddress(email, nome + " (User Sabichão)");
                        MailMessage message = new MailMessage(from, to);
                        message.IsBodyHtml = true;
                        message.Subject = "Inscriçao Registrada com Sucesso";
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

                        Session["id"] = NewCod;
                        Session["IPUserSab"] = nome;
                        Session["mail"] = email;
                        Response.Cookies["Sabichao"]["nome"] = email;
                        Response.Cookies["Sabichao"].Expires = DateTime.Today.AddDays(1000);
                        startPage = "sabio05.htm";           //http://www.aggora.com.br/sabio/1/
                    }
                    else {
                        UserExist.Read();
                            int ax1 = 1;
                            if (ax != "") ax1 = 0;
                            if (UserExist["USR_Senha"].ToString() != bx) {
                                UserExist.Close();
                                startPage = startPage + "?pas=1&log=" + ax1;
                            }
                            else {
                                Session["id"] = UserExist["USR_ID"];
                                Session["IPUserSab"] = UserExist["USR_Nome"];
                                Session["mail"] = UserExist["USR_Email"];
                                UserExist.Close();
                                startPage = "sabio05.htm";          //http://www.aggora.com.br/sabio/1/
                            }

                    }
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    var perg1 = ex.Message;
                }
                Response.Redirect(startPage);
                Response.End();
            }



        }

    }
}