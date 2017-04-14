using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// This object includes all methods used to talk to the database.
/// </summary>
public class dboperations
{

    //variable declaration
    public static SqlConnection con;
    public static String cs;

    //constructor to initialize those variables.
    public dboperations()
    {
        
    }

    //verify if customer account exists.
    public static int GetOneInt(string sql)
    {
        cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        con = new SqlConnection(cs);

        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);

        try
        {
            int value = (int)cmd.ExecuteScalar();

            con.Close();

            return value;
        }
        catch (Exception err)
        {
            err.ToString();
            return -9999;
        }
        finally
        {
            con.Close();
        }
    }//end of GetOneInt()


    //function to create customer account.
    public static Boolean CreateCustomer(string FirstName, string LastName, string Address, string City, string State, string Zip, string Phone, string Email,string Password, Boolean Platinum)
    {
        cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
        con = new SqlConnection(cs);
        con.Open();

        try
        {

            SqlCommand cmd = new SqlCommand("SP_INSERTCUSTOMER", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@First", SqlDbType.NVarChar, 50));
            cmd.Parameters["@First"].Value = FirstName;

            cmd.Parameters.Add(new SqlParameter("@Last", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Last"].Value = LastName;

            cmd.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Address"].Value = Address;

            cmd.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, 50));
            cmd.Parameters["@City"].Value = City;

            cmd.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 50));
            cmd.Parameters["@State"].Value = State;

            cmd.Parameters.Add(new SqlParameter("@Zip", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Zip"].Value = Zip;

            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", SqlDbType.NVarChar, 50));
            cmd.Parameters["@PhoneNumber"].Value = Phone;

            cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 50));
            cmd.Parameters["@Email"].Value = Email;

            cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.NChar, 10));
            cmd.Parameters["@Password"].Value = Password;

            cmd.Parameters.Add(new SqlParameter("@Platinum", SqlDbType.Bit));
            cmd.Parameters["@Platinum"].Value = Platinum;

            cmd.ExecuteNonQuery();
            return true;

        }
        catch (Exception err)
        {
            err.Message.ToString();
            return false;
        }
        finally
        {
            con.Close();
        }


    }//end of CreateCustomer

}