<%@ Page Title="" Language="C#" MasterPageFile="~/Capa Presentacion/Menu.master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('../Imagen/home-sales-agents-and-buyers-work-on-signing-new-homes-and-shaking-hands-photo.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        h1 {
            color: white;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Bienvenido a la página de inicio</h1>
</asp:Content>
