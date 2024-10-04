using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;

namespace Sabio._1.tema14
{
    public partial class Sabio01 : System.Web.UI.Page
    {

        protected int pTotl = 0;
        protected int pCosc = 0;
        protected int pSala = 0;
        protected int Codigo = 0;
        protected static int slMax;
        protected string text = "";
        protected string Nome = "";
        protected string Titulo = "";
        protected string Descricao = "";
        protected string Tipo = "";
        protected string Arquivo = "";
        protected string OlhoVivo = "";
        protected string Cod = "";
        protected string perg1 = "";
        protected int man = 0;
        protected int leg = 0;
        protected int dma = 0;
        public static string[] co = { "P", "R", "Ê", "M", "I", "O", "S", "S", "S" };
        public static string[] cu = { "P", "R", "Ê", "M", "I", "O", "S", "S", "S" };
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
                    string queryString = "SELECT MAX(Codigo) AS max_Codigo FROM Perg0014";
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

                        queryString = "SELECT USD_Consec, USD_Sala14 FROM UserDados WHERE USR_ID = " + Session["id"];
                        OdbcCommand command1 = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader DadosS = command1.ExecuteReader();
                        DadosS.Read();
                            pCosc = Convert.ToInt16(DadosS["USD_Consec"].ToString());
                            text = DadosS["USD_Sala14"].ToString();
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
                            queryString = "SELECT * FROM Perg0014 T, Users U WHERE U.USR_ID = T.USR_ID and T.Codigo = " + (Convert.ToInt16(pPerg) + 1);
                            OdbcCommand command2a = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Talento = command2a.ExecuteReader();
                            Talento.Read();
                                Codigo = (Convert.ToInt16(pPerg) + 1);
                                Nome = Talento["USR_Nome"].ToString();
                                Titulo = Talento["Titulo"].ToString();
                                Descricao = Talento["Descricao"].ToString();
                                Tipo = Talento["Tipo"].ToString();
                                Arquivo = "uploads/" + Talento["Arquivo"].ToString();
                                man = Convert.ToInt16(Talento["Manero"].ToString());
                                leg = Convert.ToInt16(Talento["Legal"].ToString());
                                dma = Convert.ToInt16(Talento["Demais"].ToString());
                            text = pResp + "Perg:" + Codigo + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + (Convert.ToInt16(pQtde) + 1);
                            Talento.Close();

                        }
                        else
                        {
                            pSala = 0;
                            queryString = "SELECT * FROM Perg0014 T, Users U WHERE U.USR_ID = T.USR_ID and T.Codigo = 1";
                            OdbcCommand command2b = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Talento = command2b.ExecuteReader();
                            Talento.Read();
                                Codigo = 1;
                                Nome = Talento["USR_Nome"].ToString();
                                Titulo = Talento["Titulo"].ToString();
                                Descricao = Talento["Descricao"].ToString();
                                Tipo = Talento["Tipo"].ToString();
                                Arquivo = "uploads/" + Talento["Arquivo"].ToString();
                                man = Convert.ToInt16(Talento["Manero"].ToString());
                                leg = Convert.ToInt16(Talento["Legal"].ToString());
                                dma = Convert.ToInt16(Talento["Demais"].ToString());
                            text = "m" + "Perg:" + Codigo + "Sala:" + pSala + "Data:" + Hoje + "Qtde:1";
                            Talento.Close();
                        }

                        queryString = "UPDATE UserDados SET USD_Sala14 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
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
                string queryString = "SELECT USD_Total, USD_Consec, USD_Sala14 FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UsuarioDados = command.ExecuteReader();
                    UsuarioDados.Read();
                        text = UsuarioDados["USD_Sala14"].ToString();
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
                string queryString = "SELECT * FROM Perg0014 T, Users U WHERE U.USR_ID = T.USR_ID and T.Codigo = " + IDPerg;
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader Talento = command.ExecuteReader();
                    Talento.Read();
                        Nome = Talento["USR_Nome"].ToString();
                        Titulo = Talento["Titulo"].ToString();
                        Descricao = Talento["Descricao"].ToString();
                        Tipo = Talento["Tipo"].ToString();
                        Arquivo = "uploads/" + Talento["Arquivo"].ToString();
                        man = Convert.ToInt16(Talento["Manero"].ToString());
                        leg = Convert.ToInt16(Talento["Legal"].ToString());
                        dma = Convert.ToInt16(Talento["Demais"].ToString());
                    Talento.Close();
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
                string queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala14 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                        command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    perg1 = "Ocorreu uma excessão na consulta GravaSala - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
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
                    string queryString = "SELECT USD_Total, USD_Consec, USD_Sala14 FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //LeSala(Conexao);
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();

                        UsuarioDados.Read();
                            text = UsuarioDados["USD_Sala14"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();

                        int sQtde = 0;
                        int newIDPerg = 0;
                        string apost = HFApost.Value;
                        string imagem = ""; string pCert = "";
                        switch (apost)
                        {
                            case "m": imagem = "1"; pCert = "Manero"; break;
                            case "l": imagem = "2"; pCert = "Legal";  break;
                            case "d": imagem = "3"; pCert = "Demais"; break;
                        }

                        string text1 = text.Substring(text.IndexOf("Sala:") + 5, text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5));
                        Int32.TryParse(text1, out pSala);
                        text1 = text.Substring(text.IndexOf("Qtde:") + 5);
                        Int32.TryParse(text1, out sQtde); sQtde++;
                        text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                        Int32.TryParse(text1, out newIDPerg);

