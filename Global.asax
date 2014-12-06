<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        _control.CargarFunciones()
    End Sub
    
    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        _control.CerrarSesion(Context.User.Identity.Name)
    End Sub
       
</script>