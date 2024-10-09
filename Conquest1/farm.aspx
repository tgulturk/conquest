<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="farm.aspx.cs" Inherits="Conquest1.farm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <div id="content">
            <h3>ÇİFTLİK (Seviye <asp:Label ID="lblseviye" runat="server" Text=""></asp:Label>&nbsp;)</h3>
            <br />
            Çiftlik, birliklerini ve işçilerine yiyecek sağlar. Çiftliğini geliştirmezsen, köyün büyümez. Çiftliğin seviyesi ne kadar yüksekse, o kadar büyük bir nüfus beslenebilir.
            <br />&nbsp
            <table style="width:250px; border:1px solid white; background-color:#C1A264">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Size="Small" Text="Nüfus"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Size="Small" Text="Miktar"></asp:Label></td>
                </tr>
            </table>
            <table style="width:250px; border:1px solid white; background-color:#F4E4BC">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Güncel Nüfus"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblguncel" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
                <tr>
                    <td style="width:180px"><asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Sonraki Seviyede Nüfus"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblsonraki" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
            </table>
            <br />
        </div>
    </div>
</asp:Content>
