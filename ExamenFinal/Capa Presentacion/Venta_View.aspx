<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Capa Presentacion/Menu.Master" CodeBehind="Venta_View.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Venta_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/Gridview.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container" style="max-width: 750px; min-width: 500px; float: left; margin-left: 100px; margin-right: 50px; margin-bottom: 500px;">
        <div class="card">
            <h3 class="card-header text-center">Registrar Ventas</h3>
            <div class="card-body">
                <form id="form1" class="float-end">
                    <div class="row">
                        
                        <div class="col">
                            <div class="form-group">
                                <div class="mb-3">
                                    <label class="form-label">ID Venta:</label>
                                    <asp:TextBox runat="server" class="form-control form-control-sm" ID="tVentaID" Style="width: 200px; height: 30px !important;"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">ID Agente:</label>
                                    <asp:DropDownList ID="dropIDAgente" CssClass="form-control" class="form-control form-control-sm d-inline-block w-50" runat="server" EnableViewState="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">ID Cliente:</label>
                                    <asp:DropDownList ID="dropIDCliente" CssClass="form-control" class="form-control form-control-sm d-inline-block w-50" runat="server" EnableViewState="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">ID Casa:</label>
                                    <asp:DropDownList ID="dropIDCasa" CssClass="form-control" class="form-control form-control-sm d-inline-block w-50" runat="server" EnableViewState="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Fecha: </label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFecha" TextMode="Date"></asp:TextBox>
                                </div>
                                <hr />
                                <asp:Button ID="btnAgregar" class="btn btn-success" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                                <asp:Button ID="btnModificar" runat="server" class="btn btn-dark" Text="Modificar" OnClick="btnModificar_Click" />
                                <asp:Button ID="btnEliminar" class="btn btn-danger" runat="server" Text="Borrar" OnClick="btnEliminar_Click" />
                                <asp:Button ID="btnConsultar" runat="server" CssClass="btn btn-danger" Text="Consultar" OnClick="btnConsultar_Click" BackColor="Blue" ForeColor="White" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnReload" runat="server" CssClass="btn btn-danger" Text="Refrescar" OnClick="btnReload_Click" BackColor="Green" ForeColor="White" />


                             
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <div class="col-md-6" style="float: right;">
        <div class="card">
            <h3 class="card-header text-center">Ventas Registradas</h3>
            <div class="search-box">
          


            </div>
            <div class="card-body">
                <hr />
               
                <br />
                <asp:GridView ID="gvVentas" runat="server" AutoGenerateColumns="False" Width="850px">
                    <Columns>
                        <asp:BoundField DataField="IDVenta" HeaderText="ID Venta" />
                        <asp:BoundField DataField="ID_Agente" HeaderText="ID Agente" />
                        <asp:BoundField DataField="ID_Cliente" HeaderText="ID Cliente" />
                        <asp:BoundField DataField="ID_Casa" HeaderText="ID Casa" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    </div>
</div>

</asp:Content>
