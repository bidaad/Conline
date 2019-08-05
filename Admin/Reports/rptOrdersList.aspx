<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Main.master"
    CodeBehind="rptOrdersList.aspx.cs" Inherits="ConLine.Admin.Reports.rptOrdersList"
    Title="گزارشات مالی" %>

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
            <table class="tblOrderRepList">
                <tr>
                    <th>
                        <asp:Label ID="Label23" runat="server" Text="مبلغ کل"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label5" runat="server" Text="متفرقه"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label22" runat="server" Text="هزینه ارسال"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="درصد پایگان"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label21" runat="server" Text="مبلغ کالا"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label7" runat="server" Text="مبلغ خرید کالا"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="Label8" runat="server" Text="تاریخ"></asp:Label>
                    </th>
                </tr>
                <asp:Repeater ID="repeaterOrders" EnableViewState="false" runat="server" 
                    onitemdatabound="repeaterOrders_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td class="TendCell">
                                <asp:Label ID="lblTotalOrderCost" runat="server" Val=<%# Eval("TotalOrderCost") %> Text=<%#Tools.FormatCurrency2( Eval("TotalOrderCost"))%>></asp:Label>
                            </td>
                            <td class="TendCell">
                                <asp:Label ID="lblOtherCosts" runat="server" Val=<%# Eval("OtherCosts") %> Text=<%#Tools.FormatCurrency2( Eval("OtherCosts"))%>></asp:Label>
                                
                            </td>
                            <td class="TendCell">
                                <asp:Label ID="lblSendPrice" runat="server" Val=<%#Eval("SendPrice") %> Text=<%#Tools.FormatCurrency2(Eval("SendPrice"))%>></asp:Label>
                                
                            </td>
                            <td class="TendCell">
                                <asp:Label ID="lblPayeganPercent" runat="server" Val=<%#Eval("TotalPrice") %> Text=<%#Tools.FormatCurrency2(0.03 * Convert.ToInt32(Eval("TotalPrice")))%>></asp:Label>
                                
                            </td>
                            <td class="TendCell">
                                <asp:Label ID="lblTotalPrice" runat="server" Val=<%#Eval("TotalPrice") %> Text=<%#Tools.FormatCurrency2(Eval("TotalPrice"))%>></asp:Label>
                                
                            </td>
                            <td class="TendCell">
                                <asp:Label ID="lblBuyCost" runat="server" Val=<%#Eval("BuyCost") %> Text=<%#Tools.FormatCurrency2(Eval("BuyCost"))%>></asp:Label>
                                
                            </td>
                            <td class="TendCell">
                                <%#ShowDate( Eval("CreateDate") )%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td class="SumRow">
                        <asp:Label ID="lblTotalOrderCost" runat="server" ></asp:Label>
                    </td>
                    <td class="SumRow">
                        <asp:Label ID="lblOtherCosts" runat="server" ></asp:Label>
                    </td>
                    <td class="SumRow">
                        <asp:Label ID="lblSendPrice" runat="server" ></asp:Label>
                    </td>
                    <td class="SumRow">
                        <asp:Label ID="lblTotalPayeganPercent" runat="server" ></asp:Label>
                    </td>
                    <td class="SumRow">
                        <asp:Label ID="lblTotalPrice" runat="server" ></asp:Label>
                    </td>
                    <td class="SumRow">
                        <asp:Label ID="lblBuyCost" runat="server" ></asp:Label>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div>
            <Tlb:PagerToolbar runat="server" ID="pgrToolbar" />
        </div>
    </div>
</asp:Content>
