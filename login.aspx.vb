Imports System.Web.Security
Imports System.Data

Partial Class _login
    Inherits System.Web.UI.Page
    Dim us As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Limpiar()
        If Not Request.Cookies("userCookie") Is Nothing Then
            Dim miCookie As HttpCookie
            miCookie = Request.Cookies("userCookie")
            TBemail.Text = miCookie.Values("usuario")
            TBpassw.Text = miCookie.Values("password")
        End If
    End Sub

    Sub Validar(ByVal sender As Object, ByVal e As EventArgs) Handles BTvalidar.Click
        Dim datosUsuario As New DataTable
        datosUsuario = _control.ObtenerDatosUsuario(TBemail.Text, TBpassw.Text)
        If datosUsuario.Rows.Count <> 0 Then
            Limpiar()
            Session("dUsuario") = datosUsuario
            us = datosUsuario.Rows(0).Item(0).ToString ' us contiene el idUsuario

            FormsAuthentication.RedirectFromLoginPage(us, CkBpersitente.Checked) 'Esta es la forma para ver si el usuario es correcto

            CVnousuario.IsValid = True

            'Escribimos la cookie si el checkbox está marcado
            If CkBpersitente.Checked Then                
                Dim miCookie As New HttpCookie("userCookie")
                miCookie.Values("usuario") = TBemail.Text
                miCookie.Values("password") = TBpassw.Text
                miCookie.Expires = DateTime.Now.AddMinutes(30)
                Response.Cookies.Add(miCookie)
            End If

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
