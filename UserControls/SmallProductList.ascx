<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SmallProductList.ascx.cs"
    Inherits="ConLine.UserControls.SmallProductList" %>
<%@ Register Src="~/UserControls/PagerToolbar.ascx" TagName="PagerToolbar" TagPrefix="Tlb" %>
<div class="cSpacer">
</div>
<div class="Padder1">
    <div class="ProductListHeader">
        <asp:Label ID="lblListHeader" runat="server"></asp:Label>
    </div>
    <div style="margin-bottom: 8px;">
        <AKP:MsgBox runat="server" ID="msgBox">
        </AKA:MsgBox>
    </div>
    <asp:Repeater ID="rptProducts" runat="server">
        <HeaderTemplate>
            <table class="tblSmallPros">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="cTitle" ToolTip='<%#DataBinder.Eval(Container.DataItem, "Title") %>'
                        Target="_blank" NavigateUrl='<%#"~/ShowProduct.aspx?Code=" +DataBinder.Eval(Container.DataItem, "ProductCode")+ "&Ref=" + RefID %> '><%#FormatText(DataBinder.Eval(Container.DataItem, "Title"))%></asp:HyperLink>
                </td>
                <td>
                    <%#ShowPic(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "SmallPicFile"))%>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
</div>
<p>
    &nbsp;<Tlb:PagerToolbar runat="server" ID="pgrToolbar" />
