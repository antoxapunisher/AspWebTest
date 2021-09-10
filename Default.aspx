<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Контакты" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html5 xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server" title="Контакты">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link rel="stylesheet" href="css/button.css" />
        <link rel="stylesheet" href="css/ModalWindow.css" />
    </head>
    <body id="mybody" runat="server" style="width: 95%">
        <div id="headerDiv" runat="server"
            style="margin: 0px 0px 20px 0px; padding-left: 10px; vertical-align: top; background-color: #666699; height: 50px; top: -10px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #66FFFF; font-weight: bold; box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22); border-radius: 4px">
            <h1>Контакты</h1>
        </div>
        <form id="form1" runat="server" style="box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22); width: 100%; display: inline-block;">
            <div style="width: 100%; height: 30px; margin: 0px 0px 0px 0px; padding: 20px 20px 0px 20px">
                <asp:Button runat="server" Text="Добавить" ID="AddContact"
                    CssClass="Button" OnClick="AddContact_Click" />
            </div>
            <div>
                <asp:GridView
                    ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="Id"
                    DataSourceID="SqlDataSource1"
                    AllowPaging="True"
                    PageSize="5" Width="100%" MaxHeight="100%" OnRowCommand="GridView1_RowCommand"
                    CellPadding="4" ForeColor="#333333" GridLines="None"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#284775" BorderColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id"
                            InsertVisible="False" ReadOnly="True" SortExpression="Id"
                            ControlStyle-CssClass="idBound" ItemStyle-CssClass="idBound"
                            HeaderStyle-CssClass="idBound">
                            <ControlStyle CssClass="idBound" ForeColor="#336699"></ControlStyle>
                            <HeaderStyle CssClass="idBound" ForeColor="#5D7B9D"></HeaderStyle>
                            <ItemStyle CssClass="idBound" ForeColor="#F7F6F3"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Имя"
                            SortExpression="Name" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="MobilePhone" HeaderText="Номер телефона"
                            SortExpression="MobilePhone" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="JobTitle" HeaderText="Должность"
                            SortExpression="JobTitle" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="BirthDate" HeaderText="Дата рождения"
                            SortExpression="BirthDate" ItemStyle-HorizontalAlign="Center"
                            DataFormatString="{0:d}">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:ButtonField Text="Изменить" runat="server"
                            ButtonType="Button" ControlStyle-CssClass="Button"
                            CommandName="EditBtn_Click1"></asp:ButtonField>
                        <asp:ButtonField Text="Удалить" runat="server"
                            ButtonType="Button"
                            ControlStyle-CssClass="Button"
                            CommandName="DeleteBtn_Click1"></asp:ButtonField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336699" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle Font-Size="22px" BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Contacts]"
                    DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @Id"
                    InsertCommand="INSERT INTO [Contacts] ([Name], [MobilePhone], [JobTitle], [BirthDate]) VALUES (@Name, @MobilePhone, @JobTitle, @BirthDate)"
                    UpdateCommand="UPDATE [Contacts] SET [Name] = @Name, [MobilePhone] = @MobilePhone, [JobTitle] = @JobTitle, [BirthDate] = @BirthDate WHERE [Id] = @Id">
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
            <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <ajaxToolkit:ModalPopupExtender ID="mpePopUp" runat="server"
                TargetControlID="lblHidden" PopupControlID="divPopUp"
                BackgroundCssClass="modalBackground">
            </ajaxToolkit:ModalPopupExtender>

            <div id="divPopUp" runat="server" class="pnlBackGround">
                <div id="Header" class="header">
                    <asp:Label runat="server" ID="ModalHead"></asp:Label>
                    <div id="Divbtncancel" style="float: right; right: 20px">
                        <asp:Button ID="btnCancel" runat="server" class="buttonCancel"
                            Text="x" OnClick="btnCancel_Click" />
                    </div>
                </div>
                <asp:TextBox runat="server" ID="idTxt" Enabled="True"
                    Visible="false">
                </asp:TextBox>
                <br />
                <div id="main" class="main">
                    <div style="height: 15%">
                        <div style="float: left; width: 30%">
                            <label>Имя:</label>

                        </div>
                        <div style="float: left; width: 70%">
                            <asp:TextBox runat="server" Width="50%" ID="NameTxt"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="ReQFV1"
                                runat="server" ControlToValidate="NameTxt"
                                Font-Size="Small"
                                ValidationGroup="UserInfoGroup"
                                SetFocusOnError="true"
                                ErrorMessage="Заполните поле"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="height: 15%">
                        <div style="float: left; width: 30%">
                            <label>Номер телефона:</label>
                        </div>
                        <div style="float: left; width: 70%">
                            <label style="font-size: unset">+375</label>
                            <asp:TextBox runat="server" Width="39%" ID="PhoneTxt"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regularvalidate" runat="server"
                                ValidationExpression="\d+"
                                ControlToValidate="PhoneTxt" Font-Size="Small"
                                ValidationGroup="UserInfoGroup"
                                Text="Не корректный формат"
                                Display="Dynamic" ForeColor="Red"
                                SetFocusOnError="true" />
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1"
                                Font-Size="Small"
                                SetFocusOnErroДарьr="true"
                                runat="server" ControlToValidate="PhoneTxt"
                                ValidationGroup="UserInfoGroup"
                                ErrorMessage="Заполните поле"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="height: 15%; margin-top: 5px;">
                        <div style="float: left; width: 30%">
                            <label>Должность:</label>
                        </div>
                        <div style="float: left; width: 70%">
                            <asp:TextBox runat="server" Width="50%" ID="JobTxt"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                Font-Size="Small"
                                SetFocusOnError="true"
                                runat="server" ControlToValidate="JobTxt"
                                ValidationGroup="UserInfoGroup"
                                ErrorMessage="Заполните поле"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="height: 25%">
                        <div style="float: left; width: 30%">
                            <label>Дата рождения:</label>
                        </div>
                        <div style="float: left; width: 70%">
                            <label>Год</label>
                            <asp:DropDownList runat="server" ID="DropdownList1">
                                <asp:ListItem Selected="true">1970</asp:ListItem>
                            </asp:DropDownList>
                            <label>Месяц</label>
                            <asp:DropDownList runat="server" ID="DropdownList2">
                                <asp:ListItem Selected="true">01</asp:ListItem>
                            </asp:DropDownList>
                            <label>День</label>
                            <asp:DropDownList runat="server" ID="DropdownList3">
                                <asp:ListItem Selected="true">01</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div style="float: left; font-size: large; width: 30%; height: 50%">
                        <div id="buttons" style="float: left; position: absolute; bottom: 0;">
                            <div id="DivbtnOK" style="float: left;" class="buttonOK">
                                <asp:Button ID="btnOk" ValidationGroup="UserInfoGroup" runat="server" Text="Ok"
                                    OnClick="btnOk_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Label ID="ErrorOutput" runat="server"
                EnableViewState="false" />
        </form>
    </body>
</html5>

