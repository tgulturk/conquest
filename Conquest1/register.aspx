<%@ Page Title="Kayıt Ol" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Conquest1.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="registercontent" style="color: #582727">

        Kayıt Formu<br />
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblUsername" Text="Kullanıcı Adı: " runat="server" 
                    Width="100px" />
                <asp:TextBox ID="tbUsername" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tbUsername" ErrorMessage="*" ForeColor="Red" Height="25px" 
                    ValidationGroup="gr1"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblPassword" Text="Sifre: " runat="server" Width="100px" />
                <asp:TextBox ID="tbPassword" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="tbPassword" ErrorMessage="*" ForeColor="Red" Height="25px" 
                    ValidationGroup="gr1"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblPasswordAgain" Text="Sifre Tekrar: " runat="server" 
                    Width="100px" />
                <asp:TextBox ID="tbPasswordAgain" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="tbPasswordAgain" ErrorMessage="*" ForeColor="Red" 
                    Height="25px" ValidationGroup="gr1"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblEmail" Text="E-Mail: " runat="server" Width="100px" />
                <asp:TextBox ID="tbEmail" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="tbEmail" ErrorMessage="*" ForeColor="Red" Height="25px" 
                    ValidationGroup="gr1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tbEmail" ErrorMessage="Mail Hatalı" ForeColor="Red" 
                    Height="25px" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="gr1"></asp:RegularExpressionValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblhata" runat="server" Font-Bold="False" 
                    Font-Names="Old English Text MT" Font-Size="Small" ForeColor="Red" 
                    Height="25px" Width="127px"></asp:Label>
                &nbsp;<asp:Button ID="btnSend" Text="Gönder" runat="server" onclick="btnSend_Click" 
                    ValidationGroup="gr1" />&nbsp;
                <asp:Button ID="btnCancel" Text="İptal" runat="server" 
                    onclick="btnCancel_Click" />
            </ContentTemplate>        
        </asp:UpdatePanel>

    </div>
</asp:Content>
