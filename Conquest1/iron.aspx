﻿<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="iron.aspx.cs" Inherits="Conquest1.iron" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <div id="content">
            <h3>DEMİR MADENİ (Seviye <asp:Label ID="lblseviye" runat="server" Text=""></asp:Label>&nbsp;)</h3>
            <br />
            Demir madeninde, işçilerin savaşların sonucunu belirleyen demiri çıkarırlar. Demir madeninin seviyesi ne kadar yüksekse, o kadar çok demir üretilir.
            <br />&nbsp
            <table style="width:250px; border:1px solid white; background-color:#C1A264">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Size="Small" Text="Üretim"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Size="Small" Text="Saat Başı"></asp:Label></td>
                </tr>
            </table>
            <table style="width:250px; border:1px solid white; background-color:#F4E4BC">
                <tr>
                    <td style="width:180px"><asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Güncel Üretim"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblguncel" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
                <tr>
                    <td style="width:180px"><asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Sonraki Seviyede Üretim"></asp:Label></td>
                    <td style="width:70px; text-align:center;"><asp:Label ID="lblsonraki" runat="server" Font-Size="Small" Text="0"></asp:Label></td>                        
                </tr>
            </table>
            <br />
        </div>
    </div>
</asp:Content>
