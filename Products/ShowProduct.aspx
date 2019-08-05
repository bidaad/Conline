<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainRoot.Master"
    CodeBehind="ShowProduct.aspx.cs" Inherits="ConLine.ProductsFolder.ShowProduct" %>

<%@ Register Src="~/UserControls/UCSelectedProducts.ascx" TagName="UCSelectedProducts"
    TagPrefix="UC" %>
<%@ Register Src="~/UserControls/NormalLogin.ascx" TagName="NormalLogin" TagPrefix="UCLogin" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <script type="text/javascript" src="../Scripts/jquery.jcarousel.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.elevatezoom.js"></script>
    <script type="text/javascript">
        function CheckTick(objCheckBox) {
            if (!$(objCheckBox).is(':checked')) {
                $("#txtComment").prop("disabled", true);
                $("#txtComment").addClass('DisabledArea');
            }
            else {
                $("#txtComment").prop("disabled", false);
                $("#txtComment").removeClass('DisabledArea');
            }
        }

        $(document).ready(function () {
            $("#btnRecommend").button();
            $("#btnRecommend").click(function () { ShowRecommendForm(); return false; });

            //            $("#btnSendComment").button();
            //            $("#btnSendComment").click(function () { ShowLogin(); return false; });


        });

        function ShowRecommendForm() {
            $("#divRecommend").modal('show');
        }

        function ShowLogin() {
            $("#divLogin").modal('show');
        }


    </script>
    <div id="divRecommend" class="modal fade" style="display: none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title">
                        معرفی به دوستان</h4>
                </div>
                <div class="modal-body">
                    <div class="WinBlue1">
                        <div style="padding: 7px; direction: rtl;">
                            <table class="tblRecommend">
                                <tr>
                                    <td colspan="2" style="text-align: right;">
                                        <asp:TextBox ID="txtMyName" CssClass="form-control" placeholder="نام شما" TabIndex="2" runat="server"></asp:TextBox>
                                    </td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right;">
                                        <asp:TextBox ID="txtFromEmail" CssClass="form-control" TabIndex="1" placeholder="ایمیل شما" SkinID="English" runat="server"></asp:TextBox>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right;">
                                        <asp:TextBox ID="txtFriendName" CssClass="form-control" TabIndex="4" placeholder="نام دوست شما" runat="server"></asp:TextBox>
                                    </td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtFriendEmail" CssClass="form-control" TabIndex="3" placeholder="ایمیل دوست شما" SkinID="English" runat="server"></asp:TextBox>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    
                                    <td colspan="1">
                                        <telerik:RadCaptcha ID="RadCaptcha1" CssClass="Capt" CaptchaImage-ImageCssClass="CaptImg"
                            CaptchaTextBoxCssClass="CaptText form-control" runat="server"
                            ErrorMessage="" CaptchaTextBoxLabel="">
                        </telerik:RadCaptcha>
                                    </td>
                                    <td colspan="1">
                                        <asp:Label ID="Label1" runat="server" Text="کد امنیتی"></asp:Label>
                                    </td>
                                    
                                </tr>
                            </table>
                        </div>
                        <div>
                            <AKP:MsgBox runat="server" ID="msgBox1">
                            </AKP:MsgBox>
                        </div>
                    </div>
                    <div class="cInformation" style="font-size:14px;">
                    کد کوپن تخفیف به آدرس ایمیل دوست شما ارسال میگردد.
                </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        انصراف</button>
                    <asp:Button ID="btnSend" CssClass="btn btn-primary" runat="server" Text="ارسال" OnClick="btnSend_Click" />
                </div>
            </div>
        </div>
    </div>
    <div id="divLogin" class="modal fade" style="display: none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title">
                        ورود</h4>
                </div>
                <div class="modal-body">
                    <div class="WinBlue1">
                        <div style="padding: 7px; direction: rtl;">
                            <UCLogin:NormalLogin ID="NormalLogin1" runat="server" />
                        </div>
                        <div>
                            <AKP:MsgBox runat="server" ID="msgBox2">
                            </AKP:MsgBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        انصراف</button>
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="ارسال" OnClick="btnSend_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="">
        <div class="Hierarchy">
            <ul class="mnuHierarchy">
                <li class="IcHome">
                    <asp:HyperLink ID="hplMainPage" NavigateUrl="~/" runat="server">صفحه اصلی</asp:HyperLink>
                </li>
                <asp:Literal ID="ltrHirarchy" runat="server"></asp:Literal>
            </ul>
        </div>
        <div class="clear">
        </div>
        <div class="">
            
            <div id="productdetails" class="MainProDetail row">
                
                <div class="ProOptions col-md-8">
                    <div class="cErrorMessage" style="font-size:16px;">
                برای حفظ حریم شخصی افراد و شئونات جامعه، محصولات زناشویی بدون نام ارسال میشوند
                    </div>
                    <div class="cProTitle pull-right">
                        <h3>
                            <asp:Literal ID="lblEnTitle" runat="server"></asp:Literal></h3>
                    </div>
                    <div class="cProTitle  pull-left">
                        <h3>
                            <asp:Literal ID="lblFaTitle" runat="server"></asp:Literal></h3>
                    </div>
                    <div>
                        <table class="tblProInfo1">
                            <tr>
                                <td class="TDVal">
                                    <div>
                                        <asp:Image ID="imgAvailStatus" ImageUrl="~/images/Available.gif" runat="server" />
                                    </div>
                                </td>
                                <td class="TDlbl">
                                    وضعیت:
                                </td>
                            </tr>
                            <asp:Panel ID="pnlProColors" runat="server">
                                <tr>
                                    <td class="TDVal">
                                        <div>
                                            <table class="tblColors">
                                                <tr>
                                                    <asp:Repeater ID="rptProColors" runat="server">
                                                        <ItemTemplate>
                                                            <td>
                                                                <asp:RadioButton ID="rbColor" GroupName="ProductColors" runat="server" />
                                                            </td>
                                                            <td class="NoWrap">
                                                                <%#Eval("ColorName") %>
                                                            </td>
                                                            <td class="TDColor">
                                                                <div class="color" style="background-color: <%#Eval("RGB")%>">
                                                                </div>
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td class="TDlbl">
                                        رنگ:
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="pnlGaranties" runat="server">
                                <tr>
                                    <td class="TDVal">
                                        <div>
                                            <table class="tblGaranties">
                                                <tr>
                                                    <asp:Repeater ID="rptProductGaranties" runat="server">
                                                        <ItemTemplate>
                                                            <td>
                                                                <asp:RadioButton ID="rbColor" Checked="true" GroupName="ProductGaranties" runat="server" />
                                                            </td>
                                                            <td class="NoWrap">
                                                                <%#Eval("Garanty") %>
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td class="TDlbl">
                                        گارانتی:
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="pnlMarketPrice" Visible="false" runat="server">
                                <tr>
                                    <td class="TDVal">
                                        <div>
                                            <asp:Label ID="lblMarketPrice" runat="server" Target="_blank" CssClass="MarketPrice"></asp:Label>
                                        </div>
                                    </td>
                                    <td class="TDlbl">
                                        قیمت بازار:
                                    </td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td class="TDVal">
                                    <div>
                                        <asp:Label ID="lblPrice" runat="server" Target="_blank" CssClass="Price"></asp:Label>
                                    </div>
                                </td>
                                <td class="TDlbl">
                                    قیمت:
                                </td>
                            </tr>
                            <asp:Panel ID="pnlCoupon" Visible="false" CssClass="Marginer10 RTL pull-right" runat="server">
                                <tr>
                                    <td colspan="2" class="TDVal">
                                        <asp:Label ID="lblCouponMessage" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <div class="clear">
                            </div>
                        </table>
                    </div>
                    <div class="clear">
                    </div>
                    <div style="text-align: left; float: right;">
                        <table class="tblBasketCount">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="hplBuy" ImageUrl="~/images/addtocart.gif" ToolTip="اضافه کردن محصول به سبد خرید"
                                        runat="server"></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <AKP:MsgBox runat="server" ID="msgMessage">
                                    </AKP:MsgBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="cNormText">
                        <div class="ProDesc">
                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="Clear">
                    </div>
                </div>
                <div class="ProGallery  col-md-4">
                    <div id="contentnav" class="">
                        <ul>
                            <li class="gs"><a href="#productdetails" class="anchorLink" id="btnproductdetails">مشخصات
                                کلی<span class="border"></span></a> </li>
                            <li class="rp"><a href="#relatedproducts" class="anchorLink" id="btnrelatedproducts">
                                محصولات مشابه<span class="border"></span></a></li>
                            
                            <li class="uc"><a href="#usercomments" class="anchorLink" id="btnusercomments">نظرات
                                کاربران<span class="border"></span></a></li>
                        </ul>
                    </div>
                    <div class="Clear">
                    </div>
                    <div class="ProFullPic text-center">
                        <ul class="gallery clearfix">
                            <li>
                                <div class="ProMainImage">
                                    <asp:HyperLink ID="hplLargePic" runat="server" rel="prettyPhoto[gallery2]" title="">
                                        <figure>
                                            <asp:Image runat="server" BorderWidth="0" CssClass="ShowProPic" ID="imgPicFile" />
                                        </figure>
                                    </asp:HyperLink>
                                    <asp:Image runat="server" ID="imgSpecialOfferLBL" Visible="false" CssClass="SepcialOffer"
                                        ImageUrl="../images/SpecialOffer.png" alt="پیشنهاد ویژه" />
                                </div>
                            </li>
                        </ul>
                    </div>
                    <asp:Panel runat="server" ID="pnlProPictures">
                        <div class="jcarousel-wrapper">
                            <div class="jcarousel">
                                <asp:Repeater ID="rptProductPictures" runat="server">
                                    <HeaderTemplate>
                                        <ul class="gallery clearfix ProThumbnail">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><a href="..<%#Eval("PicFile").ToString().Replace("//","/") %>" rel="prettyPhoto[gallery1]">
                                            <img alt="" src="<%#Eval("SmallPicFile") %>" />
                                        </a></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <a href="#" class="jcarousel-control-prev">&lsaquo;</a> <a href="#" class="jcarousel-control-next">
                                &rsaquo;</a>
                        </div>
                    </asp:Panel>
                    <div>
                        <AKP:MsgBox runat="server" ID="MsgBoxSendTools">
                        </AKP:MsgBox>
                    </div>
                    <div>
                        <table class="tblSendTools">
                            <tr>
                                <td>
                                    <div id="btnRecommend" class="Icons SendToFriend">
                                        معرفی به دوستان
                                    </div>
                                </td>
                                <td>
                                    <div class="Icons AddToFav">
                                        <asp:LinkButton ID="btnAddToFav" runat="server" OnClick="btnAddToFav_Click">اضافه به لیست مورد علاقه</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="cWarning" style="font-size:14px;margin-top:10px;">
                        با معرفی این محصول به هر یک از دوستان، ٢٠٠٠ تومان کوپن تخفیف دریافت کنید
                    </div>
                </div>
            </div>
            <div class="Clear">
            </div>
            <asp:Panel ID="pnlRelatedProductsLabel" runat="server" CssClass="RightAlign">
                <div id="RelatedProducts" class="SectionHeader RelatedProLBL">
                    <img src="../images/relatedproducts.gif" alt="محصولات مشابه" />
                </div>
            </asp:Panel>
            <div class="clear">
            </div>
            <div>
                <UC:UCSelectedProducts runat="server" id="RelatedProducts1" />
            </div>
            <div id="technicalspecs" class="clear">
            </div>
            
            <div class="Clear">
            </div>
            <div class="CommentList">
                <div class="SectionHeader">
                    <img src="../images/usercomments.gif" alt="نظرات کاربران" />
                </div>
                <asp:Repeater ID="rptComments" EnableViewState="false" runat="server">
                    <ItemTemplate>
                        <div class="boldtext right">
                            &nbsp;<%#ShowItem(Eval("Name"))%>&nbsp;<span class="CommentDate">(<%#ShowDate(Eval("CommentDate"))%>)</span></div>
                        <div class="clear">
                        </div>
                        <div class="Justify RTL ActualComment">
                            &nbsp;<%#Tools.FormatString( Eval("Comment").ToString())%>
                            <div class="Justify RTL AdminComment">
                                <span>کانلاین</span> &nbsp;<%#Tools.FormatString( Eval("AdminComment").ToString())%></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="Clear">
            </div>
            <div id="usercomments">
                <div class="CommentForm">
                    <div class="ShadowBox">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <AKP:MsgBox runat="server" ID="msgBox">
                                            </AKP:MsgBox>
                                            <asp:Panel runat="server" CssClass="SendCommentForm" ID="pnlSendCommentForm">
                                                <div class="CommentFormHeader">
                                                    نظر خود را در مورد این محصول با دیگران به اشتراک بگذارید
                                                </div>
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="lblRequestLogin" ForeColor="Maroon" runat="server" Text="کاربر گرامی چنانچه تمایل دارید، نقد یا نظر شما به نام خودتان در سایت ثبت شود، لطفاً وارد سایت شوید. "></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="vertical-align: top;">
                                                            متن:
                                                        </td>
                                                        <td>
                                                            <AKP:ExTextBox ID="txtComment" ClientIDMode="Static" CssClass="input-text DisabledArea container form-control"
                                                                Enabled="false" TextMode="MultiLine" Height="100" runat="server"></AKP:ExTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <div class="FLeft">
                                                                <asp:ImageButton ImageUrl="~/images/submitcomment.png" ID="btnSendComment" ClientIDMode="Static"
                                                                    Text="ثبت نظر" runat="server" OnClick="btnSendComment_Click"></asp:ImageButton>
                                                            </div>
                                                            <div class="FRight">
                                                                <asp:CheckBox ID="CheckBox1" onclick="CheckTick(this)" Text="شرایط و قوانین استفاده از سرویس های سایت کانلاین را مطالعه نموده و با کلیه موارد آن موافقم."
                                                                    runat="server" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="Clear">
            </div>
            <div class="Keywords">
                <asp:Repeater ID="rptKeywords" EnableViewState="false" runat="server">
                    <ItemTemplate>
                        <span>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "~/" + strEnTitle + "-" + strCode + ".html"%>'><%#Eval("Name") %>&nbsp;<%#ProTitle%></asp:HyperLink></span>&nbsp;&nbsp;
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="Clear">
            </div>
            <div class="Clear">
            </div>
            <br />
        </div>
        <div class="Clear">
        </div>
    </div>
    <div class="Clear">
    </div>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            $("area[rel^='prettyPhoto']").prettyPhoto();

            $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'normal', theme: 'light_square', slideshow: 9000, autoplay_slideshow: true });


            $("#btnproductdetails").click(function () {
                $('html, body').animate({
                    scrollTop: $("#productdetails").offset().top
                }, 2000);
            });
            $("#btnrelatedproducts").click(function () {
                $('html, body').animate({
                    scrollTop: $("#RelatedProducts").offset().top
                }, 2000);
            });
            $("#btnusercomments").click(function () {
                $('html, body').animate({
                    scrollTop: $("#usercomments").offset().top
                }, 2000);
            });
            $("#btnTechnicalspecs").click(function () {
                $('html, body').animate({
                    scrollTop: $("#technicalspecs").offset().top
                }, 2000);
            });
        });





        (function ($) {
            $(function () {
                $('.jcarousel').jcarousel();

                $('.jcarousel-control-prev')
            .on('jcarouselcontrol:active', function () {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function () {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '-=1'
            });

                $('.jcarousel-control-next')
            .on('jcarouselcontrol:active', function () {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function () {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '+=1'
            });

                $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function () {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function () {
                $(this).removeClass('active');
            })
            .jcarouselPagination();
            });
        })(jQuery);


        //$(".ShowProPic").elevateZoom({zoomEnabled:!1,mobile:!1,cursor:"crosshair",galleryActiveClass:"active",imageCrossfade:!0,scrollZoom:!1,tint:!1,zoomWindowWidth:320,zoomWindowHeight:400,tintColour:"#000",tintOpacity:.5,borderSize:1,loadingIcon:"../Images/Loading.GIF",zoomWindowPosition:9,easing:!0,easingDuration:1e3,zoomType:""});


        $(".ShowProPic").elevateZoom({
            easing: true,
            scrollZoom: true,
            zoomWindowPosition: 10,
            borderSize: 1
        });

    </script>
</asp:Content>
