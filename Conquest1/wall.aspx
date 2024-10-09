<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="wall.aspx.cs" Inherits="Conquest1.wall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <div id="content">
            <h3>SUR (Seviye <asp:Label ID="lblseviye" runat="server" Text=""></asp:Label>&nbsp;)</h3>
            <br />
            Sur sayesinde düşman birliklerinden kısmen korunursun. Sur, köy savunmanı ve birliklerinin savunmasını arttırır.
            <br />&nbsp
            <table style="width:250px; border:1px solid white; background-color:#C1A264">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Size="Small" Text="Seviye"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Size="Small" Text="Bonus"></asp:Label></td>
                </tr>
            </table>
            <table style="width:250px; border:1px solid white; background-color:#F4E4BC">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Güncel Bonus"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblguncel" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
                <tr>
                    <td style="width:180px"><asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Sonraki Seviyede Bonus"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblsonraki" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
            </table>
            <br />
        </div>
    </div>
</asp:Content>
