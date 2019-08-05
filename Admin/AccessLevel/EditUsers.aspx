<%@ Page Language="C#" StylesheetTheme="Edit" MasterPageFile="~/Admin/Main.master"
    AutoEventWireup="true" Inherits="Users_EditUsers"
    Title="Users" Codebehind="EditUsers.aspx.cs" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="cphMain">

   

    <div class="EditHeader">
        <asp:Label runat="server" ID="lblSysName"></asp:Label></div>
    <div>
        <div>
            <AKP:MsgBox runat="server" ID="msgBox" />
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtID" jas="1" MaxLength="50" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblID" runat="server" Text="شناسه:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExCheckBox ID="chkAutoLogin" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblAutoLogin" runat="server" Text="ورود خودکار:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtFirstName" jas="1" MaxLength="100" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblFirstName" runat="server" Text="نام:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtLastName" jas="1" MaxLength="100" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblLastName" runat="server" Text="نام خانوادگي:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtEmail" jas="1" MaxLength="50" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblEmail" runat="server" Text="ايميل:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtPassword" SkinID="English" TextMode="Password" jas="1" MaxLength="50" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblPassword" runat="server" Text="کلمه عبور:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="UploaderContainer">
            <fieldset style="direction: rtl">
                <legend>&nbsp;<asp:Label runat="server" Text="عکس" ID="lblPicFile" />&nbsp;</legend>
                <table class="cTblOneRow">
                    <tr>
                        <td class="cFieldLeft">
                            <div class="cPic">
                                <AKP:ExRadUpload ID="uplPicFile" jas="1" runat="server" AllowedFileExtensions=".gif,.jpg,.jpeg,.png,.bmp"
                                    TargetFolder="~/Files/Users/" Skin="Vista" MaxFileSize="200000" ControlObjectsVisibility="None" />
                                <br />
                                <asp:CheckBox ID="chkDeletePicFile" runat="server" Text="حذف فایل" />
                            </div>
                        </td>
                        <td class="cFieldRight">
                            <asp:HyperLink rel="lightbox" EnableViewState="false" Target="_blank" runat="server"
                                ID="hplPicFile" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:Combo ID="cboHCGenderCode" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblHCGenderCode" runat="server" Text="جنسيت:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExCheckBox ID="chkActive" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblActive" runat="server" Text="فعال:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtAccountBalance" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblAccountBalance" runat="server" Text="بالانس:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox DisplayMode="ViewMode" ID="dteRegDate" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblRegDate" runat="server" Text="تاريخ عضويت:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:FarsiDate ID="dteBirthDate" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblBirthDate" runat="server" Text="تاريخ تولد:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox DisplayMode="ViewMode" ID="txtLoginTimes" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblLoginTimes" runat="server" Text="دفعات ورود:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="TabHeaderData">
        <telerik:RadTabStrip Style="margin-right: 8px;" dir="rtl" ID="tsUsers" runat="server"
            MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Vista" SkinsPath="~/RadControls/TabStrip/Skins">
            <Tabs>
                <telerik:RadTab ID="Tab1" runat="server" Text="گروه های کاربر">
                </telerik:RadTab>
                
                <telerik:RadTab ID="Tab2" runat="server" Text="تراکنش های کاربر">
                </telerik:RadTab>
                <telerik:RadTab ID="Tab3" runat="server" Text="آدرس های کاربر">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div class="cTabWrapper">
            <telerik:RadMultiPage ID="RadMultiPage1" SelectedIndex="0" runat="server">
                <telerik:RadPageView ID="PageView1" runat="server">
                    <div class="cDivSep">
                    </div>
                    <div class="cBrowseArea" id="UserGroups">
                    </div>
                    <div class="cDivSep">
                    </div>
                </telerik:RadPageView>
                
                <telerik:RadPageView ID="PageView2" runat="server">
                    <div class="cDivSep">
                    </div>
                    <div class="cBrowseArea" id="UserTransactions">
                    </div>
                    <div class="cDivSep">
                    </div>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView1" runat="server">
                    <div class="cDivSep">
                    </div>
                    <div class="cBrowseArea" id="UserAddresses">
                    </div>
                    <div class="cDivSep">
                    </div>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
    </div>
    <div style="text-align: right">
        <table class="tblEditButtons" cellpadding="2" cellspacing="4">
            <tr>
                <td>
                    <asp:ImageButton ID="imgBtnBack" Text=" بازگشت " SkinID="BackButton" OnClick="GoToList"
                        runat="server" />
                </td>
                <td>
                    <asp:ImageButton ID="imgBtnSave" Text=" ذخیره " SkinID="SaveButton" OnClick="DoSave"
                        runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="hfPassword" runat="server" />
</asp:Content>
