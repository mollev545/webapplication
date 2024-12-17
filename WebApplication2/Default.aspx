<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Styles/Default_Style.css" />


    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">ASP.NET</h1>
            <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Getting started</h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Get more libraries</h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Web Hosting</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </section>
        </div>
    <div>
        <h1>Database Connection</h1>
        <p>Fill out the form below to connect to your database:</p>

        <div class="connection-form">
            <asp:Label ID="lblHostName" runat="server" Text="Host Name:" AssociatedControlID="txtHostName" CssClass="form-label" />
            <asp:TextBox ID="txtHostName" runat="server" CssClass="form-control" placeholder="e.g., localhost"></asp:TextBox>

            <asp:Label ID="lblPort" runat="server" Text="Port:" AssociatedControlID="txtPort" CssClass="form-label" />
            <asp:TextBox ID="txtPort" runat="server" CssClass="form-control" placeholder="e.g., 3306"></asp:TextBox>

            <asp:Label ID="lblUserName" runat="server" Text="User Name:" AssociatedControlID="txtUserName" CssClass="form-label" />
            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="e.g., root"></asp:TextBox>

            <asp:Label ID="lblDatabase" runat="server" Text="Database Name:" AssociatedControlID="txtDatabase" CssClass="form-label" />
            <asp:TextBox ID="txtDatabase" runat="server" CssClass="form-control" placeholder="e.g., transactions"></asp:TextBox>

            <asp:Label ID="lblTable" runat="server" Text="Table Name:" AssociatedControlID="txtTable" CssClass="form-label" />
            <asp:TextBox ID="txtTable" runat="server" CssClass="form-control" placeholder="e.g., orders"></asp:TextBox>

            <asp:Button ID="btnConnect" runat="server" Text="Connect" CssClass="btn btn-primary" OnClick="btnConnect_Click" />

            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="error-label" />
        </div>

        <h2>Database Results</h2>
        <asp:GridView ID="myGridView" runat="server" AutoGenerateColumns="True" CssClass="table table-bordered" />
    
        </div>
    </main>

</asp:Content>
