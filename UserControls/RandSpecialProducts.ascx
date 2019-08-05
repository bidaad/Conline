<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RandSpecialProducts.ascx.cs"
    Inherits="ConLine.UserControls.RandSpecialProducts" %>
<div>
    <asp:DataList ID="rptProducts" RepeatColumns="3" CssClass="tblSpecialProducts"
        RepeatDirection="Horizontal" runat="server">
        <ItemTemplate>
            <div>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="cTitle" ToolTip='<%#FormatText(DataBinder.Eval(Container.DataItem, "Title")) %>'
                    NavigateUrl='<%#"~/ShowProduct.aspx?Code=" +DataBinder.Eval(Container.DataItem, "ProductCode")%>'>
                                <%#ShowPic(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "SmallPicFile"))%>
                </asp:HyperLink></div>
            <div class="ProName">
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="cTitle" ToolTip='<%#DataBinder.Eval(Container.DataItem, "Title") %>'
                    NavigateUrl='<%#"~/ShowProduct.aspx?Code=" +DataBinder.Eval(Container.DataItem, "ProductCode") %>'><%#FormatText(DataBinder.Eval(Container.DataItem, "Title"))%></asp:HyperLink></div>
            <div class="Rial">
                <span>&nbsp;ریال&nbsp;<%#Tools.FormatCurrency2(DataBinder.Eval(Container.DataItem, "Price"))%></span></div>
            <div>
                <AKP:MsgBox runat="server" ID="msgMessage">
                </AKA:MsgBox>
                <asp:ImageButton ID="btnAddToBasket" CommandName="AddToBasket" ProductCode='<%#DataBinder.Eval(Container.DataItem, "ProductCode") %>'
                    ImageUrl="~/images/buy-post.png" ToolTip="خرید پستی" runat="server"></asp:ImageButton></div>
        </ItemTemplate>
    </asp:DataList>
</div>
