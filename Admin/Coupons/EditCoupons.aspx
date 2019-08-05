<%@ Page Language="C#" StylesheetTheme="Edit" MasterPageFile="~/Edit.master" AutoEventWireup="true" Inherits="Coupons_EditCoupons" Title="Coupons" Codebehind="EditCoupons.aspx.cs" %>


<asp:Content runat="server" ID="content1" ContentPlaceHolderID="cphMain">
 <div style="text-align: center">
        <div style="width: 910;">
            <table class="cTblEdit" bordercolor="#697077" border="1" align="center" cellpadding="0"
                cellspacing="0">
                <tr>
                    <th>
                        <div style="width: 880px;">
                            <div style="width: 180px; float: left;">
                                <table align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="imgBtnReport" runat="server" 
                                                ImageUrl="~/images/Report.gif" ToolTip="گزارش" />
                                        </td>
                                        <td class="cSepVer">
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnSearch" runat="server" 
                                                ImageUrl="~/images/Search.gif" ToolTip="جستجو" />
                                        </td>
                                        <td class="cSepVer">
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnOpenFol" runat="server" ImageUrl="~/images/OpenFol.gif" ToolTip="" />
                                        </td>
                                        <td class="cSepVer">
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Help.gif" 
                                                ToolTip="راهنما" />
                                        </td>
                                        <td class="cSepVer">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="width: 700px; float: right; text-align: right; color: White;">
                                <asp:Label runat="server" ID="lblSysName"></asp:Label></div>
                        </div>
                    </th>
                </tr>
                <tr>
                    <td class="cTDEdit">
                        <table cellpadding="2" cellspacing="0" width="100%">
                            <tr>
                                <td class="cEditLeft" valign="top">
                                    <RE:RelatedEntities ID="RelatedEntities1" runat="server" />
                                </td>
                                <td class="cEditRight">
                                    <table class="cEditMain" width="100%">
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <div class="cHeaderEditMain">
                                                    <table align="left" width="150" dir="ltr">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton ID="imgBtnDelete" runat="server" ImageUrl="~/images/Delete.gif"
                                                                    ToolTip="حذف" />
                                                            </td>
                                                            <td class="cSepVer">
                                                            </td>
                                                            <td>
                                                                <asp:HyperLink ID="hplView" runat="server" onclick="GoToPage()" ImageUrl="~/images/View.gif" ToolTip="حالت نمایش" />
                                                            </td>
                                                            <td class="cSepVer">
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="imgBtnPrint" runat="server" ImageUrl="~/images/Print.gif" ToolTip="چاپ" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="cEditMainData">
                                                    <table align="center" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div>
                                                                  <div>
                                                                        <AKP:MsgBox ID="msgBox" runat="server" CssClass="cError" />
                                                                    </div>
                                                                <div>
                                                                        <table class="cTblOneRow">
                                                                            <tr>
                                                                                <td class="cFieldLeft">
                                                                                    <table class="cTblField">
                                                                    <tr>
                                                                        <td class="cCtrl">
                                                                            <AKP:ExTextBox ID="txtID" jas="1" MaxLength="20"  runat="server"/>
                                                                        </td>
                                                                        <td class="cLabel">
                                                                            <asp:Label ID="lblID" runat="server" Text="Not Defined:"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                 </table>
                                                                                </td>
                                                                                <td class="cFieldRight">
                                                                                    <table class="cTblField">
                                                                    <tr>
                                                                        <td class="cCtrl">
                                                                            <AKP:ExTextBox ID="lkpPostCode" jas="1"  BaseID=""  runat="server"/>
                                                                        </td>
                                                                        <td class="cLabel">
                                                                            <asp:Label ID="lblPostCode" runat="server" Text="Not Defined:"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                 </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="cHorSep">
                                    </div>
                                    
                                    <div class="cHorSep">
                                    </div>
                                    <div style="text-align:left">
                                    <table cellpadding="2" cellspacing="4">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Cancel.gif" />
                                            </td>
                                            <td class="cVerBar1">
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="imgBtnBack" SkinID="BackButton" OnClick="GoToList" runat="server" />
                                            </td>
                                            <td class="cVerBar1">
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="imgBtnSave" SkinID="SaveButton" OnClick="DoSave" runat="server" />
                                            </td>
                                            <td class="cVerBar1">
                                            </td>
                                            <td>
                                                <button onclick="ChangeLang()" class="cBtnImage2" type="button">
                                                    <img alt="" name="langimg" border="0" src="../images/Farsibtn.gif" width="16" height="16" /></button>
                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
