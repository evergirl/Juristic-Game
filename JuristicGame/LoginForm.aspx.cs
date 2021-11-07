using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JuristicGame
{
    using JuristicGame.sql;
    using System.Windows.Forms;

    public partial class LoginForm : System.Web.UI.Page
    {
        UserBO userBo = new UserBO();
        const String LINK_TRAGET_HOME = "~/Home.aspx";
        public const String PARAM_USERID = "UserName";
        const String register = "Registrieren";
        const String login = "Login";
        int index = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw new Exception("Seite konnte nicht geladen werden", ex);
            }
        }

        protected void chkRegister_CheckChanged(object sender, EventArgs e)
        {
            // text button aendern
            lblRole.Visible = chkRegister.Checked;
            ddlRole.Visible = chkRegister.Checked;
            ddlRole.Enabled = chkRegister.Checked;
            if (chkRegister.Checked)
            {
                btnLogin.Text = register;
                if (index == 0)
                {
                    QuizDataSet.RolesDataTable roles = userBo.GetRoles();
                    foreach (QuizDataSet.RolesRow row in roles)
                    {
                        ddlRole.Items.Add(row.RoleName);
                    }
                }
            }
            else
            {
                btnLogin.Text = login;
            }
            index++;
        }

        protected void btnLogin_Click(Object sender, EventArgs e)
        {
            Boolean loginSuccessful = false;
            String name = txtUserName.Text;
            String password = txtPassword.Text;
            if (chkRegister.Checked)
            {
                // Register
                String role = ddlRole.SelectedValue;
                loginSuccessful = userBo.CreateUser(name, password, role);
                if (!loginSuccessful)
                {
                    // could not create user
                    
                        MessageBox.Show("Es konnte kein neuer Benuzter erstellt werden");
                }
            }
            else
            {
                // Login
                QuizDataSet.UsersRow user = userBo.GetUserByName(name);
                if (user != null)
                {
                    user.Password = password;
                    loginSuccessful = userBo.DoLogin(user);
                    if (!loginSuccessful)
                    {
                        // Wrong password    
                        MessageBox.Show("Falsches Passwort");
                    }
                }
                else
                {
                    // exception user does not exist
                    MessageBox.Show("Benutzer existiert nicht");
                }
            }

            if (loginSuccessful)
            {
                // redirect to home
                Response.Redirect(LINK_TRAGET_HOME + "?" + PARAM_USERID + "=" + name, false);
            }
        }
    }
}