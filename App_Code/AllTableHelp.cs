using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;
using General;

/// <summary>
/// slf_AllTableHelp 的摘要说明
/// </summary>
public class AllTableHelp
{
    public AllTableHelp()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static System.Data.DataTable GetAllInfo(string tableNameOrView, string showField, string orderField, bool direction, int pageSize, int pageNum, string sqlWhere, out int sum)
    {
        SqlParameter[] parameters =
            {
                new SqlParameter("@total", SqlDbType.Int, 4),
                new SqlParameter("@tableName", tableNameOrView),
                new SqlParameter("@showField", showField),
                new SqlParameter("@orderField", orderField),
                new SqlParameter("@pageSize", pageSize),
                new SqlParameter("@pageIndex", pageNum),
                new SqlParameter("@orderType", direction),
                new SqlParameter("@strWhere", sqlWhere)
            };
        parameters[0].Direction = System.Data.ParameterDirection.Output;
        DataTable dt = DbHelper.ExecuteDataTable(CommandType.StoredProcedure, "pageing", parameters);
        sum = (int)parameters[0].Value;
        return dt;
    }

    public static System.Data.DataTable GetTableInfo(string tbName, string showField, string sqlWhere)
    {
        string sql = string.Format("select " + showField + " from " + tbName + sqlWhere);
        return DbHelper.ExecuteDataTable(CommandType.Text, sql, null);
    }

    public static System.Data.DataTable GetTableInfo(int topNum, string tbName, string showField, string sqlWhere)
    {
        string sql = string.Format("select top " + topNum + showField + " from " + tbName + sqlWhere);
        return DbHelper.ExecuteDataTable(CommandType.Text, sql, null);
    }

    public static int modifyState(string tab, string id, int ids, string state)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("update " + tab + " set State=@State where " + id + "=" + ids);
        SqlParameter[] sps = new SqlParameter[] 
            {
                new SqlParameter("@State", SqlDbType.Char, 1)
            };
        sps[0].Value = state;
        return DbHelper.ExecuteSql(sb.ToString(), sps);
    }

    ///
    ///更新字段值
    ///
    public static int modifyField(string tab, string field, string value, string sqlWhere)
    {
        string sql = string.Format("update " + tab + " set " + field + "='" + value + "' where 1=1");
        if (sqlWhere.Length > 0)
            sql += sqlWhere;
        return DbHelper.ExecuteSql(sql);
    }

    ///
    ///更新字段值
    ///
    public static int modifyFields(string tab, string field, string value, string sqlWhere)
    {
        string sql = string.Format("update " + tab + " set " + field + "=" + value + " where 1=1");
        if (sqlWhere.Length > 0)
            sql += sqlWhere;
        return DbHelper.ExecuteSql(sql);
    }

    /// <summary>
    /// 执行sql
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static int ExecuteSql(string sql)
    {
        return DbHelper.ExecuteSql(sql);
    }

    public static string jiaId(string id)
    {
        return new SymmetricMethod().Encrypto(id);
    }
    public static string jieMi(string id)
    {
        return new SymmetricMethod().Decrypto(id);
    }
    public static int jieId(string id)
    {
        try
        {
            return int.Parse(jieMi(id));
        }
        catch { return 0; }
    }
}