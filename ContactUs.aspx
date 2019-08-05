<%@ Page Language="C#" AutoEventWireup="True" Title="تماس با کانلاین" MasterPageFile="~/MainRoot.Master"
    CodeBehind="ContactUs.aspx.cs" Inherits="ConLine.ContactUs" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <div id="contact" class="InnerHome">
        <div class="Hierarchy">
            <ul class="mnuHierarchy">
                <li class="IcHome">
                    <asp:HyperLink ID="hplMainPage" NavigateUrl="~/" runat="server">صفحه اصلی</asp:HyperLink>
                </li>
                <li class="Sep">&nbsp; </li>
                <li>
                    <asp:Label ID="Label1" runat="server" Text="تماس با ما"></asp:Label>
                </li>
            </ul>
        </div>
        <div class="InnerPage">
            <div class="title fa RightAlign">
                <ul class="AboutUsItems" >
                    <li><span lang="FA">شنبه تا چهارشنبه ساعت 9 صبح تا 5 بعدازظهر</span><span> </span>
                    </li>
                    <li><span lang="FA">پنجشنبه ساعت 9 صبح تا 14 بعدازظهر</span><span> </span></li>
                    <li><span lang="FA">تلفن : 66476024-021</span><span> </span></li>
                    <li><span lang="FA">ایمیل : </span><a href="mailto:support@bamilo.com"><span>support@ConLine.ir</span></a><span>
                    </span></li>
                </ul>
                <div>
                    <span lang="FA">تهران، خیابان جمهوری، بین فخر رازی و 12 فروردین پاساژ تجارت
                        طبقه دوم اداری واحد 2402</span>
                </div>
                <span lang="FA">فکس : 66476024-021</span></div>
            <div class="Line1">
            </div>
        </div>
    </div>
    <div class="Clear">
    </div>
    <AKP:MsgBox runat="server" ID="msgBox" />
    <div class="panel panel-default Marginer20">
        <div class="panel-heading ListTitle">
            <h3 class="panel-title BulletList">
                تماس با ما</h3>
        </div>
        <div class="Padder5">
            <AKP:MsgBox runat="server" ID="msgMessage">
            </AKP:MsgBox>
            <asp:Panel runat="server" ID="pnlSend" CssClass="RegformCont" Style="margin-right: -3px;">
                <div class="input-group RegField">
                    <asp:TextBox runat="server" ID="txtFullName" Width="300" placeholder="نام" CssClass="form-control" />
                    <span class="input-group-addon">نام و نام خانوادگی: </span>
                </div>
                <div class="input-group RegField">
                    <asp:TextBox ID="txtEmail" runat="server" Width="300" placeholder="ایمیل" CssClass="form-control LTR" />
                    <span class="input-group-addon">ایمیل: </span>
                </div>
                <div class="input-group RegField">
                    <asp:TextBox ID="txtComment" TextMode="MultiLine" Height="200" Width="300" runat="server"
                        placeholder="متن پیام" CssClass="form-control" />
                    <span class="input-group-addon">متن پیام: </span>
                </div>
                <div class="input-group RegField">
                    <div class="form-control">
                        <telerik:RadCaptcha ID="RadCaptcha1" CssClass="Capt" CaptchaImage-ImageCssClass="CaptImg"
                            CaptchaTextBoxCssClass="CaptText" ValidationGroup="ValidateSend" runat="server"
                            ErrorMessage="" CaptchaTextBoxLabel="">
                        </telerik:RadCaptcha>
                    </div>
                    <span class="input-group-addon">کد امنیتی: </span>
                </div>
                <div style="margin-right: 380px;">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" ValidationGroup="ValidateSend"
                        OnClick="btnSend_Click" runat="server" Text="ارسال" />
                </div>
            </asp:Panel>
            <div class="clear">
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
