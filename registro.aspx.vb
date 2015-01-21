Imports System.Web.Security
Imports System.Data

Partial Class registro
    Inherits System.Web.UI.Page

    Protected Sub Btregistrar_Click(sender As Object, e As System.EventArgs) Handles Btregistrar.Click
        Dim a As Integer = _control.insertaUsuario(TBemail.Text, TBpassw.Text, TBdni.Text)

        If a <> -1 Then
            userOk.Style.Add("display", "block")
        Else
            userNoOk.Style.Add("display", "block")
        End If
    End Sub
End Class
