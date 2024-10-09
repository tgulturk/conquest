<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="commandcenter.aspx.cs" Inherits="Conquest1.commandcenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <h3>KOMUTA MERKEZİ </h3>
        <br />
        Komuta merkezinde savaşçıların toplanır. Bu merkezde saldırı emirlerini verebilir ve birliklerini kaydırabilirsin.
        <br />&nbsp
        <br />&nbsp
        <br />
        <table>
            <tr>
                <td><asp:Label runat="server" ID="Label1" Text="Mızrakçı :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbMizrak" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblMizrak" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
                <td style="width:50px"></td>
                <td><asp:Label runat="server" ID="Label3" Text="Casus :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbCasus" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblCasus" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
                <td style="width:50px"></td>
                <td><asp:Label runat="server" ID="Label10" Text="Şahmerdan :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbSahmerdan" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblSahmerdan" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" ID="Label2" Text="Kılıç Ustası :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbKilic" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblKilic" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
                <td style="width:50px"></td>
                <td><asp:Label runat="server" ID="Label5" Text="Hafif Atlı :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbHafif" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblHafif" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
                <td style="width:50px"></td>
                <td><asp:Label runat="server" ID="Label6" Text="Misyoner :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbMisyoner" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblMisyoner" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" ID="Label4" Text="Baltacı :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbBaltaci" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblBaltaci" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
                <td style="width:50px"></td>
                <td><asp:Label runat="server" ID="Label7" Text="Ağır Atlı :" Height="24px" Width="95px"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="tbAgir" Width="60px"></asp:TextBox></td>
                <td><asp:Label runat="server" ID="lblAgir" Height="24px" Width="60px" Font-Bold="true" Font-Size="Small" ForeColor="#702604"></asp:Label></td>
            </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td><asp:Label runat="server" ID="Label8" Height="24px" Text="X :" Width="20px"></asp:Label></td>
                    <td><asp:TextBox runat="server" ID="tbX" Width="35px" ></asp:TextBox></td>
                    <td style="width:5px"></td>
                    <td><asp:Label runat="server" ID="Label9" Height="24px" Text="Y :" Width="20px"></asp:Label></td>
                    <td><asp:TextBox runat="server" ID="tbY" Width="35px" ></asp:TextBox></td>
                    <td style="width:5px"></td>
                    <td><asp:Button runat="server" ID="btnGonder" Text="Gönder" Height="24px" 
                            Width="62px" onclick="btnGonder_Click" /></td>
                    <td style="width:5px">&nbsp;</td>
                    <td>
                        <asp:UpdatePanel runat="server" ID="UPH">
                            <ContentTemplate>
                                <asp:Label runat="server" ID="lblHata" Text="" Font-Size="Small" ForeColor="Red"></asp:Label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnGonder" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <br />
            <asp:UpdatePanel ID="UP2" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rep1" runat="server" onitemcommand="rep1_ItemCommand">
                    <HeaderTemplate>
                        <table style=" border:1px solid white; background-color:#C1A264">
                            <tr >
                                <td style="width:250px"><asp:Label ID="lb1" runat="server" Width="250px" Text="Hedef" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:100px; text-align:center"><asp:Label ID="Label2" runat="server" Width="100px" Text="Kalan Süre" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text="Varış" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:54px; text-align:center"><asp:Label ID="Label4" runat="server" Width="54px" Text="İptal" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </table>   
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style=" border:1px solid white; background-color:#F4E4BC">
                            <tr >
                                <td style="width:250px"><asp:Label ID="lb1" runat="server" Width="250px" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:100px; text-align:center"><asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:50px; text-align:center"><asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="İptal" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width:0px; visibility:hidden"><asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                                
                            </tr>
                        </table> 
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rep2" runat="server">
                    <ItemTemplate>
                        <table style=" border:1px solid white; background-color:#F4E4BC">
                            <tr >
                                <td style="width:250px"><asp:Label ID="lb1" runat="server" Width="250px" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:100px; text-align:center"><asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:50px; text-align:center"><asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width:0px; visibility:hidden"><asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                                
                            </tr>
                        </table> 
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rep3" runat="server">
                    <ItemTemplate>
                        <table style=" border:1px solid white; background-color:#F4E4BC">
                            <tr >
                                <td style="width:250px"><asp:Label ID="lb1" runat="server" Width="250px" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:100px; text-align:center"><asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:50px; text-align:center"><asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width:0px; visibility:hidden"><asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                                
                            </tr>
                        </table> 
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />&nbsp
    </div>
</asp:Content>
