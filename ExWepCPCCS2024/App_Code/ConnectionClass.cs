using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ConnectiomClass
/// </summary>
public class ConnectionClass
{
    private static SqlConnection conn;
    private static SqlCommand command;

    static ConnectionClass()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbWebCPCCS2024ConnectionString"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    public static ArrayList GetWearableByType(string wearableType)
    {
        ArrayList list = new ArrayList();
        string query = string.Format("SELECT * FROM wearable WHERE type LIKE '{0}'", wearableType);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int idWearable = reader.GetInt32(0);
                string name = reader.GetString(1);
                string type = reader.GetString(2);
                double price = reader.GetDouble(3);
                string image = reader.GetString(4);
                string review = reader.GetString(5);
                Wearable wearable = new Wearable(idWearable, name, type, price, image, review);
                list.Add(wearable);
            }
        }
        finally
        {
            conn.Close();
        }
        return list;
    }

    public static void AddWearable(Wearable wearable)
    {
        string query = string.Format(@"INSERT INTO wearable VALUES('{0}', '{1}', @price, '{2}', '{3}')", 
                                        wearable.Name, wearable.Type, wearable.Image, wearable.Review);
        try
        {
            conn.Open();
            command.CommandText = query;
            command.Parameters.Add(new SqlParameter("@price", wearable.Price));
            command.ExecuteNonQuery();
        }
        finally
        {
            conn.Close();
            command.Parameters.Clear();
        }
    }

    public static User LoginUser(string name, string password)
    {
        User user = null;
        string query = string.Format("SELECT COUNT(*) FROM users WHERE user_name = '{0}'", name);
        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers == 1)
            {
                query = string.Format("SELECT password FROM users WHERE user_name = '{0}'", name);
                command.CommandText = query;
                string dbPassword = command.ExecuteScalar().ToString();

                if (dbPassword == password)
                {
                    query = string.Format("SELECT email, user_type FROM users WHERE user_name = '{0}'", name);
                    command.CommandText = query;

                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        string email = reader.GetString(0);
                        string user_type = reader.GetString(1);
                        user = new User(name, password, email, user_type);
                    }
                    return user;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
        finally
        {
            conn.Close();
        }
        
    }

    public static int ValidUsername(String name)
    {
        string query = string.Format("SELECT COUNT(*) FROM users WHERE user_name = '{0}'", name);
        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers > 0)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        finally
        {
            conn.Close();
        }
        
    }
}