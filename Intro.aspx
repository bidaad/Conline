<%@ Page Language="C#" MasterPageFile="~/MainRoot.Master" AutoEventWireup="True" CodeBehind="Intro.aspx.cs" Inherits="ConLine.Intro" %>
<%@ Register Src="~/UserControls/UCProductList.ascx" TagName="UCProductList" TagPrefix="UC" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <div><UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListMostSold" /></div>
    <div>
        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListNew" />
    </div>
    <div>
        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListDiscount" />
    </div>
    <div>
        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListSepcial" />
    </div>

</asp:Content>