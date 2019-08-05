<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="UserControls_PersianCalendar" Codebehind="PersianCalendar.ascx.cs" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
<div class="FarsiAll" style="text-align: center;">
    <div class="cDateHeader">
        <table style="width: 100%; direction: ltr;">
            <tr>
                <td>
                    <asp:ImageButton ID="btnPreYear" ImageUrl="~/images/CalFirst.gif" runat="server"
                        OnClick="btnPreYear_Click" />
                </td>
                <td>
                    <asp:ImageButton ID="btnPreMonth" ImageUrl="~/images/CalPrevious.gif" runat="server"
                        OnClick="btnPreMonth_Click" />
                </td>
                <td style="width: 150px; text-align: center;">
                    <asp:Label ID="lblHeader" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:ImageButton ID="btnNextMonth" ImageUrl="~/images/CalNext.gif" runat="server"
                        OnClick="btnNextMonth_Click" />
                </td>
                <td>
                    <asp:ImageButton ID="btnNextYear" ImageUrl="~/images/CalLast.gif" runat="server"
                        OnClick="btnNextYear_Click" Style="width: 14px" />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:DataList runat="server" EnableViewState="false" CssClass="ctblDate" ID="dtlDays"
            RepeatColumns="7" RepeatDirection="Horizontal">
            <HeaderTemplate>
                <table class="ctblDateHeader">
                    <tr>
                        <th>
                            ش
                        </th>
                        <th>
                            ی
                        </th>
                        <th>
                            د
                        </th>
                        <th>
                            س
                        </th>
                        <th>
                            چ
                        </th>
                        <th>
                            پ
                        </th>
                        <th>
                            ج
                        </th>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <%#ShowDay(DataBinder.Eval(Container.DataItem, "Day"))%>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
</ContentTemplate>
</asp:UpdatePanel>
