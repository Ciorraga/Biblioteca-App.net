<%@ Page Language="VB" AutoEventWireup="false" CodeFile="fRoles.aspx.vb" Inherits="_fRoles" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicación Biblioteca</title>
    <script src="https://code.jquery.com/jquery.js"></script>        
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <script src="js/bootstrap.min.js"></script>
    <style>
        body
        {
            background-color:#000078;
            }
    </style>
</head>
<body>
    <div class="page-header" style="color:White">
        <h1><center>Aplicación Biblioteca</center></h1>
    </div>
    <div id="resOk" runat="server" class='alert alert-success' style="display:none"><center>Libro reservado con éxito</center></div>
    <form id="form1" runat="server">
    <div class="col-sm-4 col-sm-offset-4" style="margin-top:5%;background-color:White;border-radius:10px;padding:15px;border:1px solid black">       
        <center><asp:DropDownList ID="DDLMaterial" runat="server" AutoPostBack="True" 
            DataSourceID="SQLDSClaseMaterial" DataTextField="claseMaterial" 
            DataValueField="claseMaterial" AppendDataBoundItems="true"  >
            <asp:ListItem Text="Seleccione un tipo de material" Value="*"></asp:ListItem>
        </asp:DropDownList></center>
        <asp:SqlDataSource ID="SQLDSClaseMaterial" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" 
            SelectCommand="select DISTINCT claseMaterial from Obras">
        </asp:SqlDataSource>    
        Buscar por:<br />
        <asp:RadioButton ID="RB1" runat="server" Checked="True" GroupName="AuTitEd" 
            Text="Autor" value="autores"/>
        <br />
        <asp:RadioButton ID="RB2" runat="server" GroupName="AuTitEd" Text="Titulo"
            value="titulo"/>
        <br />
        <asp:RadioButton ID="RB3" runat="server" GroupName="AuTitEd" Text="Editorial" 
            value="editoriales"/>
        <br />
        <br />
        Texto de búsqueda: 
        <asp:TextBox ID="TBBusq" runat="server" Width="189px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Buscar" runat="server" Text="Buscar" />
    </div>
    
    
        <asp:Panel ID="Panel1" runat="server" Height="848px">
            <asp:ListView ID="LVDatos" runat="server" DataKeyNames="isbn" DataSourceID="SqlDataSource1" style="border:1px solid black">
            <LayoutTemplate>
                <div class="col-sm-8 col-sm-offset-2" style="border-radius:10px;background-color:White;padding:15px auto;margin-top:5%;">
                <table id="Traiz" runat="server" class="table">
                    <tr id="Tr4" runat="server" style="">
                        <th id="Th1" runat="server" style="width:100px;">
                            ¿Reservar?</th>
                        <th id="Th7" runat="server">
                             ISBN</th>
                        <th id="Th8" runat="server">
                            Título</th>
                        <th id="Th9" runat="server">
                            Tipo Material</th>
                        <th id="Th10" runat="server">
                            Autores</th>                                
                        <th id="Th11" runat="server">
                            Editorial</th>                                
                    </tr>
                        <tr runat="server" ID="itemPlaceholder">
                    </tr>
                </table>
                </div>
            </LayoutTemplate>

            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Reservar" width="80px" CommandName="select" Enabled='<%# If(Session("anonimo") = True, "False", Eval("disponible"))%>'/> 
                    </td>
                    <td>
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="claseMaterialLabel" runat="server" 
                            Text='<%# Eval("claseMaterial") %>' />
                    </td>
                    <td>
                        <asp:Label ID="autoresLabel" runat="server" Text='<%# Eval("autores") %>' />
                    </td>
                
                    </td>
                    <td>
                        <asp:Label ID="editorialLabel" runat="server" Text='<%# Eval("editorial") %>' />
                    </td>                
                </tr>
            </ItemTemplate>

            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="claseMaterialLabel" runat="server" 
                            Text='<%# Eval("claseMaterial") %>' />
                    </td>
                    <td>
                        <asp:Label ID="autoresLabel" runat="server" Text='<%# Eval("autores") %>' />
                    </td>          
                    <td>
                        <asp:Label ID="editorialLabel" runat="server" Text='<%# Eval("editorial") %>' />
                    </td>
                
                </tr>
            </SelectedItemTemplate>
            </asp:ListView>
        </asp:Panel>

       
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" 
        DeleteCommand="DELETE FROM [Obras] WHERE [isbn] = @isbn" 
        InsertCommand="INSERT INTO [Obras] ([isbn], [titulo], [autores]) VALUES (@isbn, @titulo, @autores)" 
        SelectCommand="select * from obras join editoriales on obras.idEditorial = editoriales.idEditorial"        
        UpdateCommand="UPDATE [Obras] SET [titulo] = @titulo, [autores] = @autores WHERE [isbn] = @isbn">
        <DeleteParameters>
            <asp:Parameter Name="isbn" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="isbn" Type="String" />
            <asp:Parameter Name="titulo" Type="String" />
            <asp:Parameter Name="autores" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="titulo" Type="String" />
            <asp:Parameter Name="autores" Type="String" />
            <asp:Parameter Name="isbn" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    

    </form>
</body>
</html>
