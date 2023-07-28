using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
    /// <summary>
	/// memberInfo:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
[Serializable]
public partial class memberInfo
{
    public memberInfo()
    { }
    #region Model
    private int _id;
    private string _openid;
    private string _passcode;
    private string _truename;
    private string _hospital;
    private string _provicename;
    private string _salename;
    private string _title;
    private int _majortype;
    private string _descript;
    private string _email;
    private int _state;
    private DateTime _createdate;
    private string _morecol;
    private string _morecol1;
    private string _phone;
    /// <summary>
    /// 
    /// </summary>
    public int Id
    {
        set { _id = value; }
        get { return _id; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string openId
    {
        set { _openid = value; }
        get { return _openid; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string passCode
    {
        set { _passcode = value; }
        get { return _passcode; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string trueName
    {
        set { _truename = value; }
        get { return _truename; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string hospital
    {
        set { _hospital = value; }
        get { return _hospital; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string proviceName
    {
        set { _provicename = value; }
        get { return _provicename; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string saleName
    {
        set { _salename = value; }
        get { return _salename; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string title
    {
        set { _title = value; }
        get { return _title; }
    }
    /// <summary>
    /// 1:青光眼合并白内障 2:糖尿病合并白内障 3:高度近视白内障 4:其他
    /// </summary>
    public int majorType
    {
        set { _majortype = value; }
        get { return _majortype; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string descript
    {
        set { _descript = value; }
        get { return _descript; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string email
    {
        set { _email = value; }
        get { return _email; }
    }
    /// <summary>
    /// 
    /// </summary>
    public int state
    {
        set { _state = value; }
        get { return _state; }
    }
    /// <summary>
    /// 
    /// </summary>
    public DateTime createDate
    {
        set { _createdate = value; }
        get { return _createdate; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string moreCol
    {
        set { _morecol = value; }
        get { return _morecol; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string moreCol1
    {
        set { _morecol1 = value; }
        get { return _morecol1; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string phone
    {
        set { _phone = value; }
        get { return _phone; }
    }
    
    #endregion Model

}


