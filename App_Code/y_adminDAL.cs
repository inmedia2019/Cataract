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
public class y_adminDAL
{
	public y_adminDAL()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 得到一个对象实体
    /// </summary>
    public y_admin GetUserInfo(string username, string pwd)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 UserID,username,pwd,moreCol from y_admin ");
        strSql.Append(" where username=@username and pwd=@pwd");
        SqlParameter[] parameters = {
					new SqlParameter("@username", username),new SqlParameter("@pwd", pwd)};

        y_admin model = new y_admin();
        DataSet ds = DbHelper.Query(strSql.ToString(), parameters);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["UserID"].ToString() != "")
            {
                model.userid = int.Parse(ds.Tables[0].Rows[0]["UserID"].ToString());
            }
            model.username = ds.Tables[0].Rows[0]["username"].ToString();
            model.pwd = ds.Tables[0].Rows[0]["pwd"].ToString();
            model.morecol = ds.Tables[0].Rows[0]["moreCol"].ToString();
            return model;
        }
        else
        {
            return null;
        }
    }
    /// <summary>
    /// 修改密码
    /// </summary>
    public int modifyPwd(string username, string pwd)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("update y_admin set  pwd='" + pwd + "' where username='" + username + "' ");

        return DbHelper.ExecuteSql(strSql.ToString());
    }


    /// <summary>
    /// 增加一条数据
    /// </summary>
    public int Add(y_admin model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("insert into y_admin(");
        strSql.Append("username,pwd,state,createDate,morecol,morecol1)");
        strSql.Append(" values (");
        strSql.Append("@username,@pwd,@state,@createDate,@morecol,@morecol1)");
        strSql.Append(";select @@IDENTITY");
        SqlParameter[] parameters = {
					new SqlParameter("@username", SqlDbType.NVarChar,500),
					new SqlParameter("@pwd", SqlDbType.NVarChar,500),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@morecol", SqlDbType.NVarChar,500),
					new SqlParameter("@morecol1", SqlDbType.NVarChar,500)};
        parameters[0].Value = model.username;
        parameters[1].Value = model.pwd;
        parameters[2].Value = model.state;
        parameters[3].Value = model.createDate;
        parameters[4].Value = model.morecol;
        parameters[5].Value = model.morecol1;

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
    public bool Update(y_admin model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("update y_admin set ");
        strSql.Append("username=@username,");
        strSql.Append("pwd=@pwd,");
        strSql.Append("state=@state,");
        strSql.Append("createDate=@createDate,");
        strSql.Append("morecol=@morecol,");
        strSql.Append("morecol1=@morecol1");
        strSql.Append(" where userid=@userid");
        SqlParameter[] parameters = {
					new SqlParameter("@username", SqlDbType.NVarChar,500),
					new SqlParameter("@pwd", SqlDbType.NVarChar,500),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@morecol", SqlDbType.NVarChar,500),
					new SqlParameter("@morecol1", SqlDbType.NVarChar,500),
					new SqlParameter("@userid", SqlDbType.Int,4)};
        parameters[0].Value = model.username;
        parameters[1].Value = model.pwd;
        parameters[2].Value = model.state;
        parameters[3].Value = model.createDate;
        parameters[4].Value = model.morecol;
        parameters[5].Value = model.morecol1;
        parameters[6].Value = model.userid;

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
        strSql.Append("delete from y_admin ");
        strSql.Append(" where userid=@userid");
        SqlParameter[] parameters = {
					new SqlParameter("@userid", SqlDbType.Int,4)
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
        strSql.Append("delete from y_admin ");
        strSql.Append(" where userid in (" + useridlist + ")  ");
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
    public y_admin GetModel(int userid)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 userid,username,pwd,state,createDate,morecol,morecol1 from y_admin ");
        strSql.Append(" where userid=@userid");
        SqlParameter[] parameters = {
					new SqlParameter("@userid", SqlDbType.Int,4)
			};
        parameters[0].Value = userid;

        y_admin model = new y_admin();
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
    public y_admin DataRowToModel(DataRow row)
    {
        y_admin model = new y_admin();
        if (row != null)
        {
            if (row["userid"] != null && row["userid"].ToString() != "")
            {
                model.userid = int.Parse(row["userid"].ToString());
            }
            if (row["username"] != null)
            {
                model.username = row["username"].ToString();
            }
            if (row["pwd"] != null)
            {
                model.pwd = row["pwd"].ToString();
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
        }
        return model;
    }

    /// <summary>
    /// 获得数据列表
    /// </summary>
    public DataSet GetList(string strWhere)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select userid,username,pwd,state,createDate,morecol,morecol1 ");
        strSql.Append(" FROM y_admin ");
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
        strSql.Append(" userid,username,pwd,state,createDate,morecol,morecol1 ");
        strSql.Append(" FROM y_admin ");
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
        strSql.Append("select count(1) FROM y_admin ");
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
            strSql.Append("order by T.userid desc");
        }
        strSql.Append(")AS Row, T.*  from y_admin T ");
        if (!string.IsNullOrEmpty(strWhere.Trim()))
        {
            strSql.Append(" WHERE " + strWhere);
        }
        strSql.Append(" ) TT");
        strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
        return DbHelper.Query(strSql.ToString());
    }

}