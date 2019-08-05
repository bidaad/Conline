<%@ Page Language="C#" AutoEventWireup="True" Title="کانلاین :: پنل کاربری" MasterPageFile="~/Master1Col.Master"
    CodeBehind="Default.aspx.cs" Inherits="ConLine.UsersFolder.Default" %>

<%@ Register Src="~/UserControls/UCOrderProducts.ascx" TagName="UCOrderProducts" TagPrefix="UC" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <script>
    $(document).ready(function () {
        <%=ActivateTab %>
    });
    function activaTab(tab) {
        $('.nav-tabs a[href="#' + tab + '"]').tab('show');
    };
    </script>
    <div id="profile" class="Page">
        <div class="">
            <div class="Hierarchy">
                <ul class="mnuHierarchy">
                    <li class="IcHome">
                        <asp:HyperLink ID="hplMainPage" NavigateUrl="~/" runat="server">صفحه اصلی</asp:HyperLink>
                    </li>
                    <li class="Sep">&nbsp; </li>
                    <li>
                        <asp:Label ID="Label1" runat="server" Text="صفحه کاربر"></asp:Label>
                    </li>
                </ul>
            </div>
            <div class="Clear">
            </div>
            <div class="Marginer1">
                <AKP:MsgBox runat="server" ID="msgMessage">
                </AKP:MsgBox>
            </div>
            <div id="tabs" class="UserTabCont">
                <ul class="nav nav-tabs" style="margin-top: 20px;" id="myTab">
                    <li class="active">
                        <asp:HyperLink runat="server" ID="hplProfile" NavigateUrl="#tab0" data-toggle="tab">پروفایل</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="hplOrders" NavigateUrl="#tab1" data-toggle="tab">سفارشات من</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="hplComments" NavigateUrl="#tab2" data-toggle="tab">نظرات من</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="hplFavorites" NavigateUrl="#tab3" data-toggle="tab">لیست مورد علاقه</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="hplCharge" NavigateUrl="#tab4" data-toggle="tab">شارژ حساب</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="hplMyTrans" NavigateUrl="#tab5" data-toggle="tab">تراکنشهای من</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="#tab6" data-toggle="tab">کوپن های تخفیف</asp:HyperLink></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab0">
                        <div class="LTR">
                            <div class="RegformCont">
                                <div class="form-group RegField">
                                    <asp:DropDownList ID="cboGenderCode" DataTextField="Name" DataValueField="Code" CssClass="form-control col-sm-9 col-md-9 col-xs-9"
                                        runat="server">
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <div class="form-group RegField">
                                    <asp:TextBox runat="server" ID="txtFirstName" placeholder="نام" CssClass="form-control" />
                                </div>
                                <div class="form-group RegField">
                                    <asp:TextBox ID="txtLastName" runat="server" placeholder="نام خانوادگی" CssClass="form-control" />
                                </div>
                                <div class="form-group RegField">
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="ایمیل" CssClass="form-control LTR" />
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="cReq"
                                        ValidationGroup="ValidateRegister" Display="Dynamic" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ControlToValidate="txtEmail" ErrorMessage="ایمیل معتبر نیست"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group RegField">
                                    <asp:TextBox ID="txtPassword" runat="server" SkinID="English" TextMode="Password"
                                        placeholder="کلمه عبور" CssClass="form-control LTR" />
                                </div>
                                <div class="form-group RegField Relative">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" SkinID="English" TextMode="Password"
                                        placeholder="تکرار کلمه عبور" CssClass="form-control LTR" />
                                    <span onmouseup="hidePass($(this))" onmousedown="showPass($(this))" class="viewpass">
                                        <img src="../images/viewpassword.png"></span>
                                </div>
                                <div style="margin-right: 200px;">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" ValidationGroup="ValidateRegister"
                                        runat="server" Text="ثبت تغییرات" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab1">
                        <div class="OrderList">
                            <asp:Repeater ID="rptMyOrders" runat="server" OnItemDataBound="rptMyOrders_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table table-striped">
                                        <tr class="warning">
                                            <th>
                                                ردیف
                                            </th>
                                            <th>
                                                کد
                                            </th>
                                            <th>
                                                تاریخ
                                            </th>
                                            <th>
                                                مبلغ
                                            </th>
                                            <th>
                                                وضعیت
                                            </th>
                                            <th>
                                                عملیات پرداخت
                                            </th>
                                            <th>
                                                جزئیات
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#OrderCounter %>
                                        </td>
                                        <td>
                                            <asp:HyperLink NavigateUrl='<%#"~/Checkout.aspx?ID=" + Eval("ID") %>' runat="server">
                                        <span><%#Eval("ID") %></span>&nbsp;</span>&nbsp;
                                            </asp:HyperLink>
                                        </td>
                                        <td>
                                            <span>
                                                <%#Eval("CDate") %>
                                        </td>
                                        <td>
                                            <span>
                                                <%#Eval("TotalOrderCost") %>
                                        </td>
                                        <td>
                                            <span>
                                                <%#Eval("OrderStatus") %>
                                        </td>
                                        <td>
                                            <asp:HyperLink ID="hplPayOrder" Enabled='<%#IsPayOrderDisabled(Eval("HCTransStatusCode"))%>'
                                                NavigateUrl='<%#"~/Payment.aspx?OrderID=" + Eval("ID") %>' runat="server">
                                                <asp:Image ID="imgPay" CssClass='<%#PayDisbaled(Eval("HCTransStatusCode"))%>' ImageUrl="~/images/Payment.png"
                                                    runat="server" />
                                            </asp:HyperLink>
                                        </td>
                                        <td>
                                            <img alt="جزئیات سفارش" class="cursorHand" onclick='$("#PanelOrderPros<%#Eval("Code") %>").slideToggle();' src="/images/orderdetailsopen.png"  />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <div id="PanelOrderPros<%#Eval("Code") %>" class="OrderProducts NoDisp">
                                                <UC:UCOrderProducts runat="server" OrderCode=<%#Eval("Code") %> />
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <div >
                            <asp:Repeater ID="rptComments" runat="server">
                                <ItemTemplate>
                                    <div>
                                        <asp:HyperLink NavigateUrl='<%#"~/Products/" + Eval("ProductCode") + ".htm#" + Eval("Code")%>'
                                            runat="server">
                                        <span><%#Eval("Comment") %></span>&nbsp;<span><%#Eval("CDate") %></span>&nbsp;
                                        </asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab3">
                        <table class="table table-striped">
                            <asp:Repeater ID="rptFavorites" OnItemCommand="HandleRepeaterCommand" runat="server"
                                OnItemDataBound="rptFavorites_ItemDataBound">
                                <HeaderTemplate>
                                    <tr class="warning">
                                        <th>
                                            ردیف
                                        </th>
                                        <th>
                                            عنوان
                                        </th>
                                        <th>
                                            حذف
                                        </th>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#FavCounter %>
                                        </td>
                                        <td>
                                            <span>
                                                <%#Eval("FaTitle") %></span>
                                        </td>
                                        <td>
                                            <asp:ImageButton runat="server" Code='<%#Eval ("Code") %>' ID="btnRemove" CommandName="RemoveFromFavorites"
                                                ToolTip="حذف از لیست" ImageUrl="~/images/Remove-icon.png" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <div class="tab-pane" id="tab4">
                        <div>
                            موجودي:
                            <asp:Label ID="lblAccountBalance" runat="server"></asp:Label>
                        </div>
                        <div>
                            <table class="tblCharge">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnUpdateAccount" CssClass="btn btn-primary" OnClientClick="HideButton(this);"
                                            runat="server" Text="افزايش اعتبار" OnClick="btnUpdateAccount_Click" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label211" runat="server" Text="ريال"></asp:Label>
                                    </td>
                                    <td>
                                        <AKP:NumericTextBox ID="txtAmount" runat="server"></AKP:NumericTextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="مبلغ شارژ"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab5">
                        <div>
                            <asp:Repeater ID="rptTransList" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped">
                                        <tr class="warning">
                                            <th>
                                                وضعیت
                                            </th>
                                            <th>
                                                مبلغ
                                            </th>
                                            <th>
                                                تاریخ
                                            </th>
                                            <th>
                                                نوع
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="<%#ShowClass(Eval("Amount")) %>">
                                        <td>
                                            <%#Eval("TransStatus")%>
                                        </td>
                                        <td>
                                            <%#ShowAmount(Eval("Amount")) %>
                                        </td>
                                        <td>
                                            <%#Tools.ChangeEnc(Eval("ChrgDate"))%>
                                        </td>
                                        <td>
                                            <%#ShowPayDirection(Eval("Amount")) %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="<%#ShowClass(Eval("Amount")) %>">
                                        <td>
                                            <%#Eval("TransStatus")%>
                                        </td>
                                        <td>
                                            <%#ShowAmount(Eval("Amount")) %>
                                        </td>
                                        <td>
                                            <%#Tools.ChangeEnc(Eval("ChrgDate"))%>
                                        </td>
                                        <td>
                                            <%#ShowPayDirection(Eval("Amount")) %>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab6">
                        <div>
                            <table class="tblCharge">
                                <tr>
                                    <td>
                                        <asp:Button ID="Button1" CssClass="btn btn-primary" OnClientClick="HideButton(this);"
                                            runat="server" Text="ارسال" OnClick="btnAddCoupon_Click" />
                                    </td>
                                    <td>
                                        <AKP:ExTextBox ID="txtCouponID" runat="server"></AKP:ExTextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="شماره کوپن"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <asp:Repeater ID="rptUserCoupons" runat="server">
                                <HeaderTemplate>
                                    <table class="tblThem1">
                                        <tr>
                                            <th>
                                            </th>
                                            <th>
                                                تاریخ انقضا
                                            </th>
                                            <th>
                                                کوپن
                                            </th>
                                            <th>
                                                نوع
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="Them1Cell">
                                        </td>
                                        <td class="Them1Cell">
                                            <%#Eval("EDate")%>
                                        </td>
                                        <td class="Them1Cell">
                                            <%#Eval("ID")%>
                                        </td>
                                        <td class="Them1Cell">
                                            <%#Eval("CouponType")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Clear">
            </div>
            <br />
            <br />
        </div>
        <div class="Clear">
        </div>
    </div>
    <div class="Clear">
    </div>
</asp:Content>
