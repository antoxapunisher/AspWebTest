using DocumentFormat.OpenXml.Drawing.Diagrams;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

  
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnOpenPopUp_Click1(object sender, EventArgs e)
    {
        mpePopUp.Show();
       
     mybody.Style[HtmlTextWriterStyle.BackgroundColor] = " rgba(102, 102, 102, 0.9)";
        
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        mpePopUp.Hide();
        mybody.Style[HtmlTextWriterStyle.BackgroundColor] = "White";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        mpePopUp.Hide();
        mybody.Style[HtmlTextWriterStyle.BackgroundColor] = "White";
    }
}