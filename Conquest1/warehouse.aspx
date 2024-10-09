<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="warehouse.aspx.cs" Inherits="Conquest1.warehouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <div id="content">
            <h3>HAMMADDE DEPOSU (Seviye <asp:Label ID="lblseviye" runat="server" Text=""></asp:Label>&nbsp;)</h3>
            <br />
            Depo sayesinde, köyünde üretilen hammaddeleri (odun, kil, demir) depolayabilirsin. Deponun seviyesi ne kadar yüksekse, içinde o kadar çok hammadde depolanabilir.
            <br />&nbsp
            <table style="width:250px; border:1px solid white; background-color:#C1A264">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Size="Small" Text="Depo Kapasitesi"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Size="Small" Text="Miktar"></asp:Label></td>
                </tr>
            </table>
            <table style="width:250px; border:1px solid white; background-color:#F4E4BC">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Güncel Kapasite"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblguncel" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
                <tr>
                    <td style="width:180px"><asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Sonraki Seviyede Kapasite"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblsonraki" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
            </table>
            <br />
        </div>
    </div>
</asp:Content>
