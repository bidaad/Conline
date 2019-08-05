<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="PayOrder.aspx.cs" MasterPageFile="~/Master1Col.Master" Inherits="ConLine.PayOrder" %>

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
                        <asp:Label ID="Label1" runat="server" Text="شیوه پرداخت"></asp:Label>
                    </li>
                </ul>
            </div>
            <div class="clear">
            </div>
            <div class="Marginer1">
                <AKP:MsgBox runat="server" ID="msgMessage">
                </AKP:MsgBox>
            </div>
            <div class="GreenBoxCont">
                <table class="tblGreenBox">
                    <tr>
                        <td class="TDText">
                            مبلغ قابل پرداخت:
                        </td>
                        <td class="TDCurrencyVal">
                            <asp:Label ID="lblTotalOrderPrice" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="CurrencyLabel">
                            تومان
                        </td>
                    </tr>
                </table>
                <div class="Clear">
                </div>
            </div>
            <div style="height: 10px;">
            </div>
            <div class="GreenBoxCont">
                <table class="tblGreenBox">
                    <tr>
                        <td class="TDText">
                            کوپن تخفیف:
                        </td>
                        <td class="TDCurrencyVal">
                            <AKP:ExTextBox runat="server" CssClass="form-control" ID="txtCoupon" />
                        </td>
                        <td>
                            <asp:Button runat="server" CssClass="btn btn-default" ID="btnCoupon" Text="وارد کردن کوپن"
                                OnClick="btnCoupon_Click" />
                        </td>
                    </tr>
                </table>
                <div class="Clear">
                </div>
                <asp:Panel ID="pnlUserCoupons" runat="server" CssClass="Marginer20">
                    <asp:Repeater ID="rptUserCoupons" OnItemCommand="HandleRepeaterCommand" runat="server">
                        <HeaderTemplate>
                            <table class="tblThem1">
                                <tr>
                                    <th>
                                    </th>
                                    <th class="text-center">
                                        تاریخ انقضا
                                    </th>
                                    <th class="text-center">
                                        کوپن
                                    </th>
                                    <th class="text-center">
                                        نوع
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="Them1Cell text-center">
                                    <asp:Button ID="btnApplyCoupon" CommandName="ApplyCoupon" CssClass="btn btn-info" Text="اعمال کوپن" runat="server" />
                                </td>
                                <td class="Them1Cell text-center">
                                    <%#Eval("EDate")%>
                                </td>
                                <td class="Them1Cell text-center">
                                    <asp:Label ID="lblCoupon" runat="server" Text=<%#Eval("ID")%>></asp:Label>
                                    
                                </td>
                                <td class="Them1Cell text-center">
                                    <%#Eval("CouponType")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="Clear">
                    </div>
                </asp:Panel>
            </div>
            <div class="header">
                <h2>
                    شیوه پرداخت
                </h2>
            </div>
            <div class="GrayBoxCont">
                <table class="tblPayMethods">
                    <tr>
                        <td class="TDRadio">
                            <asp:RadioButton ID="rbPayOnline" Checked="true" GroupName="PaymentMethod" runat="server" />
                        </td>
                        <td class="TDText">
                            <div class="boldtext">
                                پرداخت اینترنتی
                            </div>
                            <div class="Desc">
                                انتخاب درگاه پرداخت : ( پرداخت از طریق کلیه کارت های عضو شتاب )
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <%--<div class="GrayBoxCont">
                <table class="tblPayMethods">
                    <tr>
                        <td class="TDRadio">
                            <asp:RadioButton ID="rbPayInPlace" GroupName="PaymentMethod" runat="server" />
                        </td>
                        <td class="TDText">
                            <div class="boldtext">
                                پرداخت در محل</div>
                            <div class="Desc">
                                در حال حاضر مشتریانی که سفارش آن ها از طریق تحویل اکسپرس ارسال می شود، می توانند
                                وجه سفارش خود را بصورت نقدی یا با استفاده از کارت بانکی خود در محل دریافت پرداخت
                                نماید.
                            </div>
                        </td>
                    </tr>
                </table>
            </div>--%>
            <div>
                <asp:Panel runat="server" ID="pnlPayTools">
                    <div class="Marginer1">
                        <div class="OrderForm" style="text-align: right;">
                            <div style="text-align: left; padding-left: 15px;">
                                <asp:ImageButton ID="btnPay" ImageUrl="~/images/spacer.gif" OnClientClick="Hide(this)"
                                    CssClass="PayOrder" Text="تایید اطلاعات و ثبت سفارش" runat="server" OnClick="btnPay_Click">
                                </asp:ImageButton>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="Clear">
            </div>
            <br />
        </div>
    </div>
    <div class="Clear">
    </div>
</asp:Content>
