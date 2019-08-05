using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Collections;

public partial class UserControls_PersianCalendar : System.Web.UI.UserControl
{
    protected int StartDay;
    protected int DaysOfMonth;
    protected int _curMonth;
    public int CurMonth
    {
        get
        {
            return Convert.ToInt32( ViewState["_curMonth"]);
        }
        set
        {
            _curMonth = value;
            ViewState["_curMonth"] = value;
        }
    }
    protected int _curYear;
    public int CurYear
    {
        get
        {
            return Convert.ToInt32( ViewState["_curYear"]);
        }
        set
        {
            ViewState["_curYear"] = value;
            _curYear = value;
        }
    }
    int Counter = 0;
    int DayCounter = 1;
    public string ShowDay(object obj)
    {
        string Result = "";
        Counter++;
        if (Counter < StartDay || DayCounter > DaysOfMonth)
            Result = "";
        else
        {
            Result = GetDay(DayCounter);
            DayCounter++;
        }
        return Result;

    }
    protected string GetDay(int DayIndex)
    {
        if (_dayEvents == null)
        {
            string strDay = DayIndex.ToString();
            string strMonth = _curMonth.ToString();
            string strYear = _curYear.ToString();
            string PassDate = "";
            if (strDay.Length == 1)
                strDay = "0" + strDay;
            if (strMonth.Length == 1)
                strMonth = "0" + strMonth;
            PassDate = strYear + strMonth + strDay;
            return "<a href=\"News.aspx?NewsDate=" + PassDate + "\">" + Tools.ChangeEnc(DayIndex.ToString()) + "</div>";
        }
        for (int i = 0; i < _dayEvents.Count; i++)
        {
            if (Convert.ToInt32(((string[])_dayEvents[i])[0]) == DayIndex)
                return "<div class='cEventDay'><a target=\"_blank\" href=\"" + ((string[])_dayEvents[i])[1] + "\" title=\"" + ((string[])_dayEvents[i])[2] + "\" >" + Tools.ChangeEnc(DayIndex.ToString()) + "</a></div>";

        }
        return Tools.ChangeEnc(DayIndex.ToString());
    }
    protected ArrayList _dayEvents;
    public ArrayList DayEvents
    {
        get
        {
            return _dayEvents;
        }
        set
        {
            _dayEvents = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PersianCalendar pc = new PersianCalendar();
            if (_curYear == 0)
            {
                DateTime CurrentDT = DateTime.Now;
                CurYear = _curYear = pc.GetYear(CurrentDT);
            }
            if (_curMonth == 0)
            {
                DateTime CurrentDT = DateTime.Now;
                CurMonth = _curMonth = pc.GetMonth(CurrentDT);
            }

            LoadDate();
        }
    }

    private void LoadDate()
    {
        PersianCalendar pc = new PersianCalendar();
        DataTable tblDays = new DataTable();
        DataColumn dc = new DataColumn("Day");
        tblDays.Columns.Add(dc);
        for (int i = 1; i < 42; i++)
        {
            DataRow dr = tblDays.NewRow();
            dr["Day"] = i.ToString();
            tblDays.Rows.Add(dr);
        }

        lblHeader.Text = GetPersianMonthName(CurMonth) + " " + Tools.ChangeEnc(CurYear.ToString());
        DateTime dt = pc.ToDateTime(CurYear, CurMonth, 1, 0, 0, 0, 0);
        DaysOfMonth = pc.GetDaysInMonth(CurYear, CurMonth);
        StartDay = GetPersianStartDay(Convert.ToInt32(dt.DayOfWeek));
        dtlDays.DataSource = tblDays;
        dtlDays.DataBind();
    }
    protected int GetPersianStartDay(int GStartDay)
    {
        switch (GStartDay)
        {
            case 1:
                return 3;
                break;
            case 2:
                return 4;
                break;
            case 3:
                return 5;
                break;
            case 4:
                return 6;
                break;
            case 5:
                return 7;
                break;
            case 6:
                return 1;
                break;
            case 0:
                return 2;
                break;
            default:
                return 0;
        }
    }
    public string GetPersianMonthName(int MonthNumber)
    {
        string MonthName;
        switch (MonthNumber)
        {
            case 1:
                MonthName = "فروردین";
                break;
            case 2:
                MonthName = "اردیبهشت";
                break;
            case 3:
                MonthName = "خرداد";
                break;
            case 4:
                MonthName = "تیر";
                break;
            case 5:
                MonthName = "مرداد";
                break;
            case 6:
                MonthName = "شهریور";
                break;
            case 7:
                MonthName = "مهر";
                break;
            case 8:
                MonthName = "آبان";
                break;
            case 9:
                MonthName = "آذر";
                break;
            case 10:
                MonthName = "دی";
                break;
            case 11:
                MonthName = "بهمن";
                break;
            case 12:
                MonthName = "اسفند";
                break;
            default:
                MonthName = "نامشخص";
                break;
        }
        return MonthName;
    }
    protected void btnPreYear_Click(object sender, ImageClickEventArgs e)
    {
        CurYear--;
        LoadDate();

    }
    protected void btnPreMonth_Click(object sender, ImageClickEventArgs e)
    {
        if (CurMonth == 1)
            CurMonth = 12;
        else
            CurMonth--;
        LoadDate();

    }
    protected void btnNextMonth_Click(object sender, ImageClickEventArgs e)
    {
        if (CurMonth == 12)
            CurMonth = 1;
        else
            CurMonth++;
        LoadDate();

    }
    protected void btnNextYear_Click(object sender, ImageClickEventArgs e)
    {
        CurYear++;
        LoadDate();

    }
}
