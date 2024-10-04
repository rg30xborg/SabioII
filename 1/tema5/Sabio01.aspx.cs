using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;

namespace Sabio._1.tema5
{
    public partial class Sabio01 : System.Web.UI.Page
    {

        protected int pTotl = 0;
        protected int pCosc = 0;
        protected int pSala = 0;
        protected static int slMax;
        protected string text = "";
        protected string perg1 = "";
        protected string resp0 = "";
        protected string resp1 = "";
        protected string resp2 = "";
        protected string resp3 = "";
        protected string resp4 = "";
        protected string resp5 = "";
        protected string OlhoVivo = "";
        protected string Cod = "";
        public static string[] co = { "P", "R", "Ê", "M", "I", "O", "S" };
        public static string[] cu = { "P", "R", "Ê", "M", "I", "O", "S" };
        protected DateTime Hoje = DateTime.Now;

        //public partial class _Default : System.Web.UI.Page
        //{
        //    public  string[] co = { "ok", "4", "20", "6960", "103", "O", "S" };
        //}

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

            //Numero de perguntas no banco de dados na Sala e o ("hoje") é para computar o dia na Sala
            //  // The connection string assumes that the Access
            //  string connectionString = "Driver={Microsoft Access Driver (*.mdb)};" + "Dbq=c:\\Data\\Northwind.mdb;Uid=Admin;Pwd=;";
            //  // Provide the query string with a parameter placeholder.
            //  string queryString = "SELECT ProductID, UnitPrice, ProductName from products " + "WHERE UnitPrice > ? " + "ORDER BY UnitPrice DESC;";
            //  // Specify the parameter value.
            //  int paramValue = 5;
            //  command.Parameters.AddWithValue("@pricePoint", paramValue);

            if (!IsPostBack)
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT MAX(Codigo) AS max_Codigo FROM Perg0005";
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader reader = command.ExecuteReader();
                        reader.Read();
                            slMax = Convert.ToInt16(reader["max_Codigo"].ToString());
                        reader.Close();

                        queryString = "SELECT USD_Consec, USD_Sala5 FROM UserDados WHERE USR_ID = " + Session["id"];
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader DadosS = command1.ExecuteReader();
                        DadosS.Read();
                            pCosc = Convert.ToInt16(DadosS["USD_Consec"].ToString());
                            text = DadosS["USD_Sala5"].ToString();
                        DadosS.Close();

