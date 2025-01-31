<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="WearableOverview.aspx.cs" Inherits="Pages_WearableOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Available Wearable:</p>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Pages/AddWearable.aspx">Add New Wearable</asp:LinkButton>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idWearable" DataSourceID="sds_wearable" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idWearable" HeaderText="idWearable" InsertVisible="False" ReadOnly="True" SortExpression="idWearable" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                <asp:BoundField DataField="review" HeaderText="review" SortExpression="review" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="sds_wearable" runat="server" ConnectionString="<%$ ConnectionStrings:dbWebCPCCS2024ConnectionString %>" DeleteCommand="DELETE FROM [wearable] WHERE [idWearable] = @idWearable" InsertCommand="INSERT INTO [wearable] ([name], [type], [price], [image], [review]) VALUES (@name, @type, @price, @image, @review)" SelectCommand="SELECT * FROM [wearable]" UpdateCommand="UPDATE [wearable] SET [name] = @name, [type] = @type, [price] = @price, [image] = @image, [review] = @review WHERE [idWearable] = @idWearable">
            <DeleteParameters>
                <asp:Parameter Name="idWearable" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="review" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="review" Type="String" />
                <asp:Parameter Name="idWearable" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

