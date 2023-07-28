using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
	/// y_admin:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
[Serializable]
public partial class ztypeInfo
{
    public ztypeInfo()
    { }
    #region Model
    private int id;
    private string _sname;
    private int _isRecommand;
    private string _descript;
    private string _description;
    private int _state;
    private DateTime _createdate;
    private string _morecol;
    private string _morecol1;
    private string _tName;
    private string _tPassWord;
    /// <summary>
    /// 
    /// </summary>
    public int Id
    {
        set { id = value; }
        get { return id; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string sname
    {
        set { _sname = value; }
        get { return _sname; }
    }
    /// <summary>
    /// 
    /// </summary>
    public int isRecommand
    {
        set { _isRecommand = value; }
        get { return _isRecommand; }
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
    public string description
    {
        set { _description = value; }
        get { return _description; }
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
    /// <summary>
    /// 
    /// </summary>
    public string tName
    {
        set { _tName = value; }
        get { return _tName; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string tPassWord
    {
        set { _tPassWord = value; }
        get { return _tPassWord; }
    }
    #endregion Model

}


