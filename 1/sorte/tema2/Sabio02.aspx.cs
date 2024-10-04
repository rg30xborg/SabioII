using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace Sabio._1.sorte.tema2
{
    public partial class Sabio02 : System.Web.UI.Page
    {
        protected int LibOk = 0;  //Equivale a Libok
        protected int LibSl = 0;  //Equivale a Libsl

        protected string text = "";
        //protected int pTotl = 0;
        //protected int pCosc = 0;
        //protected int pSala = 0;

        public static string[] co = { "P", "R", "Ê", "M", "I", "O", "S", "S", "S", "S" };
        public static string[] myFirst = { "P", "R", "Ê", "M", "I", "O", "S", "S", "S", "S" };
        protected DateTime Hoje = DateTime.Now;

        protected string[] myCarts = { "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                     "", "", "", "", "", "", "", "", "", "", "", "", "", ""
        };

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
                Response.Redirect("../../Sabio12.aspx");               //http://www.aggora.com.br/sabio/1/
                Response.End();
            }

            myCarts[0] = "01o"; myCarts[1] = "02o"; myCarts[2] = "03o"; myCarts[3] = "04o";
            myCarts[4] = "05o"; myCarts[5] = "06o"; myCarts[6] = "07o"; myCarts[7] = "08o";
            myCarts[8] = "09o"; myCarts[9] = "10o"; myCarts[10] = "11o"; myCarts[11] = "12o";
            myCarts[12] = "13o"; myCarts[13] = "01c"; myCarts[14] = "02c"; myCarts[15] = "03c";
            myCarts[16] = "04c"; myCarts[17] = "05c"; myCarts[18] = "06c"; myCarts[19] = "07c";
            myCarts[20] = "08c"; myCarts[21] = "09c"; myCarts[22] = "10c"; myCarts[23] = "11c";
            myCarts[24] = "12c"; myCarts[25] = "13c"; myCarts[26] = "01p"; myCarts[27] = "02p";
            myCarts[28] = "03p"; myCarts[29] = "04p"; myCarts[30] = "05p"; myCarts[31] = "06p";
            myCarts[32] = "07p"; myCarts[33] = "08p"; myCarts[34] = "09p"; myCarts[35] = "10p";
            myCarts[36] = "11p"; myCarts[37] = "12p"; myCarts[38] = "13p"; myCarts[39] = "01e";
            myCarts[40] = "02e"; myCarts[41] = "03e"; myCarts[42] = "04e"; myCarts[43] = "05e";
            myCarts[44] = "06e"; myCarts[45] = "07e"; myCarts[46] = "08e"; myCarts[47] = "09e";
            myCarts[48] = "10e"; myCarts[49] = "11e"; myCarts[50] = "12e"; myCarts[51] = "13e";
            myCarts[52] = "carta";

            if (!IsPostBack)
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    // Open the connection in a try/catch block.
                    try
                    {
                        Conexao.Open();
                        OdbcDataReader UserDados = command.ExecuteReader();
                        UserDados.Read();
                        LibOk = Convert.ToInt32(UserDados["USD_Total"].ToString());
                        LibSl = Convert.ToInt32(UserDados["USD_1gm"].ToString());
                        //pPrem = Request.QueryString["premio"];
                        UserDados.Close();

                        if (LibOk < 2 || Session["xdemo"].ToString() != "demo01"
                            || Request["dataz"].ToString() == "" || Request["salax"].ToString() == "")
                        {
                            Conexao.Close();
                            Conexao.Dispose();
                            Response.Redirect("../Sabio01.aspx?Err=1");        //http://www.aggora.com.br/sabio/1/sorte
                            Response.End();
                        }
                        Conexao.Close();
                        Conexao.Dispose();
                    }
                    catch (Exception ex)
                    {
                        var perg1 = ex.Message;
                    }
                }
            }

        }

        protected void LeSala(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "SELECT USD_Total, USD_1gm, USD_2gm FROM UserDados WHERE USR_ID = " + Session["id"];
                OdbcCommand command = new OdbcCommand(queryString, Conexao);

                // Open the connection in a try/catch block.
                try
                {
                    Conexao.Open();
                    OdbcDataReader UsuarioDados = command.ExecuteReader();
                    UsuarioDados.Read();
                    text = UsuarioDados["USD_2gm"].ToString();
                    LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                    LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                    UsuarioDados.Close();
                }
                catch (OdbcException ex)
                {
                    text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                }
                Conexao.Close();
            }
        }

        protected void GravaSala(OdbcConnection Conexao)
        {
            using (Conexao)
            {
                string queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_2gm = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
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
                    text = "Ocorreu uma excessão na consulta GravaSala - Recarregue a Page (" + ex.Message + ")";
                }
            }
        }

        protected void GravaStr(OdbcConnection Conexao, string str)
        {
            using (Conexao)
            {
                string queryString = "UPDATE UserDados SET USD_2gm = '" + str + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
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
                    text = "Ocorreu uma excessão na consulta GravaSala - Recarregue a Page (" + ex.Message + ")";
                }
            }
        }

        protected void Reg21_Click(object sender, ImageClickEventArgs e)
        {
            if (HFPCert.Value == "0")
            {
                text = ""; LibOk = 0; LibSl = 0;

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = queryString = "SELECT USD_Total, USD_1gm, USD_2gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;

                    try
                    {
                        //LeSala(Conexao);
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                        text = UsuarioDados["USD_2gm"].ToString();
                        LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                        UsuarioDados.Close();

                        int gparc = 0; int cred = LibOk;
                        if (text != "new")
                        {
                            if (text[0] != '?' && text[0] != '0')
                            {
                                gparc = Convert.ToInt16(text.Substring(0, text.IndexOf("-")));
                                //cred  = Convert.ToInt16(text.Substring(text.IndexOf("!") + 1));
                                if (gparc > 0)
                                {
                                    cred += gparc;
                                    LibSl += gparc;
                                    LibOk += gparc;
                                    text = "new";
                                }
                            }

                            //GravaSala(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_2gm = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();
                            
                        }

                        cred = LibOk;       //parseInt(text, 10);
                        int aposm = Convert.ToInt16(HFApost.Value);
                        int apos = 0;

                        if (cred > 0)
                        {
                            //var myFirst = new Array(); //Criado em Global Vars
                            if (aposm < 11) apos = aposm; else apos = 10;
                            if (apos > cred) apos = cred; cred -= apos;

                            LibOk = cred;
                            LibSl = LibSl - apos;
                            myFirst[0] = LibOk.ToString();

                            Random rnd = new Random();

                            int p = rnd.Next(0, 51);
                            myFirst[1] = myCarts[p];
                            int num1 = Convert.ToInt16(myCarts[p].Substring(0, 2));
                            string nai1 = myCarts[p].Substring(2, 1);

                            int o = rnd.Next(0, 51);
                            while (o == p)
                                o = rnd.Next(0, 51);
                            myFirst[2] = myCarts[o];
                            int num2 = Convert.ToInt16(myCarts[o].Substring(0, 2));
                            string nai2 = myCarts[o].Substring(2, 1);

                            int k = rnd.Next(0, 51);
                            while (k == p || k == o)
                                k = rnd.Next(0, 51);
                            myFirst[3] = myCarts[k];
                            int num3 = Convert.ToInt16(myCarts[k].Substring(0, 2));
                            string nai3 = myCarts[k].Substring(2, 1);

                            int ee = rnd.Next(0, 51);
                            while (ee == p || ee == o || ee == k)
                                ee = rnd.Next(0, 51);
                            myFirst[4] = myCarts[ee];
                            int num4 = Convert.ToInt16(myCarts[ee].Substring(0, 2));
                            string nai4 = myCarts[ee].Substring(2, 1);

                            int r = rnd.Next(0, 51);
                            while (r == p || r == o || r == k || r == ee)
                                r = rnd.Next(0, 51);
                            myFirst[5] = myCarts[r];
                            int num5 = Convert.ToInt16(myCarts[r].Substring(0, 2));
                            string nai5 = myCarts[r].Substring(2, 1);

                            int jogo = 0;
                            if (num1 == num2) jogo++; if (num1 == num3) jogo++; if (num1 == num4) jogo++; if (num1 == num5) jogo++;
                            if (num2 == num3) jogo++; if (num2 == num4) jogo++; if (num2 == num5) jogo++;
                            if (num3 == num4) jogo++; if (num3 == num5) jogo++;
                            if (num4 == num5) jogo++;

                            if (jogo == 0)
                            {
                                int seq0 = 0; int seq1 = 0; int seq2 = 0;
                                seq1 = Math.Min(num1, num2);
                                seq1 = Math.Min(seq1, num3);
                                seq1 = Math.Min(seq1, num4);
                                seq1 = Math.Min(seq1, num5);
                                if (seq1 == 1)
                                {
                                    seq2 = Math.Max(num1, num2);
                                    seq2 = Math.Max(seq2, num3);
                                    seq2 = Math.Max(seq2, num4);
                                    seq2 = Math.Max(seq2, num5);
                                    if (seq2 == 13) seq1 = 10;
                                    else seq1 = 2;
                                }
                                else seq1++;
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) { seq0++; seq1++; }
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) { seq0++; seq1++; }
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) { seq0++; seq1++; }
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) seq0++;
                                if (seq0 == 4 && nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5) jogo = 150;
                                else
                                {
                                    if (nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5) jogo = 10;
                                    else
                                    {
                                        if (seq0 == 4) jogo = 5;
                                    }
                                }
                            }

                            if (jogo == 0) myFirst[6] = "Nada - Parcial";
                            if (jogo == 1) myFirst[6] = "Uma dupla - Parcial";
                            if (jogo == 2) myFirst[6] = "Duas duplas - Parcial";
                            if (jogo == 3) myFirst[6] = "Trinca - Parcial";
                            if (jogo == 4) myFirst[6] = "Fulla - Parcial";
                            if (jogo == 5) myFirst[6] = "Sequência - Parcial";
                            if (jogo == 6) myFirst[6] = "Quadra - Parcial";
                            if (jogo == 10) myFirst[6] = "Flash - Parcial";
                            if (jogo == 150) myFirst[6] = "Street Flash - Parcial";
                            if (jogo >= 2) myFirst[7] = "yes"; else myFirst[7] = "no";

                            myFirst[8] = LibSl.ToString(); //pSala
                            text = "?" + apos + "!" + cred + "#" + 610509 + ":" + " " + (p + 10) + " " + (o + 10) + " " + (k + 10) + " " + (ee + 10) + " " + (r + 10);

                            //GravaSala(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_2gm = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();
                            Conexao.Close();

                            //return myFirst
                            co[0] = myFirst[0]; HFco0.Value = myFirst[0];
                            co[1] = myFirst[1]; HFco1.Value = myFirst[1];
                            co[2] = myFirst[2]; HFco2.Value = myFirst[2];
                            co[3] = myFirst[3]; HFco3.Value = myFirst[3];
                            co[4] = myFirst[4]; HFco4.Value = myFirst[4];
                            co[5] = myFirst[5]; HFco5.Value = myFirst[5];
                            co[6] = myFirst[6]; HFco6.Value = myFirst[6];
                            co[7] = myFirst[7]; HFco7.Value = myFirst[7];
                            co[8] = myFirst[8]; HFco8.Value = myFirst[8];
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                    }
                }
                Conexao.Dispose();
            }

        }

        protected void Reg20_Click(object sender, ImageClickEventArgs e)
        {
            if (HFPCert.Value == "1")
            {
                text = ""; LibOk = 0; LibSl = 0;

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = queryString = "SELECT USD_Total, USD_1gm, USD_2gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;

                    try
                    {
                        //LeSala(Conexao);
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                            text = UsuarioDados["USD_2gm"].ToString();      //EX:   '?10!5009#610509: 58 20 10 29 24'
                            LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                            LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                        UsuarioDados.Close();

                        int tr1, tr2, tr3, tr4, tr5;
                        tr1 = Convert.ToInt16(HFco1.Value);
                        tr2 = Convert.ToInt16(HFco2.Value);
                        tr3 = Convert.ToInt16(HFco3.Value);
                        tr4 = Convert.ToInt16(HFco4.Value);
                        tr5 = Convert.ToInt16(HFco5.Value);

                        int cred = Convert.ToInt32(text.Substring(text.IndexOf("!") + 1, ((text.IndexOf("#610509")) - (text.IndexOf("!") + 1))));
                        cred = LibOk;       //faço isso aqui para testar se o que esta lendo é igual ao DB

                        if (cred >= 0)
                        {
                            var i = text.IndexOf(":") + 2;
                            int p =  Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int o =  Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int k =  Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int ee = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int r =  Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;

                            int apos = Convert.ToInt16(text.Substring(text.IndexOf("?") + 1, ((text.IndexOf("!")) - (text.IndexOf("?") + 1))));
                            apos = Convert.ToInt16(HFApost.Value);   //faço isso aqui para testar se o que esta lendo é igual ao DB

                            Random rnd = new Random();
                            int p1, o1, k1, e1, r1 = 0;
                            if (tr1 == 1)
                            {
                                p1 = rnd.Next(0, 51);
                                while (p1 == p || p1 == o || p1 == k || p1 == ee || p1 == r)
                                    p1 = rnd.Next(0, 51);
                            }
                            else
                                p1 = p;

                            myFirst[1] = myCarts[p1];
                            int num1 = Convert.ToInt16(myCarts[p1].Substring(0, 2));
                            string nai1 =myCarts[p1].Substring(2, 1);

                            if (tr2 == 1)
                            {
                                o1 = rnd.Next(0, 51);
                                while (o1 == p || o1 == o || o1 == k || o1 == ee || o1 == r || o1 == p1)
                                    o1 = rnd.Next(0, 51);
                            }
                            else
                                o1 = o;

                            myFirst[2] = myCarts[o1];
                            int num2 = Convert.ToInt16(myCarts[o1].Substring(0, 2));
                            string nai2 = myCarts[o1].Substring(2, 1);


                            if (tr3 == 1)
                            {
                                k1 = rnd.Next(0, 51);
                                while (k1 == p || k1 == o || k1 == k || k1 == ee || k1 == r || k1 == p1 || k1 == o1)
                                    k1 = rnd.Next(0, 51);
                            }
                            else
                                k1 = k;

                            myFirst[3] = myCarts[k1];
                            int num3 = Convert.ToInt16(myCarts[k1].Substring(0, 2));
                            string nai3 = myCarts[k1].Substring(2, 1);


                            if (tr4 == 1)
                            {
                                e1 = rnd.Next(0, 51);
                                while (e1 == p || e1 == o || e1 == k || e1 == ee || e1 == r || e1 == p1 || e1 == o1 || e1 == k1)
                                    e1 = rnd.Next(0, 51);
                            }
                            else
                                e1 = ee;

                            myFirst[4] = myCarts[e1];
                            int num4 = Convert.ToInt16(myCarts[e1].Substring(0, 2));
                            string nai4 = myCarts[e1].Substring(2, 1);


                            if (tr5 == 1)
                            {
                                r1 = rnd.Next(0, 51);
                                while (r1 == p || r1 == o || r1 == k || r1 == ee || r1 == r || r1 == p1 || r1 == o1 || r1 == k1 || r1 == e1)
                                    r1 = rnd.Next(0, 51);
                            }
                            else
                                r1 = r;

                            myFirst[5] = myCarts[r1];
                            int num5 = Convert.ToInt16(myCarts[r1].Substring(0, 2));
                            string nai5 = myCarts[r1].Substring(2, 1);

                            int jogo = 0;
                            if (num1 == num2) jogo++; if (num1 == num3) jogo++; if (num1 == num4) jogo++; if (num1 == num5) jogo++;
                            if (num2 == num3) jogo++; if (num2 == num4) jogo++; if (num2 == num5) jogo++;
                            if (num3 == num4) jogo++; if (num3 == num5) jogo++;
                            if (num4 == num5) jogo++;

                            int seq0 = 0; int seq1 = 0; int seq2 = 0;
                            if (jogo == 0)
                            {
                                seq1 = Math.Min(num1, num2);
                                seq1 = Math.Min(seq1, num3);
                                seq1 = Math.Min(seq1, num4);
                                seq1 = Math.Min(seq1, num5);
                                if (seq1 == 1)
                                {
                                    seq2 = Math.Max(num1, num2);
                                    seq2 = Math.Max(seq2, num3);
                                    seq2 = Math.Max(seq2, num4);
                                    seq2 = Math.Max(seq2, num5);
                                    if (seq2 == 13)
                                        seq1 = 10;
                                    else
                                        seq1 = 2;
                                }
                                else
                                    seq1++;

                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) { seq0++; seq1++; }
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) { seq0++; seq1++; }
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) { seq0++; seq1++; }
                                if (seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5) seq0++;
                                if (seq0 == 4 && nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5) jogo = 150;

                                else
                                {
                                    if (nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5) jogo = 10;
                                    else
                                    {
                                        if (seq0 == 4) jogo = 5;
                                    }
                                }
                            }

                            int sorte = 1;
                            if (num1 == 1 || num2 == 1 || num3 == 1 || num4 == 1 || num5 == 1) sorte = 2;

                            int gparc = 0;
                            if (jogo == 0) myFirst[6]     = "Nada - Final";
                            if (jogo == 1) myFirst[6]     = "Uma dupla - Não Ganha";
                            if (jogo == 2) { myFirst[6]   = "'Duas duplas - Ganha " + apos * 2; gparc = (apos * 2); }
                            if (jogo == 3) { myFirst[6]   = "Trinca - Ganha " + apos * 3; gparc = (apos * 3); }
                            if (jogo == 4) { myFirst[6]   = "Fulla - Ganha " + (apos * 10 * sorte); gparc = (apos * 10 * sorte); }
                            if (jogo == 5) { myFirst[6]   = "Sequência - Ganha " + apos * 5; gparc = (apos * 5); }
                            if (jogo == 6) { myFirst[6]   = "Quadra - Ganha " + (apos * 60 * sorte); gparc = (apos * 60 * sorte); }
                            if (jogo == 10) { myFirst[6]  = "Flash - Ganha " + apos * 6; gparc = (apos * 6); }
                            if (jogo == 150) { myFirst[6] = "Street Flash - Ganha " + (apos * 150 * sorte); gparc = (apos * 150 * sorte); }
                            if(jogo >= 2) myFirst[7] = "yes"; else myFirst[7] = "no";

                            text = gparc.ToString() + "-" + text + ":: " + (p1 + 10) + " " + (o1 + 10) + " " + (k1 + 10) + " " + (e1 + 10) + " " + (r1 + 10);

                            //GravaSala(Conexao)
                            queryString = "UPDATE UserDados SET USD_Total = " + LibOk + ", USD_1gm = " + LibSl + ", USD_2gm = '" + text + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            //Conexao.Close
                            //return mySecond
                            co[0] = myFirst[0]; HFco0.Value = myFirst[0];
                            co[1] = myFirst[1]; HFco1.Value = myFirst[1];
                            co[2] = myFirst[2]; HFco2.Value = myFirst[2];
                            co[3] = myFirst[3]; HFco3.Value = myFirst[3];
                            co[4] = myFirst[4]; HFco4.Value = myFirst[4];
                            co[5] = myFirst[5]; HFco5.Value = myFirst[5];
                            co[6] = myFirst[6]; HFco6.Value = myFirst[6];
                            co[7] = myFirst[7]; HFco7.Value = myFirst[7];
                            co[8] = myFirst[8]; HFco8.Value = myFirst[8];
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                    }
                }
                Conexao.Dispose();
            }

        }

        protected void Reg21a_Click(object sender, ImageClickEventArgs e)
        {
            if (HFPCert.Value == "2")
            {
                text = ""; LibOk = 0; LibSl = 0;

                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
                OdbcConnection Conexao = new OdbcConnection(connString);
                using (Conexao)
                {
                    string queryString = queryString = "SELECT USD_Total, USD_1gm, USD_2gm FROM UserDados WHERE USR_ID = " + Session["id"];
                    OdbcCommand command = new OdbcCommand(queryString, Conexao);
                    command.CommandTimeout = 60;

                    try
                    {
                        //LeSala(Conexao);
                        Conexao.Open();
                        OdbcDataReader UsuarioDados = command.ExecuteReader();
                        UsuarioDados.Read();
                        text = UsuarioDados["USD_2gm"].ToString();
                        LibOk = Convert.ToInt32(UsuarioDados["USD_Total"].ToString());
                        LibSl = Convert.ToInt32(UsuarioDados["USD_1gm"].ToString());
                        UsuarioDados.Close();

                        string dob, naipe; int numero;
                        dob = HFco1.Value;
                        numero = Convert.ToInt16(HFco2.Value);
                        naipe = HFco3.Value;

                        int gparc;
                        gparc = Convert.ToInt16(text.Substring(0, text.IndexOf("-")));
                        //gparc = parseInt(txt1, 10)

                        if (gparc > 0)
                        {
                            //var i = text.IndexOf(":") + 1
                            //p = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //o = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //k = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //e = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //r = parseInt(txt1.substring(i, i += 3), 10) - 10

                            var i = text.IndexOf(":") + 2;
                            int p = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int o = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int k = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int ee = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int r = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;

                            int p1 = Convert.ToInt16(text.Substring(i += 2, 2)) - 10; i += 3;
                            int o1 = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int k1 = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int e1 = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;
                            int r1 = Convert.ToInt16(text.Substring(i, 2)) - 10; i += 3;

                            //p1 = parseInt(txt1.substring(i += 2, i += 3), 10) - 10
                            //o1 = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //k1 = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //e1 = parseInt(txt1.substring(i, i += 3), 10) - 10
                            //r1 = parseInt(txt1.substring(i, i += 3), 10) - 10

                            int p2 = 52; int o2 = 52; int k2 = 52; int e2 = 52;
                            //var myThirt = new Array()
                            i = text.IndexOf("::: "); myFirst[3] = "indice=" + i;

                            if (i > 0)
                            {
                                string txt2 = text.Substring(i + 3); int len = txt2.Length;
                                myFirst[4] = "txt2=" + txt2; myFirst[5] = "len=" + len;

                                           p2 = Convert.ToInt16(txt2.Substring(i = 1, 2)) - 10; i += 3; myFirst[6] = "p2=" + p2;
                                if (len > 3) { o2 = Convert.ToInt16(txt2.Substring(i, 2)) - 10; i += 3; myFirst[7] = "o2=" + o2; }
                                if (len > 6) { k2 = Convert.ToInt16(txt2.Substring(i, 2)) - 10; i += 3; myFirst[8] = "k2=" + k2; }
                                if (len > 9) { e2 = Convert.ToInt16(txt2.Substring(i, 2)) - 10; i += 3; myFirst[9] = "e2=" + e2; }
                            }
                            Random rnd = new Random();

                            int xx2 = rnd.Next(0, 51);
                            while (xx2 == p || xx2 == o || xx2 == k || xx2 == ee || xx2 == r || xx2 == p1 || xx2 == o1
                                            || xx2 == k1 || xx2 == e1 || xx2 == r1 || xx2 == p2 || xx2 == o2 || xx2 == k2 || xx2 == e2)
                                  xx2 = rnd.Next(0, 51);

                            myFirst[0] = myCarts[xx2];
                            int num = Convert.ToInt16(myCarts[xx2].Substring(0, 2));
                            string nai = myCarts[xx2].Substring(2, 1);


                            if (dob != "x1")
                            {
                                if (num == 7)
                                {
                                    myFirst[1] = "Sete é Neutra - Mantém " + gparc;
                                }
                                else
                                {
                                    if ((dob == "<" && num < 7) || (dob == ">" && num > 7))
                                    {
                                        gparc = (gparc * 2); myFirst[1] = "Ganha dobra - " + gparc;
                                    }
                                    else
                                    {
                                        gparc = 0; myFirst[1] = "Perde dobra - ZERO";
                                    }
                                }
                            }
                            else
                            {
                                int sorte = 1;
                                if (nai == naipe) sorte *= 2;
                                if (num == numero) sorte *= 4;
                                if (num == numero && nai == naipe) sorte = 10;
                                if (sorte >= 2) {
                                    gparc *= sorte; myFirst[1] = "Ganha cheia - " + gparc;
                                }
                                else {
                                    gparc = 0; myFirst[1] = "Perde cheia - ZERO";
                                }
                            }
                            if (gparc == 0) myFirst[2] = "yes"; else myFirst[2] = "no";
                            string str = gparc.ToString() + "-" + text + (text.IndexOf("::: ") < 0 ? "::: " : " ") + (xx2 + 10);

                            //GravaStr(Conexao, str)
                            queryString = "UPDATE UserDados SET USD_2gm = '" + str + "', USD_Acesso = '" + Hoje + "' WHERE USR_ID = " + Session["id"];
                            command = new OdbcCommand(queryString, Conexao);
                            command.ExecuteNonQuery();

                            //return myThirt
                            co[0] = myFirst[0]; HFco0.Value = myFirst[0];
                            co[1] = myFirst[1]; HFco1.Value = myFirst[1];
                            co[2] = myFirst[2]; HFco2.Value = myFirst[2];
                            co[3] = myFirst[3]; HFco3.Value = myFirst[3];
                            co[4] = myFirst[4]; HFco4.Value = myFirst[4];
                            co[5] = myFirst[5]; HFco5.Value = myFirst[5];
                            co[6] = myFirst[6]; HFco6.Value = myFirst[6];
                            co[7] = myFirst[7]; HFco7.Value = myFirst[7];
                            co[8] = myFirst[8]; HFco8.Value = myFirst[8];
                            co[9] = myFirst[9]; HFco9.Value = myFirst[9];
                        }
                        Conexao.Close();
                    }
                    catch (OdbcException ex)
                    {
                        text = "Ocorreu uma excessão na consulta LeSala - Recarregue a Page (" + ex.Message + ")";
                    }
                }
                Conexao.Dispose();
            }
        }

    }
}