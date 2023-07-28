using Aspose.Cells;
using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class inputFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        //string sourceUrl = Request.UrlReferrer.ToString();
        //if (sourceUrl.IndexOf("https://wx.linkmed.cn") < 0)
        //{
        //    Response.Write("-1");
        //    Response.End();
        //    return;
        //}
      
        //try
       // {
            string m = DNTRequest.GetString("m");
           
            HttpPostedFile f = Request.Files[m];

            if (f.ContentLength > 0)
            {
                string fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + f.FileName.Substring(f.FileName.LastIndexOf('.'));
                string path = Server.MapPath("~/upload/" + fileName);
                f.SaveAs(path);
                Response.Write(fileName);
            }
            else
            {
                Response.Write("1");
            }
        //}
        //catch (Exception ex) 
        //{

           
      //  }
        
        Response.End();
    }
}