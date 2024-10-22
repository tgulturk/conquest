<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Conquest1.main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" language="javascript">
        var i = 0;
         function Validate() 
         {
            var lbInsaEt = window.event.srcElement;
            srcButton.disabled = true ;

        }
        function DisableButton() {
            if (i == 1) {
                //document.forms[0].submit();
                window.setTimeout("disableButton()", 0);
            }
            else i = 1;
        }

        function disableButton() {
            for (i = 0; i <= document.forms[0].elements.length; i++) {
                elm = document.forms[0].elements[i];
                elm.disabled = true;
            }
        }

    </script>
    <div id="overview" style="overflow: -moz-scrollbars-vertical; overflow-y: auto;">
        <h3>ANA BİNA </h3>
        <br />
        Ana bina sayesinde yeni binalar yapılabilir ya da var olan binalar geliştirilebilir. Ana binanın seviyesi ne kadar yüksekse, yeni binalar o kadar çabuk yapılabilir.
        <br />&nbsp
        <br />İnşa kuyruğuna en fazla 3 inşaat eklenebilir. Bir işlem iptal edildiğinde harcanan madenlerin %75'i geri alınır.
        <br />&nbsp
        <asp:UpdatePanel ID="UP1" runat="server" ChildrenAsTriggers="True" UpdateMode="Always">
            <ContentTemplate>
                <asp:Repeater ID="repI" runat="server" onitemcommand="repI_ItemCommand">
                    <HeaderTemplate>
                        <table style=" border:1px solid white; background-color:#C1A264; width: 85%;">
                            <tr >
                                <td style="width:140px"><asp:Label ID="lb1" runat="server" Width="140px" Text="İşlem Yapılan Bina" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:60px"><asp:Label ID="Label1" runat="server" Width="60px" Text="İşlem" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:100px"><asp:Label ID="Label2" runat="server" Width="100px" Text="Kalan Süre" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text="Tamamlanma" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width:50px; text-align:center"><asp:Label ID="Label4" runat="server" Width="54px" Text="İptal" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </table>   
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style=" border:1px solid white; background-color:#F4E4BC; width: 85%;">
                            <tr >
                                <td style="width:140px"><asp:Label ID="lb1" runat="server" Width="140px" Text='<%#Eval("bName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:60px"><asp:Label ID="Label1" runat="server" Width="60px" Text='<%#Eval("islem")%>'  Font-Size="Small"></asp:Label></td>
                                <td style="width:100px"><asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>'  Font-Size="Small"></asp:Label></td>
                                <td style="width:140px"><asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width:50px; text-align:center"><asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="İptal" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width:0px; visibility:hidden"><asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                                <!--<asp:Timer ID="timer1" runat="server" Interval="1000" Enabled="false"></asp:Timer>-->
                            </tr>
                        </table> 
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>            
        </asp:UpdatePanel>
        <br />&nbsp
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Always">
            <ContentTemplate>
        <asp:Repeater ID="repB" runat="server" onitemcommand="repB_ItemCommand">
            <HeaderTemplate>
                <table style=" border:1px solid white; background-color:#C1A264; width: 85%;">
                    <tr >
                        <td style="width:200px"><asp:Label ID="lb1" runat="server" Text="Bina" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                        <td style="width:210px"><asp:Label ID="Label2" runat="server"  Text="Gereksinimler" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                        <td style="width:80px"><asp:Label ID="Label5" runat="server"  Text="Süre" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                        <td style="width:158px; text-align:center"><asp:Label ID="Label4" runat="server" Width="158px" Text="İnşa Et" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                    </tr>
                </table>   
            </HeaderTemplate>
            <ItemTemplate>
                <table style="border:1px solid white; background-color:#F4E4BC; width: 85%;">
                    <tr >
                        <td style="width:200px"><asp:Label ID="lb1" runat="server" Width="200px" Text='<%#Eval("Bina")%>' Font-Size="Small"></asp:Label></td>
                        <td style="width:70px;"> 
                            <img src="images/wood.png" alt="Odun" style="width: 21px; height: 18px; vertical-align: middle;" />
                            <asp:Label ID="lblodun" runat="server" Text='<%#Eval("Odun")%>' Font-Size="Small" style='<%# "color:" + MadenKontrol(Eval("Odun").ToString(), 0) + ";" %>'></asp:Label>
                        </td>
                        <td style="width:70px;"> 
                            <img src="images/clay.png" alt="Kil" style="width: 21px; height: 18px; vertical-align: middle;" />
                            <asp:Label ID="lblkil" runat="server" Text='<%#Eval("Kil")%>' Font-Size="Small" style='<%# "color:" + MadenKontrol(Eval("Kil").ToString(), 1) + ";" %>'></asp:Label>
                        </td>
                        <td style="width:70px;"> 
                            <img src="images/iron.png" alt="Demir" style="width: 21px; height: 18px; vertical-align: middle;" />
                            <asp:Label ID="lbldemir" runat="server"  Text='<%#Eval("Demir")%>' Font-Size="Small" style='<%# "color:" + MadenKontrol(Eval("Demir").ToString(), 2) + ";" %>'></asp:Label>
                        </td>
                        <td style="width:80px"><asp:Label ID="lblsure" runat="server" Width="80px" Text='<%#Eval("Sure")%>' Font-Size="Small"></asp:Label></td>
                        <td style="width:150px; text-align:center"><asp:LinkButton ID="lbInsaEt" runat="server" Width="150px" Text='<%#Eval("bLevel")+". Seviyeye Yükselt"%>' OnClientClick="DisableButton();" Font-Size="Small" ForeColor="#702604" Enabled='<%# InsaKontrol(Eval("Kil").ToString(),Eval("Odun").ToString(),Eval("Demir").ToString()) %>' EnableViewState="True"></asp:LinkButton></td>
                        <td style="width:0px; visibility:hidden"><asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("bID")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                        <td style="width:0px; visibility:hidden"><asp:Label ID="lvl" runat="server" Width="0px" Text='<%#Eval("bLevel")%>' Font-Size="Small" Visible="false"></asp:Label></td>
                    </tr>
                </table> 
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="repT" runat="server">
            <ItemTemplate>
                <table style=" border:1px solid white; background-color:#F4E4BC; width: 85%;">
                    <tr >
                        <td style="width:200px"><asp:Label ID="lb1" runat="server" Text='<%#Eval("bName")%>' Font-Size="Small"></asp:Label></td>
                        <td style="width:434px; text-align:center"><asp:Label ID="Label1" runat="server" Width="434px" Text="Bu Bina Tamamlanmış"  Font-Size="Small"></asp:Label></td>
                    </tr>
                </table> 
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="repG" runat="server">
            <ItemTemplate>
                <table style=" border:1px solid white; background-color:#F4E4BC; width: 85%;">
                    <tr >
                        <td style="width:200px"><asp:Label ID="lb1" runat="server" Text='<%#Eval("bName")%>' Font-Size="Small"></asp:Label></td>
                        <td style="width:434px; text-align:center"><asp:Label ID="Label1" runat="server" Width="434px" Text='<%#Eval("Gereksinim")%>'  Font-Size="Small"></asp:Label></td>
                    </tr>
                </table> 
            </ItemTemplate>
        </asp:Repeater>
            </ContentTemplate>            
        </asp:UpdatePanel>
        <br />&nbsp
    </div>
</asp:Content>
