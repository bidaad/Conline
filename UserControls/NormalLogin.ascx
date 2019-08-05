<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NormalLogin.ascx.cs"
    Inherits="IONS.UserControls.NormalLogin" %>
<div class="panel panel-default Marginer20">
    <div class="panel-heading ListTitle">
        <h3 class="panel-title BulletList">
            ورود به حساب کاربری</h3>
    </div>
    <div class="Padder5 text-center">
        <AKP:MsgBox runat="server" ID="msgMessage">
        </AKP:MsgBox>
        <div class="RegformCont">
            <div class="form-group RegField">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="ایمیل" CssClass="form-control LTR" />
            </div>
            <div class="form-group RegField">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="کلمه عبور"
                    CssClass="form-control LTR" />
                <span onmouseup="hidePass($(this))" onmousedown="showPass($(this))" class="viewpass">
                    <img alt="مشاهده کلمه عبور" src="../images/viewpassword.png"></span>
            </div>
            <div style="margin-right: 0px; margin-top: 5px;">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary container" runat="server" Text="ورود"
                    OnClick="btnSubmit_Click" />
            </div>
            <div class="form-group RegField ">
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Users/ForgotPassword.aspx" runat="server">کلمه عبور را فراموش کرده ام</asp:HyperLink>
            </div>
            <div class="Clear">
            </div>
            <div style="margin-right: 0px; margin-top: 5px;">
                <asp:Button ID="btnReg" CssClass="btn btn-info container" runat="server" Text="عضویت"
                    OnClick="btnReg_Click" />
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</div>
