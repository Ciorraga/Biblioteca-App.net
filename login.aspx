<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="_login" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<script type="text/javascript" language="javascript">

function ValidarEmail(source,arguments)
{
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(arguments.Value))
	   arguments.IsValid=true;
    else
	   arguments.IsValid=false;
}

function maximizar() 
{
    window.moveTo(0, 0);
    if (document.all) 
    {
        top.window.resizeTo(screen.availWidth, screen.availHeight);
    }
    else if (document.layers || document.getElementById)
    {
        if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth)
         {
            top.window.outerHeight = screen.availHeight;
            top.window.outerWidth = screen.availWidth;
        }
    }
}

</script>

<head runat="server">
  <title>Aplicación Biblioteca</title>
  <script src="https://code.jquery.com/jquery.js"></script>
        
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body onload="maximizar();">
   <form id="miForm" runat="server" style="font-family: Arial, Helvetica, sans-serif; font-size: small; margin-top:5%;">    
    <div class="col-sm-6 col-sm-offset-3">

        <div class="panel panel-default" >
            <div class="page-header" style="margin-top:0px">
                <center><h1>Aplicación Biblioteca</h1></center>
            </div>
            <div class="panel-body" style="background-color:white;">
                    <p class="form-group">
                        <label for="labUser" class="col-sm-2 control-label" style="text-align:left;">Email</label>
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
                    <p class="form-group">
                        <label for="labUser" class="col-sm-2 control-label" style="text-align:left;">Contraseña</label>
                        <asp:TextBox class="form-control" ID="TBpassw" runat="server"  Width="75%"/>    
                        <asp:RequiredFieldValidator ID="RFVContraseña" 
                          ControlToValidate="TBpassw"
                          ErrorMessage="· Introduzca su contraseña." 
                          runat="server" Display="Dynamic" />                    
                    </p>               
                    
                    <div class="form-group" style="margin-left:10%;margin-top:5%;">
                        Recordar <asp:CheckBox ID="CkBpersitente" runat="server" />
                    </div>   
                    <div class="col-sm-6 col-sm-offset-3"> 
                        <asp:Button ID="BTvalidar" OnClick="Validar" Text="Validar" runat="server" BackColor="#66AFE9" BorderColor="#507CD1" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="white" />
                        <asp:Button ID="Btregistrar" runat="server" Text="Registrarse" BackColor="#66AFE9" BorderColor="#507CD1" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="white" CausesValidation="false" PostBackUrl="registro.aspx"/>
                        <asp:Button ID="BtAnon" runat="server" Text="Anónimo" BackColor="#66AFE9" BorderColor="#507CD1" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="white" CausesValidation="false"/>                                                
                    </div>
                    <br />
                    <div class="col-sm-4 col-sm-offset-4" style="margin-top:10px;"> 
                        <asp:CustomValidator ID="CVnousuario" runat="server" Display="Dynamic" ErrorMessage="· Usuario incorrecto."/>                        
                    </div>
            </div>        
        </div>
    </div>
    <br />
    
  </form>
</body>
</html>
