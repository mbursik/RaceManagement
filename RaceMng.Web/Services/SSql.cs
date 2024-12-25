using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Options;
using RaceMng.Web.Controllers;
using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Globalization;
using System.Reflection.PortableExecutable;

namespace RaceMng.Web.Services
{
/*
  public class SSql : ISql
  {
    private readonly IConfiguration _configuration;
    private readonly ILogger<SSql> _logger;
    private SqlConnection _con;
    private SqlDataReader _reader;
    public SSql(IOptions<SSqlOptions> options, IConfiguration configuration, ILogger<SSql> logger)
    {
      _configuration = configuration;
      _logger = logger;
      _con = new(options.Value.ConnectionString);//_configuration.GetConnectionString("RaceMngConnection"));

      //_con.Open();

    }

    public SqlConnection Connection => _con;

    public void ConnectionOpen() => _con.Open();

    public List<T> ExecuteToCommonTypeList<T>(string query, string column)
    {
      List<T> list = new List<T>();
      SqlCommand cmd = new SqlCommand(query, _con);
      _logger.LogInformation(query);
      _reader = cmd.ExecuteReader();
      while (_reader.Read())
      {
        T item = (T) _reader[column];
        list.Add(item);
      }
      return list;
    }



    public List<T> ExecuteToList<T>(string query)
    {
      List<T> list = new List<T>();
      SqlCommand cmd = new SqlCommand(query, _con);
      _logger.LogInformation(query);
      _reader = cmd.ExecuteReader();
      while (_reader.Read())
      {
        var type = typeof(T);

        var obj = SetProperty(_reader, type);

        #region legacy code
        //T obj = (T)Activator.CreateInstance(type)!;
        // foreach (var prop in type.GetProperties())
        // {
        //   var isVirtual = prop.GetGetMethod().IsVirtual;
        //   var propType = prop.PropertyType;
        //   if (!isVirtual)
        //   {
        //     prop.SetValue(obj, Convert.ChangeType(_reader[prop.Name].ToString(), propType));
        //   }
        //   else 
        //   { 
        //     var objVirtual = Activator.CreateInstance(propType);
        //     foreach (var propVirtual in propType.GetProperties())
        //     {
        //       var propTypeVirtual = propVirtual.PropertyType;
        //       propVirtual.SetValue(objVirtual, Convert.ChangeType(_reader[$"{prop.Name}#{propVirtual.Name}"].ToString(), propTypeVirtual));
        //     }
        //     prop.SetValue(obj, objVirtual);
        //   }

        // }
        #endregion
        list.Add(obj);
      }
      return list;
    }


    private dynamic SetProperty(SqlDataReader reader, Type type, string? virtualPropertyName = null)
    {
      var columnCollection = reader.GetSchemaTable().Columns;
      dynamic obj = Activator.CreateInstance(type)!;
      foreach (var prop in type.GetProperties())
      {
        var isVirtual = prop.GetGetMethod().IsVirtual;
        var propType = prop.PropertyType;
        if (!isVirtual)
        {
          var column = (virtualPropertyName == null) ? prop.Name : $"{virtualPropertyName}#{prop.Name}";
          if (IsColumnExists(reader,column))
          {
            if (reader[column] == DBNull.Value)
            {
              prop.SetValue(obj, null);
            }
            else
            {
              if (propType == typeof(TimeOnly?) || propType == typeof(TimeOnly))
              {
                prop.SetValue(obj, TimeOnly.FromTimeSpan((System.TimeSpan)reader[column]));//TimeOnly.ParseExact(reader[column].ToString(), "HH:mm:ss.fffffff"));
              }
              else
              {
                Type u = Nullable.GetUnderlyingType(propType);
                if (u == null)
                  prop.SetValue(obj, Convert.ChangeType(reader[column].ToString(), propType));
                else
                  prop.SetValue(obj, Convert.ChangeType(reader[column].ToString(), u));
              }
            }
          }
        }
        else
        {
          var objVirtual = SetProperty(reader, propType, prop.Name);
          prop.SetValue(obj, objVirtual);
        }

      }

      return obj;
    }


    private bool IsColumnExists(SqlDataReader dataReader, string columnName)
    {
      for (int i = 0; i < dataReader.FieldCount; i++)
      {
        if (dataReader.GetName(i).Equals(columnName))
          return true;
      }
      return false;
    }



    public T? ExecuteFirstOrEmpty<T>(string query)
    {
      SqlCommand cmd = new SqlCommand(query, _con);
      _reader = cmd.ExecuteReader();
      if (_reader.Read())
      {
        var type = typeof(T);
        var obj = SetProperty(_reader, type);

        //var type = typeof(T);
        //T obj = (T)Activator.CreateInstance(type)!;
        //foreach (var prop in type.GetProperties())
        //{
        //  var propType = prop.PropertyType;
        //  prop.SetValue(obj, Convert.ChangeType(_reader[prop.Name].ToString(), propType));
        //}
        return obj;
      } 
      else
        return default(T);
    }

    public int Execute(string query)
    {
      int rows;
      SqlCommand cmd = new SqlCommand(query, _con);
      rows = cmd.ExecuteNonQuery();
      ConnectionClose();
      return rows;
    }


    public void ConnectionClose() 
    {
      if (_reader != null) _reader.Close();
      if (_con != null) _con.Close();
    }


  }
  */
}
