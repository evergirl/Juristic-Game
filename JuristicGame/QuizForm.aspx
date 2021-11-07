<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuizForm.aspx.cs" Inherits="JuristicGame.QuizForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" OnRebindCommand="Page_Load">
        <div>
            <asp:Panel ID="pnlQuiz" runat="server" BorderColor="Black" BorderWidth="3px" Width="100%">
                <asp:Button ID="btnHomeQuiz" runat="server" OnClick="btnHomeQuiz_Click" Text="Home" />
                <asp:Table runat="server">
                    <asp:TableHeaderRow Width="50%" CssClass="padding" Height="30%" HorizontalAlign="Center">
                        <asp:TableHeaderCell>
                            <asp:Label ID="lblTitle" runat="server" Text="Quiz" />
                        </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblNewQuestion" runat="server" Text="Neue Frage stellen" 
                                Visible="false" Enabled="false" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="chkNewQuestion" runat="server" Visible="false" Enabled="false" 
                                Checked="false" AutoPostBack="true" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:TextBox ID="txtQuestion" runat="server" Enabled="false" Visible="false"/>
                            <asp:RequiredFieldValidator ID="validtxtQuestion" runat="server" ControlToValidate="txtQuestion"
                                Display="Dynamic" ErrorMessage="Frage kann nicht leer sein" ForeColor="Red"  
                                Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ID="tcRblAnswers" Visible="false">
                            <asp:RadioButtonList ID="rblAnswers" runat="server" Visible="false">
                                <asp:ListItem Value="1" Selected="True" />
                                <asp:ListItem Value="2" Selected="False" />
                                <asp:ListItem Value="3" Selected="False" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="trAnswers" Visible="false">
                        <asp:TableCell>
                            <asp:TextBox ID="txtAnswer1" runat="server" Enabled="false" />
                            <asp:RequiredFieldValidator ID="validtxtAnswer1" runat="server" ControlToValidate="txtAnswer1"
                                Display="Dynamic" ErrorMessage="1. Antwort kann nicht leer sein" ForeColor="Red" 
                                Enabled="false" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAnswer2" runat="server" Enabled="false" />
                            <asp:RequiredFieldValidator ID="validtxtAnswer2" runat="server" ControlToValidate="txtAnswer2"
                                Display="Dynamic" ErrorMessage="2. Antwort kann nicht leer sein" ForeColor="Red"  
                                Enabled="false" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAnswer3" runat="server" Enabled="false" />
                            <asp:RequiredFieldValidator ID="validtxtAnswer3" runat="server" ControlToValidate="txtAnswer3"
                                Display="Dynamic" ErrorMessage="3. Antwort kann nicht leer sein" ForeColor="Red"  
                                Enabled="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button ID="btnStart" runat="server" Text="Start" 
                                OnClick="btnStart_Click" Visible="true" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCheck" runat="server" Text="Check" 
                                OnClick="btnCheck_Click" Visible="false" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnNewQuestion" runat="server" Text="Save Question" 
                                OnClick="btnNewQuestion_Click" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
