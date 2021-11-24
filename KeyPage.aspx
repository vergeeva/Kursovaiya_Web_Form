<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeyPage.aspx.cs" Inherits="Курсовая_Веб.KeyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 246px;
        }
        .auto-style2 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style1">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Код_товара" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" InsertVisible="False" ReadOnly="True" SortExpression="Код_товара" />
                                <asp:BoundField DataField="Наименование_товара" HeaderText="Наименование_товара" SortExpression="Наименование_товара" />
                                <asp:BoundField DataField="Цена_за_единицу_товара" HeaderText="Цена_за_единицу_товара" SortExpression="Цена_за_единицу_товара" />
                            </Columns>
                            <SelectedRowStyle BackColor="#FFFF66" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VariantConnectionString %>" DeleteCommand="DELETE FROM Товары WHERE ([Код_товара] = ?)" InsertCommand="INSERT INTO Товары([Наименование_товара], [Цена_за_единицу_товара]) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:VariantConnectionString.ProviderName %>" SelectCommand="SELECT [Код_товара], [Наименование_товара], [Цена_за_единицу_товара] FROM [Товары] ORDER BY [Наименование_товара]" UpdateCommand="UPDATE Товары SET [Наименование_товара] = ?, [Цена_за_единицу_товара] = ? WHERE ([Код_товара] = ?)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="TextIDProduct" Name="?" PropertyName="Text" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TextNameProduct" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextPriceProduct" Name="?" PropertyName="Text" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="TextNameProduct" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextPriceProduct" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextIDProduct" Name="?" PropertyName="Text" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAddProduct" runat="server" OnClick="ButtonAddProduct_Click" Text="Добавить" Width="184px" />
                        <br />
                        <asp:Button ID="ButtonUpdProduct" runat="server" OnClick="ButtonUpdProduct_Click" Text="Изменить" Width="184px" />
                        <br />
                        <asp:Button ID="ButtonDelProduct" runat="server" OnClick="ButtonDelProduct_Click" Text="Удалить" Width="184px" />
                        <asp:Panel ID="Panel1" runat="server" Height="167px">
                            Наименование<br />
                            <asp:TextBox ID="TextNameProduct" runat="server" Width="171px"></asp:TextBox>
                            <br />
                            Цена за единицу<br />
                            <asp:TextBox ID="TextPriceProduct" runat="server" Width="172px"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextIDProduct" runat="server" Enabled="False" Visible="False" Width="171px"></asp:TextBox>
                            <br />
                            <asp:Button ID="ButtonOKProduct" runat="server" OnClick="ButtonOKProduct_Click" Text="Окей" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ButtonCancelProduct" runat="server" OnClick="ButtonCancelProduct_Click" Text="Отмена" />
                        </asp:Panel>
                        <asp:Button ID="ButtonClearPr" runat="server" OnClick="ButtonClearPr_Click" Text="Очистить выделение" Width="184px" />
                    </td>
                    <td>
                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Код_клиента" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                <asp:BoundField DataField="Код_клиента" HeaderText="Код_клиента" InsertVisible="False" ReadOnly="True" SortExpression="Код_клиента" />
                                <asp:BoundField DataField="ФИО" HeaderText="ФИО" SortExpression="ФИО" />
                                <asp:BoundField DataField="Домашний_адрес" HeaderText="Домашний_адрес" SortExpression="Домашний_адрес" />
                            </Columns>
                            <SelectedRowStyle BackColor="#CCFF66" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VariantConnectionString %>" DeleteCommand="DELETE FROM Клиенты WHERE ([Код_клиента] = ?)" InsertCommand="INSERT INTO Клиенты(ФИО, [Домашний адрес]) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:VariantConnectionString.ProviderName %>" SelectCommand="SELECT [Код_клиента], [ФИО], [Домашний адрес] AS Домашний_адрес FROM [Клиенты] ORDER BY [ФИО]" UpdateCommand="UPDATE Клиенты SET ФИО = ?, [Домашний адрес] = ? WHERE ([Код_клиента] = ?)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="TextIDClient" Name="?" PropertyName="Text" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TextFIOClient" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextAdresClient" Name="?" PropertyName="Text" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="TextFIOClient" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextAdresClient" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextIDClient" Name="?" PropertyName="Text" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAddClient" runat="server" OnClick="ButtonAddClient_Click" Text="Добавить" Width="184px" />
                        <br />
                        <asp:Button ID="ButtonUpdClient" runat="server" OnClick="ButtonUpdClient_Click" Text="Изменить" Width="184px" />
                        <br />
                        <asp:Button ID="ButtonDelClient" runat="server" OnClick="ButtonDelClient_Click" Text="Удалить" Width="184px" />
                        <asp:Panel ID="Panel2" runat="server" Height="220px">
                            ФИО клиента<br />
                            <asp:TextBox ID="TextFIOClient" runat="server" Width="171px"></asp:TextBox>
                            <br />
                            Домашний адрес<br />
                            <asp:TextBox ID="TextAdresClient" runat="server" Height="68px" Width="172px"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextIDClient" runat="server" Enabled="False" Visible="False" Width="171px"></asp:TextBox>
                            <br />
                            <asp:Button ID="ButtonOkClient" runat="server" OnClick="ButtonOkClient_Click" Text="Окей" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ButtonCancelClient" runat="server" OnClick="ButtonCancelClient_Click" Text="Отмена" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                <asp:BoundField DataField="Код_реализации" HeaderText="Код_реализации" InsertVisible="False" SortExpression="Код_реализации" />
                                <asp:BoundField DataField="Код_клиента" HeaderText="Код_клиента" SortExpression="Код_клиента" />
                                <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" SortExpression="Код_товара" />
                                <asp:BoundField DataField="Клиент" HeaderText="Клиент" SortExpression="Клиент" />
                                <asp:BoundField DataField="Наименование_товара" HeaderText="Наименование_товара" SortExpression="Наименование_товара" />
                                <asp:BoundField DataField="Цена_за_единицу_товара" HeaderText="Цена_за_единицу_товара" SortExpression="Цена_за_единицу_товара" />
                                <asp:BoundField DataField="Количество" HeaderText="Количество" SortExpression="Количество" />
                                <asp:BoundField DataField="Стоимость" HeaderText="Стоимость" ReadOnly="True" SortExpression="Стоимость" />
                            </Columns>
                            <SelectedRowStyle BackColor="#FFCCFF" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:VariantConnectionString %>" DeleteCommand="DELETE FROM [Реализация_товаров] WHERE ([Код_реализации] = ?)" InsertCommand="INSERT INTO [Реализация_товаров] ([Код_клиента], [Код_товара], Количество) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:VariantConnectionString.ProviderName %>" SelectCommand="SELECT [Реализация_товаров].[Код_реализации], [Реализация_товаров].[Код_клиента], [Реализация_товаров].[Код_товара], Клиенты.ФИО AS Клиент, Товары.[Наименование_товара], Товары.[Цена_за_единицу_товара], [Реализация_товаров].Количество, [Реализация_товаров].Количество * Товары.[Цена_за_единицу_товара] AS Стоимость FROM ((Клиенты INNER JOIN [Реализация_товаров] ON Клиенты.[Код_клиента] = [Реализация_товаров].[Код_клиента]) INNER JOIN Товары ON [Реализация_товаров].[Код_товара] = Товары.[Код_товара])" UpdateCommand="UPDATE [Реализация_товаров] SET [Код_клиента] = ?, [Код_товара] = ?, Количество = ? WHERE ([Код_реализации] = ?)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="TextIDReal" Name="?" PropertyName="Text" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="DropClient" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropProduct" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TextCount" Name="?" PropertyName="Text" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="DropClient" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropProduct" Name="?" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TextCount" Name="?" PropertyName="Text" />
                                <asp:ControlParameter ControlID="TextIDReal" Name="?" PropertyName="Text" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAddReal" runat="server" OnClick="ButtonAddReal_Click" Text="Добавить" Width="184px" />
                        <br />
                        <asp:Button ID="ButtonUpdReal" runat="server" OnClick="ButtonUpdReal_Click" Text="Изменить" Width="184px" />
                        <br />
                        <asp:Button ID="ButtonDelReal" runat="server" OnClick="ButtonDelReal_Click" Text="Удалить" Width="184px" />
                        <asp:Panel ID="Panel3" runat="server">
                            Выберите клиента:<br />
                            <asp:DropDownList ID="DropClient" runat="server" DataSourceID="SqlDataSource4" DataTextField="ФИО" DataValueField="Код_клиента" Height="29px" Width="199px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:VariantConnectionString %>" ProviderName="<%$ ConnectionStrings:VariantConnectionString.ProviderName %>" SelectCommand="SELECT [Код_клиента], [ФИО] FROM [Клиенты]"></asp:SqlDataSource>
                            Выберите товар:<br />
                            <asp:DropDownList ID="DropProduct" runat="server" DataSourceID="SqlDataSource5" DataTextField="Наименование_товара" DataValueField="Код_товара" Height="23px" Width="199px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:VariantConnectionString %>" ProviderName="<%$ ConnectionStrings:VariantConnectionString.ProviderName %>" SelectCommand="SELECT [Код_товара], [Наименование_товара] FROM [Товары]"></asp:SqlDataSource>
                            Количество товара:<br />
                            <asp:TextBox ID="TextCount" runat="server" Width="171px"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextIDReal" runat="server" Enabled="False" Width="171px" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Button ID="ButtonOkReal" runat="server" Text="Окей" OnClick="ButtonOkReal_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ButtonCancelReal" runat="server" Text="Отмена" OnClick="ButtonCancelReal_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
