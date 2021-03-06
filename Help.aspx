﻿<%@ Page Language="C#" AutoEventWireup="True" Title="کانلاین :: راهنمای خرید" MasterPageFile="~/Master1Col.Master"
    CodeBehind="Help.aspx.cs" Inherits="ConLine.Help" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="CP1">
    <div>
        <div class="Hierarchy">
            <ul class="mnuHierarchy">
                <li class="IcHome">
                    <asp:HyperLink ID="hplMainPage" NavigateUrl="~/" runat="server">صفحه اصلی</asp:HyperLink>
                </li>
                <li class="Sep">&nbsp; </li>
                <li>
                    <asp:Label ID="Label1" runat="server" Text="راهنمای خرید"></asp:Label>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View runat="server">
                    <div class="RTL RightAlign Marginer20">
                        <div>
                            <span class="cReq">شرایط حمل و تحویل کالا<br />
                            </span>
                            <br />
                            در حال حاظر فروشگاه اینترنتی کانلاین، موفق بهدریافت نماد اعتماد الکترونیکی از وزارت
                            بازرگانی شده است تا با ایجاد و حفظ حس اعتماد خریداران و شرایط ارسال سریع‌، تحویل
                            رایگان در سراسر ایران و پرداخت در محل ( فعلا &quot; فقط شهر تهران ) با حفظ حریم
                            شخصی شما ، لذت خریدی متفاوت را برای شما فراهم کرده است.<br />
                            <br />
                            <span class="cReq">روش های مختلف ثبت سفارش<br />
                            </span>
                            <br />
                            در صورتیکه وجه سفارش خودرا بصورت آنلاین و یا کارت به کارت واریز نمایید به پاس اعتماد
                            شما ، به اندازه 20% از مبلغ سفارش خودامتیاز کسب می کنید و میتوانید با استفاده از
                            امتیازات کسب شده در خریدهای بعدی به عنوان وجه نقد از آنها استفاده نمائید .هزینه
                            ارسال سفارشات از طریق پست به تمام نقاط ایران کاملا رایگان بوده و مدت زمان دریافت
                            سفارش بسته به روش ارسال پستی و استان محل سکونت ، بین 2-5 روز کاری طول می کشد . در
                            صورتیکه تمایل داشته باشید سفارش شما سریعتر بدستتان برسید ، برای خریدهای بیش از 50.000
                            تومان بصورت کاملا&quot; رایگان از طریق پیک موتوری ( فقط در محدوده شهر تهران ) و
                            کمتر از 50.000 تومان با هزینه متقاضی از طریق پیک موتوری انجام می گیرد .<br />
                            بعد ثبت نهایی سفارش ، شماره فاکتور جهت پیگیری به آدرس ایمیلی که در فرم سفارش ثبت
                            نموده اید ارسال شده و یک نسخه دیگر جهت اطلاع از طریق پیامک به شماره موبایل شما ارسال
                            می گردد . پس از تحویل سفارش به اداره پست کد رهگیری پستی به دو روش فوق به اطلاع شما
                            خواهد رسید که با وارد کردن آن در سایت رسمی پست به آدرس زیر می توانید از وضعیت مرسوله
                            خود با خبر شوید.<br />
                            پست جمهوری اسلامی<br />
                            از آنجاییکه کد رهگیری از طریق سامانه پیامکی ارسال می گردد ، در صورتیکه دریافت پیامک
                            تبلیغاتی را غیر فعال نموده اید به طرق زیر می توانید مجددا فعال نمایید.<br />
                            <span class="cReq">
                                <br />
                                فعالسازی پیامک تبلیغاتی همراه اول :<br />
                            </span>ارسال عدد 1 به شماره پیامکی 8999<br />
                            http://www.mci.ir/not-receiving-promotional-sms<br />
                            <br />
                            <span class="cReq">فعالسازی پیامک تبلیغاتی ایرانسل :<br />
                            </span>ارسال عدد 1 به شماره پیامکی 5005<br />
                            ساعات اداری فروشگاه کانلاین از 9صبح الی 5 بعد از ظهر می باشد.<br />
                            <br />
                            <span class="cReq">1- پرداخت بصورت آنلاین و ارسال با پست سفارشی+ امتیاز ریالی به میزان
                                20 % مبلغ فاکتور نهایی :<br />
                            </span>درصورتیکه مبلغ نهایی سفارش شما کمتر از 10.000 تومان باشد ، فقط با این روش
                            و به صورت کاملا&quot; رایگان ارسال میگردد ودرصورت انتخاب پست پیشتاز مبلغ 2.000 تومان
                            به هزینه نهایی اضافه خواهد شد .مدت زمان دریافت مرسوله از این روش بطور متوسط بین
                            2 تا 4 روز کاری می باشد.<br />
                            در صورت انتخاب این گزینه به درگاه بانک هدایت می شوید که بعد از پر کردن فیلدهای مربوط
                            به شماره کارت ، رمز و ... مجدد به سایت کانلاین برگشت داده می شوید و کد رهگیری به
                            شما نمایش داده می شود و همان لحظه 20% مبلغ سفارش به عنوان پاداش خرید ، به حساب کاربری
                            شما منظور میگردد که در خریدهای بعدی میتوانید از آن به عنوان وجه نقد استفاده نمائید
                            .<br />
                            در اولین روز کاری سفارش شما بسته بندی شده و داخل کارتن گذاشته می شود.<br />
                            جهت حفظ حریم خصوصی ، بر روی بسته ارسالی تنها نام گیرنده و آدرس و نام فرستنده که
                            شرکت ایران 24 می باشد به همراه صندوق پستی شرکت بدون ذکر نام کالای خریداری شده درج
                            می شودو توسط اداره پست ارسال می گردد .<br />
                            <br />
                            <span class="cReq">2- پرداخت بصورت آنلاین و ارسال با پست پیشتاز + امتیاز به میزان 20
                                % مبلغ فاکتور نهایی :<br />
                            </span>چنانچه مبلغ خرید نهایی شما بیش از 10.000 تومان باشد و در صورت انتخاب این
                            گزینه ، هزینه ارسال به تمام نقاط ایران کاملا&quot; رایگان بوده و سپس به درگاه بانک
                            هدایت می شوید که بعد از پر کردن فیلدهای مربوط به شماره کارت ، رمز و ... مجدد به
                            سایت کانلاین برگشت داده می شوید و کد رهگیری به شما نمایش داده می شود و همان لحظه
                            20% مبلغ سفارش به عنوان پاداش خرید ، به حساب کاربری شما منظور میگردد که در خریدهای
                            بعدی میتوانید از آن به عنوان وجه نقد استفاده نمائید .مدت زمان دریافت مرسوله از این
                            روش بطور متوسط بین 1 تا 3 روز کاری می باشد.<br />
                            در اولین روز کاری سفارش شما بسته بندی شده و داخل کارتن گذاشته می شود.<br />
                            جهت حفظ حریم خصوصی ، بر روی بسته ارسالی تنها نام گیرنده و آدرس و نام فرستنده که
                            شرکت ایران 24 می باشد به همراه صندوق پستی شرکت بدون ذکر نام کالای خریداری شده درج
                            می شود و توسط اداره پست ارسال می گردد .<br />
                            <br />
                            <br />
                            <span class="cReq">3- پرداخت بصورت آنلاین و ارسال با پیک موتوری(ویژه تهران) + امتیاز
                                ریالی به میزان 20 % مبلغ فاکتور نهایی :<br />
                            </span>این گزینه فقط برای مشتریان ساکن تهران نمایش داده می شود.<br />
                            برای خریدهای بیش از 50.000 تومان بصورت کاملا&quot; رایگان از طریق پیک موتوری ( فقط
                            در محدوده شهر تهران ) و کمتر از 50.000 تومان با هزینه متقاضی از طریق پیک موتوری
                            انجام می گیرد .<br />
                            در صورت انتخاب این گزینه به درگاه بانک هدایت می شوید که بعد از پر کردن فیلدهای مربوط
                            به شماره کارت ، رمز و ... مجدد به سایت کانلاین برگشت داده می شوید و کد رهگیری به
                            شما نمایش داده می شود.<br />
                            در اولین فرصت سفارش شما بسته بندی شده و بعد از هماهنگی های لازم توسط پیک موتوری
                            برای شما ارسال می گردد.<br />
                            بر روی بسته ارسالی تنها فاکتور پیک چسبانده می شود.<br />
                            مدت زمان دریافت مرسوله در صورتیکه در ساعات کاری شرکت باشد ، همان روز و در غیر اینصورت
                            در اولین روز کاری پس از هماهنگی تحویل میگردد.<br />
                            هزینه ارسال با پیک موتوری بستگی به فاصله محل مورد نظر شما از 10.000 تومان تا 20.000
                            تومان متغیر می باشد.(البته با تعاملات انجام شده بزودی هزینه ارسال به سراسرتهران
                            بصورت کاملا&quot; رایگان انجام خواهد شد . )<br />
                            <br />
                            <span class="cReq">4- پرداخت در محل و ارسال با پیک موتوری(ویژه تهران) + امتیاز ریالی
                                به میزان 20 % مبلغ فاکتور نهایی پس از دریافت مبلغ :
                                <br />
                            </span>این گزینه فقط برای مشتریان ساکن تهران بوده که فعلا&quot; غیر فعال می باشد
                            .
                            <br />
                            درصورت نیاز به انتخاب این روش ، با شماره تلفن66476024 تماس حاصل نموده یا تقاضای
                            خودرا از طریق ایمیل به آدرس : support@conline.ir ارسال نمائید . کارشناسان ما در
                            اسرع وقت با شما تماس می گیرند .<br />
                        </div>
                    </div>
                </asp:View>
                <asp:View runat="server">
                    <div class="RTL RightAlign Marginer20">
                        <div class="RTL">
                        <span class="cReq"><strong>نحوه دریافت کوپن تخفیف و امتیاز<br /> </strong>
                        </span><br />
                        <span class="cReq">1- ارسال لینک خرید محصول به دوستان :
                        <br />
                        </span>با انتخاب هرمحصول ، کافیست روی نوشته &quot; معرفی به دوستان&quot; که زیر عکس محصول 
                        قرار دارد کلیک نمائید . گزینه های مورد نیاز را تکمیل نموده و کلید ارسال را فشار 
                        دهید . در اینصورت یک ایمیل به شما و دوستتان ارسال می گردد که حاوی لینک اطلاعات 
                        محصول و یک کوپن تخفیف می باشد . به ازای معرفی محصول به هریک از دوستان خود ، یک 
                        کوپن 2.000 تومانی به آدرس ایمیل شما ارسال میگردد که هنگام خرید و در مرحله پرداخت 
                        وجه ، با وارد کردن کد کوپن در قسمت مربوطه ، به همان میزان به عنوان وجه نقد از 
                        حساب شما کسر خواهد شد . <br />
                        <br />
                        <span class="cReq">2- دریافت کوپن تخفیف<br /> </span>در صورت دریافت کوپن تخفیف 
                        از روشهای مختلف ( پیامک ، کارت هدیه ، کلیک کردن روی لینکهای موجود در سایتهای پر 
                        بازدید و ... ) هنگام خرید و در مرحله پرداخت وجه ، با وارد کردن کد کوپن در قسمت 
                        مربوطه ، به همان میزان به عنوان وجه نقد از حساب شما کسر خواهد شد.<br />&nbsp;
                        <br />
                        &nbsp;<span class="cReq"><strong>شرایط کلی استفاده از کوپن تخفیف<br /> </strong>روش 
                        اول :</span>برای استفاده از کوپن های تخفیف کانلاین، با نام کاربری خود وارد سایت 
                        شوید و کدکوپن تخفیف را در قسمت مربوطه وارد نموده و گزینه ثبت کوپن را انتخاب 
                        نمائید . مبلغ ریالی کوپن تخفیف به حساب کاربری شما اضافه می گردد و می توانید به 
                        هنگام پرداخت وجه کالای خریداری شده از آن به عنوان وجه نقد استفاده نمائید .<br />
                        <span class="cReq">روش دوم :</span> برای استفاده از کوپن های تخفیف کانلاین، با 
                        نام کاربری خود وارد سایت شوید و کالای مورد نیاز خود را در سایت انتخاب نمائید و 
                        مراحل سفارش را تکمیل نمائید . در مرحله پایانی که مرحله پرداخت وجه می باشد ، 
                        کدکوپن تخفیف را در قسمت مربوطه وارد نموده و گزینه ثبت کوپن را انتخاب نمائید . 
                        مبلغ ریالی کوپن تخفیف از مبلغ نهایی سفارش کسر خواهد شد و مابه التفاوت وجه فاکتور 
                        خود را بصورت اینترنتی پرداخت نمائید .<br />
