using Microsoft.Extensions.Caching.Memory;
using System.Data;
using System.Data.SqlClient;

namespace RaceMng.Web.Services
{
  public class SSqlOptions
  {
    private string _connectionString = "";
    public string ConnectionString { 
      get 
      {
        return _connectionString;
      } 
    }

    public void UseSqlServer(string? connectionString)
    { 
      this._connectionString = connectionString??""; 
    }

  }
}
