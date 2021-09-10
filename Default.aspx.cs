using DocumentFormat.OpenXml.Drawing.Diagrams;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Windows.Forms;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection _connection;
    protected void Page_Load(object sender, EventArgs e)
    {

       // Скрытие модального окна.
        divPopUp.Visible = false;

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        // Настройка объекта подключения к базе и открытие подключения.
        _connection = new SqlConnection(connectionString);
        _connection.Open();

        
        NameTxt.MaxLength = 40;
        JobTxt.MaxLength = 60;
        PhoneTxt.MaxLength = 9;


        //Добавление данных для выбора даты рождения.
        if (!Page.IsPostBack)
        {

            // Год.
            for (int i = 1971; i <= 2003; i++)
            {
                DropdownList1.Items.Add(i.ToString());

            }

            //Месяц.
            for (int i = 2; i <= 12; i++)
            {
                if (i <= 9)
                {
                    DropdownList2.Items.Add("0" + i.ToString());
                }
                else
                {
                    DropdownList2.Items.Add(i.ToString());
                }


            }

             // День. 
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
        if(Page.IsValid)
        { 
        if (btnOk.Text == "Добавить")
        {
            try
            {
                string dater = DropdownList1.Text + "-" + DropdownList2.Text + "-" + DropdownList3.Text;
                SqlCommand command = new SqlCommand("INSERT INTO Contacts (Name, MobilePhone, JobTitle, BirthDate) VALUES (@Name, @MobilePhone, @JobTitle, @BirthDate)", _connection);
                command.Parameters.AddWithValue("Name", NameTxt.Text);
                command.Parameters.AddWithValue("MobilePhone","+375" + PhoneTxt.Text);
                command.Parameters.AddWithValue("JobTitle", JobTxt.Text);
                command.Parameters.AddWithValue("BirthDate", dater);      
                command.ExecuteNonQuery();
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
                SqlCommand command = new SqlCommand("UPDATE Contacts SET Name=N'"+ NameTxt.Text+"', MobilePhone=N'"+"+375"+PhoneTxt.Text+"', JobTitle=N'"+JobTxt.Text+"', BirthDate=N'"+dater+ "' WHERE Id='"+idTxt.Text+"'", _connection);              
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorOutput.Text = "Error:<br />" + ex.Message;
                ErrorOutput.ForeColor = Color.Red;
            }
        }
        
            mpePopUp.Hide();
            divPopUp.Visible = false;

            // Обновдение данных  в GridView.
            SqlDataSource1.UpdateCommand = "Select * from Contacts";
            SqlDataSource1.Update();
            GridView1.DataSourceID = "SqlDataSource1";

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {      
            mpePopUp.Hide();
            divPopUp.Visible = false;
        }
       

        
    }

    
    protected void AddContact_Click(object sender, EventArgs e)
    {
        mpePopUp.Show();
        divPopUp.Visible = true;
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
        int RowIndex;
        RowIndex = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName=="EditBtn_Click1")
        {  
            mpePopUp.Show();
            divPopUp.Visible = true;
            ModalHead.Text = "Редактировать контакт";
            
            GridViewRow row = GridView1.SelectedRow;
            string idtext = GridView1.Rows[RowIndex].Cells[0].Text; 
            string name = GridView1.Rows[RowIndex].Cells[1].Text;
            string number = GridView1.Rows[RowIndex].Cells[2].Text;
            string job = GridView1.Rows[RowIndex].Cells[3].Text;
            string birth = GridView1.Rows[RowIndex].Cells[4].Text;
            
            idTxt.Text =idtext;
            NameTxt.Text = name;
            PhoneTxt.Text = number.Substring(4).Trim();
            JobTxt.Text = job;

            // Данные для даты рождения.
            DropdownList1.Text = birth.Substring(0, birth.Length - 6);
            DropdownList2.Text = birth[5].ToString()+birth[6].ToString();
            DropdownList3.Text = birth.Substring(8);
        }

        if (e.CommandName == "DeleteBtn_Click1")
        {
            if (System.Windows.Forms.MessageBox.Show("Выдействительно хотите удалить контакт?", "Удаление", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1, MessageBoxOptions.ServiceNotification) != System.Windows.Forms.DialogResult.Cancel)
            {
                try
                {
                    string idtext = GridView1.Rows[RowIndex].Cells[0].Text;
                    SqlCommand command = new SqlCommand("DELETE FROM Contacts WHERE ID=@UserId", _connection);

                    // Инициализация переменных в запросе.
                    command.Parameters.AddWithValue("UserID", idtext);
                    SqlDataSource1.UpdateCommand = "Select * from Contacts";
                    SqlDataSource1.Update();
                    GridView1.DataSourceID = "SqlDataSource1";

                    // Выполнение запроса. Метод ExecuteNonQuery возвращает количество удаленных в базе строк.
                    int affectedRows = command.ExecuteNonQuery();

                    // Добавление в ответ пользователю тега скрипт, в котором с помощью javascript функции alert выводиться сообщение.
                    string script = string.Format("alert('Удалено {0} контакт');", affectedRows);
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
                }
                catch (Exception ex)
                {
                    ErrorOutput.Text = "Error:<br />" + ex.Message;
                    ErrorOutput.ForeColor = Color.Red;
                }
                return;
            }
            
        }


    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        String idtext = GridView1.SelectedRow.Cells[0].Text;
        idTxt.Text = idtext;
    }
    }