<span class="cReq">توجه : </span> <br />
<ul style="list-style-type:circle">
                        <li>لطفا در هنگام ورود کوپن از صحت ورود کد اطمینان حاصل نمایید.</li>
                        <li>کوپن های تخفیف فقط یک بار قابل استفاده می باشد.</li>
                        <li>کوپن های تخفیف منحصر به هر مشتری می باشند.</li>
                        <li>در هر ثبت سفارش فقط یک کوپن تخفیف قابل استفاده بوده و امکان ترکیب دو یا چند کوپن 
                        وجود ندارد.</li>
                        <li>مبلغ کوپن تخفیف از مبلغ قابل پرداخت سفارش شما کسر خواهد شد.</li>
                        <li>کوپن تخفیف قابل انتقال به دیگران نمی باشد .</li>
                        <li>کلیه امتیازات و اعتبارات در حساب ناحیه کاربری شما ذخیره شده و قابل مشاهده می 
                        باشد .</li>
                        <li>امتیازات یا اعتبارات فقط برای خرید مجدد از سایت کانلاین قابل استفاده می باشد .</li>
                        <li>معادل ریالی امتیازات یا اعتبارات به صورت نقدی قابل انتقال یا پرداخت نمی باشد .</li>
                        </ul>
<br />
<br />
</div>
                    </div>
                </asp:View>
                <asp:View ID="View1" runat="server">
                    <div class="RTL RightAlign Marginer20">
                        <div>
                            <span class="cReq">انتقادات و پیشنهادات
                                <br />
                            </span>جهت ارائه انتقادات و پیشنهادات خواهشمند است از طریق فرم &quot;تماس با ما&quot;
                            یا ایمیل Support@conline.ir نواقص و کاستیهای فروشگاه را اطلاع دهید. مدیران سایت
                            با آغوش باز منتظر انتفادات و پیشنهادات سازنده شما مشتریان گرامی می باشند. پیشاپیش
                            از توجه شما تشکر مینماییم.<br />
                            <br />
                            <span class="cReq">شرایط استرداد یا تعویض کالا<br />
                            </span>فرم مخصوص &quot; استرداد کالا &quot; را پر کنید(این فرم در پائین صفحات سایت
                            موجود است) و کالاهای مورد نظر و دلیل بازگرداندن را نیز مشخص نمایید. همکاران ما به
                            محض دریافت درخواست استرداد کالا با شما تماس خواهند گرفت .
                            <br />
                            هرگونه نقص و عيب کالا، اشتباه در ثبت و ارسال سفارش بايد حداکثر 48 ساعت پس از دريافت
                            كالا حتي در روزهاي تعطيل از طریق ارسال ايميل Support@conline.ir یا &quot;فرم استرداد
                            کالا &quot;به واحد امورمشتريان فروشگاه اطلاع داده شود تا مشكل فوراً بررسي و در صورت
                            اثبات آن ، جايگزين ارسال گردد. بديهي است پس از 48 ساعت هيچ اعتراضي پذيرفتني نيست.<br />
                            درصورتیکه کالا توسط خریدار باز شده باشد ، به هیچ عنوان پس گرفته یا تعویض نمی گردد
                            .
                            <br />
                            <span class="cReq">
                                <br />
                                آسیب‏های فیزیکی ناشی از حمل و نقل<br />
                            </span>در صورتی که آسیب‏های ناشی از حمل و نقل در لحظه تحویل کالا قابل مشاهده است
                            و یا بسته بندی کالا در زمان حمل دچار آسیب شده است، شما می‏توانید از تحویل گرفتن
                            مرسوله خودداری نمایید تا جهت بررسی و ارسال مجدد به فروشگاه اینترنتی کانلاین عودت
                            شود.<br />
                            فروشگاه اینترنتی کانلاین همواره در تلاش است تا با ایجاد بستری امن مبتنی بر اصول
                            مشتری مداری و رعایت حقوق مصرف کننده، امنیت خاطر مشتریان خود را، پیش، حین و پس از
                            خرید فراهم آورد.<br />
                            <br />
                        </div>
                    </div>
                </asp:View>
                
            </asp:MultiView>
            <div class="Line1">
            </div>
        </div>
    </div>
    <div class="Clear">
    </div>
</asp:Content>
