<%@ Page Language="VB" AutoEventWireup="false" CodeFile="fRoles.aspx.vb" Inherits="_fRoles" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicación Biblioteca</title>
    <script src="https://code.jquery.com/jquery.js"></script>        
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <style>
        body
        {
            background-color:#c9c7c7;
            }
    </style>
</head>
<body>
    <div class="page-header" style="color:White">
        <h1><center>Aplicación Biblioteca</center></h1>
    </div>
    <form id="form1" runat="server">
    <div class="col-sm-4 col-sm-offset-4" style="margin-top:5%;background-color:White;border-radius:10px;padding:15px">   
        Seleccione el tipo de material:
        <asp:DropDownList ID="DDLMaterial" runat="server" AutoPostBack="True" 
            DataSourceID="SQLDSClaseMaterial" DataTextField="claseMaterial" 
            DataValueField="claseMaterial" AppendDataBoundItems="true"  >
            <asp:ListItem Text="Seleccione un tipo de material" Value="*"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SQLDSClaseMaterial" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" 
            SelectCommand="select DISTINCT claseMaterial from Obras">
        </asp:SqlDataSource>    
    
        <br />
        <br />
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
    
    
        <asp:Panel ID="Panel1" runat="server">
            <asp:ListView ID="LVDatos" runat="server">

            <LayoutTemplate>
                <div class="col-sm-8 col-sm-offset-2" style="border-radius:10px;background-color:White;padding:15px auto;margin-top:5%;">
                <table id="Traiz" runat="server" class="table">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table ID="itemPlaceholderContainer" runat="server">
                                <tr id="Tr2" runat="server">
                                        <th id="Th1" runat="server" style="width:100px;">
                                            ¿Reservar?
                                        </th>
                                        <th id="Th2"  runat="server">
                                            ISBN
                                        </th>
                                        <th id="Th3" runat="server">
                                            Título
                                        </th>
                                        <th id="Th4" runat="server">
                                            Autores
                                        </th>
                                        <th id="Th5" runat="server">
                                            Material
                                        </th>
                                        <th id="Th6" runat="server">
                                            Editorial
                                        </th>
                                        </tr>
                                            <tr ID="itemPlaceholder" runat="server" >
                                        </tr>
                            </table>
                         </td>
                   </tr>
                </table>
                </div>
            </LayoutTemplate>

            <ItemTemplate>                        
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Reservar" width="80px"/>
                    </td>
                    <td>
                        <asp:Label ID="Lmodulo" runat="server" Text='<%# Eval("isbn") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("titulo") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("autores") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("claseMaterial") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("editorial") %>'/>
                    </td>
                </tr>
            </ItemTemplate>
            </asp:ListView>
            <br />
        </asp:Panel>
    

    </form>
</body>
</html>
