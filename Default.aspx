<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #Text1 {
            height: 12px;
            width: 215px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
       <div>
           <asp:GridView
               ID="GridView1" runat="server"
               AutoGenerateColumns="False"
               CellPadding="4"
               DataKeyNames="Id"
               DataSourceID ="SqlDataSource1"
               ForeColor ="#333333"
               GridLines ="None"
               AllowPaging="True"
               PageSize ="5" Width="100%" Height="250">
               <Columns>
                   <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                   <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-HorizontalAlign="Center" />
                   <asp:BoundField DataField="MobilePhone" HeaderText="Mobile Phone" SortExpression="MobilePhone" ItemStyle-HorizontalAlign="Center" />
                   <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" ItemStyle-HorizontalAlign="Center"/>
                   <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Center" />
                   <asp:ButtonField Text="Изменить" ButtonType="Button" />
                   <asp:ButtonField Text="Удалить" ButtonType="Button" />
                                      </Columns>

               <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
               <EditRowStyle BackColor="#9999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White"/>
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#3333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="3333333" />

           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Contacts]"></asp:SqlDataSource>
       </div>


    </form>

 
</body>
</html>
