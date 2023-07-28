using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
	/// teacherAccout:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
[Serializable]
public partial class teacherAccout
{
    public teacherAccout()
    { }
    #region Model
    private int _id;
    private string _accoutinfo;
    private string _accoutpwd;
    private int _areaid;
    private int _state;
    private DateTime _createdate;
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
    public string accoutInfo
    {
        set { _accoutinfo = value; }
        get { return _accoutinfo; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string accoutPwd
    {
        set { _accoutpwd = value; }
        get { return _accoutpwd; }
    }
    /// <summary>
    /// 
    /// </summary>
    public int areaId
    {
        set { _areaid = value; }
        get { return _areaid; }
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
