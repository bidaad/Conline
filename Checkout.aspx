<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Master1Col.Master"
    CodeBehind="Checkout.aspx.cs" Inherits="ConLine.Checkout" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <div class="">
        <div class="">
            <div class="Hierarchy">
                <ul class="mnuHierarchy">
                    <li class="IcHome">
                        <asp:HyperLink ID="hplMainPage" NavigateUrl="~/" runat="server">صفحه اصلی</asp:HyperLink>
                    </li>
                    <li class="Sep">&nbsp; </li>
                    <li>
                        <asp:Label ID="Label2" runat="server" Text="سفارش"></asp:Label>
                    </li>
                    <li class="Sep">&nbsp; </li>
                    <li>
                        <asp:Label ID="Label1" runat="server" Text="نتیجه تراکنش"></asp:Label>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
            <div class="Marginer1">
                <AKP:MsgBox runat="server" ID="msgMessage">
                </AKP:MsgBox>
            </div>
            <div>
                <table class="tblOrderInfo">
                    <tr>
                        <td>
                            <div class="GrayBoxCont">
                                <div class="GrayHeader">
                                    اطلاعات ارسالی سفارش
                                </div>
                                <div class="Row">
                                    <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label>
                                    تحویل گیرنده:
                                </div>
                                <div class="Row Address">
                                    <asp:Literal ID="lblAddress" runat="server" Text=""></asp:Literal>
                                </div>
                                <div class="LastRow">
                                    <asp:Label ID="lblSendType" runat="server" Text=""></asp:Label>
                                    شیوه ارسال
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="GrayBoxCont">
                                <div class="GrayHeader">
                                    خلاصه وضعیت سفارش
                                </div>
                                <div class="Row">
                                    <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
                                    شماره سفارش :
                                </div>
                                <div class="Row">
                                    <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label>
                                    مبلغ کل:
                                </div>
                                <div class="Row">
                                    <asp:Label ID="lblPaymentStatus" runat="server" Text=""></asp:Label>
                                    وضعیت پرداخت:
                                </div>
                                <div class="LastRow">
                                    <asp:Label ID="lblOrderStatus" runat="server" Text=""></asp:Label>
                                    وضعیت سفارش:
                                </div>
                            </div>
                        </td>
                        <td>
                            <asp:Panel ID="mainMessage" runat="server" class="msg">
                                <div class="LargeGreen">
                                    از خرید شما سپاسگزاریم!
                                </div>
                                <div class="Farsi Padder10">
                                    با توجه به روش ارسال انتخاب شده برای این سفارش، قبل از ارسال کالا می‌توانید پرداخت
                                    سفارش خود را تکمیل نمایید. توجه کنید که تا 48 ساعت سفارش شما منتظر پرداخت خواهد
                                    بود و پس از آن بطور خودکار از فرآیند خرید خارج می‌گردد.
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="Clear">
            </div>
            <br />
        </div>
    </div>
    <div class="Clear">
    </div>
</asp:Content>
