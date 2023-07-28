using General;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ueditor_cj_ImgUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string base64str = Request.Form["base64str"];
        string imgurl = Request.Form["imgurl"];
        Response.Write(GetMessage(base64str, imgurl));
        Response.End();
    }

    private string GetMessage(string base64str, string imgurl)
    {
       

        string[] temp = base64str.Split(';');
        string[] childtemp = temp[0].Split('/');
        string[] imgtemp = temp[1].Split(',');
        string temps = imgurl.Substring(imgurl.LastIndexOf("/") + 1);
        temps = temps.Substring(0, temps.LastIndexOf("."));
        string imgInfo = temps + "_1." + childtemp[1];
        MemoryStream stream = new MemoryStream(Convert.FromBase64String(imgtemp[1]));
        Bitmap img = new Bitmap(stream);
        img.Save(Server.MapPath("~/upload/" + imgInfo));

        return imgInfo;
    }
}