using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace JuristicGame.sql
{
    public class BusinessObject
    {
        //Data Source=LTZWICKY01;Initial Catalog=QuizDB;Integrated Security=True
        // Server =.\LTZWICKY01; Database = QuizDB; Trusted_Connection = True;
        protected static String connectionString = @"Data Source=LTZWICKY01;Initial Catalog=QuizDB;Integrated Security=True;";

        public SqlConnection GetConnection()
        {
            // db connection
            SqlConnection conn = new SqlConnection(connectionString);
            return conn;
        }

        protected Boolean ExecuteStoredProcedure(SqlCommand cmd)
        {
            bool insertSuccess = false;
            cmd.Connection.Open();

            // set type and execute
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();

            insertSuccess = dr.HasRows;

            //close reader and connection
            dr.Close();
            cmd.Connection.Close();

            return insertSuccess;
        }
    }
}