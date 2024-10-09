<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="village.aspx.cs" Inherits="Conquest1.village1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="villagebuilds">
    <h2>YETKİLİ OLDUĞUNU İDDİA EDİP ŞİFRENİZİ İSTEYENLERE İTİMAT ETMEYİNİZ.</h2>
    <br />
    <asp:Repeater ID="rep" runat="server" onitemcommand="rep_ItemCommand">
        <ItemTemplate>
            <asp:Label runat="server" ID="id" Text='<%#Eval("bID")%>'  Visible="false"></asp:Label>
            <asp:LinkButton runat="server" ID="lbBina" Text='<%#Eval("Isim")%>' Font-Bold="True" 
                                            ForeColor="#702604" Font-Size="Small"></asp:LinkButton>&nbsp
            (Seviye&nbsp<asp:Label runat="server" ID="lbSeviye" Text='<%#Eval("Seviye") %>'></asp:Label>)<br />
        </ItemTemplate>
    </asp:Repeater>
    <br />&nbsp
    </div>
    <div id="villageinfo">
                <div id="resourceincrement">
                    <asp:Label ID="Label1" runat="server" Text="Odun :" Width="75px"></asp:Label>
                    <asp:Label ID="lblOduninc" runat="server" Text="Label"></asp:Label>
                    &nbsp;saat başı<br />
                    <asp:Label ID="Label3" runat="server" Text="Kil :" Width="75px"></asp:Label>
                    <asp:Label ID="lblKilinc" runat="server" Text="Label"></asp:Label>
                    &nbsp;saat başı<br />
                    <asp:Label ID="Label5" runat="server" Text="Demir :" Width="75px"></asp:Label>
                    <asp:Label ID="lblDemirinc" runat="server" Text="Label"></asp:Label>
                &nbsp;saat başı</div>
                <div id="villageunits">
                    <asp:Repeater ID="rep1" runat="server">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbSayi" Text='<%#Eval("Sayi") %>' />&nbsp
                        <asp:Label runat="server" ID="lbIsim" Text='<%#Eval("Isim") %>' /><br />
                    </ItemTemplate>
                    <SeparatorTemplate> 
                    </SeparatorTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>
                </div>
                <div id="events">
                    <asp:UpdatePanel runat="server" ID="UPE">
                        <ContentTemplate>
                            <asp:Repeater runat="server" ID="repe">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width:180px"><asp:Label runat="server" ID="LabelS" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                            <td style="width:100px"><asp:Label runat="server" ID="lblKalan" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater runat="server" ID="repe2">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width:180px"><asp:Label runat="server" ID="LabelS" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                            <td style="width:100px"><asp:Label runat="server" ID="lblKalan" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
</asp:Content>
