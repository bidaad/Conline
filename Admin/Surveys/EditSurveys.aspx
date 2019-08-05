<%@ Page Language="C#" StylesheetTheme="Edit" MasterPageFile="~/Admin/Main.master" AutoEventWireup="true" Inherits="Surveys_EditSurveys" Title="Surveys" Codebehind="EditSurveys.aspx.cs" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="cphMain">
    <div class="EditHeader">
        <asp:Label runat="server" ID="lblSysName"></asp:Label></div>
    <div>
        <div>
            <AKP:MsgBox runat="server" ID="msgBox">
            </AKA:MsgBox>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtTitle" jas="1" MaxLength="50" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblTitle" runat="server" Text="عنوان:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <asp:CheckBox ID="chkActive" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblActive" runat="server" Text="فعال:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="TabHeaderData">
        <telerik:RadTabStrip Style="margin-right: 8px;" dir="rtl" ID="tsUsers" runat="server"
            MultiPageID="tsSurveys" SelectedIndex="0" Skin="Vista" SkinsPath="~/RadControls/TabStrip/Skins">
            <Tabs>
                <telerik:RadTab ID="Tab1" runat="server" Text="پاسخهای نظرسنجی">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div class="cTabWrapper">
            <telerik:RadMultiPage ID="RadMultiPage1" SelectedIndex="0" runat="server">
                <telerik:RadPageView ID="PageView1" runat="server">
                    <div class="cDivSep">
                    </div>
                    <div class="cBrowseArea" id="SurveyQuestions">
                    </div>
                    <div class="cDivSep">
                    </div>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
    </div>
    <div style="text-align: right">
        <table cellpadding="2" cellspacing="4">
            <tr>
                <td>
                    <a class="button2" onclick="ChangeLang()">فارسی </a>
                </td>
                <td class="cVerBar1">
                </td>
                <td>
                    <asp:LinkButton ID="imgBtnBack" Text=" بازگشت " SkinID="BackButton" OnClick="GoToList"
                        runat="server" />
                </td>
                <td class="cVerBar1">
                </td>
                <td>
                    <asp:LinkButton ID="imgBtnSave" Text=" ذخیره " SkinID="SaveButton" OnClick="DoSave"
                        runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="hfPassword" runat="server" />
</asp:Content>
