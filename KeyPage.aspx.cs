using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Курсовая_Веб
{
    enum State { Insert, Update, Select };
    public partial class KeyPage : System.Web.UI.Page
    {
        static State st = State.Select;
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }

        protected void ButtonAddProduct_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            st = State.Insert;
            TextNameProduct.Text = "";
            TextPriceProduct.Text = "";

        }

        protected void ButtonUpdProduct_Click(object sender, EventArgs e)
        {
            st = State.Update;
            Panel1.Visible = true;
            int si = GridView1.SelectedIndex;
            if (si < 0) return;
            TextIDProduct.Text = GridView1.Rows[si].Cells[1].Text;
            TextNameProduct.Text = GridView1.Rows[si].Cells[2].Text;
            TextPriceProduct.Text = GridView1.Rows[si].Cells[3].Text;
        }

        protected void ButtonDelProduct_Click(object sender, EventArgs e)
        {
            int si = GridView1.SelectedIndex;
            if (si < 0) return;
            TextIDProduct.Text = GridView1.Rows[si].Cells[1].Text;
            try 
            { 
            SqlDataSource1.Delete();
            }
            catch
            {
                //Для целостности данных нельзя удалять то, что имеет связи
                //Сначала надо удалить все покупки с этим товаром
            }

            Panel1.Visible = false;
        }

        protected void ButtonOKProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (st == State.Insert) SqlDataSource1.Insert();
                if (st == State.Update) SqlDataSource1.Update();
                st = State.Select;
                GridView1_SelectedIndexChanged(sender, e);
                Panel1.Visible = false;
            }
            catch (Exception)
            {
                //Что-то пошло не так
                //Данные корявые, например
            }
        }

        protected void ButtonCancelProduct_Click(object sender, EventArgs e)
        {
            st = State.Select;
            TextNameProduct.Text = "";
            TextPriceProduct.Text = "";
            Panel1.Visible = false;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int si = GridView1.SelectedIndex;
            if (si < 0) return;
            try
            {
                TextIDProduct.Text = GridView1.Rows[si].Cells[1].Text;
                SqlDataSource3.SelectCommand = "SELECT [Реализация_товаров].[Код_реализации], [Реализация_товаров].[Код_клиента], " +
                    "[Реализация_товаров].[Код_товара], Клиенты.ФИО AS Клиент, Товары.[Наименование_товара], Товары.[Цена_за_единицу_товара], " +
                    "[Реализация_товаров].Количество, [Реализация_товаров].Количество * Товары.[Цена_за_единицу_товара] AS Стоимость " +
                    "FROM ((Клиенты INNER JOIN [Реализация_товаров] ON Клиенты.[Код_клиента] = [Реализация_товаров].[Код_клиента]) " +
                    "INNER JOIN Товары ON [Реализация_товаров].[Код_товара] = Товары.[Код_товара]) " +
                    "WHERE Товары.[Код_товара] = " + Convert.ToInt32(TextIDProduct.Text);
                SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                DropProduct.SelectedValue = TextIDProduct.Text;
            }
            catch (Exception)
            {
                //На случай если поле пустое или есть непредвиденные ошибочки
            }
        }

        protected void ButtonAddClient_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            st = State.Insert;
            TextFIOClient.Text = "";
            TextAdresClient.Text = "";
        }

        protected void ButtonUpdClient_Click(object sender, EventArgs e)
        {
            st = State.Update;
            Panel2.Visible = true;
            int si = GridView4.SelectedIndex;
            if (si < 0) return;
            TextIDClient.Text = GridView4.Rows[si].Cells[1].Text;
            TextFIOClient.Text = GridView4.Rows[si].Cells[2].Text;
            TextAdresClient.Text = GridView4.Rows[si].Cells[3].Text;
        }

        protected void ButtonDelClient_Click(object sender, EventArgs e)
        {
            int si = GridView4.SelectedIndex;
            if (si < 0) return;
            TextIDClient.Text = GridView4.Rows[si].Cells[1].Text;
            try
            {
                SqlDataSource2.Delete();
            }
            catch
            {
                //Для целостности данных нельзя удалять то, что имеет связи
                //Сначала надо удалить все покупки с этим товаром
            }

            Panel2.Visible = false;

        }

        protected void ButtonOkClient_Click(object sender, EventArgs e)
        {
            try
            {
                if (st == State.Insert) SqlDataSource2.Insert();
                if (st == State.Update) SqlDataSource2.Update();
                st = State.Select;
                GridView4_SelectedIndexChanged(sender, e);
                Panel2.Visible = false;
            }
            catch (Exception)
            {
                //Что-то пошло не так
                //Данные корявые, например
            }
        }

        protected void ButtonCancelClient_Click(object sender, EventArgs e)
        {
            st = State.Select;
            TextFIOClient.Text = "";
            TextAdresClient.Text = "";
            Panel2.Visible = false;
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            int si4 = GridView4.SelectedIndex;
            int si1 = GridView1.SelectedIndex;
            if (si4 < 0) return;
            try
            {
                if (si1 < 0)
                {
                    TextIDClient.Text = GridView4.Rows[si4].Cells[1].Text;
                    SqlDataSource3.SelectCommand = "SELECT [Реализация_товаров].[Код_реализации], [Реализация_товаров].[Код_клиента], " +
                        "[Реализация_товаров].[Код_товара], Клиенты.ФИО AS Клиент, Товары.[Наименование_товара], Товары.[Цена_за_единицу_товара], " +
                        "[Реализация_товаров].Количество, [Реализация_товаров].Количество * Товары.[Цена_за_единицу_товара] AS Стоимость " +
                        "FROM ((Клиенты INNER JOIN [Реализация_товаров] ON Клиенты.[Код_клиента] = [Реализация_товаров].[Код_клиента]) " +
                        "INNER JOIN Товары ON [Реализация_товаров].[Код_товара] = Товары.[Код_товара]) " +
                        "WHERE Клиенты.[Код_клиента] = " + Convert.ToInt32(TextIDClient.Text);
                    SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                    DropClient.SelectedValue = TextIDClient.Text;
                }
                else
                {
                    TextIDProduct.Text = GridView1.Rows[si1].Cells[1].Text;
                    TextIDClient.Text = GridView4.Rows[si4].Cells[1].Text;
                    SqlDataSource3.SelectCommand = "SELECT [Реализация_товаров].[Код_реализации], [Реализация_товаров].[Код_клиента], " +
                        "[Реализация_товаров].[Код_товара], Клиенты.ФИО AS Клиент, Товары.[Наименование_товара], Товары.[Цена_за_единицу_товара], " +
                        "[Реализация_товаров].Количество, [Реализация_товаров].Количество * Товары.[Цена_за_единицу_товара] AS Стоимость " +
                        "FROM ((Клиенты INNER JOIN [Реализация_товаров] ON Клиенты.[Код_клиента] = [Реализация_товаров].[Код_клиента]) " +
                        "INNER JOIN Товары ON [Реализация_товаров].[Код_товара] = Товары.[Код_товара]) " +
                        "WHERE Клиенты.[Код_клиента] = " + Convert.ToInt32(TextIDClient.Text) + 
                        " AND Товары.[Код_товара] =" + Convert.ToInt32(TextIDProduct.Text);
                    SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                    DropClient.SelectedValue = TextIDClient.Text;
                    DropProduct.SelectedValue = TextIDProduct.Text;
                }

            }
            catch (Exception)
            {
                //На случай если поле пустое или есть непредвиденные ошибочки
            }
        }

        protected void ButtonClearPr_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
        }

        protected void ButtonAddReal_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            st = State.Insert;
            TextCount.Text = "";
        }

        protected void ButtonUpdReal_Click(object sender, EventArgs e)
        {
            st = State.Update;
            Panel3.Visible = true;
            int si = GridView3.SelectedIndex;
            if (si < 0) return;
            TextIDReal.Text = GridView3.Rows[si].Cells[1].Text;
            DropClient.SelectedValue = GridView3.Rows[si].Cells[2].Text;
            DropProduct.SelectedValue = GridView3.Rows[si].Cells[3].Text;
            TextCount.Text = GridView3.Rows[si].Cells[7].Text;
        }

        protected void ButtonDelReal_Click(object sender, EventArgs e)
        {
            int si = GridView3.SelectedIndex;
            if (si < 0) return;
            TextIDReal.Text = GridView3.Rows[si].Cells[1].Text;
            try
            {
                SqlDataSource3.Delete();
            }
            catch
            {
                //Для целостности данных нельзя удалять то, что имеет связи
                //Сначала надо удалить все покупки с этим товаром
            }

            Panel2.Visible = false;
        }

        protected void ButtonOkReal_Click(object sender, EventArgs e)
        {
            try
            {
                if (st == State.Insert) SqlDataSource3.Insert();
                if (st == State.Update) SqlDataSource3.Update();
                st = State.Select;

                Panel3.Visible = false;
            }
            catch (Exception)
            {
                //Что-то пошло не так
                //Данные корявые, например
            }
        }

        protected void ButtonCancelReal_Click(object sender, EventArgs e)
        {
            st = State.Select;
            TextCount.Text = "";
            Panel3.Visible = false;
        }
    }
}