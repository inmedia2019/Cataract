using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// phoneSendCode 的摘要说明
/// </summary>
public class phoneSendCode
{
	public phoneSendCode()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    #region Model
    private int _id;
    private string _phone;
    private string _vcode;
    private int _tid;
    private DateTime _createdate;
    private int _state;
    private string _descript;
    private string _morecol;
    private string _morecol1;
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
    public string phone
    {
        set { _phone = value; }
        get { return _phone; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string vcode
    {
        set { _vcode = value; }
        get { return _vcode; }
    }
    /// <summary>
    /// 0:注册验证码
    /// </summary>
    public int tid
    {
        set { _tid = value; }
        get { return _tid; }
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
    public int state
    {
        set { _state = value; }
        get { return _state; }
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
    #endregion Model
}