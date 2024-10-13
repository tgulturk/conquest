<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="palace.aspx.cs" Inherits="Conquest1.palace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <h3>SARAY </h3>
        <br />
        Saray sayesinde misyoner üretebilir ve köyler fethedebilirsiniz. En fazla 3 adet misyoner barındırabilirsiniz.
        <br />
        <br />
        <asp:UpdatePanel ID="UP2" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rep1" runat="server">
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
        <asp:UpdatePanel ID="UP4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>     
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
        <table style=" border:1px solid white; background-color:#F4E4BC">
            <tr>
                <td><asp:Label ID="Label8" runat="server" Text="Misyoner" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblModun" runat="server" Font-Size="Small" Text="40000" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblMkil" runat="server" Font-Size="Small" Text="50000" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblMdemir" runat="server" Font-Size="Small" Text="50000" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblMpop" runat="server" Font-Size="Small" Text="100" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblMsure" runat="server" Font-Size="Small" Text="04:00:00" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbMisyoner" runat="server" Width="70px"></asp:TextBox></td>
            </tr>
        </table>
        </ContentTemplate>
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
