<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/MainRoot.Master"
    Title="فروشگاه کانلاین :: ورود اعضا" CodeBehind="Login.aspx.cs" Inherits="ConLine.UsersFolder.Login" %>

<%@ Register Src="~/UserControls/NormalLogin.ascx" TagName="NormalLogin" TagPrefix="UCLogin" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <div class="LoginCont">
        <h1 class="PageTitle text-center">
            <asp:Image ID="Image1" ImageUrl="~/images/login_icon.png" ToolTip="ورود به کانلاین"
                runat="server" />
        </h1>
        <div class="NewsItemCont text-center">
            <UCLogin:NormalLogin runat="server" />
        </div>
        <div class="SendQuestion">
            <AKP:MsgBox runat="server" ID="msg">
            </AKP:MsgBox>
        </div>
    </div>
</asp:Content>
