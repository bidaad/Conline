<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="SiteMapProducts.aspx.cs" Inherits="Parsetv91._1.SiteMapProducts" %><?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">
<asp:Repeater runat="server" ID="rptProducts" EnableViewState="False">
<ItemTemplate>
    <url>
        <loc><%#"http://www.conline.ir/" + Eval("EnTitle") + "-" + Eval("Code") + ".html"%></loc>
        <image:image>
            <image:loc><%#"http://www.conline.ir" + Eval("LargePicFile") %></image:loc> 
        </image:image>
    </url>
</ItemTemplate>
</asp:Repeater>
</urlset>