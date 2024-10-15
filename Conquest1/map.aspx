<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="Conquest1.map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
        <div  style="max-width:574px;  width:574px !important; float:left;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div style="text-align:center; width:100%; min-height:11px;">
                        <asp:ImageButton runat="server" ID="ibust" Width="11px" Height="11px" 
                            ImageUrl="images/map_n.png" onclick="ibust_Click" />
                    </div>
                    
                    <div style="max-width:574px; width:574px; float:left;">
                        <div style="max-width:11px; width:11px; min-width:11px; height:380px; float:left;">
                            <div style="margin-top:166px">
                                <asp:ImageButton runat="server" ID="ibsol" Width="11px" Height="11px" 
                                    ImageUrl="images/map_w.png" onclick="ibsol_Click" />
                            </div>
                        </div>
                        <div style="width:21px; height:380px; float:left; text-align:center; line-height:38px">
                            <asp:Label runat="server" ID="Label1" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label2" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label3" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label4" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label5" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label6" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label7" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label8" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label9" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="Label10" width="20px" Height="38px" Text="50" Font-Size="Small" ></asp:Label>
                        </div>
                        <div style="max-width:531px;width:531px; height:380px; float:left;">
                            
                            <asp:Repeater runat="server" ID="rep" onitemcommand="rep_ItemCommand">
                                <ItemTemplate>
                                    <div <%# GetClass(Eval("vID").ToString()) %>">
                                        <asp:Label runat="server" ID="vID" Text='<%#Eval("vID")%>' Visible="false"></asp:Label>
                                        <asp:ImageButton runat="server" ID="ib" style='<%# Cursor(Eval("vID").ToString()) %>' Width="53px" Height="38px" ImageUrl='<%# ReturnImage(Eval("vID").ToString()) %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                        </div>
                        <div style="max-width:11px; width:11px; min-width:11px; height:380px; float:right;">
                            <div style="margin-top:166px">
                                <asp:ImageButton runat="server" ID="ibsag" Width="11px" Height="11px" 
                                    ImageUrl="images/map_e.png" onclick="ibsag_Click" />
                            </div>                            
                        </div>
                        <div style="margin-left:32px; float:left; text-align:center; max-height:17px;">
                            <asp:Label runat="server" ID="lbl1" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl2" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl3" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl4" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl5" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl6" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl7" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl8" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl9" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                            <asp:Label runat="server" ID="lbl10" Width="49px" Text="50" Font-Size="Small" ></asp:Label>
                        </div>
                    </div>
                    <div style="text-align:center; width:100%; min-height:11px;">
                        <asp:ImageButton runat="server" ID="ibalt" Width="11px" Height="11px" 
                            ImageUrl="images/map_s.png" onclick="ibalt_Click" />
                    </div>
                    <div style=" width:100%;">
                        <div style="margin-left:32px; width:130px;">
                            <div style="width:109px; min-height:10px;">&nbsp</div>
                            <div style="margin-left:1px; margin-right:4px; background-color:White; height:14px; width:14px; border:1px solid grey; float:left;"></div>
                            <div style="float:left;"><asp:Label ID="lblaktif" runat="server" Text="Aktif Köyün" Font-Size="Smaller" ></asp:Label></div><br />
                            <div style="margin-left:1px; margin-right:4px; background-color:yellow; height:14px; width:14px; border:1px solid grey; float:left;"></div>
                            <div style="float:left;"><asp:Label ID="lblsenin" runat="server" Text="Sana Ait Köy" Font-Size="Smaller" ></asp:Label></div><br />
                            <div style="margin-left:1px; margin-right:4px; background-color:Red; height:14px; width:14px; border:1px solid grey; float:left;"></div>
                            <div style="float:left;"><asp:Label ID="Label11" runat="server" Text="Düşman Köyler" Font-Size="Smaller" ></asp:Label></div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ibalt" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ibsag" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ibsol" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ibust" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div style="margin-top:11px; width:291px; border:1px solid gray; min-height:100px; margin-right:10px; max-height:500px; float:right;">
            <div style="margin-left:10px; margin-top:5px; height:auto;">
                <h3>Köy Bilgileri</h3>
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Small" Text="Köy Adı: " Width="90px"></asp:Label>
                        <asp:Label ID="lblVillageName" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Small" Text="Kullanıcı Adı: " Width="90px"></asp:Label>
                        <asp:LinkButton ID="lbUsername" runat="server" Text="" Width="160px" 
                                    Font-Bold="True" Font-Underline="false"
                                            ForeColor="#702604" Font-Size="Small" 
                            onclick="lbUsername_Click"></asp:LinkButton>
                        <br />
                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Small" Text="Puan: " Width="90px"></asp:Label>
                        <asp:Label ID="lblPuan" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br />
                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Small" Text="Koordinatlar: " Width="90px"></asp:Label>
                        <asp:Label ID="lblCoordinates" runat="server" Font-Size="Small" Text="" Width="180px"></asp:Label>
                        <br /><br />
                        <asp:LinkButton ID="lbSendTroops" runat="server" Text=">> Asker Gönder" Width="160px" 
                                    Font-Bold="True" Font-Underline="false"
                                            ForeColor="#702604" Font-Size="Small" 
                            onclick="lbSendTroops_Click"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lbSendResources" runat="server" Text=">> Hammadde Gönder" 
                            Width="160px" Font-Bold="True" Font-Underline="false"
                                            ForeColor="#702604" Font-Size="Small" 
                            onclick="lbSendResources_Click"></asp:LinkButton>
                        <br />&nbsp
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div style="width:100%; float:left;">&nbsp</div>
        
    </div>    
</asp:Content>
