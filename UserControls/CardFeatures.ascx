<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CardFeatures.ascx.cs"
    Inherits="ConLine.UserControls.CardFeatures" %>
<div>
    <div id="CardBenefCont">
        <ul class="kwicks">
            <li id="kwick4">
                <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/images/spacer.gif" Width="100"
                    Height="170" NavigateUrl="~/Help.aspx"></asp:HyperLink></li>
            <li id="kwick3"></li>
            <li id="kwick2"></li>
            <li id="kwick1">
                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/images/spacer.gif" Width="200"
                    Height="170" NavigateUrl="~/Users/Register.aspx"></asp:HyperLink></li>
        </ul>
    </div>
    <%--<div class="BoxYel">
        <div class="BoxYelHeader">
            <div class="BoxYelLable">
                راهنمای خرید
            </div>
        </div>
        <div class="BoxYelMid">
            <div class="HowToBuy">
                روش خرید: پس از انتخاب محصول مورد علاقه خود ، درصورتیکه قصد انتخاب محصول دیگری را
                ندارید ، روی کلید " اتمام خرید " کلیک کنید و درصورتیکه قصد اضافه کردن محصولات دیگری
                دارید ، روی " سبد خرید " کلیک نمائید . تا زمانیکه از سایت بیرون نروید ، محصول یا
                محصولاتی را که به سبدخرید اضافه نموده اید ، درسبد خرید شما نگهداری میشود و پس از
                کلیک روی دکمه " اتمام خرید " شما به صفحه تکمیل فرم سفارش هدایت میشوید و پس از تکمیل
                اطلاعات خود و مشاهده قیمت کالا و هزینه پست پیشتاز ، سفارشات خود را ظرف 2-3 روز کاری
                توسط شرکت پست جمهوری اسلامی درب منزل یا محل کارخود تحویل بگیرید، سپس وجه کالا و
                هزینه ارسال راطبق فاکتور به مامور پست بپردازید.
            </div>
        </div>
        <div class="BoxYelBot">
        </div>
    </div>--%>
    <script type="text/javascript">
        $().ready(function () {
            $('#CardBenefCont .kwicks').kwicks({
                max: 455,
                spacing: 5
            });
        });
    </script>
</div>
<div class="Clear">
</div>
