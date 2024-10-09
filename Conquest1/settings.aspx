<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="Conquest1.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="messageswrapper">
        <div style="height:30px; width:95%; padding-left:20px;">
        <asp:Label ID="lblbl" runat="server" Width="20px"></asp:Label>
            <h3>AYARLAR</h3>
        </div>
        <div id="mleft">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                  
            <asp:Menu ID="Menu1" runat="server" Width="96px" BackColor="Transparent"
                DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="1em" 
                ForeColor="#990000" StaticSubMenuIndent="10px" 
                onmenuitemclick="Menu1_MenuItemClick">
                <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#FFFBD6" />
                <DynamicSelectedStyle BackColor="#FFCC66" />
                <Items>
                    <asp:MenuItem Text="Profil Bilgileri" Value="Profil Bilgileri"></asp:MenuItem>
                    <asp:MenuItem Text="EPosta Adresi" Value="EPosta Adresi"></asp:MenuItem>
                    <asp:MenuItem Text="Şifreyi Değiştir" Value="Şifreyi Değiştir"></asp:MenuItem>
                    <asp:MenuItem Text="Baştan Başla" Value="Baştan Başla"></asp:MenuItem>
                    <asp:MenuItem Text="Hesabı Sil" Value="Hesabı Sil"></asp:MenuItem>
                    <asp:MenuItem Text="Girişler" Value="Girişler"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="3px" />
                <StaticSelectedStyle BackColor="#FFCC66" />
            </asp:Menu>
            
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        <div id="mright" style="border-left:1px solid grey">            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" 
                UpdateMode="Conditional">
            <ContentTemplate>
            
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
                onactiveviewchanged="MultiView1_ActiveViewChanged">
                <asp:View ID="View6" runat="server">
                    <div style="margin-left:20px; margin-top:10px; height:auto;">
                        <h3>Profil Bilgileri</h3>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı: " Width="180px"></asp:Label>
                        <asp:Label ID="lblUsername" runat="server" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="E-Posta Adresi: " Width="180px"></asp:Label>
                        <asp:Label ID="lblEposta" runat="server" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Köy Sayısı: " Width="180px"></asp:Label>
                        <asp:Label ID="lblKoySayisi" runat="server" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Toplam Puan: " Width="180px"></asp:Label>
                        <asp:Label ID="lblPuan" runat="server" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Sıralama: " Width="180px"></asp:Label>
                        <asp:Label ID="lblSiralama" runat="server" Text="" Width="180px"></asp:Label>
                    </div>
                </asp:View>
                
                <asp:View ID="View2" runat="server">
                    <div style="margin-left:20px; margin-top:10px; overflow: -moz-scrollbars-vertical; overflow-y: auto;  height:auto;">
                        <h3>ŞİFRE DEĞİŞTİR</h3>
                        <br />
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>                        
                                <asp:Label ID="Label8" runat="server" Text="Şifre: " Width="180px"></asp:Label>
                                <asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    Display="Dynamic" ErrorMessage="*" Height="25px" 
                                    ControlToValidate="tbNewPassword" ValidationGroup="g2"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="Şifre Tekrar: " Width="180px"></asp:Label>
                                <asp:TextBox ID="tbNewPassAgain" runat="server" TextMode="Password" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    Display="Dynamic" ErrorMessage="*" Height="25px" 
                                    ControlToValidate="tbNewPassAgain" ValidationGroup="g2"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ControlToCompare="tbNewPassAgain" ControlToValidate="tbNewPassword" 
                                    ErrorMessage="Şifreler Uyuşmuyor" Font-Size="Small" Height="25px" 
                                    ValidationGroup="g2"></asp:CompareValidator>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="Hesap Şifreniz: " Width="180px"></asp:Label>
                                <asp:TextBox ID="tbPassword2" runat="server" TextMode="Password" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    Display="Dynamic" ErrorMessage="*" Height="14px" 
                                    ControlToValidate="tbPassword2" ValidationGroup="g2"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="lblhataP" runat="server" Text="" Width="257px" ForeColor="Red" Font-Size="Smaller"></asp:Label>
                                <asp:Button ID="btnKaydetP" runat="server" Text="Kaydet" 
                                    ValidationGroup="g2" onclick="btnKaydetP_Click" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnKaydetP" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>                        
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    
                </asp:View>
                <asp:View ID="View4" runat="server">
                    
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <div style="margin-left:20px; margin-top:10px; overflow: -moz-scrollbars-vertical; overflow-y: auto;  height:auto;">
                        <h3>GİRİŞLER</h3>
                        <br />
                        <br />
                        Bu sayfada, hesabına yapılan giriş denemelerini görebilirsin. 
                        Bu sayede yetkisiz girişleri tespit edebilir, erken önlem alabilirsin. 
                        IP adresin, genelde internet bağlantını kesip tekrar bağlandığında değişir.
                        <br /><br />
                        <i>Son 10 Giriş</i>
                        <table style="width:320px; border:1px solid white; background-color:#C1A264">
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Width="180px" Text="Tarih"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Width="120px" Text="IP Adresi"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:Repeater ID="rep" runat="server">
                                    <ItemTemplate>
                                        <table style="width:320px; border:1px solid white; background-color:#F4E4BC">
                                            <tr>
                                                <td style="width:180px"><asp:Label runat="server" ID="Tarih" Text='<%#Eval("Tarih")%>' ></asp:Label></td> 
                                                <td style="width:120px"><asp:Label runat="server" ID="IP" Text='<%#Eval("IP")%>'></asp:Label></td>                         
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div> 
                </asp:View>
                <asp:View ID="View1" runat="server">
                        <div style="margin-left:20px; margin-top:10px; overflow: -moz-scrollbars-vertical; overflow-y: auto;  height:auto;">
                        <h3>E-POSTA  ADRESİ DEĞİŞTİR</h3>
                        <br />
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>                        
                                <asp:Label ID="lbl1" runat="server" Text="E-Posta Adresi: " Width="180px"></asp:Label>
                                <asp:TextBox ID="tbEposta" runat="server" Width="200px" Font-Size="Small"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    Display="Dynamic" ErrorMessage="*" Height="25px" 
                                    ControlToValidate="tbEposta" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="Geçerli Bir Mail Adresi Değil" Font-Size="Small" Height="25px" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="g1" ControlToValidate="tbEposta"></asp:RegularExpressionValidator>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="E-Posta Adresi Tekrar: " Width="180px"></asp:Label>
                                <asp:TextBox ID="tbEpostatekrar" runat="server" Width="200px" 
                                    Font-Size="Small" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    Display="Dynamic" ErrorMessage="*" Height="25px" 
                                    ControlToValidate="tbEpostatekrar" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="tbEpostatekrar" ControlToValidate="tbEposta" 
                                    ErrorMessage="Mail Adresleri Uyuşmuyor" Font-Size="Small" Height="25px" 
                                    ValidationGroup="g1"></asp:CompareValidator>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Hesap Şifreniz: " Width="180px"></asp:Label>
                                <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    Display="Dynamic" ErrorMessage="*" Height="14px" 
                                    ControlToValidate="tbPassword" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="lblhata" runat="server" Text="" Width="318px" ForeColor="Red" Font-Size="Smaller"></asp:Label>
                                <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" 
                                    onclick="btnKaydet_Click" ValidationGroup="g1" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnKaydet" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>                        
                    </div>
                </asp:View>
            </asp:MultiView>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Menu1" EventName="MenuItemClick" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
