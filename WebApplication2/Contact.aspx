<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Contact page,</h3>
        <address>
            Hengersor utca 33/A<br />
            Hungary Budapest 1181 <br />
            <abbr title="Phone">P:</abbr>
            +36 30 775 4732
        </address>
          
        

        <address>
            <strong>Support:</strong>   <a href="mailto:mollev545@hengersor.hu">mollev545@hengersor.hu</a><br />
            <strong>Develpoer:</strong> <a href="mailto:mollev545@hengersor.hu">mollev545@hengersor.hu</a>
        </address>
    </main>

</asp:Content>
