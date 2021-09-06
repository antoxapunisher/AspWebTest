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
    
  

   </div>

    <form id="form1" runat="server" >
        <div  style="width:100%; height:30px;  margin: 0px 0px 0px 0px; padding: 20px 20px 0px 20px"  >
   <asp:Button runat="server" Text="Добавить" id="AddContact"  CssClass="Button"  />
    </div>
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
               PageSize ="5" Width="100%" MaxHeight="350">
               <Columns>
                   <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                   <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-HorizontalAlign="Center" />
                   <asp:BoundField DataField="MobilePhone" HeaderText="Mobile Phone" SortExpression="MobilePhone" ItemStyle-HorizontalAlign="Center" />
                   <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" ItemStyle-HorizontalAlign="Center"/>
                   <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Center" />
                   
                   <asp:ButtonField Text="Изменить" ButtonType="Button"   ControlStyle-CssClass="Button" />
                 <asp:ButtonField Text="Удалить" ButtonType="Button" ControlStyle-CssClass="Button"/>
                                      </Columns>

               <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
               <EditRowStyle BackColor="#9999999"  />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White"/>
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
               <PagerStyle BackColor="#284775"  ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#3333333" Font-Size="22px" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="3333333" />

           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Contacts]"></asp:SqlDataSource>
       </div>
        <asp:Button ID="btnOpenPopUp" runat="server" text="Open PopUp" OnClick="btnOpenPopUp_Click1" />
 
        <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
        <asp:ScriptManager runat="server"> </asp:ScriptManager>
        <ajaxToolkit:ModalPopupExtender ID="mpePopUp" runat="server" TargetControlID="lblHidden" PopupControlID="divPopUp" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
     
<div id="divPopUp" class="pnlBackGround" >
     <div id="Header" class="header">MyHeader</div>
     <div id="main" class="main">
         
     </div>
     <div id="buttons">
          <div id="DivbtnOK" class="buttonOK"><asp:Button id="btnOk" runat="server" text="Ok" OnClick="btnOk_Click" /></div>
          <div id="Divbtncancel" class="buttonOK"><asp:Button id="btnCancel" runat="server" text="Cancel" OnClick="btnCancel_Click" /></div>
     </div>
</div>
    
    </form>
        
</body>
</html5>
    
