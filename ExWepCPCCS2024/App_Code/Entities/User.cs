using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public int IdUser { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public string UserType { get; set; }
    public User(int idUser, string userName, string passWord, string email, string userType)
    {
        IdUser = idUser;
        UserName = userName;
        Password = passWord;
        Email = email;
        UserType = userType;
    }
    public User(string userName, string passWord, string email, string userType)
    {
        UserName = userName;
        Password = passWord;
        Email = email;
        UserType = userType;
    }
}