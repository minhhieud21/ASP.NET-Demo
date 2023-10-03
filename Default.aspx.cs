using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
 
namespace WebApplication
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class product
        {
           public int id;
           public string name;
           public int type;
           public int donvi;
           public string price;
           public string note;
        }
        [WebMethod]
        public static List<product> LoadDB()
        {
                List<product> products = new List<product>();
                    string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=product;Integrated Security=True";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string sql = "select * from sanpham where status = 1";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    product product = new product();
                                    product.id = reader.GetInt32(0);
                                    product.name = reader.GetString(1);
                                    product.type = reader.GetInt32(2);
                                    product.donvi = reader.GetInt32(3);
                                    product.price = reader.GetString(4);
                                    product.note = reader.GetString(5);
                                    products.Add(product);
                                }
                            return products;
                        }
                       }
            }
        }
        [WebMethod]
        public static void DeleteProduct(int id)
        {
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=product;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sql = "UPDATE sanpham SET Status = '0' WHERE Id = @id;";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.ExecuteNonQuery();
                }
            }
        }
        [WebMethod]
        public static void UpdateDB(product sanpham)
        {
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=product;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sql = "UPDATE sanpham SET Name = @Name, Type = @Type, Donvi = @Donvi, Price = @Price, Note = @Note, Status = @Status WHERE Id = @Id";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@Id", sanpham.id);
                    command.Parameters.AddWithValue("@Name", sanpham.name);
                    command.Parameters.AddWithValue("@Type", sanpham.type);
                    command.Parameters.AddWithValue("@Donvi", sanpham.donvi);
                    command.Parameters.AddWithValue("@Price", sanpham.price);
                    command.Parameters.AddWithValue("@Note", sanpham.note);
                    command.Parameters.AddWithValue("@Status", 1);
                    command.ExecuteNonQuery();
                }
            }
        }
        [WebMethod]
        public static void PushDB(product sanpham)
        {
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=product;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                int idcuoi = 1;
                string sql = "SELECT TOP 1 Id FROM sanpham ORDER BY Id DESC;";
                using (SqlCommand command1 = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command1.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            idcuoi = reader.GetInt32(0);
                        }
                    }
                    sql = "INSERT INTO sanpham (Id,Name,Type,Donvi,Price,Note,Status) VALUES (@Id,@Name,@Type,@Donvi,@Price,@Note,@Status)";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.Add("@Id", (idcuoi+1));
                        command.Parameters.Add("@Name", sanpham.name);
                        command.Parameters.Add("@Type", sanpham.type);
                        command.Parameters.Add("@Donvi", sanpham.donvi);
                        command.Parameters.Add("@Price", sanpham.price);
                        command.Parameters.Add("@Note", sanpham.note);
                        command.Parameters.Add("@Status", "1");
                        command.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}