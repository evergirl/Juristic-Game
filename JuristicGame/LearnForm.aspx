<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearnForm.aspx.cs" Inherits="JuristicGame.LearnForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" OnRebindCommand="Page_Load">
        <div>
            <asp:Panel runat="server">
                <asp:Button ID="btnHomeLearn" runat="server" OnClick="btnHomeLearn_Click" Text="Home" />
                <asp:Table ID="tblContent" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>
                            <asp:Label ID="lblTitle" runat="server" />
                        </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
