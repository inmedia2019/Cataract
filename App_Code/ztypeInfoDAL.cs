using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// y_adminDAL 的摘要说明
/// </summary>
public class ztypeInfoDAL
{
    public ztypeInfoDAL()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    

    /// <summary>
    /// 增加一条数据
    /// </summary>
    public int Add(ztypeInfo model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("insert into ztypeInfo(");
        strSql.Append("sname,isRecommand,descript,description,state,createDate,morecol,morecol1,tName,tPassWord)");
        strSql.Append(" values (");
        strSql.Append("@sname,@isRecommand,@descript,@description,@state,@createDate,@morecol,@morecol1,@tName,@tPassWord)");
        strSql.Append(";select @@IDENTITY");
        SqlParameter[] parameters = {
					new SqlParameter("@sname", SqlDbType.NVarChar,500),
                    new SqlParameter("@isRecommand", SqlDbType.Int,4),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
                    new SqlParameter("@description", SqlDbType.NVarChar,-1),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@morecol", SqlDbType.NVarChar,500),
					new SqlParameter("@morecol1", SqlDbType.NVarChar,500),
                    new SqlParameter("@tName", SqlDbType.NVarChar,500),
                    new SqlParameter("@tPassWord", SqlDbType.NVarChar,500),
                                    };
        parameters[0].Value = model.sname;
        parameters[1].Value = model.isRecommand;
        parameters[2].Value = model.descript;
        parameters[3].Value = model.description;
        parameters[4].Value = model.state;
        parameters[5].Value = model.createDate;
        parameters[6].Value = model.morecol;
        parameters[7].Value = model.morecol1;
        parameters[8].Value = model.tName;
        parameters[9].Value = model.tPassWord;

        object obj = DbHelper.GetSingle(strSql.ToString(), parameters);
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
    /// 更新一条数据
    /// </summary>
    public bool Update(ztypeInfo model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("update ztypeInfo set ");
        strSql.Append("sname=@sname,");
        strSql.Append("isRecommand=@isRecommand,");
        strSql.Append("descript=@descript,");
        strSql.Append("description=@description,");
        strSql.Append("state=@state,");
        strSql.Append("createDate=@createDate,");
        strSql.Append("morecol=@morecol,");
        strSql.Append("morecol1=@morecol1,tName=@tName,tPassWord=@tPassWord");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@sname", SqlDbType.NVarChar,500),
                    new SqlParameter("@isRecommand", SqlDbType.Int,4),
                    
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
                    new SqlParameter("@description", SqlDbType.NVarChar,-1),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@morecol", SqlDbType.NVarChar,500),
					new SqlParameter("@morecol1", SqlDbType.NVarChar,500),
                    new SqlParameter("@tName", SqlDbType.NVarChar,500),
					new SqlParameter("@tPassWord", SqlDbType.NVarChar,500),
					new SqlParameter("@Id", SqlDbType.Int,4)};
        parameters[0].Value = model.sname;
        parameters[1].Value = model.isRecommand;
        parameters[2].Value = model.descript;
        parameters[3].Value = model.description;
        parameters[4].Value = model.state;
        parameters[5].Value = model.createDate;
        parameters[6].Value = model.morecol;
        parameters[7].Value = model.morecol1;
        parameters[8].Value = model.tName;
        parameters[9].Value = model.tPassWord;
        parameters[10].Value = model.Id;

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
    public bool Delete(int userid)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("delete from ztypeInfo ");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
        parameters[0].Value = userid;

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
    public bool DeleteList(string useridlist)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("delete from ztypeInfo ");
        strSql.Append(" where Id in (" + useridlist + ")  ");
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
    public ztypeInfo GetModel(int userid)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 Id,sname,isRecommand,descript,description,state,createDate,morecol,morecol1,tName,tPassWord from ztypeInfo ");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
        parameters[0].Value = userid;

        ztypeInfo model = new ztypeInfo();
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
    public ztypeInfo DataRowToModel(DataRow row)
    {
        ztypeInfo model = new ztypeInfo();
        if (row != null)
        {
            if (row["Id"] != null && row["Id"].ToString() != "")
            {
                model.Id = int.Parse(row["Id"].ToString());
            }
            if (row["sname"] != null)
            {
                model.sname = row["sname"].ToString();
            }
            if (row["isRecommand"] != null && row["isRecommand"].ToString() != "")
            {
                model.isRecommand = int.Parse(row["isRecommand"].ToString());
            }
            if (row["descript"] != null)
            {
                model.descript = row["descript"].ToString();
            }
            if (row["description"] != null)
            {
                model.description = row["description"].ToString();
            }
            if (row["state"] != null && row["state"].ToString() != "")
            {
                model.state = int.Parse(row["state"].ToString());
            }
            if (row["createDate"] != null && row["createDate"].ToString() != "")
            {
                model.createDate = DateTime.Parse(row["createDate"].ToString());
            }
            if (row["morecol"] != null)
            {
                model.morecol = row["morecol"].ToString();
            }
            if (row["morecol1"] != null)
            {
                model.morecol1 = row["morecol1"].ToString();
            }
            if (row["tName"] != null)
            {
                model.tName = row["tName"].ToString();
            }
            if (row["tPassWord"] != null)
            {
                model.tPassWord = row["tPassWord"].ToString();
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
        strSql.Append("select Id,sname,isRecommand,descript,description,state,createDate,morecol,morecol1,tName,tPassWord ");
        strSql.Append(" FROM ztypeInfo ");
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
        strSql.Append(" Id,sname,isRecommand,descript,description,state,createDate,morecol,morecol1,tName,tPassWord ");
        strSql.Append(" FROM ztypeInfo ");
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
        strSql.Append("select count(1) FROM ztypeInfo ");
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
    

}