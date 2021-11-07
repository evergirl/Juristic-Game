<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JuristicGame.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .padding {
            padding: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" OnRebindCommand="Page_Load">
        <div>
            <asp:Panel ID="pnlLogin" runat="server" BorderColor="Black" BorderWidth="3px" Width="100%"  >
                <asp:Table runat="server" >
                    <asp:TableHeaderRow Width="50%" CssClass="padding" Height="30%" HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Label ID="lblTitle" Text="Wähle einen Modus aus" runat="server" />
                        </asp:TableCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnLearn" Text="Lernen" runat="server" Width="80%" 
                                OnClick="btnLearn_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnQuizMode" Text="Quiz Modus" runat="server" Width="80%" 
                                OnClick="btnQuizMode_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
