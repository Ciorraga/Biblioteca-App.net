Imports System.Web.Security
Imports System.Data

Partial Class _login
    Inherits System.Web.UI.Page
    Dim us As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Limpiar()
    End Sub

    Sub Validar(ByVal sender As Object, ByVal e As EventArgs) Handles BTvalidar.Click
        Dim datosUsuario As New DataTable
        datosUsuario = _control.ObtenerDatosUsuario(TBemail.Text, TBpassw.Text)
        If datosUsuario.Rows.Count <> 0 Then
            Limpiar()
            Session("dUsuario") = datosUsuario
            us = datosUsuario.Rows(0).Item(0).ToString ' us contiene el idUsuario
            'FormsAuthentication.
            ' Partimos de la base que el navegador del cliente admite la escritura de cookies.   
            ' El método FormsAuthentication.RedirectFromLoginPage
            ' emite un vale de autenticación para el usuario us que es guardado en la cookie predeterminada (persistente o no).
            ' A su vez, redirige al usuario autenticado hacia la dirección URL originalmente solicitada o a la dirección URL predeterminada.
            FormsAuthentication.RedirectFromLoginPage(us, CkBpersitente.Checked) 'Esta es la forma para ver si el usuario es correcto

            ' Validación del Custom Validator para el mensaje de usuario incorrecto.
            ' Para validar la página todos los controles de validación tienen que estar a ok,
            ' la validación de este debe realizarse a mano.
            CVnousuario.IsValid = True
            ' Usuario autenticado. Redirección a la selección del rol de trabajo.
            Response.Redirect("fRoles.aspx")
        Else
            ' Si el DataTable no tiene filas, no es usuario y, por tanto, no validamos el CustomValidator
            CVnousuario.IsValid = False
        End If
    End Sub

    Public Sub Limpiar()
        Session("dUsuario") = Nothing
        us = Context.User.Identity.Name
        If us <> Nothing Then
            _control.RemoveUsuarioyRoles(us, Roles.GetRolesForUser(us))
            FormsAuthentication.SignOut()
        End If
    End Sub


End Class
