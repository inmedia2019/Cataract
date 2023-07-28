using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// memberInfoDAL 的摘要说明
/// </summary>
public class memberInfoDAL
{
	public memberInfoDAL()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 增加一条数据
    /// </summary>
    public int Add(memberInfo model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("insert into memberInfo(");
        strSql.Append("openId,passCode,trueName,hospital,proviceName,saleName,title,majorType,descript,email,state,createDate,moreCol,moreCol1,phone)");
        strSql.Append(" values (");
        strSql.Append("@openId,@passCode,@trueName,@hospital,@proviceName,@saleName,@title,@majorType,@descript,@email,@state,@createDate,@moreCol,@moreCol1,@phone)");
        strSql.Append(";select @@IDENTITY");
        SqlParameter[] parameters = {
					new SqlParameter("@openId", SqlDbType.NVarChar,500),
					new SqlParameter("@passCode", SqlDbType.NVarChar,500),
					new SqlParameter("@trueName", SqlDbType.NVarChar,500),
					new SqlParameter("@hospital", SqlDbType.NVarChar,500),
					new SqlParameter("@proviceName", SqlDbType.NVarChar,500),
					new SqlParameter("@saleName", SqlDbType.NVarChar,500),
					new SqlParameter("@title", SqlDbType.NVarChar,500),
					new SqlParameter("@majorType", SqlDbType.Int,4),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
					new SqlParameter("@email", SqlDbType.NVarChar,500),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@moreCol", SqlDbType.NVarChar,500),
					new SqlParameter("@moreCol1", SqlDbType.NVarChar,500),
                    new SqlParameter("@phone", SqlDbType.NVarChar,500)};
        parameters[0].Value = model.openId;
        parameters[1].Value = model.passCode;
        parameters[2].Value = model.trueName;
        parameters[3].Value = model.hospital;
        parameters[4].Value = model.proviceName;
        parameters[5].Value = model.saleName;
        parameters[6].Value = model.title;
        parameters[7].Value = model.majorType;
        parameters[8].Value = model.descript;
        parameters[9].Value = model.email;
        parameters[10].Value = model.state;
        parameters[11].Value = model.createDate;
        parameters[12].Value = model.moreCol;
        parameters[13].Value = model.moreCol1;
        parameters[14].Value = model.phone;

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
    public bool Update(memberInfo model)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("update memberInfo set ");
        strSql.Append("openId=@openId,");
        strSql.Append("passCode=@passCode,");
        strSql.Append("trueName=@trueName,");
        strSql.Append("hospital=@hospital,");
        strSql.Append("proviceName=@proviceName,");
        strSql.Append("saleName=@saleName,");
        strSql.Append("title=@title,");
        strSql.Append("majorType=@majorType,");
        strSql.Append("descript=@descript,");
        strSql.Append("email=@email,");
        strSql.Append("state=@state,");
        strSql.Append("createDate=@createDate,");
        strSql.Append("moreCol=@moreCol,");
        strSql.Append("moreCol1=@moreCol1,phone=@phone");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@openId", SqlDbType.NVarChar,500),
					new SqlParameter("@passCode", SqlDbType.NVarChar,500),
					new SqlParameter("@trueName", SqlDbType.NVarChar,500),
					new SqlParameter("@hospital", SqlDbType.NVarChar,500),
					new SqlParameter("@proviceName", SqlDbType.NVarChar,500),
					new SqlParameter("@saleName", SqlDbType.NVarChar,500),
					new SqlParameter("@title", SqlDbType.NVarChar,500),
					new SqlParameter("@majorType", SqlDbType.Int,4),
					new SqlParameter("@descript", SqlDbType.NVarChar,-1),
					new SqlParameter("@email", SqlDbType.NVarChar,500),
					new SqlParameter("@state", SqlDbType.Int,4),
					new SqlParameter("@createDate", SqlDbType.DateTime),
					new SqlParameter("@moreCol", SqlDbType.NVarChar,500),
					new SqlParameter("@moreCol1", SqlDbType.NVarChar,500),
                    new SqlParameter("@phone", SqlDbType.NVarChar,500),
					new SqlParameter("@Id", SqlDbType.Int,4)};
        parameters[0].Value = model.openId;
        parameters[1].Value = model.passCode;
        parameters[2].Value = model.trueName;
        parameters[3].Value = model.hospital;
        parameters[4].Value = model.proviceName;
        parameters[5].Value = model.saleName;
        parameters[6].Value = model.title;
        parameters[7].Value = model.majorType;
        parameters[8].Value = model.descript;
        parameters[9].Value = model.email;
        parameters[10].Value = model.state;
        parameters[11].Value = model.createDate;
        parameters[12].Value = model.moreCol;
        parameters[13].Value = model.moreCol1;
        parameters[14].Value = model.phone;
        parameters[15].Value = model.Id;

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
        strSql.Append("delete from memberInfo ");
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
        strSql.Append("delete from memberInfo ");
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
    public memberInfo GetModel(int Id)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 Id,openId,passCode,trueName,hospital,proviceName,saleName,title,majorType,descript,email,state,createDate,moreCol,moreCol1,phone from memberInfo ");
        strSql.Append(" where Id=@Id");
        SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
        parameters[0].Value = Id;

        memberInfo model = new memberInfo();
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
    public memberInfo GetModel(string openId)
    {

        StringBuilder strSql = new StringBuilder();
        strSql.Append("select  top 1 Id,openId,passCode,trueName,hospital,proviceName,saleName,title,majorType,descript,email,state,createDate,moreCol,moreCol1,phone from memberInfo ");
        strSql.Append(" where openId=@openId");
        SqlParameter[] parameters = {
					new SqlParameter("@openId", SqlDbType.NVarChar,500)
			};
        parameters[0].Value = openId;

        memberInfo model = new memberInfo();
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
    public memberInfo DataRowToModel(DataRow row)
    {
        memberInfo model = new memberInfo();
        if (row != null)
        {
            if (row["Id"] != null && row["Id"].ToString() != "")
            {
                model.Id = int.Parse(row["Id"].ToString());
            }
            if (row["openId"] != null)
            {
                model.openId = row["openId"].ToString();
            }
            if (row["passCode"] != null)
            {
                model.passCode = row["passCode"].ToString();
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
            if (row["descript"] != null)
            {
                model.descript = row["descript"].ToString();
            }
            if (row["email"] != null)
            {
                model.email = row["email"].ToString();
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
            if (row["phone"] != null)
            {
                model.phone = row["phone"].ToString();
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
        strSql.Append("select Id,openId,passCode,trueName,hospital,proviceName,saleName,title,majorType,descript,email,state,createDate,moreCol,moreCol1,phone ");
        strSql.Append(" FROM memberInfo ");
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
        strSql.Append(" Id,openId,passCode,trueName,hospital,proviceName,saleName,title,majorType,descript,email,state,createDate,moreCol,moreCol1,phone ");
        strSql.Append(" FROM memberInfo ");
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
        strSql.Append("select count(1) FROM memberInfo ");
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
        strSql.Append(")AS Row, T.*  from memberInfo T ");
        if (!string.IsNullOrEmpty(strWhere.Trim()))
        {
            strSql.Append(" WHERE " + strWhere);
        }
        strSql.Append(" ) TT");
        strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
        return DbHelper.Query(strSql.ToString());
    }

}