﻿using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


public partial class Pages_Wearable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }

    private void FillPage()
    {
        ArrayList wearableList = new ArrayList();
        if (!IsPostBack)
        {
            wearableList = ConnectionClass.GetWearableByType("%");//total
        }
        else
        {
            wearableList = ConnectionClass.GetWearableByType(DropDownList1.SelectedValue);
        }
        StringBuilder sb = new StringBuilder();
        foreach (Wearable wearable in wearableList)
        {
            sb.Append(string.Format(@"<table class='werableTable'>
            <tr>
                <th rowspan='4' width='150px'><img runat='server' src='{4}' /></th>
                <th width='50px'>Name: </th>
                <td>{0}</td>
            </tr>
            <tr>
                <th>Type: </th>
                <td>{1}</td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>{2}</td>
            </tr>
            <tr>
                <th>Review: </th>
                <td>{3}</td>
            </tr>
             </table>", wearable.Name, wearable.Type, wearable.Price, wearable.Review, wearable.Image));
        }
        lblOutput.Text = sb.ToString();
    }
}