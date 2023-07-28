using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
	/// FormInfo:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
[Serializable]
public partial class FormInfo
{
    public FormInfo()
    { }
    #region Model
    private int _id;
    private string _phone;
    private string _descript;
    private int _state;
    private DateTime _createdate;
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
    public string descript
    {
        set { _descript = value; }
        get { return _descript; }
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
    #endregion Model

}


