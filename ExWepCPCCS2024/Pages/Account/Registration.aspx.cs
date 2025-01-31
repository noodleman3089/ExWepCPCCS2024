﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtName_TextChanged(object sender, EventArgs e)
    {
        int valueMessage = ConnectionClass.ValidUsername(txtName.Text);
        if (valueMessage == 0)
        {
            txtName.Text = "";
            lblCheck.Text = "This name already used. Please tyr agian";
        }
        else
        {
            lblCheck.Text = "You can use this name.";
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        User user = new User(txtName.Text, txtPassword.Text, txtEmail.Text, "users");
        //To be continue.
    }
}