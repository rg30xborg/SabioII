using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Collections.Specialized;

namespace Sabio._1
{
    public partial class Sabio13 : System.Web.UI.Page
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

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            OdbcConnection Conexao = new OdbcConnection(connString);
            using (Conexao)
            {
                try
                {
                    Conexao.Open();

                    //GOSTARIA QUE FOSSE VIA POST MAS SÓ CONSEGUI NO ASP.NET VIA GET - Modificar no Futuro para Post
                    //using System.Collections.Specialized;  //ADD this for NameValueCollection
                    //      int loop1, loop2;
                    //      NameValueCollection coll;
                    //      
                    //      // Load Header collection into NameValueCollection object.
                    //      coll = Request.Form;
                    //      
                    //      // Put the names of all keys into a string array.
                    //      String[] arr1 = coll.AllKeys;
                    //      for (loop1 = 0; loop1 < arr1.Length; loop1++)
                    //      {
                    //          Response.Write("Key: " + arr1[loop1] + "<br>");
                    //          // Get all values under this key.
                    //          String[] arr2 = coll.GetValues(arr1[loop1]);
                    //          for (loop2 = 0; loop2 < arr2.Length; loop2++)
                    //          {
                    //              Response.Write("Value " + loop2 + ": " + Server.HtmlEncode(arr2[loop2]) + "<br>");
                    //          }
                    //      }

                    if (Request["ApagaData"] != null) {
                        foreach (var field_name in Request.QueryString) {
                            if (field_name.ToString() != "ApagaData" && Request[field_name.ToString()] != "0") {
                                string queryString = "DELETE FROM Eventos WHERE EVN_Cod = " + Request[field_name.ToString()] + " AND EVN_Email = '" + Session["mail"] + "'";
                                OdbcCommand command = new OdbcCommand(queryString, Conexao);
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                    Conexao.Close();
                }
                catch (Exception ex)
                {
                    Conexao.Close();
                    Conexao.Dispose();
                    Response.Redirect(ex.HelpLink);
                }
            }
            Conexao.Dispose();

            Response.Redirect("Sabio03.aspx");          //http://www.aggora.com.br/sabio/1/
            Response.End();
        }
    }
}