using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
	/// y_admin:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
[Serializable]
public partial class y_admin
{
    public y_admin()
    { }
    #region Model
    private int _userid;
    private string _username;
    private string _pwd;
    private int _state;
    private DateTime _createdate;
    private string _morecol;
    private string _morecol1;
    /// <summary>
    /// 
    /// </summary>
    public int userid
    {
        set { _userid = value; }
        get { return _userid; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string username
    {
        set { _username = value; }
        get { return _username; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string pwd
    {
        set { _pwd = value; }
        get { return _pwd; }
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
    public string morecol
    {
        set { _morecol = value; }
        get { return _morecol; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string morecol1
    {
        set { _morecol1 = value; }
        get { return _morecol1; }
    }
    #endregion Model

}


