<%@ Page Language="C#" MasterPageFile="~/MainRoot.Master" AutoEventWireup="True"
    CodeBehind="Default.aspx.cs" Inherits="ConLine._Default" %>

<%@ Register Src="~/UserControls/UCSelectedPics.ascx" TagName="UCSelectedPics" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/UCProductList.ascx" TagName="UCProductList" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/Banner.ascx" TagName="UCBanner" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/NewsBox.ascx" TagName="NewsBox" TagPrefix="NWS" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">

    <div class="MainDataCont">
        <div class="row hidden-sm hidden-xs">
            <section class="col-lg-3 col-md-3 col-sm-12 col-xs-12 main-column text-center">
                
                <UC:UCBanner runat="server" ID="Banner1" PositionCode="1" />
                
            </section>
            <section class="col-lg-6 col-md-6 col-sm-12 col-xs-12 main-column">
                
                <UC:UCSelectedPics runat="server" ID="UCSelectedPics1" />
                
            </section>
            <aside class="col-lg-3 col-md-3 col-sm-12 col-xs-12 offcanvas-sidebar">
                <%--<UC:UCBanner runat="server" PositionCode="1" />--%>
                <NWS:NewsBox runat="server" />
            </aside>
        </div>
        
        <div class="Clear">
        </div>
        
        <div>
            <div class="NavMainCont">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs ItemsNavMain" role="tablist">
                    <li role="presentation" class="active"><a href="#MostSold" aria-controls="home" role="tab"
                        data-toggle="tab">
                        <img alt="cattabs1373761328176" src="images/log-condom01-90x53.png" class="hidden-sm hidden-xs pull-left">
                        پرفروشترین ها</a></li>
                    <li role="presentation"><a href="#New" aria-controls="New" role="tab" data-toggle="tab">
                    <img alt="cattabs1373761328178" src="images/conx9-90x53.png" class="hidden-sm hidden-xs pull-left">
                        جدیدترین ها</a></li>
                    <li role="presentation"><a href="#Discount" aria-controls="Discount" role="tab" data-toggle="tab">
                    <img alt="cattabs1373761328180" src="images/conx8-90x53.png" class="hidden-sm hidden-xs pull-left">
                        تخفیف ها</a></li>
                    <li role="presentation"><a href="#Sepcial" aria-controls="Sepcial" role="tab" data-toggle="tab">
                    <img alt="cattabs1373761328179" src="images/Untitled-3-90x53.png" class="hidden-sm hidden-xs pull-left">
                        پیشنهادات ویژه</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="MostSold">
                        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListMostSold" /></div>
                    <div role="tabpanel" class="tab-pane" id="New">
                        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListNew" /></div>
                    <div role="tabpanel" class="tab-pane" id="Discount">
                        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListDiscount" />
                    </div>
                    <div role="tabpanel" class="tab-pane" id="Sepcial">
                        <UC:UCProductList runat="server" ShowSearchTools="false" MaxPerPage="5" id="UCProductListSepcial" /></div>
                </div>
            </div>
        </div>
        
        <div>
            <div class="NavMainCont">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs CatNavMain" role="tablist">
                    <li role="presentation" class="active"><a href="#Spray" aria-controls="Spray" role="tab"
                        data-toggle="tab">
                        <img alt="cattabs1373761328176" src="images/conx01-90x53.png" class="hidden-sm hidden-xs pull-left">
                        اسپری تاخیری</a></li>
                    <li role="presentation"><a href="#Gel" aria-controls="Gel" role="tab" data-toggle="tab">
                    <img alt="cattabs1373761328178" src="images/conx03-90x53.png" class="hidden-sm hidden-xs pull-left">
                        ژل تاخیری</a></li>
                    <li role="presentation"><a href="#Device" aria-controls="Device" role="tab" data-toggle="tab">
                    <img alt="cattabs1373761328180" src="images/conx4-90x53.png" class="hidden-sm hidden-xs pull-left">
                        دستگاه توان بخشی آقایان</a></li>
                    
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="Spray">
                        <UC:UCProductList runat="server" MaxPerPage="4" ShowPagination="false" ShowSearchTools="false" id="UCProductListSpray" /></div>
                    <div role="tabpanel" class="tab-pane" id="Gel">
                        <UC:UCProductList runat="server" MaxPerPage="4" ShowPagination="false" ShowSearchTools="false" id="UCProductListGel" /></div>
                    <div role="tabpanel" class="tab-pane" id="Device">
                        <UC:UCProductList runat="server" MaxPerPage="4" ShowPagination="false" ShowSearchTools="false" id="UCProductListDevice" />
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
                <div class="media Box1">
                    <div class="pull-left">
                        <img src="images/13.jpg" class="media-object"></div>
                    <div class="media-body">
                        <h2 class="media-heading">
                            ارسال سریع</h2>
                        <p>
                            ارسال به تمام نقاط ایران در کوتاه ترین زمان ممکن</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
                <div class="media Box2">
                    <div class="pull-left">
                        <img src="images/12.jpg" class="media-object"></div>
                    <div class="media-body">
                        <h2 class="media-heading NoWrap">
                            تضمین کیفیت</h2>
                        <p>
                            محصولات حداقل دارای 12 ماه تاریخ انقضا میباشند</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
                <div class="media Box3">
                    <div class="pull-left">
                        <img src="images/14.jpg" class="media-object"></div>
                    <div class="media-body">
                        <h2 class="media-heading NoWrap">
                            هدیه و مسابقه</h2>
                        <p>
                            هدایای ویژه برای مشتریان کانلاین</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
                <div class="media Box1">
                    <div class="pull-left">
                        <img src="images/13.jpg" class="media-object"></div>
                    <div class="media-body">
                        <h2 class="media-heading">
                            ارسال سریع</h2>
                        <p>
                            ارسال به تمام نقاط ایران در کوتاه ترین زمان ممکن</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
