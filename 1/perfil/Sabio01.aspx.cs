using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;

namespace Sabio._1.perfil
{
    public partial class Sabio01 : System.Web.UI.Page
    {

        protected int pTotl = 0;
        protected int pCosc = 0;
        protected int pSala = 0;
        protected static int slMax;
        protected string text = "";
        protected string perg1 = "";
        protected string tema = "";
        protected string resp0 = "";
        protected string resp1 = "";
        protected string resp2 = "";
        protected string resp3 = "";
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
                    string queryString = "SELECT MAX(Codigo) AS max_Codigo FROM Perfil";
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

                        queryString = "SELECT USD_Consec, USD_1pf FROM UserDados WHERE USR_ID = " + Session["id"];
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader DadosS = command1.ExecuteReader();
                        DadosS.Read();
                            pCosc = Convert.ToInt16(DadosS["USD_Consec"].ToString());
                            text = DadosS["USD_1pf"].ToString();
                        DadosS.Close();

                        string pValr = text.Substring(0, 3);
                        if (text != "new")   //dPerg:1Sala:0Data:10/04/2021Qtde:1
                        {
                            string pPerg = text.Substring(text.IndexOf("Perg:") + 5, (text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5)));
                            if (Convert.ToInt16(pPerg) >= slMax) pPerg = "0";
                            pSala = Convert.ToInt16(text.Substring(text.IndexOf("Sala:") + 5, (text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5))));
                            string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));

                            string pQtde = text.Substring(text.IndexOf("Qtde:") + 5, (text.IndexOf("Clik:") - (text.IndexOf("Qtde:") + 5)));
                            //string pClik = text.Substring(text.IndexOf("Clik:") + 5);
                            //string pQtde = text.Substring(text.IndexOf("Qtde:") + 5);
                            int pDias = (Convert.ToDateTime(pData).Date - Hoje.Date).Days;
                            if (pDias < -6)
                            {
                                if (Convert.ToInt16(pQtde) > Convert.ToInt16(Session["DiaP"]))
                                {
                                    string pClik = text.Substring(text.IndexOf("Clik:") + 5, (text.IndexOf("#R:") - (text.IndexOf("Clik:") + 5)));
                                    int temaS = (Convert.ToInt16(pClik) + 1); 
                                    if (temaS == 5) //Quando aumentar dados em PERFIL reconfigurar isso para auto (obter temas e Pergs)
                                    {
                                        temaS = 1; pPerg = "1";
                                    }
                                    text = pValr + "Perg:" + pPerg + "Sala:0Data:" + Hoje + "Qtde:1Clik:" + temaS;  // pPerg;
                                    //text = pValr & "Perg:" & pPerg & "Sala:0Data:" & Date & "Qtde:1Clik:" & pPerg
                                }
                            }
                            else
                                if (Convert.ToInt16(pQtde) > Convert.ToInt16(Session["DiaP"].ToString()))
                                {
                                    Conexao.Close();
                                    Conexao.Dispose();
                                    string pClik = text.Substring(text.IndexOf("Clik:") + 5, (text.IndexOf("#R:") - (text.IndexOf("Clik:") + 5)));
                                    Response.Redirect("Sabio03.aspx?ptSala=" + pSala + "&cTema=" + pClik + "&cData=" + pData);
                                    //Response.Redirect("Sabio03.aspx?ptSala=" + pSala);       //http://www.aggora.com.br/sabio/1/tema1/
                                    Response.End();
                                }
                            //queryString = "SELECT * FROM Perfil WHERE Codigo = " + (Convert.ToInt16(pPerg) + 1);
                            queryString = "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = " + pPerg;
                            OdbcCommand command2a = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Pergunta = command2a.ExecuteReader();
                            Pergunta.Read();
                            int cod = Convert.ToInt16(Pergunta["Codigo"]);
                            perg1 = (cod % 10).ToString() + "/10: " + Pergunta["Pergunta"].ToString();
                            resp1 = Pergunta["a"].ToString();
                            resp2 = Pergunta["b"].ToString();
                            resp3 = Pergunta["c"].ToString();
                            tema = Pergunta["Tema"].ToString();
                            //text = Pergunta["Resposta"].ToString() + "Perg:" + (Convert.ToInt16(pPerg) + 1) + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + (Convert.ToInt16(pQtde) + 1);
                            Pergunta.Close();
                        }
                        else
                        {
                            //pSala = 0;
                            //queryString = "SELECT * FROM Perfil WHERE Codigo = 1";
                            queryString = "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = 1";
                            OdbcCommand command2b = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Pergunta = command2b.ExecuteReader();
                            Pergunta.Read();
                                int cod = Convert.ToInt16(Pergunta["Codigo"]);
                                perg1 = (cod % 10).ToString() + "/10: " + Pergunta["Pergunta"].ToString();
                                resp1 = Pergunta["a"].ToString();
                                resp2 = Pergunta["b"].ToString();
                                resp3 = Pergunta["c"].ToString();
                                tema =  Pergunta["Tema"].ToString();
                                pValr = Pergunta["aa"].ToString() + Pergunta["bb"].ToString() + Pergunta["cc"].ToString();
                                text = pValr + "Perg:1Sala:0Data:" + Hoje + "Qtde:1Clik:1";
                            Pergunta.Close();
                        }

                        queryString = "UPDATE UserDados SET USD_1pf = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                        OdbcCommand command3 = new OdbcCommand(queryString, Conexao);
                        command3.ExecuteNonQuery();        //OdbcDataReader olhoC = 

                        
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

        protected void Le1pf(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT USD_Total, USD_Consec, USD_1pf FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
        
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UsuarioDados = command.ExecuteReader();
                    UsuarioDados.Read();
                        text = UsuarioDados["USD_1pf"].ToString();
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
                string queryString = "SELECT aa,bb,cc FROM Perfil WHERE Codigo = " + IDPerg;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);
        
                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Perguntas = command.ExecuteReader();
                    Perguntas.Read();
                        resp0 = Perguntas["aa"].ToString() + Perguntas["bb"].ToString() + Perguntas["cc"].ToString();
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
                string queryString = "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = " + IDPerg;
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
                        tema = Perguntas["Tema"].ToString();
                    Perguntas.Close();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta NewResposta - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
            }
        }

        protected void Grava1pf(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_1pf = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
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

        protected void Grava1pfG(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
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
                    string queryString = "SELECT USD_Total, USD_Consec, USD_1pf FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //Le1pf(Conexao);
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
            
                        UsuarioDados.Read();
                            text = UsuarioDados["USD_1pf"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();
            
                        int sQtde = 0;
                        int newIDPerg = 0; 
                        string imagem = ""; string pCert = "";
                        string apost = HFApost.Value;

                        string IDResp = text.Substring(0, 3);
                        switch (apost)
                        {
                            case "a": imagem = "1"; pCert = text.Substring(0, 1); break;
                            case "b": imagem = "2"; pCert = text.Substring(1, 1); break;
                            case "c": imagem = "3"; pCert = text.Substring(2, 1); break;
                        }

                        string text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                        Int32.TryParse(text1, out pSala); pSala += Convert.ToInt16(pCert);
                        text1 = text.Substring(text.IndexOf("Qtde:") + 5, (text.IndexOf("Clik:") - (text.IndexOf("Qtde:") + 5)));
                        Int32.TryParse(text1, out sQtde); sQtde++;
                        text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                        Int32.TryParse(text1, out newIDPerg); newIDPerg++;
                        string pClik = text.Substring(text.IndexOf("Clik:")) + "#R:" + apost + " ";
                        //string pClik = text0.substr(text0.indexOf("Clik:")) + "#R:" + apost + " ";
                        resp0 = "000";

                        if (newIDPerg > slMax) newIDPerg = 1;
            
                        //NewResposta(newIDPerg, Conexao);
                        queryString = "SELECT aa,bb,cc FROM Perfil WHERE Codigo = " + newIDPerg;
                        command = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader Perguntas = command.ExecuteReader();
                        Perguntas.Read();
                            resp0 = Perguntas["aa"].ToString() + Perguntas["bb"].ToString() + Perguntas["cc"].ToString();
                        Perguntas.Close();
            
                        text = resp0 + "Perg:" + newIDPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + sQtde + pClik;
                        //Grava1pf(Conexao);
                        queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_1pf = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        //return new Array("ok",imagem)

                        co[0] = "ok";       HFco0.Value = "ok";
                        co[1] = imagem;     HFco1.Value = imagem;
            
                        Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        perg1 = "Ocorreu uma excessão na consulta - Recarregue a Page (" + ex.Message + ")";
                    }
                    //VER ISTO EM TODOS            HFPCert.Value = "1";
                }
                else
                if (HFPCert.Value == "1")
                {
                    string queryString = "SELECT USD_Total, USD_Consec, USD_1pf FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //Le1pf(Conexao);
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
            
                        UsuarioDados.Read();
                            text = UsuarioDados["USD_1pf"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();
            
                        int IDPerg; int sQtde;
            
                        string text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                        Int32.TryParse(text1, out IDPerg);
                        text1 = text.Substring(text.IndexOf("Qtde:") + 5, (text.IndexOf("Clik:") - (text.IndexOf("Qtde:") + 5)));
                        Int32.TryParse(text1, out sQtde);
                    
            
                        if (sQtde > Convert.ToInt16(Session["DiaP"].ToString()))         /* || IDPerg > slMax */
                        {
                            text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                            Int32.TryParse(text1, out pSala);


                            //pClik = parseInt(text0.substr(text0.indexOf("Clik:") + 5), 10)
                            //pData = text0.substr(text0.indexOf("Data:") + 5, (text0.indexOf("Qtde:") - (text0.indexOf("Data:") + 5)))
                            //text1 = text.Substring(text.IndexOf("Clik:") + 5);
                            text1 = text.Substring(text.IndexOf("Clik:") + 5, (text.IndexOf("#R:") - (text.IndexOf("Clik:") + 5)));
                            Int32.TryParse(text1, out int pClik);
                            string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));

                            pTotl = pTotl + 200;

                            //Grava1pfG(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            //      queryString = "Insert Into PerfilGeral(USR_ID, PFG_Usuarios) values(" + Session["id"] + ",'" + text + "')";
                            //      command = new OdbcCommand(queryString, Conexao);
                            //      command.ExecuteNonQuery();

                            Conexao.Close();
                            Conexao.Dispose();

                            //return new Array("xo", pSala, pClik, pTotl, pData)
                            cu[0] = "xo";               HFco0.Value = "xo";
                            cu[1] = pSala.ToString();   HFco1.Value = pSala.ToString();
                            cu[2] = pClik.ToString();   HFco2.Value = pClik.ToString();
                            cu[3] = pTotl.ToString();   HFco3.Value = pTotl.ToString();
                            cu[4] = pData;              HFco4.Value = pData;
                        }
                        else
                        {
                            perg1 = resp1 = resp2 = resp3 = tema = "";
                            // NewPergunta(IDPerg, Conexao);
                            queryString = "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = " + IDPerg;
                            command = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Pergunta = command.ExecuteReader();
                            Pergunta.Read();
                                int cod = Convert.ToInt16(Pergunta["Codigo"]);
                                perg1 = (cod % 10).ToString() + "/10: " + Pergunta["Pergunta"].ToString();
                                resp1 = Pergunta["a"].ToString();
                                resp2 = Pergunta["b"].ToString();
                                resp3 = Pergunta["c"].ToString();
                                tema = Pergunta["Tema"].ToString();
                            Pergunta.Close();

                            //return new Array(perg1,resp1,resp2,resp3,tema1)
                            cu[0] = perg1; HFco0.Value = perg1;
                            cu[1] = resp1; HFco1.Value = resp1;
                            cu[2] = resp2; HFco2.Value = resp2;
                            cu[3] = resp3; HFco3.Value = resp3;
                            cu[4] = tema;  HFco4.Value = tema;
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

        }
    }
}