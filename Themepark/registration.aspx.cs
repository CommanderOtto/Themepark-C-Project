using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration2 : System.Web.UI.Page
{

    //retrieving and saving to variables all the information in the form.
    string FirstName = "";
    string LastName = "";
    string Phone;
    string Address = "";
    string City = "";
    string State = "";
    string Zip;
    string Email = "";
    string Password = "";
    Boolean Platinum = false;
    int VerifyAccount;
    string dbaccount;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegistrationSubmit_Click(object sender, EventArgs e)
    {
        FirstName = FirstName_Form.Text;
        LastName = LastName_Form.Text;
        Address = Address_Form.Text;
        City = City_Form.Text;
        State = State_Form.Text;
        Zip = Zip_Form.Text;
        Phone = Phone_Form.Text;
        Email = Email_Form.Text;
        Password = Password_Form.Text;
        Platinum = false;
            
                    
        //sql statement to check if account exists or not. If not, then proceed to create account.
        string sql = "select count(*) from Customer where email = '" + Email + "'";


        VerifyAccount = dboperations.GetOneInt(sql);
        if (VerifyAccount == 0)
        {
            dboperations.CreateCustomer(FirstName, LastName, Address, City, State, Zip, Phone, Email, Password,Platinum);
            //might want to add some return bool to confirm database insert.
            Response.Redirect("customerpage.aspx");
        }
    }
}