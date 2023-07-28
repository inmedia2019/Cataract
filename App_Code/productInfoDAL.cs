using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// productInfoDAL 的摘要说明
/// </summary>
public class productInfoDAL
{
	public productInfoDAL()
	{
		//
		// TODO: 在此处添加构造函数逻辑
	}


    /// <summary>
    /// 增加一条数据
    /// </summary>
    public bool Add(productInfo model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("insert into productInfo(");
        strSql.Append("mid,trueName,hospital,proviceName,saleName,title,majorType,videoId,videoUrl,fileUrl,demoUrl,descript,areaId,state,createDate,moreCol,moreCol1,sqUrl,pptContent)");
        strSql.Append(" values (");
        strSql.Append("@mid,@trueName,@hospital,@proviceName,@saleName,@title,@majorType,@videoId,@videoUrl,@fileUrl,@demoUrl,@descript,@areaId,@state,@createDate,@moreCol,@moreCol1,@sqUrl,@pptContent)");
        SqlParameter[] parameters = {
				
					new SqlParameter("@mid", SqlDbType.Int,4),
					new SqlParameter("@trueName", SqlDbType.NVarChar,500),
					new SqlParameter("@hospital", SqlDbType.NVarChar,500),
					new SqlParameter("@proviceName", SqlDbType.NVarChar,500),
					new SqlParameter("@saleName", SqlDbType.NVarChar,500),
					new SqlParameter("@title", SqlDbType.NVarChar,500),
					new SqlParameter("@majorType", SqlDbType.Int,4),
					new SqlParameter("@videoId", SqlDbType.NVarChar,500),
					new SqlParameter("@videoUrl", SqlDbType.NVarChar,500),
					new SqlParameter("@fileUrl", SqlDbType.NVarChar,500),
					new SqlParameter("@demoUrl", SqlDbType.NVarChar,500),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
					new SqlParameter("@areaId", SqlDbType.Int,4),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@moreCol", SqlDbType.NVarChar,500),
					new SqlParameter("@moreCol1", SqlDbType.NVarChar,500),
                    new SqlParameter("@sqUrl", SqlDbType.NVarChar,500),
                    new SqlParameter("@pptContent", SqlDbType.NVarChar,-1)};
      
        parameters[0].Value = model.mid;
        parameters[1].Value = model.trueName;
        parameters[2].Value = model.hospital;
        parameters[3].Value = model.proviceName;
        parameters[4].Value = model.saleName;
        parameters[5].Value = model.title;
        parameters[6].Value = model.majorType;
        parameters[7].Value = model.videoId;
        parameters[8].Value = model.videoUrl;
        parameters[9].Value = model.fileUrl;
        parameters[10].Value = model.demoUrl;
        parameters[11].Value = model.descript;
        parameters[12].Value = model.areaId;
        parameters[13].Value = model.state;
        parameters[14].Value = model.createDate;
        parameters[15].Value = model.moreCol;
        parameters[16].Value = model.moreCol1;
        parameters[17].Value = model.sqUrl;
        parameters[18].Value = model.pptContent;

        int rows = DbHelper.ExecuteSql(strSql.ToString(), parameters);
        if (rows > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /// <summary>
    /// 更新一条数据
    /// </summary>
    public bool Update(productInfo model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("update productInfo set ");
        strSql.Append("mid=@mid,");
        strSql.Append("trueName=@trueName,");
        strSql.Append("hospital=@hospital,");
        strSql.Append("proviceName=@proviceName,");
        strSql.Append("saleName=@saleName,");
        strSql.Append("title=@title,");
        strSql.Append("majorType=@majorType,");
        strSql.Append("videoId=@videoId,");
        strSql.Append("videoUrl=@videoUrl,");
        strSql.Append("fileUrl=@fileUrl,");
        strSql.Append("demoUrl=@demoUrl,");
        strSql.Append("descript=@descript,");
        strSql.Append("areaId=@areaId,");
        strSql.Append("state=@state,");
        strSql.Append("createDate=@createDate,");
        strSql.Append("moreCol=@moreCol,");
        strSql.Append("moreCol1=@moreCol1,sqUrl=@sqUrl,pptContent=@pptContent");
        strSql.Append(" where Id=@Id ");
        SqlParameter[] parameters = {
					new SqlParameter("@mid", SqlDbType.Int,4),
					new SqlParameter("@trueName", SqlDbType.NVarChar,500),
					new SqlParameter("@hospital", SqlDbType.NVarChar,500),
					new SqlParameter("@proviceName", SqlDbType.NVarChar,500),
					new SqlParameter("@saleName", SqlDbType.NVarChar,500),
					new SqlParameter("@title", SqlDbType.NVarChar,500),
					new SqlParameter("@majorType", SqlDbType.Int,4),
					new SqlParameter("@videoId", SqlDbType.NVarChar,500),
					new SqlParameter("@videoUrl", SqlDbType.NVarChar,500),
					new SqlParameter("@fileUrl", SqlDbType.NVarChar,500),
					new SqlParameter("@demoUrl", SqlDbType.NVarChar,500),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
					new SqlParameter("@areaId", SqlDbType.Int,4),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@moreCol", SqlDbType.NVarChar,500),
					new SqlParameter("@moreCol1", SqlDbType.NVarChar,500),
                    new SqlParameter("@sqUrl", SqlDbType.NVarChar,500),
                    new SqlParameter("@pptContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Id", SqlDbType.Int,4)};
        parameters[0].Value = model.mid;
        parameters[1].Value = model.trueName;
        parameters[2].Value = model.hospital;
        parameters[3].Value = model.proviceName;
        parameters[4].Value = model.saleName;
        parameters[5].Value = model.title;
        parameters[6].Value = model.majorType;
        parameters[7].Value = model.videoId;
        parameters[8].Value = model.videoUrl;
        parameters[9].Value = model.fileUrl;
        parameters[10].Value = model.demoUrl;
        parameters[11].Value = model.descript;
        parameters[12].Value = model.areaId;
        parameters[13].Value = model.state;
        parameters[14].Value = model.createDate;
        parameters[15].Value = model.moreCol;
        parameters[16].Value = model.moreCol1;
        parameters[17].Value = model.sqUrl;
        parameters[18].Value = model.pptContent;
        parameters[19].Value = model.Id;

        int rows = DbHelper.ExecuteSql(strSql.ToString(), parameters);
        if (rows > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// 删除一条数据
    /// </summary>
    public bool Delete(int Id)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("delete from productInfo ");
        strSql.Append(" where Id=@Id ");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)			};
        parameters[0].Value = Id;

        int rows = DbHelper.ExecuteSql(strSql.ToString(), parameters);
        if (rows > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /// <summary>
    /// 批量删除数据
    /// </summary>
    public bool DeleteList(string Idlist)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("delete from productInfo ");
        strSql.Append(" where Id in (" + Idlist + ")  ");
        int rows = DbHelper.ExecuteSql(strSql.ToString());
        if (rows > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    /// <summary>
    /// 得到一个对象实体
    /// </summary>
    public productInfo GetModel(int Id)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 Id,mid,trueName,hospital,proviceName,saleName,title,majorType,videoId,videoUrl,fileUrl,demoUrl,descript,areaId,state,createDate,moreCol,moreCol1,sqUrl,pptContent from productInfo ");
        strSql.Append(" where Id=@Id ");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)			};
        parameters[0].Value = Id;

        productInfo model = new productInfo();
        DataSet ds = DbHelper.Query(strSql.ToString(), parameters);
        if (ds.Tables[0].Rows.Count > 0)
        {
            return DataRowToModel(ds.Tables[0].Rows[0]);
        }
        else
        {
            return null;
        }
    }


    /// <summary>
    /// 得到一个对象实体
    /// </summary>
    public productInfo DataRowToModel(DataRow row)
    {
        productInfo model = new productInfo();
        if (row != null)
        {
            if (row["Id"] != null && row["Id"].ToString() != "")
            {
                model.Id = int.Parse(row["Id"].ToString());
            }
            if (row["mid"] != null && row["mid"].ToString() != "")
            {
                model.mid = int.Parse(row["mid"].ToString());
            }
            if (row["trueName"] != null)
            {
                model.trueName = row["trueName"].ToString();
            }
            if (row["hospital"] != null)
            {
                model.hospital = row["hospital"].ToString();
            }
            if (row["proviceName"] != null)
            {
                model.proviceName = row["proviceName"].ToString();
            }
            if (row["saleName"] != null)
            {
                model.saleName = row["saleName"].ToString();
            }
            if (row["title"] != null)
            {
                model.title = row["title"].ToString();
            }
            if (row["majorType"] != null && row["majorType"].ToString() != "")
            {
                model.majorType = int.Parse(row["majorType"].ToString());
            }
            if (row["videoId"] != null)
            {
                model.videoId = row["videoId"].ToString();
            }
            if (row["videoUrl"] != null)
            {
                model.videoUrl = row["videoUrl"].ToString();
            }
            if (row["fileUrl"] != null)
            {
                model.fileUrl = row["fileUrl"].ToString();
            }
            if (row["demoUrl"] != null)
            {
                model.demoUrl = row["demoUrl"].ToString();
            }
            if (row["descript"] != null)
            {
                model.descript = row["descript"].ToString();
            }
            if (row["areaId"] != null && row["areaId"].ToString() != "")
            {
                model.areaId = int.Parse(row["areaId"].ToString());
            }
            if (row["state"] != null && row["state"].ToString() != "")
            {
                model.state = int.Parse(row["state"].ToString());
            }
            if (row["createDate"] != null && row["createDate"].ToString() != "")
            {
                model.createDate = DateTime.Parse(row["createDate"].ToString());
            }
            if (row["moreCol"] != null)
            {
                model.moreCol = row["moreCol"].ToString();
            }
            if (row["moreCol1"] != null)
            {
                model.moreCol1 = row["moreCol1"].ToString();
            }
            if (row["sqUrl"] != null)
            {
                model.sqUrl = row["sqUrl"].ToString();
            }
            if (row["pptContent"] != null)
            {
                model.pptContent = row["pptContent"].ToString();
            }
        }
        return model;
    }

    /// <summary>
    /// 获得数据列表
    /// </summary>
    public DataSet GetList(string strWhere)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select Id,mid,trueName,hospital,proviceName,saleName,title,majorType,videoId,videoUrl,fileUrl,demoUrl,descript,areaId,state,createDate,moreCol,moreCol1,sqUrl,pptContent ");
        strSql.Append(" FROM productInfo ");
        if (strWhere.Trim() != "")
        {
            strSql.Append(" where " + strWhere);
        }
        return DbHelper.Query(strSql.ToString());
    }

