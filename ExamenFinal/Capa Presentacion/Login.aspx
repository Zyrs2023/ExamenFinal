﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExamenFinal.Presentacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('../Imagen/images%20(1).jpeg');
            background-size: cover;
        }
        .login-container {
            width: 300px;
            background-color: rgba(255, 255, 255, 0.5); /* Reducir la opacidad aquí */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
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