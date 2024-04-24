<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExamenFinal.Presentacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../CSS/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="login-container">
        <form id="form1" runat="server">
            <h2>Iniciar Sesión</h2>
            <div class="form-group">
                <label for="username">Email:</label>
                <br />
                <asp:TextBox ID="temail" class="form-control form-control-sm" runat="server" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <br />
                <asp:TextBox ID="tcontrasena" class="form-control form-control-sm" TextMode="Password" runat="server" required="true"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" class="btn-submit btn btn-primary rounded submit px-3" OnClick="btnLogin_Click" Text="Iniciar Sesión"/>
        </form>
    </div>
</body>
</html>
