using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// teacherAccoutDAL 的摘要说明
/// </summary>
public class teacherAccoutDAL
{
    public teacherAccoutDAL()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 增加一条数据
    /// </summary>
    public int Add(teacherAccout model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("insert into teacherAccout(");
        strSql.Append("accoutInfo,accoutPwd,areaId,state,createDate,descript,moreCol,moreCol1)");
        strSql.Append(" values (");
        strSql.Append("@accoutInfo,@accoutPwd,@areaId,@state,@createDate,@descript,@moreCol,@moreCol1)");
        strSql.Append(";select @@IDENTITY");
        SqlParameter[] parameters = {
					new SqlParameter("@accoutInfo", SqlDbType.NVarChar,500),
					new SqlParameter("@accoutPwd", SqlDbType.NVarChar,500),
					new SqlParameter("@areaId", SqlDbType.Int,4),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
					new SqlParameter("@moreCol", SqlDbType.NVarChar,500),
					new SqlParameter("@moreCol1", SqlDbType.NVarChar,500)};
        parameters[0].Value = model.accoutInfo;
        parameters[1].Value = model.accoutPwd;
        parameters[2].Value = model.areaId;
        parameters[3].Value = model.state;
        parameters[4].Value = model.createDate;
        parameters[5].Value = model.descript;
        parameters[6].Value = model.moreCol;
        parameters[7].Value = model.moreCol1;

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
    public bool Update(teacherAccout model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("update teacherAccout set ");
        strSql.Append("accoutInfo=@accoutInfo,");
        strSql.Append("accoutPwd=@accoutPwd,");
        strSql.Append("areaId=@areaId,");
        strSql.Append("state=@state,");
        strSql.Append("createDate=@createDate,");
        strSql.Append("descript=@descript,");
        strSql.Append("moreCol=@moreCol,");
        strSql.Append("moreCol1=@moreCol1");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@accoutInfo", SqlDbType.NVarChar,500),
					new SqlParameter("@accoutPwd", SqlDbType.NVarChar,500),
					new SqlParameter("@areaId", SqlDbType.Int,4),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
					new SqlParameter("@moreCol", SqlDbType.NVarChar,500),
					new SqlParameter("@moreCol1", SqlDbType.NVarChar,500),
					new SqlParameter("@Id", SqlDbType.Int,4)};
        parameters[0].Value = model.accoutInfo;
        parameters[1].Value = model.accoutPwd;
        parameters[2].Value = model.areaId;
        parameters[3].Value = model.state;
        parameters[4].Value = model.createDate;
        parameters[5].Value = model.descript;
        parameters[6].Value = model.moreCol;
        parameters[7].Value = model.moreCol1;
        parameters[8].Value = model.Id;

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
        strSql.Append("delete from teacherAccout ");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
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
        strSql.Append("delete from teacherAccout ");
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
    public teacherAccout GetModel(int Id)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 Id,accoutInfo,accoutPwd,areaId,state,createDate,descript,moreCol,moreCol1 from teacherAccout ");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
        parameters[0].Value = Id;

        teacherAccout model = new teacherAccout();
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
    public teacherAccout DataRowToModel(DataRow row)
    {
        teacherAccout model = new teacherAccout();
        if (row != null)
        {
            if (row["Id"] != null && row["Id"].ToString() != "")
            {
                model.Id = int.Parse(row["Id"].ToString());
            }
            if (row["accoutInfo"] != null)
            {
                model.accoutInfo = row["accoutInfo"].ToString();
            }
            if (row["accoutPwd"] != null)
            {
                model.accoutPwd = row["accoutPwd"].ToString();
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
            if (row["descript"] != null)
            {
                model.descript = row["descript"].ToString();
            }
            if (row["moreCol"] != null)
            {
                model.moreCol = row["moreCol"].ToString();
            }
            if (row["moreCol1"] != null)
            {
                model.moreCol1 = row["moreCol1"].ToString();
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
        strSql.Append("select Id,accoutInfo,accoutPwd,areaId,state,createDate,descript,moreCol,moreCol1 ");
        strSql.Append(" FROM teacherAccout ");
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
        strSql.Append(" Id,accoutInfo,accoutPwd,areaId,state,createDate,descript,moreCol,moreCol1 ");
        strSql.Append(" FROM teacherAccout ");
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
        strSql.Append("select count(1) FROM teacherAccout ");
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
        strSql.Append(")AS Row, T.*  from teacherAccout T ");
        if (!string.IsNullOrEmpty(strWhere.Trim()))
        {
            strSql.Append(" WHERE " + strWhere);
        }
        strSql.Append(" ) TT");
        strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
        return DbHelper.Query(strSql.ToString());
    }

}