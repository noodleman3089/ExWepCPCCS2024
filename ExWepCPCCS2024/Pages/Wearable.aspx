<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Wearable.aspx.cs" Inherits="Pages_Wearable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Select a type:&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sds_data" DataTextField="type" DataValueField="type">
            <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="sds_data" runat="server" ConnectionString="<%$ ConnectionStrings:dbWebCPCCS2024ConnectionString %>" SelectCommand="SELECT DISTINCT [type] FROM [wearable] ORDER BY [type]"></asp:SqlDataSource>
    </p>
    <p>

        <asp:Label ID="lblOutput" runat="server" Text="Lable"></asp:Label>
       

    </p>

</asp:Content>

