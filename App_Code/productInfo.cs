using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
	/// productInfo:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
[Serializable]
public partial class productInfo
{
    public productInfo()
    { }
    #region Model
    private int _id;
    private int _mid;
    private string _truename;
    private string _hospital;
    private string _provicename;
    private string _salename;
    private string _title;
    private int _majortype;
    private string _videoid;
    private string _videourl;
    private string _fileurl;
    private string _demourl;
    private string _descript;
    private int _areaid;
    private int _state;
    private DateTime _createdate;
    private string _morecol;
    private string _morecol1;
    private string _sqUrl;
    private string _pptContent;

    /// <summary>
    /// 
    /// </summary>
    public string pptContent
    {
        set { _pptContent = value; }
        get { return _pptContent; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string sqUrl
    {
        set { _sqUrl = value; }
        get { return _sqUrl; }
    }
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
    public int mid
    {
        set { _mid = value; }
        get { return _mid; }
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
    /// 
    /// </summary>
    public int majorType
    {
        set { _majortype = value; }
        get { return _majortype; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string videoId
    {
        set { _videoid = value; }
        get { return _videoid; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string videoUrl
    {
        set { _videourl = value; }
        get { return _videourl; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string fileUrl
    {
        set { _fileurl = value; }
        get { return _fileurl; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string demoUrl
    {
        set { _demourl = value; }
        get { return _demourl; }
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


