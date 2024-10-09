<%@ Page Title="" Language="C#" MasterPageFile="~/village.Master" AutoEventWireup="true" CodeBehind="overview.aspx.cs" Inherits="Conquest1.overwiev" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overview">
    <table style="width:100%">
        <tr>
            <td style="width:100px"><asp:Label ID="lblKoyt" runat="server" Text="Köy" /></td>
            <td style="width:60px"><asp:Label ID="lblPuant" runat="server" Text="Puan" /></td>
            <td style="width:120px"><asp:Label ID="lblHammaddet" runat="server" Text="Hammaddeler" /></td>
            <td style="width:50px"><asp:Label ID="lblDepot" runat="server" Text="Depo" /></td>
            <td style="width:60px"><asp:Label ID="lblCiftlikt" runat="server" Text="Çiftlik" /></td>
            <td style="width:50px; text-align:center;"><asp:Label ID="lblLoyalty" runat="server" Text="Bağlılık" /></td>
        </tr>
    </table>
    <div style="min-height:50px;max-height:490px; overflow: -moz-scrollbars-vertical; overflow-y: auto;">
    <asp:Repeater ID="rep" runat="server" onitemcommand="rep_ItemCommand">

                  <ItemTemplate>
                  <table style="width:100%">
                  <tr>
                        <td style="width:0px; float:left;"><asp:Label runat="server" ID="vID" Text='<%#Eval("vID")%>' Visible="False"></asp:Label></td>
                        <td style="width:200px; float:left;"><asp:LinkButton runat="server" ID="LbKoy" Width="120px" Text='<%#Eval("vName") %>' ForeColor="#702604" Font-Bold="true"
                     Font-Size="Small"></asp:LinkButton></td>
                        <td style="width:60px; float:left;"><asp:Label runat="server" ID="lblPuan" Text='<%#Eval("vPoint")%>' ></asp:Label></td> 
                        <td style="width:280px; float:left;">
                            <asp:Image runat="server" ID="imgWood" ImageUrl="images/wood.png" />&nbsp
                            <asp:Label runat="server" ID="lblwood1" Text = '<%#Eval("Wood") %>'></asp:Label>
                            <asp:Image runat="server" ID="Image1" ImageUrl="images/clay.png" />&nbsp
                            <asp:Label runat="server" ID="Label1" Text = '<%#Eval("Clay") %>'></asp:Label>
                            <asp:Image runat="server" ID="Image2" ImageUrl="images/iron.png" />&nbsp
                            <asp:Label runat="server" ID="Label2" Text = '<%#Eval("Iron") %>'></asp:Label>
                        </td> 
                        <td style="width:100px"><asp:Label runat="server" ID="lblDepo" Text='<%#Eval("Capacity")%>'></asp:Label></td>   
                        <td style="width:150px"><asp:Label runat="server" ID="lblCiftlik" Text='<%#Eval("Ciftlik")%>'></asp:Label></td>  
                        <td style="width:60px"><asp:Label runat="server" ID="lblBaglilik" Text='<%#Eval("Loyalty")%>'></asp:Label></td>                     
                   
                  </tr>
                  </table>
               </ItemTemplate> 

               

    </asp:Repeater>
</div>
</div>
</asp:Content>
