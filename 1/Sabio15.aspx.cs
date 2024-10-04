using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace Sabio._1
{
    public partial class Sabio15 : System.Web.UI.Page
    {
        protected string txtweb = "";
        protected string assunto = "";
        protected string emailDestinatario = "";
        protected string Erro = "";

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

            if (Request["origem"] == "Anuncie")
                assunto = "Anúncio via RG Sabichao WEB - ";
            else
                assunto = "Contato via RG Sabichao WEB - ";

            string nomeDestinatario = Request["Contato"];
            string emailDestinatario = Request["E_mail"];
            string nomeRemetente = "(º_º) Sabichão - Um desafio aos seus Conhecimentos";
            string emailRemetente = "contato@aggora.com.br";
            string emailRetorno = "contato@aggora.com.br";
            string empresa = Request["Empr"];
            string fone =  Request["Fone"];
            string contato = Request["Cntt"];
            string obs = Request["Obsv"];

            assunto = assunto + Request["Tipo"];
            DateTime data = DateTime.Now;
            string txtinfo = "Mensagem de: " + nomeDestinatario;
            txtinfo = txtinfo + "." + Environment.NewLine + "Endereço E-mail: " + emailDestinatario;
            txtinfo = txtinfo + "." + Environment.NewLine + Environment.NewLine + "Enviada em: " + data.ToString("dd/MM/yyyy HH:mm:ss");
            txtinfo = txtinfo + "." + Environment.NewLine + Environment.NewLine + "Usuário/Empresa: " + empresa;
            txtinfo = txtinfo + "." + Environment.NewLine + "Telefone: " + fone;
            txtinfo = txtinfo + "." + Environment.NewLine + "Prefere Contato por: " + contato;
            txtinfo = txtinfo + "." + Environment.NewLine + "Comentários Adicionais: " + obs;

            txtweb = "Mensagem de: <b>" + nomeDestinatario;
            txtweb = txtweb + "</b>.<br>Endereço E-mail: <b>" + emailDestinatario;
            txtweb = txtweb + "</b>.<br>Enviada em: <b>" + data.ToString("dd/MM/yyyy HH:mm:ss");
            txtweb = txtweb + "</b>.<p>Usuário/Empresa: <b>" + empresa;
            txtweb = txtweb + "</b>.<br>Telefone: <b>" + fone;
            txtweb = txtweb + "</b>.<br>Prefere Contato por: <b>" + contato;
            txtweb = txtweb + "</b>.<br>Comentários Adicionais: <b>" + obs + "</b>";

            //Configuramos os dados a serem utilizados no cabeçalho da mensagem
            MailAddress from = new MailAddress(emailRemetente, nomeRemetente);
            MailAddress to = new MailAddress(emailDestinatario, nomeDestinatario + " (Remetente)");
            MailMessage message = new MailMessage(from, to);
            message.IsBodyHtml = false;
            message.Subject = assunto;
            message.Body = @txtinfo;
            // Add a carbon copy recipient.
            MailAddress copy = new MailAddress(emailRetorno, "(º_º) Sabichão Web (Destinatário)");
            message.CC.Add(copy);

            try
            {
                SmtpClient client = new SmtpClient("www.aggora.com.br");
                using (SmtpClient smtp = new SmtpClient("smtp.aggora.com.br", 587))
                {
                    smtp.Credentials = new NetworkCredential(emailRemetente, "dadedade02");
                    smtp.Send(message);
                }
            }
            catch (SmtpException ex)
            {
                Erro = "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>";
                Erro = Erro + "<b>Erro.Description:</b> " + ex.Message + "<br>";
                Erro = Erro + "<b>Erro.HResult:</b> " + ex.HResult + "<br>";
                Erro = Erro + "<b>Erro.Source:</b> " + ex.Source + "<br>";
            }

        }
    }
}