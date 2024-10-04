using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Net.Mail;
using System.Net;

namespace Sabio._1.promo
{
    public partial class Sabio02 : System.Web.UI.Page
    {
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

            if (Session["IPUserSab"].ToString() == ":Anonimo:") 
            {
                Response.Redirect("Sabio01.aspx?err=3");            //http://www.aggora.com.br/sabio/1/promo/
                Response.End();
            }

            string startPage = "";

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                string ax = Request["email_indicado"];
                //Checa se Indicado ja é usuário
                string queryString = "SELECT * FROM Users WHERE USR_Email='" + ax + "'";
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Usuario = command.ExecuteReader();
                    if (!Usuario.HasRows)
                    {
                        queryString = "SELECT * FROM Promos WHERE PRM_Email_Indicado = '" + ax + "'";
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader Promos = command1.ExecuteReader();

                        if (!Promos.HasRows)
                        {
                            //Pega os dados de cliente
                            string ex = Request["email_cliente"];
                            string bx = Request["nome_indicado"];
                            string cx = Session["IPUserSab"].ToString();
                            string dx = Request["info_usuario"];

                            string msg = cx + ": Parabéns por sua participação na Promoção Indique Amigos (" + bx + ", pelo E-mail: " + ax + "). Os Pontos dessa Promoção serão adicionados ao seu total após validação. Dica! - Indique quantos Amigos desejar.";

                            queryString = "INSERT INTO Promos(USR_ID, PRM_Email, PRM_Nome_Indicado, PRM_Email_Indicado) VALUES ('" + Session["id"] + "','" + ex + "','" + bx + "','" + ax + "')";
                            OdbcCommand command2 = new OdbcCommand(queryString, Conexao);
                            command2.ExecuteNonQuery();

                            queryString = "INSERT INTO Eventos(USR_ID, EVN_Email, EVN_Desc, EVN_Tipo) VALUES ('" + Session["id"] + "','" + ex + "','" + msg + "','Promoção Indique Amigo')";
                            command2 = new OdbcCommand(queryString, Conexao);
                            command2.ExecuteNonQuery();

                            string HTML = "<html><head></head><body bgcolor=#ffffff><center>";
                            HTML = HTML + "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>";
                            HTML = HTML + "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>";
                            HTML = HTML + "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>";
                            HTML = HTML + "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>";
                            HTML = HTML + "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>";
                            HTML = HTML + "</font></p><p><font face=arial size=2>Este é um convite enviado por: <b>" + cx + "</b> para que você ";
                            HTML = HTML + "conheça nosso Site.<br>No <a href=http://www.aggora.com.br/sabio>Site Sabichão</a> você responde ";
                            HTML = HTML + "Perguntas sobre assuntos diversos e acumula pontos que em breve voce poderá arrisca-los e obter ";
                            HTML = HTML + "grandes prêmios. É Totalmente Gratuito e Você ainda corre o risco de Ganhar Prêmios.</p><hr><p>";
                            HTML = HTML + bx + ", acesse o Site Sabichão Web em: <a href=http://www.aggora.com.br/sabio>http://www.aggora.com.br/sabio</a>, ";
                            HTML = HTML + "quando desejar. Ao entrar no Site, você e <b>" + cx + "</b> recebem automaticamente 500 Pontos de ";
                            HTML = HTML + "bonificação na pontuação geral.</p><p>Agradecemos sua Visita - Promoção Indique um Amigo - OK!</p><hr>";
                            HTML = HTML + "<p>" + dx + "</p></font></center><font face=arial size=1><p>Copyright &copy;2000 by ";
                            HTML = HTML + "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>";

                            MailAddress from = new MailAddress("contato@aggora.com.br", "(º_º) Sabichão - Um desafio aos seus Conhecimentos");
                            MailAddress to = new MailAddress(ax, bx + " (Convidado)");
                            MailMessage message = new MailMessage(from, to);
                            message.IsBodyHtml = true;
                            message.Subject = "Promoção Indique Amigos: " + cx + " te convidou a conhecer o Site-Quiz Sabio Web";
                            message.Body = @HTML;
                            // Add a carbon copy recipient.
                            MailAddress copy = new MailAddress("contato@aggora.com.br");
                            message.CC.Add(copy);
                            copy = new MailAddress(ex, cx + " (Convidante)");
                            message.CC.Add(copy);
                            SmtpClient client = new SmtpClient("www.aggora.com.br");

                            string user = "contato@aggora.com.br"; string pass = "dadedade02";
                            using (SmtpClient smtp = new SmtpClient("smtp.aggora.com.br", 587))
                            {
                                smtp.Credentials = new NetworkCredential(user, pass);
                                smtp.Send(message);
                            }

                            Response.Write("Mensagem Enviada com Sucesso:<br>" + HTML);
                        }
                        else
                        {
                            startPage = "Sabio01.aspx?err=1";    //http://www.aggora.com.br/sabio/1/promo/
                        }
                        Promos.Close();
                    }
                    else
                    {
                        startPage = "Sabio01.aspx?err=2"; //http://www.aggora.com.br/sabio/1/promo/
                    }
                    Usuario.Close();
                }
                catch (Exception err)
                {
                    string erro = "<html><head></head><body bgcolor=#ffffff><center>";
                    erro = erro + "<b><font color='red'> Erro ao enviar a Mensagem.</font></b><br>";
                    erro = erro + "<b>Erro.Description:</b> " + err.Message + "<br>";
                    erro = erro + "<b>Erro.Number:</b> " + err.InnerException + "<br>";
                    erro = erro + "<b>Erro.Source:</b> " + err.Source + "<br>";
                    erro = erro + "Retorne à página da Promoção [Indique Amigos] e tente novamente.</center><font face=arial size=1><p>Copyright &copy;2000 by ";
                    erro = erro + "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>";
                    Response.Write("Erro Inesperado!!!:<br>" + erro);
                }
                Conexao.Close();
                Conexao.Dispose();
                if (startPage != "")
                {
                    Response.Redirect(startPage);
                    Response.End();
                }
            }


        }
    }
}