using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace JuristicGame.sql
{
    using QuizDataSetTableAdapters;

    [DataObject]
    public class UserBO : BusinessObject
    {
        // data adapter
        private UsersTableAdapter _userAdapter;
        private RolesTableAdapter _rolesAdapter;

        private UsersTableAdapter DataAdapter
        {
            get
            {
                if (null == _userAdapter)
                {
                    _userAdapter = new UsersTableAdapter();
                    _userAdapter.Connection.ConnectionString = connectionString + "App=UserBO";
                }
                return _userAdapter;
            }
        }

        protected RolesTableAdapter rolesDataAdapter
        {
            get
            {
                if (null == _rolesAdapter)
                {
                    _rolesAdapter = new RolesTableAdapter();
                    _rolesAdapter.Connection.ConnectionString = connectionString + "App=UserBO";
                }
                return _rolesAdapter;
            }
        }

        public UserBO()
        {
            DataAdapter.Connection.Open();
            rolesDataAdapter.Connection.Open();
        }

        // stored procedure
        static String spAddUser = @"dbo.[AddUser]";

        private bool AddUser(string userName, string password, string role)
        {
            // SqlCommand
            SqlCommand cmd = new SqlCommand(spAddUser, GetConnection());

            // Set parameter
            SqlParameter paramName = new SqlParameter("@Name", SqlDbType.NVarChar, 50);
            SqlParameter paramPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 8);
            SqlParameter paramrole = new SqlParameter("@Role", SqlDbType.NVarChar, 20);

            paramName.Value = userName;
            paramPassword.Value = password;
            paramrole.Value = role;

            //add parameter to SqlCommand
            cmd.Parameters.Add(paramName);
            cmd.Parameters.Add(paramPassword);
            cmd.Parameters.Add(paramrole);

            return ExecuteStoredProcedure(cmd);
        }

        public QuizDataSet.UsersDataTable GetUsers()
        {
            QuizDataSet.UsersDataTable userRows = DataAdapter.GetData();
            if (userRows.Count == 0)
            {
                return null;
            }

            return userRows;
        }

        public QuizDataSet.UsersRow GetUserByName(String userName)
        {
            QuizDataSet.UsersDataTable users = DataAdapter.GetUserByName(userName);
            //DataAdapter.Connection.Close();

            if (users.Count == 0)
            {
                return null;
            }
            return users[0];
        }

        public QuizDataSet.RolesDataTable GetRoles()
        {
            QuizDataSet.RolesDataTable roles = rolesDataAdapter.GetAllRoles();

            if (roles.Count == 0)
            {
                return null;
            }
            return roles;
        }

        public Int32 GetRoleIdByName(String roleName)
        {
            QuizDataSet.RolesDataTable roles = rolesDataAdapter.GetDataByRoleName(roleName);

            if (roles.Count == 0)
            {
                return 0;
            }
            return roles[0].RoleId;
        }

        //public String GetRoleByUserName(String userName)
        //{
        //    QuizDataSet.UsersRow userData = GetUserByName(userName);
        //    if (userData != null)
        //    {
        //        QuizDataSet.RolesRow role = GetRoleByRoleId(userData.RoleId);
        //        if (role != null)
        //        {
        //            return role.RoleName;
        //        }
        //    }
        //    return null;
        //}

        public QuizDataSet.UsersDataTable GetUsersByRoleId(Int32 roleId)
        {
            QuizDataSet.UsersDataTable users = DataAdapter.GetUsersByRoleId(roleId);
            if (users.Count == 0)
            {
                return null;
            }
            return users;
        }

        public QuizDataSet.RolesRow GetRoleByRoleId(Int32 roleId)
        {
            QuizDataSet.RolesDataTable role = rolesDataAdapter.GetDataByRoleId(roleId);
            if (role.Count == 0)
            {
                return null;
            }
            return role[0];
        }

        public Boolean DoLogin(QuizDataSet.UsersRow user)
        {
            Boolean loginSuccess = false;
            try
            {
                QuizDataSet.UsersRow dbuser = GetUserByName(user.Name);
                if (dbuser.Password == user.Password)
                {
                    loginSuccess = true;
                }
            }
            catch
            {
                // log exception
            }
            return loginSuccess;
        }

        public Boolean CreateUser(String name, String password, String role)
        {
            Boolean addUserSuccessful = false;

            try
            {
                if (GetRoleIdByName(role) > 0)
                {
                    // if user doesn't exist
                    addUserSuccessful = AddUser(name, password, role);
                }
            }
            catch
            {
                // log exception
            }
            return addUserSuccessful;
        }
    }
}