                        if (text != "new")   //dPerg:1Sala:0Data:10/04/2021Qtde:1
                        {
                            string pResp = text.Substring(0, 1);
                            string pPerg = text.Substring(text.IndexOf("Perg:") + 5, (text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5)));
                            if (Convert.ToInt16(pPerg) >= slMax) pPerg = "0";
                            pSala = Convert.ToInt16(text.Substring(text.IndexOf("Sala:") + 5, (text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5))));
                            string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));
                            string pQtde = text.Substring(text.IndexOf("Qtde:") + 5);
                            int pDias = (Convert.ToDateTime(pData).Date - Hoje.Date).Days;
                            if (pDias < 0)
                            {
                                //text = pResp + "Perg:" + pPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:1";
                                pQtde = "0";
                            }
                            else
                                if (Convert.ToInt16(pQtde) > Convert.ToInt16(Session["Dia"].ToString()))
                                {
                                    Conexao.Close();
                                    Conexao.Dispose();
                                    Response.Redirect("Sabio03.aspx?ptSala=" + pSala);       //http://www.aggora.com.br/sabio/1/tema1/
                                    Response.End();
                                }
                            queryString = "SELECT * FROM Perg0005 WHERE Codigo = " + (Convert.ToInt16(pPerg) + 1);
                            OdbcCommand command2a = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Pergunta = command2a.ExecuteReader();
                            Pergunta.Read();
                                perg1 = Pergunta["Pergunta"].ToString();
                                resp1 = Pergunta["a"].ToString();
                                resp2 = Pergunta["b"].ToString();
                                resp3 = Pergunta["c"].ToString();
                                resp4 = Pergunta["d"].ToString();
                                resp5 = Pergunta["e"].ToString();
                                text = Pergunta["Resposta"].ToString() + "Perg:" + (Convert.ToInt16(pPerg) + 1) + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + (Convert.ToInt16(pQtde) + 1);
                            Pergunta.Close();
                        }
                        else
                        {
                            pSala = 0;
                            queryString = "SELECT * FROM Perg0005 WHERE Codigo = 1";
                            OdbcCommand command2b = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Pergunta = command2b.ExecuteReader();
                            Pergunta.Read();
                                perg1 = Pergunta["Pergunta"].ToString();
                                resp1 = Pergunta["a"].ToString();
                                resp2 = Pergunta["b"].ToString();
                                resp3 = Pergunta["c"].ToString();
                                resp4 = Pergunta["d"].ToString();
                                resp5 = Pergunta["e"].ToString();
                                text = Pergunta["Resposta"].ToString() + "Perg:1Sala:0Data:" + Hoje + "Qtde:1";
                            Pergunta.Close();
                        }

                        queryString = "UPDATE UserDados SET USD_Sala5 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                        OdbcCommand command3 = new OdbcCommand(queryString, Conexao);
                        command3.ExecuteReader();        //OdbcDataReader olhoC = 

                        
                        int CdDic = 0;
                        queryString = "SELECT MAX(Codigo) AS max_Codigo FROM Dicas";
                        OdbcCommand command4 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader maxC = command4.ExecuteReader();
                        maxC.Read();
                        CdDic = Convert.ToInt16(maxC["max_Codigo"].ToString());
                        Random rnd = new Random();
                        CdDic = rnd.Next(0, CdDic);
                        maxC.Close();


                        queryString = "SELECT Dica,Cod FROM Dicas WHERE Codigo = " + CdDic;
                        OdbcCommand command5 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader olhoV = command5.ExecuteReader();
                        olhoV.Read();
                        OlhoVivo = olhoV["Dica"].ToString();
                        Cod = olhoV["Cod"].ToString();
                        if (Cod == "1") Cod = "VOCÊ SABIA QUE..."; else Cod = "PIADINHA...";
                        olhoV.Close();
                        
                        Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        perg1 = "Ocorreu uma excessão na consulta - Recarregue a Page (" + ex.Message + ")";
                    }
                    Conexao.Dispose();
                }
            }
        }

        protected void LeSala(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT USD_Total, USD_Consec, USD_Sala5 FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UsuarioDados = command.ExecuteReader();
                    UsuarioDados.Read();
                        text = UsuarioDados["USD_Sala5"].ToString();
                        pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                        pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                    UsuarioDados.Close();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
            }
        }

        protected void NewResposta(int IDPerg, OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT Resposta FROM Perg0005 WHERE Codigo = " + IDPerg;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Perguntas = command.ExecuteReader();
                    Perguntas.Read();
                        resp0 = Perguntas["Resposta"].ToString();
                    Perguntas.Close();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta NewResposta - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
            }
        }

        protected void NewPergunta(int IDPerg, OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT * FROM Perg0005 WHERE Codigo = " + IDPerg;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Perguntas = command.ExecuteReader();
                    Perguntas.Read();
                        perg1 = Perguntas["Pergunta"].ToString();
                        resp1 = Perguntas["a"].ToString();
                        resp2 = Perguntas["b"].ToString();
                        resp3 = Perguntas["c"].ToString();
                        resp4 = Perguntas["d"].ToString();
                        resp5 = Perguntas["e"].ToString();
                    Perguntas.Close();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta NewResposta - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
            }
        }

        protected void GravaSala(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala5 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                        command.ExecuteReader();
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta GravaSala - Recarregue a Page (" + ex.Message + ")";
                }
            }
        }

        protected void IBbotao_Click(object sender, ImageClickEventArgs e)
        {

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                if (HFPCert.Value == "0")
                {
                    string queryString = "SELECT USD_Total, USD_Consec, USD_Sala5 FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //LeSala(Conexao);
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();

                        UsuarioDados.Read();
                        text = UsuarioDados["USD_Sala5"].ToString();
                        pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                        pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();

                        int sQtde = 0;
                        int newIDPerg = 0;
                        string imagem = ""; string pCert = "";
                        string IDResp = text.Substring(0, 1);
                        switch (IDResp)
                        {
                            case "a": imagem = "1"; break;
                            case "b": imagem = "2"; break;
                            case "c": imagem = "3"; break;
                            case "d": imagem = "4"; break;
                            case "e": imagem = "5"; break;
                        }

                        try   /*dPerg:1Sala:0Data:14/05/2021 00:00:00Qtde:1*/
                        {
                            string text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                            Int32.TryParse(text1, out pSala);
                            text1 = text.Substring(text.IndexOf("Qtde:") + 5);
                            Int32.TryParse(text1, out sQtde); sQtde++;
                            text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                            Int32.TryParse(text1, out newIDPerg); newIDPerg++;
                            //resp0 = "b"; // sempre que acrescentar perguntas no banco de dados a primeira a acrescentar deve ter resposta "b"
                        }
                        catch (FormatException ex)
                        {
                            perg1 = "Ocorreu uma excessão na solicitação TryParse - Recarregue a Page (" + ex.Message + ")";
                        }

                        if (newIDPerg > slMax) newIDPerg = 1;

                        //NewResposta(newIDPerg, Conexao);
                        queryString = "SELECT Resposta FROM Perg0005 WHERE Codigo = " + newIDPerg;
                        command = new OdbcCommand(queryString, Conexao);

                        OdbcDataReader Perguntas = command.ExecuteReader();
                        Perguntas.Read();
                            resp0 = Perguntas["Resposta"].ToString();
                        Perguntas.Close();

                        string apost = HFApost.Value;

                        if (IDResp == apost) { pCert = "ok"; pSala += 20; pTotl += 20; pCosc += 1; } //+ parseInt(text0, 10)}
                        else { pCert = "no"; pCosc = 0; }

                        text = resp0 + "Perg:" + newIDPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + sQtde;
                        //GravaSala(Conexao);

                        queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala5 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteReader();

                        //co = { pCert, imagem, pSala.ToString(), pTotl.ToString(), pCosc.ToString(), "", "" };

                        co[0] = pCert;              HFco0.Value = pCert;
                        co[1] = imagem;             HFco1.Value = imagem;
                        co[2] = pSala.ToString();   HFco2.Value = pSala.ToString();
                        co[3] = pTotl.ToString();   HFco3.Value = pTotl.ToString();
                        co[4] = pCosc.ToString();   HFco4.Value = pCosc.ToString();

                        Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        perg1 = "Ocorreu uma excessão na consulta - Recarregue a Page (" + ex.Message + ")";
                    }
                    HFApost.Value = "0";
                    //HFPCert.Value = "1";
                }
                else
                if (HFPCert.Value == "1")
                {
                    string queryString = "SELECT USD_Total, USD_Consec, USD_Sala5 FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //LeSala(Conexao);
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();

                        UsuarioDados.Read();
                            text = UsuarioDados["USD_Sala5"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();

                        int IDPerg; int sQtde;

                        string text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                        Int32.TryParse(text1, out IDPerg); ;
                        text1 = text.Substring(text.IndexOf("Qtde:") + 5);
                        Int32.TryParse(text1, out sQtde);
                    

                        if (sQtde > Convert.ToInt16(Session["Dia"].ToString()))         /* || IDPerg > slMax */
                        {
                            text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                            Int32.TryParse(text1, out pSala);

                            //      //AKI ESTOU RETORNANDO À PAGINA PARA QUE O SCRIPT FAÇA O ENVIO PARA Sabio03.aspx
                            //      cu[0] = "xo";               HFco0.Value = "xo";
                            //      cu[1] = pSala.ToString();   HFco1.Value = pSala.ToString();
                            //      cu[2] = "5";                HFco2.Value = "5";  //Numero da Sala

                            //OU AKI ENCAMINHO DIRETAMENTE DAKI
                            Conexao.Close();
                            Conexao.Dispose();
                            Response.Redirect("Sabio03.aspx?ptSala=" + pSala.ToString());
                        }
                        else
                        {
                            perg1 = resp1 = resp2 = resp3 = resp4 = resp5 = "";
                            // NewPergunta(IDPerg, Conexao);

                            queryString = "SELECT * FROM Perg0005 WHERE Codigo = " + IDPerg;
                            command = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Perguntas = command.ExecuteReader();
                            Perguntas.Read();
                                perg1 = Perguntas["Pergunta"].ToString();
                                resp1 = Perguntas["a"].ToString();
                                resp2 = Perguntas["b"].ToString();
                                resp3 = Perguntas["c"].ToString();
                                resp4 = Perguntas["d"].ToString();
                                resp5 = Perguntas["e"].ToString();
                            Perguntas.Close();

                            //Conexao.Close()
                            //co = new Array(perg1, resp1, resp2, resp3, resp4, resp5, figr1);
                            cu[0] = perg1; HFco0.Value = perg1;
                            cu[1] = resp1; HFco1.Value = resp1;
                            cu[2] = resp2; HFco2.Value = resp2;
                            cu[3] = resp3; HFco3.Value = resp3;
                            cu[4] = resp4; HFco4.Value = resp4;
                            cu[5] = resp5; HFco5.Value = resp5;
                        }
                        Conexao.Close();
                    }
                    catch (FormatException ex)
                    {
                        perg1 = "Ocorreu uma excessão na solicitação TryParse - Recarregue a Page (" + ex.Message + ")";
                    }
                    HFPCert.Value = "2";
                }
                Conexao.Dispose();
            }
            //UpdatePanel1.Update();
        }
    }
}