                        //LeValorDaAtual(newIDPerg, Conexao);
                        queryString = "Select Manero, Legal, Demais From Perg0014 WHERE Codigo = " + newIDPerg;
                        command = new OdbcCommand(queryString, Conexao);
                        OdbcDataReader Valor = command.ExecuteReader();
                        Valor.Read();
                            man = Convert.ToInt16(Valor["Manero"].ToString());
                            leg = Convert.ToInt16(Valor["Legal"].ToString());
                            dma = Convert.ToInt16(Valor["Demais"].ToString());
                        Valor.Close();

                        int pVal = 0;
                        switch (apost)
                        {
                            case "m": man += 1; pVal = man; break;
                            case "l": leg += 1; pVal = leg; break;
                            case "d": dma += 1; pVal = dma; break;
                        }
                        
                        //GravaVotoAtual(newIDPerg, Conexao);
                        queryString = "UPDATE Perg0014 SET " + pCert + " = " + pVal + " WHERE Codigo = " + newIDPerg;
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteReader();

                        newIDPerg++;
                        if (newIDPerg > slMax) newIDPerg = 1;

                        pSala += 20; pTotl += 20; pCosc += 1;
                        text = apost + "Perg:" + newIDPerg + "Sala:" + pSala + "Data:" + Hoje + "Qtde:" + sQtde;

                        //GravaSala(Conexao);
                        queryString = "UPDATE UserDados SET USD_Total = " + pTotl + ", USD_Consec = " + pCosc + ",  USD_Sala14 = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                        command = new OdbcCommand(queryString, Conexao);
                        command.ExecuteNonQuery();

                        //co = { pCert, imagem, pSala.ToString(), pTotl.ToString(), pCosc.ToString(), "", "" };
                        co[0] = "ok";               HFco0.Value = "ok";
                        co[1] = imagem;             HFco1.Value = imagem;
                        co[2] = pSala.ToString();   HFco2.Value = pSala.ToString();
                        co[3] = pTotl.ToString();   HFco3.Value = pTotl.ToString();
                        co[4] = pCosc.ToString();   HFco4.Value = pCosc.ToString();
                        co[5] = man.ToString();     HFco5.Value = man.ToString();
                        co[6] = leg.ToString();     HFco6.Value = leg.ToString();
                        co[7] = dma.ToString();     HFco7.Value = dma.ToString();

                        Conexao.Close();
                    }
                    catch (Exception ex)
                    {
                        perg1 = "Ocorreu uma excessão na consulta - Recarregue a Page (" + ex.Message + ")";
                    }
                    //HFPCert.Value = "1";
                }
                else
                if (HFPCert.Value == "1")
                {
                    string queryString = "SELECT USD_Total, USD_Consec, USD_Sala14 FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 120;
                    text = ""; pTotl = 0; pCosc = 0;
                    //LeSala(Conexao);
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();

                        UsuarioDados.Read();
                            text = UsuarioDados["USD_Sala14"].ToString();
                            pCosc = Convert.ToInt16(UsuarioDados["USD_Consec"].ToString());
                            pTotl = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        UsuarioDados.Close();

                        int IDPerg; int sQtde;

                        string text1 = text.Substring(text.IndexOf("Perg:") + 5, text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5));
                        Int32.TryParse(text1, out IDPerg);
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
                            Nome = Titulo = Descricao = Tipo = Arquivo = ""; man = leg = dma = 0; Codigo = IDPerg;

                            // NewPergunta(IDPerg, Conexao);
                            queryString = "SELECT T.*, U.USR_Nome FROM Perg0014 T, Users U WHERE U.USR_ID = T.USR_ID and T.Codigo = " + IDPerg;
                            command = new OdbcCommand(queryString, Conexao);
                            OdbcDataReader Talento = command.ExecuteReader();
                            Talento.Read();
                                Nome = Talento["USR_Nome"].ToString();
                                Titulo = Talento["Titulo"].ToString();
                                Descricao = Talento["Descricao"].ToString();
                                Tipo = Talento["Tipo"].ToString();
                                Arquivo = "uploads/" + Talento["Arquivo"].ToString();
                                man = Convert.ToInt16(Talento["Manero"].ToString());
                                leg = Convert.ToInt16(Talento["Legal"].ToString());
                                dma = Convert.ToInt16(Talento["Demais"].ToString());
                            Talento.Close();

                            //Conexao.Close()
                            //co = new Array(perg1, resp1, resp2, resp3, resp4, resp5, figr1);
                            cu[0] = Nome;               HFco0.Value = Nome;
                            cu[1] = Titulo;             HFco1.Value = Titulo;
                            cu[2] = Descricao;          HFco2.Value = Descricao;
                            cu[3] = Tipo;               HFco3.Value = Tipo;
                            cu[4] = Arquivo;            HFco4.Value = Arquivo;
                            cu[5] = Codigo.ToString();  HFco5.Value = Codigo.ToString();
                            cu[6] = man.ToString();     HFco6.Value = man.ToString();
                            cu[7] = leg.ToString();     HFco7.Value = leg.ToString();
                            cu[8] = dma.ToString();     HFco8.Value = dma.ToString();
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