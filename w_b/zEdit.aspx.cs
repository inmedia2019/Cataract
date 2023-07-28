using bsc.DAL;
using bsc.Model;
using General;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zEdit : UserPage
{
    public int id = DNTRequest.GetInt("id", 0);

    public string trueName = "";
    public string danwei = "";
    public string keshi = "";
    public string zhiwu = "";
    public string fangxiang = "";
    public string dianhua = "";
    public string mail = "";
    public string anserInfo = "";
    public string zcs="";
    public string CWID = "";
    public string email = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (id > 0)
                BindData();
        }
    }

    private void BindData()
    {
        try
        {
            buserAnswers info = new buserAnswersDAL().GetModel(id);
            memberInfo minfo = new memberInfoDAL().GetModel(info.openId);
            trueName = minfo.nickname;
            CWID = minfo.openId;
         
            dianhua = minfo.trueName;
            email = minfo.email;


            string[] timu = info.answers.Split('〓');
            ArrayList questions = new ArrayList();
            ArrayList answers = new ArrayList();
            for (int i = 0; i < timu.Length; i++)
            {
                if (timu[i].Length > 0)
                {
                    string[] childTemp = timu[i].Split('ん');
                    questions.Add(childTemp[0]);
                    answers.Add(childTemp[1]);
                }
            }

           
            for (int i = 0; i < questions.Count; i++)
            {
                if (questions[i].ToString().Length > 0)
                {
                    string timmu = "";
                    string daans = "";
                    try
                    {
                        if (info.sex == 0)
                            timmu = new bquestionsDAL().GetModel(Utils.ToInt(questions[i])).title;
                        else
                            timmu = new bquestionsDAL().GetModel(Utils.ToInt(questions[i])).Entitle;
                    }
                    catch (Exception)
                    {
                        timmu = "题目已删除";
                    }


                   
                        string[] tempDa = answers[i].ToString().Split(',');

                        for (int k = 0; k < tempDa.Length; k++)
                        {
                            if (tempDa[k].Length > 0)
                            {
                                try
                                {
                                    daans += new banswerInfoDAL().GetModel(Utils.ToInt(tempDa[k])).ainfo + "<br /><br />";
                                }
                                catch (Exception)
                                {

                                    daans += tempDa[k];
                                }
                               
                            }
                        }


                    
                      
                   
                    anserInfo += "<div class=\"control-group\">" +
                                    "<label for=\"title\" class=\"control-label\">" +
                                        "题目：</label>" +
                                    "<div class=\"controls\">" +
                                       timmu +
                                    "</div>" +
                                "</div>" +
                                "<div class=\"control-group\">" +
                                    "<label for=\"title\" class=\"control-label\">" +
                                        "答案：</label>" +
                                    "<div class=\"controls\" style=\"color:red;\">" +
                                          (daans == "" ? "未作答" : daans) +
                                    "</div>" +
                                "</div>";
                }
            }

        }
        catch (Exception)
        {
            
         
        }
    }
  
}
