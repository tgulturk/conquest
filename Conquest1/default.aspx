<%@ Page Title="Conquest - Browser Tabalı RTS Oyunu" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Conquest1._default1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="leftcontent" style="text-align: left">
        <span style="font-family: 'Old English Text MT'; font-size: x-large; color: #800000; font-weight: 700;">
        CONQUEST</span><br />
        <br />
        <span style="font-family: 'Old English Text MT'; font-size: medium; color: #582727">Conquest, internet tarayıcısı üzerinden oynanan ve ortaçagda gecen bir oyundur. 
        Her oyuncu, san, söhret ve güç kazanmasını saglayacagı küçük bir köyün 
        hükümdarıdır.<br />
        <br /></span>
        &nbsp;&nbsp;&nbsp;<div style="text-align:center"><asp:HyperLink ID="HyperLink1" runat="server" BackColor="#6C4025" 
            BorderColor="#993333" BorderStyle="Outset" Font-Bold="True" 
            Font-Names="Papyrus" Font-Size="Medium" Font-Underline="False" 
            ForeColor="White" NavigateUrl="~/register.aspx" Width="250px">ÜCRETSIZ KAYIT OL</asp:HyperLink>
        </div>&nbsp;</div>
    <div id="spear"></div>
    <div id="rightcontent">
    <asp:Panel ID="panel1" runat="server" DefaultButton="btnGiris">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblUsername" runat="server" Font-Bold="True" Font-Names="Old English Text MT" 
            ForeColor="#582727" Height="25px" Text="Kullanıcı Adı :" Width="140px" 
                Font-Size="Medium"/>&nbsp
            <br />
            <asp:TextBox ID="tbUsername" runat="server" Width="140px"/>&nbsp
            <br />
            <asp:Label ID="lblPassword" runat="server" Font-Bold="True" Font-Names="Old English Text MT" 
            ForeColor="#582727" Height="25px" Text="Sifre :" Width="100px"/>&nbsp
            <br />
            <asp:TextBox ID="tbPassword" TextMode="Password" runat="server" Width="140px"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tbPassword" ErrorMessage="*" ForeColor="Red" Height="25px" 
                ValidationGroup="grup1"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblhata" runat="server" Font-Size="Small" ForeColor="Red" 
                Height="25px" Text="Label" Width="91px"></asp:Label>
            <asp:Button ID="btnGiris" Text="Giriş" runat="server" 
                onclick="btnGiris_Click" BackColor="#6C4025" BorderColor="#D9B989" 
                BorderStyle="Outset" Font-Names="Old English Text MT" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="25px" 
                ValidationGroup="grup1" />
            
            <br />
            <br />
            <span style="font-family: 'Old English Text MT'; color: #582727; font-size: small">
            -
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" 
                Font-Underline="False" ForeColor="#582727" onclick="LinkButton1_Click">Sifrenizi mi Unuttunuz?</asp:LinkButton>
            

            <asp:Panel ID="Panel_Modal_Forgot" runat="server" CssClass="popupphoto" >
                <asp:Label ID="Label1" runat="server" Text="E-Mail Adresiniz" Width="150px" Height="25px"></asp:Label>
                <asp:TextBox ID="tbMail" runat="server" Width="160px" Font-Size="Small" Height="15px"></asp:TextBox><br />
                <asp:Button ID="Button1" runat="server" Text="Gönder" OnClick="btnButton1_Click" Width="80px" Height="25px"/>&nbsp
                <asp:Button ID="btnPIptal" runat="server" Text="İptal"  OnClick="btnPIptal_Click" Width="80px" Height="25px" />
            </asp:Panel>
            </span>
            
        </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>

    </div>
    <div id="grass"></div>
    <div id="news" 
        style="color: #582727; font-size: medium; font-family: 'Old English Text MT'">
        
            <span style="font-size: x-large; font-weight: 700;">Haberler<br />
            </span>
        
            <span style="font-size: xx-small; font-weight: 700;">&nbsp;</span><br /><div id="newsli">
                <asp:Repeater ID="rep" runat="server">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="l1" Text="- " />
                        <asp:Label runat="server" ID="NewsDate" Text='<%#Eval("newsDate","{0:d}")%>'></asp:Label>
                        <asp:Label runat="server" ID="l2" Text=" - " />
                        <asp:Label runat="server" ID="News" Text='<%#Eval("news") %>' /><br />
                    </ItemTemplate>
                    <SeparatorTemplate> 
                    </SeparatorTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>
        </div>
    </div> 
</asp:Content>
