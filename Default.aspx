<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Контакты" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html5 xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" title="Контакты">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/button.css" />
     <link rel="stylesheet" href="css/ModalWindow.css" />
    <style type="text/css">
        #Text1 {
            height: 12px;
            width: 215px;
        }
    </style>
</head>
<body id="mybody" runat="server"> 
    
    <div id="headerDiv" runat="server" style="margin: 0px 0px 20px 0px; vertical-align: top; background-color: #666699; height: 50px; top: -10px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #66FFFF; font-weight: bold;">
        <h1>Контакты</h1>
       
    </div>
    
  

 

    <form id="form1" runat="server" >
        <div  style="width:100%; height:30px;  margin: 0px 0px 0px 0px; padding: 20px 20px 0px 20px"  >
   <asp:Button runat="server" Text="Добавить" id="AddContact"  CssClass="Button" OnClick="AddContact_Click"  />
            
    </div>
       <div>
           <asp:GridView
               ID="GridView1" runat="server"
               AutoGenerateColumns="False"
               DataKeyNames="Id"
               DataSourceID ="SqlDataSource1"
               AllowPaging="True"
               PageSize ="5" Width="100%" MaxHeight="350" OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AllowSorting="True">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                 
                   <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                   <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                   </asp:BoundField>
                   <asp:BoundField DataField="MobilePhone" HeaderText="Mobile Phone" SortExpression="MobilePhone" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                   </asp:BoundField>
                   <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                   </asp:BoundField>
                   <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}">
                   
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                   </asp:BoundField>
                   
                   <asp:ButtonField Text="Изменить" runat="server" ButtonType="Button"  ControlStyle-CssClass="Button"  CommandName="EditBtn_Click1" >
<ControlStyle CssClass="Button"></ControlStyle>
                   </asp:ButtonField>
                
                     <asp:CommandField ShowDeleteButton="True" />
                                      </Columns>

               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />

               <RowStyle Font-Size="22px" BackColor="#F7F6F3" ForeColor="#333333" />

               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Contacts]" DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Contacts] ([Name], [MobilePhone], [JobTitle], [BirthDate]) VALUES (@Name, @MobilePhone, @JobTitle, @BirthDate)" UpdateCommand="UPDATE [Contacts] SET [Name] = @Name, [MobilePhone] = @MobilePhone, [JobTitle] = @JobTitle, [BirthDate] = @BirthDate WHERE [Id] = @Id">
               <DeleteParameters>
                   <asp:Parameter Name="Id" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="Name" Type="String" />
                   <asp:Parameter Name="MobilePhone" Type="String" />
                   <asp:Parameter Name="JobTitle" Type="String" />
                   <asp:Parameter DbType="Date" Name="BirthDate" />
               </InsertParameters>
               
               <UpdateParameters>
                   <asp:Parameter Name="Name" Type="String" />
                   <asp:Parameter Name="MobilePhone" Type="String" />
                   <asp:Parameter Name="JobTitle" Type="String" />
                   <asp:Parameter DbType="Date" Name="BirthDate" />
                   <asp:Parameter Name="Id" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
       </div>
        <asp:Button ID="btnOpenPopUp" runat="server" text="Open PopUp" OnClick="btnOpenPopUp_Click1" />
 
        <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
        <asp:ScriptManager runat="server"> </asp:ScriptManager>
        <ajaxToolkit:ModalPopupExtender ID="mpePopUp" runat="server" TargetControlID="lblHidden" PopupControlID="divPopUp" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
     
<div id="divPopUp" class="pnlBackGround" >
     <div id="Header" class="header">
         <asp:Label runat="server" ID="ModalHead"></asp:Label></div>
     <div id="main" class="main">
         <div>

             
             <asp:TextBox runat="server" ID="idTxt" Enabled="False" Visible="False"></asp:TextBox>
             <br />
                 <label>Name</label><asp:TextBox runat="server" ID="NameTxt"></asp:TextBox>
             <br />
                 <label>Mobile Phone</label>
             <asp:TextBox runat="server" ID="PhoneTxt"></asp:TextBox>
             <br />
               <label>Job Title</label>
             <asp:TextBox runat="server" ID="JobTxt"></asp:TextBox>
             <br />
               <label>Birth Date</label>
             <asp:TextBox runat="server" ID="BirthTxt"></asp:TextBox>
             <br />
            
         </div>
     </div>
     <div id="buttons">
          <div id="DivbtnOK" class="buttonOK"><asp:Button id="btnOk" runat="server" text="Ok" OnClick="btnOk_Click" /></div>
          <div id="Divbtncancel" class="buttonOK"><asp:Button id="btnCancel" runat="server" text="Cancel" OnClick="btnCancel_Click" /></div>
     </div>
</div>
      <asp:Label ID="ErrorOutput" runat="server" EnableViewState="false" />
    </form>
        
</body>
</html5>
    
