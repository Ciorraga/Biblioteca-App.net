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
  <title>IES Oretania.</title>
</head>
<body onload="maximizar();">
   <form id="miForm" runat="server" style="font-family: Arial, Helvetica, sans-serif; font-size: small">
    <h2>
        MiAplicación - Acceso.
        </h2>
    <hr />
    <h3>
        Identificación del usuario.
    </h3>
    <table>
      <tr>
        <td>
          E-mail:</td>
        <td>
          <asp:TextBox ID="TBemail" runat="server" Width="200px" /></td>
        <td>
          <asp:RequiredFieldValidator ID="RFVemail" 
              ControlToValidate="TBemail"
              Display="Dynamic" 
              ErrorMessage="· Rellene la dirección de su e-mail." 
              runat="server" />
          <asp:CustomValidator ID="CVemail" runat="server" 
              ErrorMessage="· La dirección e-mail no tiene el formato adecuado." 
              ClientValidationFunction="ValidarEmail" ControlToValidate="TBemail" />
        </td>
      </tr>
      <tr>
        <td>
            Contraseña:</td>
        <td>
          <asp:TextBox ID="TBpassw" TextMode="Password" 
              runat="server" Width="200px" />
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RFVcontraseña" 
              ControlToValidate="TBpassw"
              ErrorMessage="· Introduzca su contraseña." 
              runat="server" Display="Dynamic" />
        </td>
      </tr>
      <tr>
        <td>
          Recordar en este equipo:</td>
        <td>
          <asp:CheckBox ID="CkBpersitente" runat="server" /></td>
      </tr>
      <tr>
        <td>
          <asp:Button ID="BTvalidar" OnClick="Validar" Text="Validar" runat="server" BackColor="Aquamarine" BorderColor="#507CD1" BorderStyle="Solid" 
              BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="#284E98" />
        </td>
        <td align="right">
           <asp:Button ID="Btregistrar" runat="server" Text="Registrarse" BackColor="Aquamarine" BorderColor="#507CD1" BorderStyle="Solid" 
               BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" ForeColor="#284E98"/>
        </td>
      </tr>
    </table>
    <asp:CustomValidator ID="CVnousuario" runat="server" Display="Dynamic" ErrorMessage="· Usuario incorrecto."/>
    <br />
    <asp:LinkButton ID="LBanonimo" runat="server" 
            PostBackUrl="~/contenidos/anonimo/inicioAn.aspx"
            Text="Usuario anónimo" 
            CausesValidation="false"/>
  </form>
</body>
</html>
