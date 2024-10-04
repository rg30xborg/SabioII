using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;

namespace Sabio._1.tema2
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
        //protected string resp2 = "";
        //protected string resp3 = "";
        //protected string resp4 = "";
        //protected string resp5 = "";
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

            if (!IsPostBack)
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT MAX(Codigo) AS max_Codigo FROM Perg0002";
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

                        queryString = "SELECT USD_Consec, USD_Sala2 FROM UserDados WHERE USR_ID = " + Session["id"];
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader DadosS = command1.ExecuteReader();
                        DadosS.Read();
                            pCosc = Convert.ToInt16(DadosS["USD_Consec"].ToString());
                            text = DadosS["USD_Sala2"].ToString();
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
                                text = pResp + "Perg:" + pPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:0";
                                //pQtde = "0";
                            }
                            else
                                if (Convert.ToInt16(pQtde) > Convert.ToInt16(Session["Dia"].ToString()))
                                {
                                    Conexao.Close();
                                    Conexao.Dispose();
                                    Response.Redirect("Sabio03.aspx?ptSala=" + pSala);       //http://www.aggora.com.br/sabio/1/tema1/
                                    Response.End();
                                }
                        }
                        else
                        {
                            pSala = 0;
                            text = "fPerg:0Sala:0Data:" + Hoje + "Qtde:0";
                        }

                        queryString = "UPDATE UserDados SET USD_Sala2 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
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
                string queryString = "SELECT USD_Total, USD_Consec, USD_Sala2 FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UsuarioDados = command.ExecuteReader();
                    UsuarioDados.Read();
                        text = UsuarioDados["USD_Sala2"].ToString();
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

        protected void NewPergunta(int IDPerg, OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT * FROM Perg0002 WHERE Codigo = " + IDPerg;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Perguntas = command.ExecuteReader();
                    Perguntas.Read();
                        perg1 = Perguntas["Pergunta"].ToString();
                        resp1 = Perguntas["a"].ToString();
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
                string queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala2 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                        command.ExecuteNonQuery();
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
                    string queryString = "SELECT USD_Total, USD_Consec, USD_Sala2 FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //LeSala(Conexao);
                    try
                    {
                        Conexao.Open();
                        //LeSala(Conexao);
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                            text = UsuarioDados["USD_Sala2"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();

                        /*dPerg:1Sala:0Data:14/05/2021 00:00:00Qtde:1*/

                        string text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                        Int32.TryParse(text1, out pSala);
                        text1 = text.Substring(text.IndexOf("Qtde:") + 5);
                        Int32.TryParse(text1, out int sQtde); sQtde++;
                        text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                        Int32.TryParse(text1, out int IDPerg); IDPerg++;

                        if (sQtde > (Convert.ToInt16(Session["Dia"].ToString()) + 1))
                        {
                            //  //return new Array("xo", pSala, 2)
                            //  co[0] = "xo";               HFco0.Value = "xo";
                            //  co[1] = pSala.ToString();   HFco1.Value = pSala.ToString();
                            //  co[2] = "2";                HFco1.Value = "2";

                            //OU AKI ENCAMINHO DIRETAMENTE DAKI
                            Conexao.Close();
                            Conexao.Dispose();
                            Response.Redirect("Sabio03.aspx?ptSala=" + pSala.ToString());
                        }
                        else
                        {
                            perg1 = resp1 = "";
                            Session["livCav"] = 1;
                            if (IDPerg > slMax) IDPerg = 1;

                            //NewPergunta(IDPerg, Conexao);
                            queryString = "SELECT * FROM Perg0002 WHERE Codigo = " + IDPerg;
                            command = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Pergunta = command.ExecuteReader();
                            Pergunta.Read();
                                perg1 = Pergunta["Pergunta"].ToString();
                                resp1 = Pergunta["a"].ToString();
                            Pergunta.Close();

                            text = "fPerg:" + IDPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + sQtde;

                            //GravaSala(Conexao);
                            queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala2 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            //return new Array(perg1, resp1)
                            co[0] = perg1; HFco0.Value = perg1;
                            co[1] = resp1; HFco1.Value = resp1;
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        co[0] = ex.Message;
                        co[1] = ex.Source;
                        co[2] = ex.HResult.ToString();
                    }
                    //HFPCert.Value = "1";
                }
                else if(HFPCert.Value == "1")
                {
                    int valor = Convert.ToInt16(HFApost.Value);

                    string queryString = "SELECT USD_Total, USD_Consec, USD_Sala2 FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    try
                    {
                        Conexao.Open();
                        //LeSala(Conexao);
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                            text = UsuarioDados["USD_Sala2"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();

                        string pCert = "";
                        string text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                        Int32.TryParse(text1, out pSala);
                        if (valor > 0 && valor < 31 && (int)Session["livCav"] == 1)
                        {
                            Session["livCav"] = null;
                            pCert = "ok"; pSala += valor; pTotl += valor; pCosc += 1;

                            text1 = text.Substring(text.IndexOf("Qtde:") + 5);
                            Int32.TryParse(text1, out int sQtde);
                            text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                            Int32.TryParse(text1, out int IDPerg);

                            text = "gPerg:" + IDPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + sQtde;
                        }
                        else { pCert = "no"; pCosc = 0; text1 = text; }

                        //GravaSala(Conexao)
                        queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala2 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        //return new Array(pCert, pSala, pTotl, pCosc)
                        co[0] = pCert;            HFco0.Value = pCert;
                        co[1] = pSala.ToString(); HFco1.Value = pSala.ToString();
                        co[2] = pTotl.ToString(); HFco2.Value = pTotl.ToString();
                        co[3] = pCosc.ToString(); HFco3.Value = pCosc.ToString();

                        HFApost.Value = "0";
                        HFPCert.Value = "2";

                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        co[0] = ex.Message;
                        co[1] = ex.Source;
                        co[2] = ex.HResult.ToString();
                    }
                }
            }

        }
    }
}