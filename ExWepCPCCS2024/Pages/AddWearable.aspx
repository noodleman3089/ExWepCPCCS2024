<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="AddWearable.aspx.cs" Inherits="Pages_AddWearable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Add new Wearable</p>
    <p>
        <table calss="wearableTable" style="width:100%;">
            <tr>
                <td style="width: 146px">Name:</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Type:</td>
                <td>
                    <asp:DropDownList ID="listType" runat="server" AutoPostBack="True">
                        <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
                        <asp:ListItem>เสื้อ</asp:ListItem>
                        <asp:ListItem>กระโปรง</asp:ListItem>
                        <asp:ListItem>กางเกง</asp:ListItem>
                        <asp:ListItem>เข็ม</asp:ListItem>
                        <asp:ListItem>เข็มขัด</asp:ListItem>
                        <asp:ListItem>ตุ่งติ้ง</asp:ListItem>
                        <asp:ListItem>เนคไท</asp:ListItem>
                        <asp:ListItem>กระดุม</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Price:</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Image:</td>
                <td>
                    <asp:DropDownList ID="ddImage" runat="server" AppendDataBoundItems="True" AutoPostBack="True" Width="300px">
                        <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;<asp:Button ID="btnUploadImage" runat="server" CausesValidation="False" OnClick="btnUploadImage_Click" Text="Upload Image" />
                </td>
            </tr>
            <tr>
                <td style="width: 146px">Review:</td>
                <td>
                    <asp:TextBox ID="txtReview" runat="server" Height="98px" TextMode="MultiLine" Width="332px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </p>
<p>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </p>
<p>
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
    </p>
</asp:Content>

