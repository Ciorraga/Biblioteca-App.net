Imports System.Web.Security
Imports System.Data

Partial Class _login
    Inherits System.Web.UI.Page
    Dim us As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Limpiar()
        If Not Request.Cookies("userCookie") Is Nothing Then
            Dim codigo As New _seguridad()
            Dim miCookie As HttpCookie
            miCookie = Request.Cookies("userCookie")
            Session("dUsuario") = codigo.Desencriptar(miCookie.Values("usuario"), "w#$b89?6")
            Response.Redirect("Principal.aspx")
        End If
    End Sub

    Sub Validar(ByVal sender As Object, ByVal e As EventArgs) Handles BTvalidar.Click
        Dim datosUsuario As New DataTable
        datosUsuario = _control.ObtenerDatosUsuario(TBemail.Text, TBpassw.Text)
        If datosUsuario.Rows.Count <> 0 Then
            Limpiar()
            Session("dUsuario") = datosUsuario.Rows(0).Item(1).ToString

            'Escribimos la cookie si el checkbox está marcado
            If CkBpersitente.Checked Then
                Dim codigo As New _seguridad()
                Dim miCookie As New HttpCookie("userCookie")
                miCookie.Values("usuario") = codigo.Encriptar(TBemail.Text, "w#$b89?6")
                miCookie.Values("password") = codigo.Encriptar(TBpassw.Text, "w#$b89?6")
                miCookie.Expires = DateTime.Now.AddMinutes(30)
                Response.Cookies.Add(miCookie)
            End If

            ' Usuario autenticado. Redirección a la selección del rol de trabajo.
            Response.Redirect("Principal.aspx")
        Else
            ' Si el DataTable no tiene filas, no es usuario y, por tanto, no validamos el CustomValidator
            CVnousuario.IsValid = False
        End If
    End Sub

    Public Sub Limpiar()
        Session("dUsuario") = Nothing
        Session("anonimo") = Nothing        
    End Sub

    Protected Sub BtAnon_Click(sender As Object, e As System.EventArgs) Handles BtAnon.Click
        Session("anonimo") = True
        Response.Redirect("Principal.aspx")
    End Sub
End Class
