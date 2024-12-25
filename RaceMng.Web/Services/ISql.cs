using Microsoft.Extensions.Caching.Memory;
using System.Data;
using System.Data.SqlClient;

namespace RaceMng.Web.Services
{
  public interface ISql
  {
    //public SqlConnection Connection { get; }
    public void ConnectionOpen();
    public List<T> ExecuteToCommonTypeList<T>(string query, string column);
    public List<T> ExecuteToList<T>(string query);
    public T? ExecuteFirstOrEmpty<T>(string query);
    public int Execute(string query);
    public void ConnectionClose();
  }
}
