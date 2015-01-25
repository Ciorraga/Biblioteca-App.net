<%@ Page Language="VB" AutoEventWireup="false" CodeFile="registro.aspx.vb" Inherits="registro" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://code.jquery.com/jquery.js"></script>
        
  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div id="userOk" runat="server" class='alert alert-success' style="display:none"><center>Usuario creado correctamente</center></div>
<div id="userNoOk" runat="server" class='alert alert-danger' style="display:none"><center>Fallo al crear usuario. Cambie los datos</center></div>
    <form id="form1" runat="server" style="font-family: Arial, Helvetica, sans-serif; font-size: small; margin-top:5%;">
    <div class="col-md-6 col-md-offset-3" >   
        <div class="panel panel-default">
            <div class="page-header">
                <center><h1>Aplicación Biblioteca</h1></center>
            </div>
            <div class="panel-body" style="background-color:white;">
                               
                    <p class="form-group">
                        <label for="labUser" class="col-md-2 control-label" style="text-align:left;">Email</label>
                        <asp:TextBox class="form-control" ID="TBemail" runat="server"  Width="75%" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                          ControlToValidate="TBemail"
                          Display="Dynamic" 
                          ErrorMessage="· Rellene la dirección de su e-mail." 
                          runat="server" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                          ErrorMessage="· La dirección e-mail no tiene el formato adecuado." 
                          ClientValidationFunction="ValidarEmail" ControlToValidate="TBemail" />
                    </p>
                    <div class="form-group">
                        <label for="labUser" class="col-md-2 control-label" style="text-align:left;">Contraseña</label>
                        <asp:TextBox type="password" class="form-control" ID="TBpassw" runat="server"  Width="75%"/>    
                        <asp:RequiredFieldValidator ID="RFVContraseña" 
                          ControlToValidate="TBpassw"
                          ErrorMessage="· Introduzca su contraseña." 
                          runat="server" Display="Dynamic" />                    
                    </div>
                    
                    <p class="form-group">
                        <label for="labUser" class="col-md-2 control-label" style="text-align:left;">Contraseña</label>
                        <asp:TextBox type="password" class="form-control" ID="TBpassw2" runat="server"  Width="75%"/>    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                          ControlToValidate="TBpassw2"
                          ErrorMessage="· Introduzca su contraseña." 
                          runat="server" Display="Dynamic" />                    
                    </p> 

                    <p class="form-group">
                        <label for="labUser" class="col-md-2 control-label" style="text-align:left;">Nombre y apellidos</label>
                        <asp:TextBox type="text" class="form-control" ID="TBNombre" runat="server"  Width="75%"/>    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                          ControlToValidate="TBNombre"
                          ErrorMessage="· Introduzca su nombre y apellidos" 
                          runat="server" Display="Dynamic" />                    
                    </p>   

                    <p class="form-group">
                        <label for="labUser" class="col-md-2 control-label" style="text-align:left;">DNI</label>
                        <asp:TextBox type="text" class="form-control" ID="TBdni" runat="server"  Width="75%"/>    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                          ControlToValidate="TBdni"
                          ErrorMessage="· Introduzca su DNI" 
                          runat="server" Display="Dynamic" />                    
                    </p>                   
                    
                    <div class="col-sm-4 col-sm-offset-4"> 
                        <asp:Button ID="Btregistrar" runat="server" Text="Registrarse" BackColor="#66AFE9" BorderColor="#507CD1" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="white"/>    
                        <asp:Button ID="BTVolver" runat="server" Text="Volver" BackColor="white" BorderColor="#507CD1" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="Black" CausesValidation="false" PostBackUrl="login.aspx"/>                                             
                    </div>
                    <br />
                    <div class="col-sm-4 col-sm-offset-4" 
                        style="margin-top:10px; top: 0px; left: 0px;">                         
                    </div>
            </div>        
        </div>
    </div>
    </form>
</body>
</html>
