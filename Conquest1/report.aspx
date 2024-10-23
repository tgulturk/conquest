<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="Conquest1.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    function toggleCheckboxes(master) {
        var checkboxes = document.querySelectorAll('input[type="checkbox"][id*="Cb"]');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = master.checked;
        }
    }
</script>
    <div id="messageswrapper">
        <div style="height:30px; width:95%; padding-left:20px;">
            <h3>Raporlar</h3>
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
                    <asp:MenuItem Text="Saldırı" Value="Saldırı"></asp:MenuItem>
                    <asp:MenuItem Text="Savunma" Value="Savunma"></asp:MenuItem>
                    <asp:MenuItem Text="Ticaret" Value="Ticaret"></asp:MenuItem>
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
                        <asp:Button ID="btnSil" runat="server" Text="Sil" onclick="btnSil_Click" />&nbsp
                        <asp:Button ID="btnOkundu" runat="server" Text="Okundu Olarak İşaretle" 
                            onclick="btnOkundu_Click" />
                        <br />
                    </div>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
                        onactiveviewchanged="MultiView1_ActiveViewChanged">
                        <asp:View ID="View1" runat="server">
                            <div style=" margin-top:10px; overflow: -moz-scrollbars-vertical; overflow-y: auto;  height:auto; border-left:1px solid grey; ">
                                <asp:Label ID="lb1" runat="server" Width="30px" Text="" Style="padding-left: 3px;">
                                    <asp:CheckBox ID="chkSelectAll" runat="server" Text="" OnClick="toggleCheckboxes(this)" />
                                </asp:Label>
                                <asp:Label ID="lblKisi" runat="server" Width="502px" Text="Konu"></asp:Label>
                                <asp:Label ID="Label99" runat="server" Width="150px" Text="Tarih"></asp:Label>
                                <asp:Repeater ID="rep" runat="server" onitemcommand="rep_ItemCommand">
                                    <HeaderTemplate>                                
                                        <hr style=""/>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table style="width:100%">
                                            <tr <%# FormatColorRow(DataBinder.Eval(Container.DataItem,"Okundumu").ToString()) %>>
                                                <td style="width:30px"><asp:CheckBox runat="server" ID="Cb" TextAlign="Left"  /></td>
                                                <td style="width:520px"><asp:LinkButton ID="lbMessage" runat="server" Text='<%#Eval("Konu") %>' Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small"></asp:LinkButton></td>
                                                <td style="width:150px"><asp:Label runat="server" ID="Date" Text='<%#Eval("senddate")%>' ></asp:Label></td> 
                                                <td style="width:0px"><asp:Label runat="server" ID="id" Text='<%#Eval("reportID")%>' Visible="False"></asp:Label></td>                         
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
                        <asp:Label ID="Label3" runat="server" Height="25px" Text="Konu :" Width="100px" 
                            Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblkonu" runat="server" Height="25px" Width="450px"></asp:Label>
                        <br />&nbsp;
                        <br />&nbsp;
                        <asp:Label ID="Label7" runat="server" Height="25px" Text="Tarih :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:Label ID="lbltarih" runat="server" Height="25px" Width="200px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <br />&nbsp
                        <asp:Label ID="Label1" runat="server" Height="25px" Text="Gönderen :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbGonderen" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbGonderen_Click"></asp:LinkButton>
                            <br />&nbsp
                        <asp:Label ID="Label8" runat="server" Height="25px" Text="Köy :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbKoy" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbKoy_Click"></asp:LinkButton>
                            <br />&nbsp
                        <asp:Label ID="Label10" runat="server" Height="25px" Text="Alıcı :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbAlici" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbAlici_Click"></asp:LinkButton>
                            <br />&nbsp
                        <asp:Label ID="Label12" runat="server" Height="25px" Text="Köy :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lblAköy" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lblAköy_Click"></asp:LinkButton>
                            <br />&nbsp
                            <br />&nbsp
                            <br />&nbsp
                            <asp:Label ID="Label9" runat="server" Height="18px" Text="Odun :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblOdun" runat="server" Height="18px" Text="400000" Width="53px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label13" runat="server" Height="18px" Text="Kil :" Width="25px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblKil" runat="server" Height="18px" Text="400000" Width="53px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label15" runat="server" Height="18px" Text="Demir :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblDemir" runat="server" Height="18px" Text="400000" Width="50px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <br />&nbsp
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                    <div>
                        <br />&nbsp;
                        <asp:Label ID="Label2" runat="server" Height="25px" Text="Konu :" Width="100px" 
                            Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblRkonu" runat="server" Height="25px" Width="450px"></asp:Label>
                        <br />&nbsp;
                        <br />&nbsp;
                        <asp:Label ID="Label4" runat="server" Height="25px" Text="Sonuç :" Width="100px" 
                            Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblSonuc" runat="server" Height="25px" Width="450px"></asp:Label>
                        <br />&nbsp;
                        <br />&nbsp;
                        <asp:Label ID="Label5" runat="server" Height="25px" Text="Tarih :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:Label ID="lblRtarih" runat="server" Height="25px" Width="200px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <br />&nbsp
                        <asp:Label ID="Label11" runat="server" Height="25px" Text="Saldıran :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbRgonderen" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbRgonderen_Click" ></asp:LinkButton>
                        <br />&nbsp
                        <asp:Label ID="Label14" runat="server" Height="25px" Text="Köy :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbRgkoy" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbRgkoy_Click" ></asp:LinkButton>                        
                        <table>
                            <tr>
                                <td style="width:90px"></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label23" Text="Mızrakçı" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label6" Text="Kılıç Ustası" Width="85px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label19" Text="Baltacı" Width="60px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label21" Text="Casus" Width="55px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label24" Text="Hafif Atlı" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label25" Text="Ağır Atlı" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label26" Text="Misyoner" Width="65px" Font-Size="Small"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:90px">&nbsp;&nbsp<asp:Label runat="server" ID="Label34" Text="Miktar :" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMmizrak" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMkilic" Text="0" Width="85px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMbaltaci" Text="0" Width="60px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMcasus" Text="0" Width="55px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMhafif" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMagir" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSMmisyoner" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:90px">&nbsp;&nbsp<asp:Label runat="server" ID="Label27" Text="Kayıplar :" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKmizrak" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKkilic" Text="0" Width="85px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKbaltaci" Text="0" Width="60px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKcasus" Text="0" Width="55px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKhafif" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKagir" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblSKmisyoner" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </table>
                        <br />&nbsp
                        <asp:Label ID="Label16" runat="server" Height="25px" Text="Savunan :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbRalici" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbRalici_Click" ></asp:LinkButton>
                            <br />&nbsp
                        <asp:Label ID="Label17" runat="server" Height="25px" Text="Köy :" Width="100px" 
                            Font-Bold="True" Font-Size="Small"></asp:Label>
                        <asp:LinkButton ID="lbRakoy" runat="server" Height="25px" Width="450px" Font-Bold="True" 
                                                    ForeColor="#702604" Font-Size="Small" 
                            onclick="lbRakoy_Click"></asp:LinkButton>
                        <table>
                            <tr>
                                <td style="width:90px"></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label28" Text="Mızrakçı" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label29" Text="Kılıç Ustası" Width="85px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label30" Text="Baltacı" Width="60px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label31" Text="Casus" Width="55px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label32" Text="Hafif Atlı" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label33" Text="Ağır Atlı" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="Label35" Text="Misyoner" Width="65px" Font-Size="Small"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:90px">&nbsp;&nbsp<asp:Label runat="server" ID="Label36" Text="Miktar :" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMmizrak" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMkilic" Text="0" Width="85px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMbaltaci" Text="0" Width="60px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMcasus" Text="0" Width="55px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMhafif" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMagir" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDMmisyoner" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width:90px">&nbsp;&nbsp<asp:Label runat="server" ID="Label44" Text="Kayıplar :" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKmizrak" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKkilic" Text="0" Width="85px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKbaltaci" Text="0" Width="60px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKcasus" Text="0" Width="55px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKhafif" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKagir" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                                <td style="text-align:center"><asp:Label runat="server" ID="lblDKmisyoner" Text="0" Width="65px" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </table>
                            <br />&nbsp
                            <asp:Label runat="server" ID="lblBdurum" Text="" Font-Bold="true" Font-Size="Small"></asp:Label>                            
                            <br />&nbsp
                            <br />&nbsp
                            <asp:Label runat="server" ID="lblSans" Text="" Font-Bold="true" Font-Size="Small"></asp:Label>   
                            <br />&nbsp
                            <br />&nbsp
                            <asp:Label runat="server" ID="lblblb" Text="Ganimetler :" Width="100px" Font-Bold="true" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label18" runat="server" Height="18px" Text="Odun :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblRodun" runat="server" Height="18px" Text="400000" Width="53px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label20" runat="server" Height="18px" Text="Kil :" Width="25px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblRkil" runat="server" Height="18px" Text="400000" Width="53px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label22" runat="server" Height="18px" Text="Demir :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblRdemir" runat="server" Height="18px" Text="400000" Width="50px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <br />&nbsp
                            <br />&nbsp
                            <asp:Label runat="server" ID="Label37" Text="Casusluk :" Width="100px" Font-Bold="true" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label38" runat="server" Height="18px" Text="Odun :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblCodun" runat="server" Height="18px" Text="400000" Width="53px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label40" runat="server" Height="18px" Text="Kil :" Width="25px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblCkil" runat="server" Height="18px" Text="400000" Width="53px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label42" runat="server" Height="18px" Text="Demir :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblCdemir" runat="server" Height="18px" Text="400000" Width="50px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>&nbsp;
                            <asp:Label ID="Label45" runat="server" Height="18px" Text="Duvar :" Width="42px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblCduvar" runat="server" Height="18px" Text="30" Width="50px" 
                            Font-Bold="False" Font-Size="Small"></asp:Label>
                            <br />&nbsp
                        </div>
                    </asp:View>
                </asp:MultiView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Menu1" EventName="MenuItemClick" />
                    <asp:AsyncPostBackTrigger ControlID="btnSil" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnOkundu" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />&nbsp;
        </div>
    </div>
</asp:Content>
