using DocumentFormat.OpenXml.Drawing.Diagrams;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection _connection;
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        // Настройка объекта подключения к базе и открытие подключения.
        _connection = new SqlConnection(connectionString);
        _connection.Open();

       PhoneTxt.MaxLength = 12;

        if (!Page.IsPostBack)
        {
            for (int i =1971; i <= 2003 ; i++)
            {
                DropdownList1.Items.Add(i.ToString());

            }
            for (int i = 2; i <= 12; i++)
            {
                if(i<=9)
                {
                    DropdownList2.Items.Add("0"+i.ToString());
                }
                else
                {
                    DropdownList2.Items.Add(i.ToString());
                }
          

            }
            for (int i = 2; i <= 31; i++)
            {
               
                if (i <= 9)
                {
                    DropdownList3.Items.Add("0" + i.ToString());
                }
                else
                {
                    DropdownList3.Items.Add(i.ToString());
                }

            }
        }

            }

  
   

    protected void btnOk_Click(object sender, EventArgs e)
    {
       // mybody.Style[HtmlTextWriterStyle.BackgroundColor] = " rgba(102, 102, 102, 0.9)";

        if (btnOk.Text == "Добавить")
        {
            try
            {
                string dater = DropdownList1.Text + "-" + DropdownList2.Text + "-" + DropdownList3.Text;
                SqlCommand command = new SqlCommand("INSERT INTO Contacts (Name, MobilePhone, JobTitle, BirthDate) VALUES (@Name, @MobilePhone, @JobTitle, @BirthDate)", _connection);
                // Инициализация переменных в запросе.
                command.Parameters.AddWithValue("Name", NameTxt.Text);
                command.Parameters.AddWithValue("MobilePhone", PhoneTxt.Text);
                command.Parameters.AddWithValue("JobTitle", JobTxt.Text);
                command.Parameters.AddWithValue("BirthDate", dater);
                // Выполнение запроса.
                command.ExecuteNonQuery();
                mpePopUp.Hide();
            }
            catch (Exception ex)
            {
                ErrorOutput.Text = "Error:<br />" + ex.Message;
                ErrorOutput.ForeColor = Color.Red;
            }
        }
        else if (btnOk.Text == "Сохранить")
        {
            try {
                string dater = DropdownList1.Text+"-"+ DropdownList2.Text+"-"+DropdownList3.Text;
                SqlCommand command = new SqlCommand("UPDATE Contacts SET Name=N'"+ NameTxt.Text+"', MobilePhone=N'"+PhoneTxt.Text+"', JobTitle=N'"+JobTxt.Text+"', BirthDate=N'"+dater+ "' WHERE Id='"+idTxt.Text+"'", _connection);                command.ExecuteNonQuery();
              
                mpePopUp.Hide();
                SqlDataSource1.UpdateCommand = "Select * from Contacts";
                SqlDataSource1.Update();
                GridView1.DataSourceID = "SqlDataSource1";
            }
            catch (Exception ex)
            {
                ErrorOutput.Text = "Error:<br />" + ex.Message;
                ErrorOutput.ForeColor = Color.Red;
            }
            }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        mpePopUp.Hide();
        mybody.Style[HtmlTextWriterStyle.BackgroundColor] = "White";
    }

    protected void AddContact_Click(object sender, EventArgs e)
    {
        mpePopUp.Show();
        ModalHead.Text = "Добавить контакт";
        btnOk.Text = "Добавить";
        idTxt.Text = string.Empty;
        NameTxt.Text = string.Empty;
        PhoneTxt.Text = string.Empty;
        JobTxt.Text = string.Empty;
        DropdownList1.Text = DropdownList1.Items[0].Value;
        DropdownList2.Text = DropdownList2.Items[0].Value;
        DropdownList3.Text = DropdownList3.Items[0].Value;
    }




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        btnOk.Text = "Сохранить";
        
        if (e.CommandName=="EditBtn_Click1")
        {  
            int RowIndex;
            RowIndex = Convert.ToInt32(e.CommandArgument);
            mpePopUp.Show();
            ModalHead.Text = "Редактировать контакт";
            GridViewRow row = GridView1.SelectedRow;
            string idtext = GridView1.Rows[RowIndex].Cells[0].Text; //Gets column
            string name = GridView1.Rows[RowIndex].Cells[1].Text;
            string number = GridView1.Rows[RowIndex].Cells[2].Text;
            string job = GridView1.Rows[RowIndex].Cells[3].Text;
            string birth = GridView1.Rows[RowIndex].Cells[4].Text;
            idTxt.Text =idtext;
            NameTxt.Text = name;
            PhoneTxt.Text = number;
            JobTxt.Text = job;


            DropdownList1.Text = birth.Substring(0, birth.Length - 6);
            DropdownList2.Text = birth[5].ToString()+birth[6].ToString();
            DropdownList3.Text = birth.Substring(8);
        }

        
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        String idtext = GridView1.SelectedRow.Cells[0].Text;
        idTxt.Text = idtext;
    }

    bool ArgsValidation(out int x)
    {
        bool xIsCorrect = Int32.TryParse(PhoneTxt.Text, out x);
        
        if (!(xIsCorrect))
        {
ErrorOutput.Text="Ошибка";
            return true;
        }
        return false;
    }
    protected void PhoneTxt_TextChanged(object sender, EventArgs e)
    {
        int x;

        if (ArgsValidation(out x))
        {
            return;
        }

    }

    //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    int value;
    //    if (Int32.TryParse(args.Value, out value))
    //    {
    //        if (value != 0)
    //        {
    //            args.IsValid = true;
    //        }
    //        else
    //        {
    //            args.IsValid = false;
    //            (source as Label).Text = "Значение должно быть цифрами ";
    //        }
    //    }
    //    else
    //    {
    //        args.IsValid = false;
    //        (source as Label).Text = "Введите номер";
    //    }
    //}
}
