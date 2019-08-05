<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MostSoldPros.ascx.cs" Inherits="ConLine.UserControls.MostSoldPros" %>
<div class="BlueHeader">
    پرفروش ترین محصولات
</div>
<asp:Repeater ID="rptProducts" EnableViewState="false" runat="server">
        <ItemTemplate>
            <div class="ParsetNewsItem">
                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ToolTip='<%#Eval("Title") %>' NavigateUrl='<%#"~/ShowProduct.aspx?Code=" + Eval("ProductCode") %>'><%#Tools.ShowBriefText( Eval("Title"), 50) %></asp:HyperLink></div>
        </ItemTemplate>
    </asp:Repeater>