    /// <summary>
    /// 获得前几行数据
    /// </summary>
    public DataSet GetList(int Top, string strWhere, string filedOrder)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select ");
        if (Top > 0)
        {
            strSql.Append(" top " + Top.ToString());
        }
        strSql.Append(" Id,mid,trueName,hospital,proviceName,saleName,title,majorType,videoId,videoUrl,fileUrl,demoUrl,descript,areaId,state,createDate,moreCol,moreCol1,sqUrl,pptContent ");
        strSql.Append(" FROM productInfo ");
        if (strWhere.Trim() != "")
        {
            strSql.Append(" where " + strWhere);
        }
        strSql.Append(" order by " + filedOrder);
        return DbHelper.Query(strSql.ToString());
    }

    /// <summary>
    /// 获取记录总数
    /// </summary>
    public int GetRecordCount(string strWhere)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select count(1) FROM productInfo ");
        if (strWhere.Trim() != "")
        {
            strSql.Append(" where " + strWhere);
        }
        object obj = DbHelper.GetSingle(strSql.ToString());
        if (obj == null)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(obj);
        }
    }
    /// <summary>
    /// 分页获取数据列表
    /// </summary>
    public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("SELECT * FROM ( ");
        strSql.Append(" SELECT ROW_NUMBER() OVER (");
        if (!string.IsNullOrEmpty(orderby.Trim()))
        {
            strSql.Append("order by T." + orderby);
        }
        else
        {
            strSql.Append("order by T.Id desc");
        }
        strSql.Append(")AS Row, T.*  from productInfo T ");
        if (!string.IsNullOrEmpty(strWhere.Trim()))
        {
            strSql.Append(" WHERE " + strWhere);
        }
        strSql.Append(" ) TT");
        strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
        return DbHelper.Query(strSql.ToString());
    }
}