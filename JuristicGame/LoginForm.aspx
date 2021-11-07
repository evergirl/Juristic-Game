<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="JuristicGame.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" OnRebindCommand="Page_Load">
        <div>
            <asp:Panel ID="pnlLogin" runat="server" BorderColor="Black" BorderWidth="3px" Width="40%"  >
                <asp:Table runat="server" HorizontalAlign="Center" >
                    <asp:TableHeaderRow Width="50%">
                        <asp:TableCell>
                            <asp:Label ID="lblTitle" Text="Login" runat="server" Font-Underline="True" />
                        </asp:TableCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow >
                        <asp:TableCell>
                            <asp:Label ID="lblUserName" Text="Benutzername" runat="server" />
                        </asp:TableCell>
                            <asp:TableCell>
                            <asp:TextBox ID="txtUserName" runat="server" />
                            <asp:RequiredFieldValidator ID="validtxtUserName" runat="server" ControlToValidate="txtUserName"
                            Display="Dynamic" ErrorMessage="Name kann nicht leer sein" ForeColor="Red" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPassword" Text="Passwort" runat="server" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="validtxtPassword" runat="server" ControlToValidate="txtPassword"
                                Display="Dynamic" ErrorMessage="Passwort kann nicht leer sein" ForeColor="Red" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblRole" Text="Benutzertyp" runat="server" Visible="false" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlRole" runat="server" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblCheckBoxRegister" Text="Registrieren" runat="server" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkRegister" runat="server" Checked="false" OnCheckedChanged="chkRegister_CheckChanged" AutoPostBack="true"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnLogin" Text="Anmelden" runat="server" OnClick="btnLogin_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
