<%@ Page Title="Insert Data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="WebApplication2.Insert" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" type="text/css" href="Styles/Insert_Style.css" />

    <main>
        <div>
        <h2>Insert Data</h2>
        <asp:TextBox ID="txtHostName" runat="server" Placeholder="Host Name"></asp:TextBox><br />
        <asp:TextBox ID="txtPort" runat="server" Placeholder="Port"></asp:TextBox><br />
        <asp:TextBox ID="txtUserName" runat="server" Placeholder="Username"></asp:TextBox><br />
        <asp:TextBox ID="txtDatabase" runat="server" Placeholder="Database"></asp:TextBox><br />
        <asp:TextBox ID="txtTable" runat="server" Placeholder="Table"></asp:TextBox><br />
        <asp:TextBox ID="txtFields" runat="server" Placeholder="Fields (e.g., account_id, account_name, balance)"></asp:TextBox><br />
        <asp:TextBox ID="txtValues" runat="server" Placeholder="Values (e.g., 3, 'Jane Doe', 500.00)"></asp:TextBox><br />
        <asp:Button ID="btnInsert" runat="server" Text="Insert Data" OnClick="btnInsert_Click" /><br />
        <label for="txtNumberOfRows">Number of Rows:</label>
            <asp:TextBox ID="txtNumberOfRows" runat="server"></asp:TextBox><br />
       <asp:Button ID="btnGenerateRandomData" runat="server" Text="Generate Random Data" OnClick="btnGenerateRandomData_Click" /><br />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    </div>
    </main>
</asp:Content>
