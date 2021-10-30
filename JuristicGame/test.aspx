<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="JuristicGame.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Whut is tha answer?"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="RadioButton1" runat="server" text="69"/><br />
                        <asp:RadioButton ID="RadioButton2" runat="server" text="111"/><br />
                        <asp:RadioButton ID="RadioButton3" runat="server" text="15"/><br />
                        <asp:RadioButton ID="RadioButton4" runat="server" text="8"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Submit" />
                        <asp:Button ID="Button2" runat="server" Text="Check" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
