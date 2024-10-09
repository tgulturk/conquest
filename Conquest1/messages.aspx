<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="Conquest1.messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="messageswrapper">
        <div style="height:30px; width:95%; padding-left:20px;">
        <asp:Label ID="lblbl" runat="server" Width="20px"></asp:Label>
            <h3>MESAJLAR</h3>
        </div>
        <div id="mleft">
        <asp:UpdatePanel ID="Upd1" runat="server">
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
                    <asp:MenuItem Text="Mesaj Yaz" Value="Mesaj Yaz"></asp:MenuItem>
                    <asp:MenuItem Text="Gelen Kutusu" Value="Gelen Kutusu"></asp:MenuItem>
                    <asp:MenuItem Text="Giden Kutusu" Value="Giden Kutusu"></asp:MenuItem>
                    <asp:MenuItem Text="Çöp Kutusu" Value="Çöp Kutusu"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="3px" />
                <StaticSelectedStyle BackColor="#FFCC66" />
            </asp:Menu>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        <div id="mright">            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" 
                UpdateMode="Conditional">
            <ContentTemplate>
            <div>
                <asp:Button ID="btngiveback" runat="server" Text="Geri Yükle" Visible="False" 
                    onclick="btngiveback_Click" />
                <asp:Button ID="btngiveback2" runat="server" Text="Geri Yükle" Visible="False" 
                    onclick="btngiveback2_Click" />
                <asp:Button ID="btnSil" runat="server" Text="Sil" onclick="Button1_Click" />
                <asp:Button ID="btnSil2" runat="server" Text="Sil" onclick="btnSil2_Click" 
                    Visible="False" />
                <asp:Button ID="btnreply" runat="server" onclick="btnreply_Click" 
                    Text="Yanıtla" />&nbsp;
                <asp:Button ID="btnforward" runat="server" onclick="btnforward_Click" 
                    Text="İlet" />
                <br />
            </div>
            
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
                onactiveviewchanged="MultiView1_ActiveViewChanged">
                <asp:View ID="View1" runat="server">
                    <div style=" margin-top:10px; overflow: -moz-scrollbars-vertical; overflow-y: auto;  height:auto; border-left:1px solid grey; ">
                        <asp:Label ID="lb1" runat="server" Width="30px" Text=""></asp:Label>
                                <asp:Label ID="lblKisi" runat="server" Width="160px" Text="Gönderen"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Width="360px" Text="Konu"></asp:Label>
                                <asp:Label ID="Label99" runat="server" Width="150px" Text="Tarih"></asp:Label>
                        <asp:Repeater ID="rep" runat="server" onitemcommand="rep_ItemCommand">
                            <HeaderTemplate>                                
                                <hr style=""/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table style="width:100%">
                                    <tr <%# FormatColorRow(DataBinder.Eval(Container.DataItem,"Okundumu").ToString()) %>>
                                        <td style="width:30px"><asp:CheckBox runat="server" ID="Cb" TextAlign="Left"  /></td>
                                        <td style="width:160px"><asp:Label runat="server" ID="Name" Text='<%#Eval("Gönderen")%>'></asp:Label></td>
                                        <td style="width:360px"><asp:LinkButton ID="lbMessage" runat="server" Text='<%#Eval("Konu") %>' Font-Bold="True" 
                                            ForeColor="#702604" Font-Size="Small"></asp:LinkButton></td>
                                        <td style="width:150px"><asp:Label runat="server" ID="Date" Text='<%#Eval("Tarih")%>' ></asp:Label></td> 
                                        <td style="width:0px"><asp:Label runat="server" ID="id" Text='<%#Eval("ID")%>' Visible="False"></asp:Label></td>                         
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <SeparatorTemplate>
                                <hr style=""/>   
                            </SeparatorTemplate>
                            <FooterTemplate><hr style=""/><br /></FooterTemplate>

                        </asp:Repeater>
                        <br />&nbsp
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div>
                        <br />&nbsp;
                        <asp:Label ID="Label1" runat="server" Height="25px" Text="Kimden :" Width="70px" 
                            Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblkimden" runat="server" Height="25px" Text="" 
                            Width="100px"></asp:Label>
                        <br />&nbsp;
                        <asp:Label ID="Label3" runat="server" Height="25px" Text="Konu :" Width="70px" 
                            Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblkonu" runat="server" Height="25px" Width="450px"></asp:Label>
                        <br />
                        <asp:TextBox ID="tbmail" runat="server" Height="230px" TextMode="MultiLine" 
                            Width="675px" ReadOnly="True"></asp:TextBox>
                            <br />&nbsp
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                     <br />&nbsp;
                    <asp:Label ID="Label4" runat="server" Height="25px" Text="Kime :" Width="50px"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbsendto" ErrorMessage="*" ForeColor="Red" 
                        Height="25px" ValidationGroup="grup1"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbsendto" runat="server" Width="200px"></asp:TextBox>
                    <asp:Label ID="lblhata" runat="server" ForeColor="Red" Height="25px" 
                        Text="    Böyle Bir Kullanıcı Bulunmamakta" Visible="False"></asp:Label>
                    <br />&nbsp;
                    <asp:Label ID="Label5" runat="server" Height="25px" Text="Konu :" Width="50px"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbsubject" ErrorMessage="*" ForeColor="Red" 
                        Height="25px" ValidationGroup="grup1"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbsubject" runat="server" Width="450px"></asp:TextBox>
                    <br /><br />&nbsp;
                    <asp:Label ID="Label6" runat="server" Height="25px" Text="Mesajınız :" 
                        Width="100px"></asp:Label>
                    <br />&nbsp;
                    <asp:TextBox ID="tbSendMessage" runat="server" Height="170px" TextMode="MultiLine" 
                        Width="675px"></asp:TextBox>
                    <br />&nbsp;
                    <asp:Label ID="Label7" runat="server" Height="25px" Width="610px"></asp:Label>
                    <asp:Button ID="btnsend" runat="server" onclick="btnsend_Click" Text="Gönder" 
                        Width="65px" ValidationGroup="grup1" />
                        <br />&nbsp
                </asp:View>
            </asp:MultiView>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Menu1" EventName="MenuItemClick" />
                    <asp:AsyncPostBackTrigger ControlID="btnforward" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btngiveback" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnreply" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSil" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSil2" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
