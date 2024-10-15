<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="rankings.aspx.cs" Inherits="Conquest1.rankings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <div  style=" width:500px !important; max-height:600px !important; float:left; overflow: -moz-scrollbars-vertical; overflow-y: auto;">
        <asp:UpdatePanel ID="UPR1" runat="server" >
                            <ContentTemplate>
        <asp:Repeater ID="rep" runat="server" onitemcommand="rep_ItemCommand">
                            <HeaderTemplate>
                                <table style="width:410px; border:1px solid white; background-color:#C1A264">
                                    <tr >
                                    <td style="width:60px"><asp:Label ID="lb1" runat="server" Width="60px" Text="Sıra"></asp:Label></td>
                                    <td style="width:160px"><asp:Label ID="Label1" runat="server" Width="160px" Text="İsim"></asp:Label></td>
                                    <td style="width:70px"><asp:Label ID="Label2" runat="server" Width="70px" Text="Puan"></asp:Label></td>
                                    <td style="width:60px"><asp:Label ID="Label3" runat="server" Width="60px" Text="Köyler"></asp:Label></td>
                                    <td style="width:100px"><asp:Label ID="Label4" runat="server" Width="120px" Text="Köyün Puan Ortalaması"></asp:Label></td>
                                    </tr>
                                </table>                                
                                <hr style=""/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table style="width:410px; border:1px solid white; background-color:#F4E4BC">
                                    <tr <%# FormatColorRow(DataBinder.Eval(Container.DataItem,"userName").ToString()) %>>
                                        <td style="width:60px"><asp:Label runat="server" ID="Name" Text='<%#Eval("Sira")%>' Width="60px"></asp:Label></td>
                                        <td style="width:160px;"><asp:LinkButton ID="lbProfil" runat="server" Text='<%#Eval("userName") %>' CssClass="username" Width="160px" Font-Bold="True" 
                                            ForeColor="#702604" Font-Size="Small"></asp:LinkButton></td>
                                        <td style="width:70px"><asp:Label runat="server" ID="Date" Width="70px" Text='<%#Eval("puan")%>' ></asp:Label></td> 
                                        <td style="width:60px"><asp:Label runat="server" ID="id" Width="60px" Text='<%#Eval("VSayi")%>'></asp:Label></td> 
                                        <td style="width:100px"><asp:Label runat="server" ID="Label5" Width="120px" Text='<%#Eval("Ortalama")%>'></asp:Label></td>                        
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <FooterTemplate><hr style=""/><br /></FooterTemplate>
                        </asp:Repeater>
                        </ContentTemplate>
                        </asp:UpdatePanel>
        </div>
        <div style="margin-top:1px; width:365px; border:1px solid gray; min-height:100px; margin-right:10px; max-height:500px; float:right;">
            <div style="margin-left:20px; margin-top:10px; height:auto;">
                        <h3>Profil Bilgileri</h3>
                        <br />
                        <asp:UpdatePanel ID="UPR2" runat="server" UpdateMode="Conditional" >
                            <ContentTemplate>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text="Kullanıcı Adı: " Width="100px"></asp:Label>
                        <asp:Label ID="lblUsername" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Text="E-Posta Adresi: " Width="100px"></asp:Label>
                        <asp:Label ID="lblEposta" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" Text="Köy Sayısı: " Width="100px"></asp:Label>
                        <asp:Label ID="lblKoySayisi" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" Text="Toplam Puan: " Width="100px"></asp:Label>
                        <asp:Label ID="lblPuan" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" Text="Sıralama: " Width="100px"></asp:Label>
                        <asp:Label ID="lblSiralama" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br /><br />
                        <asp:LinkButton ID="lbMesajYaz" runat="server" Text=">> Mesaj Yaz" Width="160px" 
                                    Font-Bold="True" Font-Underline="false"
                                            ForeColor="#702604" Font-Size="Small" onclick="lbMesajYaz_Click"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lbArkadasEkle" runat="server" Text=">> Arkadaş Olarak Ekle" Width="160px" Font-Bold="True" Font-Underline="false"
                                            ForeColor="#702604" Font-Size="Small"></asp:LinkButton>
                        <br /><br /> 
                        <div style="width:95%; padding-bottom:5px;">                            
                            <asp:Repeater ID="rep1" runat="server" onitemcommand="rep1_ItemCommand">
                                <HeaderTemplate>
                                <table style="width:100%; border:1px solid white; background-color:#C1A264">
                                <tr>
                                    <td style="width:160px"><asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Size="Small" Text="Köyler"></asp:Label></td>
                                    <td style="width:60px; text-align:center;"><asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Size="Small" Text="Koordinat"></asp:Label></td>
                                    <td style="width:60px; text-align:center;"><asp:Label ID="Label8" runat="server" Font-Bold="true" Font-Size="Small" Text="Puan"></asp:Label></td>
                                    
                                </tr>
                            </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                        <table style="width:100%; border:1px solid white; background-color:#F4E4BC">
                                            <tr>
                                                <td style="width:180px"><asp:LinkButton ID="lbProfil" runat="server" Text='<%#Eval("vName") %>' Font-Bold="True" 
                                            ForeColor="#702604" Font-Size="Small"></asp:LinkButton></td> 
                                                <td style="width:65px; text-align:center;"><asp:Label runat="server" ID="IP" Text='<%#Eval("Koordinat")%>'></asp:Label></td> 
                                                <td style="width:60px; text-align:center;"><asp:Label runat="server" ID="Label9" Text='<%#Eval("vPoint")%>'></asp:Label></td> 
                                                <td style="width:0px"><asp:Label runat="server" ID="id" Text='<%#Eval("vID")%>' Visible="false"></asp:Label></td>                        
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                            </asp:Repeater>
                        </div>                       
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="rep" EventName="ItemCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
        </div>
    </div>
</asp:Content>
