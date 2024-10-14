<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="barracks.aspx.cs" Inherits="Conquest1.barracks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <h3>KIŞLA </h3>
        <br />
        Kışlada piyade üretebilirsin. Kışlanın seviyesi ne kadar yüksekse birliklerini o kadar hızlı üretebilirsin.
        <br />
        <br />
        <asp:UpdatePanel ID="UP2" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rep1" runat="server" onitemcommand="rep1_ItemCommand">
                    <HeaderTemplate>
                        <table style=" border:1px solid white; background-color:#C1A264">
                            <tr >
                                <td style="width:160px"><asp:Label ID="lb1" runat="server" Width="160px" Text="Hedef" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:80px"><asp:Label ID="Label17" runat="server" Width="80px" Text="Sayı" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:100px"><asp:Label ID="Label2" runat="server" Width="100px" Text="Kalan Süre" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text="Tamamlanma" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:54px; text-align:center"><asp:Label ID="Label4" runat="server" Width="54px" Text="İptal" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </table>   
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style=" border:1px solid white; background-color:#F4E4BC">
                            <tr >
                                <td style="width:160px"><asp:Label ID="lb1" runat="server" Width="160px" Text='<%#Eval("uName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:80px"><asp:Label ID="Label18" runat="server" Width="80px" Text='<%#Eval("sayi")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:100px"><asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:50px; text-align:center"><asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="İptal" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width:0px; visibility:hidden"><asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                                
                            </tr>
                        </table> 
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>        
        <br />
        <br />
        <table style=" border:1px solid white; background-color:#C1A264">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Birim" Font-Bold="True" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="Label2" runat="server" Text="Odun" Font-Bold="True" Font-Size="Small" Width="55px"></asp:Label></td>
                <td><asp:Label ID="Label3" runat="server" Text="Kil" Font-Bold="True" Font-Size="Small" Width="55px"></asp:Label></td>
                <td><asp:Label ID="Label4" runat="server" Text="Demir" Font-Bold="True" Font-Size="Small" Width="55px"></asp:Label></td>
                <td><asp:Label ID="Label5" runat="server" Text="Pop." Font-Bold="True" Font-Size="Small" Width="40px"></asp:Label></td>
                <td><asp:Label ID="Label6" runat="server" Text="Süre" Font-Bold="True" Font-Size="Small" Width="65px"></asp:Label></td>
                <td><asp:Label ID="Label7" runat="server" Text="Yetiştir" Font-Bold="True" Font-Size="Small" Width="120px"></asp:Label></td>
            </tr>
        </table>
    <asp:UpdatePanel ID="UP4" runat="server" UpdateMode="Conditional">
    <ContentTemplate>      
        <table style=" border:1px solid white; background-color:#F4E4BC">
            <tr>
                <td><asp:Label ID="Label8" runat="server" Text="Mızrakçı" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblModun" runat="server" Font-Size="Small" Text="50" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblMkil" runat="server" Font-Size="Small" Text="30" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblMdemir" runat="server" Font-Size="Small" Text="10" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblMpop" runat="server" Font-Size="Small" Text="1" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblMsure" runat="server" Font-Size="Small" Text="00:00:45" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbMizrak" runat="server" Width="70px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label9" runat="server" Text="Kılıç Ustası" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblKodun" runat="server" Font-Size="Small" Text="30" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblKkil" runat="server" Font-Size="Small" Text="30" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblKdemir" runat="server" Font-Size="Small" Text="70" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblKpop" runat="server" Font-Size="Small" Text="1" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblKsure" runat="server" Font-Size="Small" Text="00:00:50" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbKilic" runat="server" Width="70px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label10" runat="server" Text="Baltacı" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblBodun" runat="server" Font-Size="Small" Text="60" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblBkil" runat="server" Font-Size="Small" Text="30" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblBdemir" runat="server" Font-Size="Small" Text="40" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblBpop" runat="server" Font-Size="Small" Text="1" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblBsure" runat="server" Font-Size="Small" Text="00:00:45" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbBaltaci" runat="server" Width="70px"></asp:TextBox></td>
            </tr>
        </table> </ContentTemplate>
    </asp:UpdatePanel>        
        <table>
            <tr>
                <td><asp:Label ID="Label11" runat="server" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="Label12" runat="server" Font-Size="Small" Width="55px"></asp:Label></td>
                <td><asp:Label ID="Label13" runat="server" Font-Size="Small" Width="55px"></asp:Label></td>
                <td><asp:Label ID="Label14" runat="server" Font-Size="Small" Width="55px"></asp:Label></td>
                <td><asp:Label ID="Label15" runat="server" Font-Size="Small" Width="40px"></asp:Label></td>
                <td>
                    <asp:UpdatePanel ID="UP3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>                            
                            <asp:Label ID="lblHata" Text="" runat="server" Font-Size="Small" 
                                Width="120px" ForeColor="Red"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnYetistir" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width:70px;text-align:right"><asp:Button ID="btnYetistir" 
                        runat="server" Font-Size="Small" Text="Yetiştir" onclick="btnYetistir_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
