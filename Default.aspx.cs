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

        PhoneTxt.MaxLength = 9;
        BirthTxt.MaxLength = 10;
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
       

        if (btnOk.Text == "Добавить")
        {
            try
            {
                SqlCommand command = new SqlCommand("INSERT INTO Contacts (Name, MobilePhone, JobTitle, BirthDate) VALUES (@Name, @MobilePhone, @JobTitle, @BirthDate)", _connection);
                // Инициализация переменных в запросе.
                command.Parameters.AddWithValue("Name", NameTxt.Text);
                command.Parameters.AddWithValue("MobilePhone", PhoneTxt.Text);
                command.Parameters.AddWithValue("JobTitle", JobTxt.Text);
                command.Parameters.AddWithValue("BirthDate", BirthTxt.Text);
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
                SqlCommand command = new SqlCommand("UPDATE Contacts SET Name = @Name, MobilePhone = @MobilePhone, JobTitle = @JobTitle, BirthDate = @BirthDate WHERE Id = @Id", _connection);
                command.Parameters.AddWithValue("Name", NameTxt.Text);
                char mp = Convert.ToChar(PhoneTxt.Text);
                command.Parameters.AddWithValue("MobilePhone", mp);
                command.Parameters.AddWithValue("JobTitle", JobTxt.Text);
                DateTime ExpiryDate = DateTime.ParseExact(BirthTxt.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
              command.Parameters.AddWithValue("BirthDate", ExpiryDate);
                command.Parameters.AddWithValue("Id", idTxt.Text);
                command.ExecuteNonQuery();
                mpePopUp.Hide();
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
        BirthTxt.Text = string.Empty;

    }
   
    protected void DeleteBtn_Click1(object sender, EventArgs e)
    {
        
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
            BirthTxt.Text = birth;
        }

        
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        String idtext = GridView1.SelectedRow.Cells[0].Text;
        idTxt.Text = idtext;
    }
}