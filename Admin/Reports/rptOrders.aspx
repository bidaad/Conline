<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Admin/Main.master" Title="گزارشات سفارشها"
    CodeBehind="rptOrders.aspx.cs" Inherits="ConLine.Admin.Reports.rptOrders" %>

<%@ Register Src="~/UserControls/PagerToolbar.ascx" TagName="PagerToolbar" TagPrefix="Tlb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="Padder1">
        <div>
            <AKP:MsgBox runat="server" ID="msgBox">
            </AKA:MsgBox>
        </div>
        <div>
            <table class="tblOrderReportFilters">
                <tr>
                    <td>
                        <AKP:ExTextBox runat="server" ID="txtBuyer"></AKA:ExTextBox>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label2" runat="server" Text="خریدار:"></asp:Label>
                    </td>
                    <td>
                        <AKP:Combo runat="server" ID="cboHCOrderStatusCode">
                        </AKA:Combo>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label1" runat="server" Text="وضعیت سفارش:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <AKP:ExTextBox runat="server" ID="txtPostOrderCode"></AKA:ExTextBox>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label19" runat="server" Text="کد رهگیری پست:"></asp:Label>
                    </td>
                    <td>
                        <AKP:ExTextBox runat="server" ID="txtPayeganOrderCode"></AKA:ExTextBox>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label20" runat="server" Text="شناسه پایگان :"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlToYear" runat="server">
                                        <asp:ListItem Text="1390">1390</asp:ListItem>
                                        <asp:ListItem Text="1391">1391</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlToMonth" runat="server">
                                        <asp:ListItem Text="1">1</asp:ListItem>
                                        <asp:ListItem Text="2">2</asp:ListItem>
                                        <asp:ListItem Text="3">3</asp:ListItem>
                                        <asp:ListItem Text="4">4</asp:ListItem>
                                        <asp:ListItem Text="5">5</asp:ListItem>
                                        <asp:ListItem Text="6">6</asp:ListItem>
                                        <asp:ListItem Text="7">7</asp:ListItem>
                                        <asp:ListItem Text="8">8</asp:ListItem>
                                        <asp:ListItem Text="9">9</asp:ListItem>
                                        <asp:ListItem Text="10">10</asp:ListItem>
                                        <asp:ListItem Text="11">11</asp:ListItem>
                                        <asp:ListItem Text="12">12</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlToDay" runat="server">
                                        <asp:ListItem Text="1">1</asp:ListItem>
                                        <asp:ListItem Text="2">2</asp:ListItem>
                                        <asp:ListItem Text="3">3</asp:ListItem>
                                        <asp:ListItem Text="4">4</asp:ListItem>
                                        <asp:ListItem Text="5">5</asp:ListItem>
                                        <asp:ListItem Text="6">6</asp:ListItem>
                                        <asp:ListItem Text="7">7</asp:ListItem>
                                        <asp:ListItem Text="8">8</asp:ListItem>
                                        <asp:ListItem Text="9">9</asp:ListItem>
                                        <asp:ListItem Text="10">10</asp:ListItem>
                                        <asp:ListItem Text="11">11</asp:ListItem>
                                        <asp:ListItem Text="12">12</asp:ListItem>
                                        <asp:ListItem Text="13">13</asp:ListItem>
                                        <asp:ListItem Text="14">14</asp:ListItem>
                                        <asp:ListItem Text="15">15</asp:ListItem>
                                        <asp:ListItem Text="16">16</asp:ListItem>
                                        <asp:ListItem Text="17">17</asp:ListItem>
                                        <asp:ListItem Text="18">18</asp:ListItem>
                                        <asp:ListItem Text="19">19</asp:ListItem>
                                        <asp:ListItem Text="20">20</asp:ListItem>
                                        <asp:ListItem Text="21">21</asp:ListItem>
                                        <asp:ListItem Text="22">22</asp:ListItem>
                                        <asp:ListItem Text="23">23</asp:ListItem>
                                        <asp:ListItem Text="24">24</asp:ListItem>
                                        <asp:ListItem Text="25">25</asp:ListItem>
                                        <asp:ListItem Text="26">26</asp:ListItem>
                                        <asp:ListItem Text="27">27</asp:ListItem>
                                        <asp:ListItem Text="28">28</asp:ListItem>
                                        <asp:ListItem Text="29">29</asp:ListItem>
                                        <asp:ListItem Text="30">30</asp:ListItem>
                                        <asp:ListItem Text="31">31</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label3" runat="server" Text="تا تاریخ:"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlFromYear" runat="server">
                                        <asp:ListItem Text="1390">1390</asp:ListItem>
                                        <asp:ListItem Text="1391">1391</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlFromMonth" runat="server">
                                        <asp:ListItem Text="1">1</asp:ListItem>
                                        <asp:ListItem Text="2">2</asp:ListItem>
                                        <asp:ListItem Text="3">3</asp:ListItem>
                                        <asp:ListItem Text="4">4</asp:ListItem>
                                        <asp:ListItem Text="5">5</asp:ListItem>
                                        <asp:ListItem Text="6">6</asp:ListItem>
                                        <asp:ListItem Text="7">7</asp:ListItem>
                                        <asp:ListItem Text="8">8</asp:ListItem>
                                        <asp:ListItem Text="9">9</asp:ListItem>
                                        <asp:ListItem Text="10">10</asp:ListItem>
                                        <asp:ListItem Text="11">11</asp:ListItem>
                                        <asp:ListItem Text="12">12</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlFromDay" runat="server">
                                        <asp:ListItem Text="1">1</asp:ListItem>
                                        <asp:ListItem Text="2">2</asp:ListItem>
                                        <asp:ListItem Text="3">3</asp:ListItem>
                                        <asp:ListItem Text="4">4</asp:ListItem>
                                        <asp:ListItem Text="5">5</asp:ListItem>
                                        <asp:ListItem Text="6">6</asp:ListItem>
                                        <asp:ListItem Text="7">7</asp:ListItem>
                                        <asp:ListItem Text="8">8</asp:ListItem>
                                        <asp:ListItem Text="9">9</asp:ListItem>
                                        <asp:ListItem Text="10">10</asp:ListItem>
                                        <asp:ListItem Text="11">11</asp:ListItem>
                                        <asp:ListItem Text="12">12</asp:ListItem>
                                        <asp:ListItem Text="13">13</asp:ListItem>
                                        <asp:ListItem Text="14">14</asp:ListItem>
                                        <asp:ListItem Text="15">15</asp:ListItem>
                                        <asp:ListItem Text="16">16</asp:ListItem>
                                        <asp:ListItem Text="17">17</asp:ListItem>
                                        <asp:ListItem Text="18">18</asp:ListItem>
                                        <asp:ListItem Text="19">19</asp:ListItem>
                                        <asp:ListItem Text="20">20</asp:ListItem>
                                        <asp:ListItem Text="21">21</asp:ListItem>
                                        <asp:ListItem Text="22">22</asp:ListItem>
                                        <asp:ListItem Text="23">23</asp:ListItem>
                                        <asp:ListItem Text="24">24</asp:ListItem>
                                        <asp:ListItem Text="25">25</asp:ListItem>
                                        <asp:ListItem Text="26">26</asp:ListItem>
                                        <asp:ListItem Text="27">27</asp:ListItem>
                                        <asp:ListItem Text="28">28</asp:ListItem>
                                        <asp:ListItem Text="29">29</asp:ListItem>
                                        <asp:ListItem Text="30">30</asp:ListItem>
                                        <asp:ListItem Text="31">31</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label4" runat="server" Text="از تاریخ:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td class="ctrl">
                    </td>
                    <td>
                        <AKP:Combo runat="server" AllowNull="false" ID="cboShopCode">
                            <asp:ListItem Text="ایران کیدز" Value="1"></asp:ListItem>
                            <asp:ListItem Text="کانلاین" Value="2"></asp:ListItem>
                        </AKA:Combo>
                    </td>
                    <td class="ctrl">
                        <asp:Label ID="Label6" runat="server" Text="فروشگاه :"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnSearch" runat="server" Text="جستجو" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Repeater ID="repeaterOrders" EnableViewState="false" runat="server">
                <ItemTemplate>
                    <div class="OrderBox">
                        <div class="OrderHeader">
                            <table class="tblOrderHeader">
                                <tr>
                                    <td class="val">
                                        <%#Eval("PayeganOrderCode")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label5" runat="server" Text="شناسه:"></asp:Label>
                                    </td>
                                    <td class="val">
                                        <%#Eval("PostOrderCode")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label7" runat="server" Text="کد رهگیری:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("CreateDate")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label8" runat="server" Text="تاریخ سفارش:"></asp:Label>
                                    </td>
                                    <td class="val">
                                        <%#Eval("CreateDate")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label9" runat="server" Text="ساعت سفارش:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("SendType")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label10" runat="server" Text="نحوه ارسال:"></asp:Label>
                                    </td>
                                    <td class="val">
                                        <%#Eval("OrderStatus")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label11" runat="server" Text="وضعیت:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("ShopName")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label12" runat="server" Text="فروشگاه:"></asp:Label>
                                    </td>
                                    <td class="val">
                                    </td>
                                    <td class="lbl">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="OrderBuyer">
                            <table class="tblOrderBuyer">
                                <tr>
                                    <td class="val">
                                        <%#Eval("FirstName")%>&nbsp;<%#Eval("LastName")%></td>
                                    <td class="lbl">
                                        <asp:Label ID="Label13" runat="server" Text="نام و نام خانوادگی:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("JobTel")%>&nbsp;<%#Eval("HomeTel")%>&nbsp;<%#Eval("CellPhone")%></td>
                                    <td class="lbl">
                                        <asp:Label ID="Label14" runat="server" Text="تلفن:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("PostalCode")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label15" runat="server" Text="کد پستی:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("Email")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label16" runat="server" Text="ایمیل:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("Address")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label17" runat="server" Text="آدرس :"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="val">
                                        <%#Eval("Description")%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label18" runat="server" Text="توضيحات :"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="OrderProducts">
                            <table class="tblOrderBuyer">
                                <tr>
                                    <td class="val">
                                        <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl=<%#"~/Admin/Orders/EditOrders.aspx?Code=" + Eval("Code") %> runat="server">ویرایش سفارش</asp:HyperLink>
                                    </td>
                                    <td class="val">
                                        <%#Tools.FormatCurrency2( Eval("TotalOrderCost"))%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label23" runat="server" Text="مبلغ کل:"></asp:Label>
                                    </td>
                                    <td class="val">
                                        <%#Tools.FormatCurrency2(Eval("SendPrice"))%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label22" runat="server" Text="هزینه ارسال:"></asp:Label>
                                    </td>
                                    <td class="val">
                                        <%#Tools.FormatCurrency2(Eval("TotalPrice"))%>
                                    </td>
                                    <td class="lbl">
                                        <asp:Label ID="Label21" runat="server" Text="مبلغ کالا:"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div>
            <Tlb:PagerToolbar runat="server" ID="pgrToolbar" />
        </div>
    </div>
</asp:Content>
