<%@ Page Language="C#" AutoEventWireup="true" Title=" کانلاین :: عضویت" MasterPageFile="~/Master1Col.Master"
    CodeBehind="Register.aspx.cs" Inherits="ConLine.UsersFolder.Register" %>
<%@ Register Src="~/UserControls/UCRegister.ascx" TagName="UCRegister" TagPrefix="Reg" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <div class="Hierarchy">
        <ul class="mnuHierarchy">
            <li class="IcHome">
                <asp:HyperLink ID="hplMainPage" NavigateUrl="~/" runat="server">صفحه اصلی</asp:HyperLink>
            </li>
            <li class="Sep">&nbsp; </li>
            <li>
                <asp:Label ID="Label1" runat="server" Text="عضویت"></asp:Label>
            </li>
        </ul>
    </div>
    <div class="clearfix">
    </div>
    <h1 class="PageTitle text-center">
        <asp:Image ID="Image1" ImageUrl="~/images/register_icon.png" ToolTip="عضویت در کانلاین"
            runat="server" />
    </h1>
    <div class="row container">
        <div class="col-md-6 col-xs-6 col-sm-6 hidden-xs">
            <ul class="RegNotes">
                <li class="first"><span class="opt"><b>سریع تر و ساده تر</b> خرید کنید</span><img
                    alt="" src="../images/cart.png" />
                </li>
                <li><span class="opt"><b>به سادگی</b> سوابق خرید و فعالیت های خود را مدیریت کنید</span><img
                    alt="" src="../images/information.png" />
                </li>
                <li><span class="opt">لیست <b>علاقمندی های</b> خود را بسازید و تغییرات آنها را دنبال
                    کنید</span><img alt="" src="../images/favorit.png" /><span></span> </li>
                <li><span class="opt"><b>نقد، بررسی و نظرات</b> خود را با دیگران به اشتراک گذارید</span><img
                    alt="" src="../images/comments.png" /><span></span> </li>
                <li><span class="opt">در جریان <b>فروش های ویژه</b> و قیمت روز محصولات قرار گیرید</span><img
                    alt="" src="../images/offer.png" /><span></span> </li>
            </ul>
        </div>
        <div class="col-md-6 col-xs-12 col-sm-6 container">
            <Reg:UCRegister runat="server" id="UCRegister1" />
            
        </div>
    </div>
    

    <br />
</asp:Content>
