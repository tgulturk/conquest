<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="market.aspx.cs" Inherits="Conquest1.market" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">

    function setValueToTextbox(label) {

        var labelText = label.innerText || label.textContent;

        const matches = labelText.match(/\d+/g);

        // Elde edilen değerleri değişkenlere atama
        const x = matches[0]; // 54
        const y = matches[1]; // 32


    }
</script>
    <div id="overview">
        <h3>PAZAR </h3>
        <br />
        Pazar yerinde başka oyuncularla ticaret yapabilir ya da onlara hammadde gönderebilirsin.
        <br />
        &nbsp
        <br />
        <asp:Label ID="Label4" runat="server" Text="Tüccar :" Width="60px"></asp:Label>
        <asp:Label ID="lbltuccar" runat="server" Text="235/235" Width="60px"></asp:Label>
        &nbsp&nbsp&nbsp
        <asp:Label ID="Label5" runat="server" Text="Azami Transfer Miktarı :" Width="170px"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="400000" Width="60px"></asp:Label>
        <br />
        &nbsp
        <br />
        <table style="float: left;margin-bottom: 20px;padding-top: 20px">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Odun :" Height="24px" Width="55px"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="tbOdun" Width="75px"
                        OnTextChanged="tbOdun_TextChanged" MaxLength="6"></asp:TextBox>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="lbOdun" Text="(400000)" Height="24px"
                                ForeColor="#702604" Font-Bold="true" Font-Size="Small"></asp:LinkButton>
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="tbOdun" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="tbKil" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="tbDemir" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Kil :" Height="24px" Width="55px"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbKil" runat="server" Width="75px"
                        OnTextChanged="tbKil_TextChanged" MaxLength="6"></asp:TextBox></td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="lbKil" Text="(400000)" Height="24px" ForeColor="#702604" Font-Bold="true" Font-Size="Small"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="tbOdun" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="tbKil" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="tbDemir" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Width="60px" Text=" " Height="24px"></asp:Label></td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="X :" Height="24px" Width="20px"></asp:Label>
                    <asp:TextBox ID="tbX" runat="server" Width="30px"></asp:TextBox>&nbsp
                    <asp:Label ID="Label8" runat="server" Text="Y :" Height="24px" Width="20px"></asp:Label>
                    <asp:TextBox ID="tbY" runat="server" Width="30px"></asp:TextBox>&nbsp
                    <asp:Button ID="btnGonder" runat="server" Height="24px" Text="Gönder"
                        OnClick="btnGonder_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Demir :" Height="24px" Width="55px"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbDemir" runat="server" Width="75px"
                        OnTextChanged="tbDemir_TextChanged" MaxLength="6"></asp:TextBox></td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="lbDemir" Text="(400000)" Height="24px" ForeColor="#702604" Font-Bold="true" Font-Size="Small"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="tbOdun" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="tbKil" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="tbDemir" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td></td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label runat="server" ID="lblHata" Font-Size="Small" ForeColor="Red"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGonder" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <div style="width: 270px; padding-bottom: 5px; float: left; margin-left: 100px; margin-bottom: 20px;overflow-y: auto;max-height: 127px">
        <asp:Repeater ID="rep4" runat="server" onitemcommand="rep4_ItemCommand">
        <HeaderTemplate>
            <table style="width:100%; border:1px solid white; background-color:#C1A264">
                <tr>
                    <td style="width:160px"><asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Size="Small" Text="Köyler"></asp:Label></td>
                    <td style="width:60px; text-align:center;"><asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Size="Small" Text="Koordinat"></asp:Label></td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table style="width:100%; border:1px solid white; background-color:#F4E4BC">
                <tr>
                    <td style="width:180px"><asp:Label ID="lbProfil" runat="server" Text='<%#Eval("vName") %>'></asp:Label></td> 
                    <td style="width:65px; text-align:center;">
                        <asp:LinkButton runat="server" ID="coordinate" Text='<%#Eval("Koordinat")%>' Font-Bold="True" ForeColor="#702604" Font-Size="Small"></asp:LinkButton>
                    </td>             
                </tr>
            </table>
        </ItemTemplate>
        </asp:Repeater>
        </div>
        <br />
        &nbsp       
        <br />
    <div>
        <asp:UpdatePanel ID="UP2" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rep1" runat="server" OnItemCommand="rep1_ItemCommand">
                    <HeaderTemplate>
                        <table style="border: 1px solid white; background-color: #C1A264;">
                            <tr>
                                <td style="width: 160px">
                                    <asp:Label ID="lb1" runat="server" Width="160px" Text="Hedef" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label10" runat="server" Width="60px" Text="Odun" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label11" runat="server" Width="60px" Text="Kil" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label12" runat="server" Width="60px" Text="Demir" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label1" runat="server" Width="60px" Text="Tüccar" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 100px">
                                    <asp:Label ID="Label2" runat="server" Width="100px" Text="Kalan Süre" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 140px">
                                    <asp:Label ID="Label3" runat="server" Width="140px" Text="Tamamlanma" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                                <td style="width: 54px; text-align: center">
                                    <asp:Label ID="Label4" runat="server" Width="54px" Text="İptal" Font-Bold="True" Font-Size="Small"></asp:Label></td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table style="border: 1px solid white; background-color: #F4E4BC">
                            <tr>
                                <td style="width: 160px">
                                    <asp:Label ID="lb1" runat="server" Width="160px" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Eval("odun")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Eval("kil")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Eval("demir")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label1" runat="server" Width="60px" Text='<%#Eval("mCount")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 100px; text-align: center">
                                    <asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 140px">
                                    <asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 50px; text-align: center">
                                    <asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="İptal" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width: 0px; visibility: hidden">
                                    <asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>

                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rep2" runat="server">
                    <ItemTemplate>
                        <table style="border: 1px solid white; background-color: #F4E4BC">
                            <tr>
                                <td style="width: 160px">
                                    <asp:Label ID="lb1" runat="server" Width="160px" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Eval("odun")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Eval("kil")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Eval("demir")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label1" runat="server" Width="60px" Text='<%#Eval("mCount")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 100px; text-align: center">
                                    <asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 140px">
                                    <asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 50px; text-align: center">
                                    <asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width: 0px; visibility: hidden">
                                    <asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>

                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rep3" runat="server">
                    <ItemTemplate>
                        <table style="border: 1px solid white; background-color: #F4E4BC">
                            <tr>
                                <td style="width: 160px">
                                    <asp:Label ID="lb1" runat="server" Width="160px" Text='<%#Eval("vName")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Eval("odun")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Eval("kil")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Eval("demir")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 60px">
                                    <asp:Label ID="Label1" runat="server" Width="60px" Text='<%#Eval("mCount")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 100px; text-align: center">
                                    <asp:Label ID="lblSure" runat="server" Width="100px" Text='<%#Eval("Sure")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 140px">
                                    <asp:Label ID="Label3" runat="server" Width="140px" Text='<%#Eval("endTime")%>' Font-Size="Small"></asp:Label></td>
                                <td style="width: 50px; text-align: center">
                                    <asp:LinkButton ID="lbiptal" runat="server" Width="50px" Text="" Font-Size="Small" ForeColor="#702604"></asp:LinkButton></td>
                                <td style="width: 0px; visibility: hidden">
                                    <asp:Label ID="id" runat="server" Width="0px" Text='<%#Eval("islemID")%>' Font-Size="Small" Visible="false"></asp:Label></td>

                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div><br />
        &nbsp
    </div>
</asp:Content>
