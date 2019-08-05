<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCOrderProducts.ascx.cs"
    Inherits="ConLine.UserControls.UCOrderProducts" %>
<asp:Repeater ID="rptOrderProducts" runat="server">
    <HeaderTemplate>
        <table class="tblBasket" cellspacing="0">
            <tr>
                <th>
                    <asp:Label ID="Label3" runat="server" Text="قیمت کل"></asp:Label>
                </th>
                <th>
                    <asp:Label ID="Label4" runat="server" Text="قیمت پایه"></asp:Label>
                </th>
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
                <%#Convert.ToInt32(Eval("ProductPrice")) * Convert.ToInt32(Eval("ItemCount"))%>
            </td>
            <td>
                <%#Tools.ChageEnc(Tools.FormatCurrency(DataBinder.Eval(Container.DataItem, "ProductPrice").ToString()))%>
            </td>
            <td>
                <%#Tools.ChangeEnc( DataBinder.Eval(Container.DataItem, "ItemCount").ToString())%>
            </td>
            <td>
                <asp:HyperLink runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ProductName")%>'
                    NavigateUrl='<%#"~/" + Tools.ConrrectUrl(Eval("EnTitle")) + "-" + Eval("ProductCode") + ".html" %>'></asp:HyperLink>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table></FooterTemplate>
</asp:Repeater>
