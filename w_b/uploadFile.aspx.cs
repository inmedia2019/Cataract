using General;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uploadfile_uploadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        HttpPostedFile file = Request.Files["FileData"]; 
        string uploadpath = Server.MapPath("~/upload/");
        string fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + new RandomKey().GenerateRandom(4) + System.IO.Path.GetExtension(file.FileName);
        if (file != null)
        {
            if (!Directory.Exists(uploadpath))
            {
                Directory.CreateDirectory(uploadpath);
            }
            file.SaveAs(uploadpath + fileName);
            Response.Write(fileName);
        }
        else
        {
            Response.Write("0");
        }
        Response.End();
    }

}