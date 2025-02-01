<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Pages_Account_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    Manage User:</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="idUser" DataSourceID="sqs_users" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" ReadOnly="True" SortExpression="idUser" />
            <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqs_users" runat="server" ConnectionString="<%$ ConnectionStrings:dbWebCPCCS2024ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [idUser] = @idUser" InsertCommand="INSERT INTO [users] ([user_name], [password], [email], [user_type]) VALUES (@user_name, @password, @email, @user_type)" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [user_name] = @user_name, [password] = @password, [email] = @email, [user_type] = @user_type WHERE [idUser] = @idUser">
        <DeleteParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="user_type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="user_type" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>

