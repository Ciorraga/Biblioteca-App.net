<%@ Page Language="VB" AutoEventWireup="false" CodeFile="fRoles.aspx.vb" Inherits="_fRoles" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
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
            Text="Autor" />
        <br />
        <asp:RadioButton ID="RB2" runat="server" GroupName="AuTitEd" Text="Titulo" />
        <br />
        <asp:RadioButton ID="RB3" runat="server" GroupName="AuTitEd" Text="Editorial" />
        <br />
        <br />
        Texto de búsqueda: 
        <asp:TextBox ID="TBBusq" runat="server" Width="189px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="uscar" runat="server" Text="Buscar" />


    
    
    </div>
    </form>
</body>
</html>
