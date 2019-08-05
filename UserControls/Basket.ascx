<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Basket.ascx.cs" Inherits="ConLine.UserControls.Basket" %>
<div class="OrgaeWin">
    <div class="Marginer1">
        <div style="text-align: right; font-weight: bold; direction: rtl;">
            <div style="float:left">
                <asp:Button ID="btnCheckout" runat="server" Text="خرید نهایی" 
                    onclick="btnCheckout_Click" />
            </div>
            <asp:Label ID="lblBasketHeader" runat="server" Text="سبد خرید خالی است"></asp:Label></div>
        <asp:Repeater ID="rptBasket" runat="server">
            <HeaderTemplate>
                <table class="tblBasket" cellspacing="0">
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="تعداد"></asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="Label6" runat="server" Text="نام محصول"></asp:Label>
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%#Tools.ChangeEnc( DataBinder.Eval(Container.DataItem, "ItemCount").ToString())%>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ProductName")%>'
                            NavigateUrl='<%#"~/ShowProduct.aspx?Code=" + DataBinder.Eval(Container.DataItem, "ProductCode")%>'></asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table></FooterTemplate>
        </asp:Repeater>
    </div>
</div>
