<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="stable.aspx.cs" Inherits="Conquest1.stable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <h3>AHIR </h3>
        <br />
        At çiftliğinizde süvari yetiştirebilirsiniz. At çiftliğinizin kademesi ne kadar yüksek olursa, o kadar hızlı birlik yetiştirebilirsiniz.
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
                <td><asp:Label ID="Label8" runat="server" Text="Casus" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblCodun" runat="server" Font-Size="Small" Text="50" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblCkil" runat="server" Font-Size="Small" Text="50" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblCdemir" runat="server" Font-Size="Small" Text="20" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblCpop" runat="server" Font-Size="Small" Text="2" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblCsure" runat="server" Font-Size="Small" Text="00:00:20" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbCasus" runat="server" Width="70px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label9" runat="server" Text="Hafif Atlı" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblHodun" runat="server" Font-Size="Small" Text="125" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblHkil" runat="server" Font-Size="Small" Text="100" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblHdemir" runat="server" Font-Size="Small" Text="250" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblHpop" runat="server" Font-Size="Small" Text="4" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblHsure" runat="server" Font-Size="Small" Text="00:01:10" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbHafif" runat="server" Width="70px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label10" runat="server" Text="Ağır Atlı" Font-Size="Small" Width="100px"></asp:Label></td>
                <td><asp:Label ID="lblAodun" runat="server" Font-Size="Small" Text="200" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblAkil" runat="server" Font-Size="Small" Text="150" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblAdemir" runat="server" Font-Size="Small" Text="600" Width="55px"></asp:Label></td>
                <td><asp:Label ID="lblApop" runat="server" Font-Size="Small" Text="6" Width="40px"></asp:Label></td>
                <td><asp:Label ID="lblAsure" runat="server" Font-Size="Small" Text="00:01:20" Width="65px"></asp:Label></td>
                <td style="width:120px"><asp:TextBox ID="tbAgir" runat="server" Width="70px"></asp:TextBox></td>
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
