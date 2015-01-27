Imports System.Web.Security
Imports System.Data

Partial Class registro
    ' SE RECUERDA QUE LA BBDD TIENE ALGUNAS RESTRICCIONES EN ALGUNOS CAMPOS DE ESTE REGISTRO. SI NO INSERTA EL USUARIO,ES PORQUE ESTA INCUMPLIENDO ALGUNA RESTRICCION
    Inherits System.Web.UI.Page

    Protected Sub Btregistrar_Click(sender As Object, e As System.EventArgs) Handles Btregistrar.Click
        Dim usuario As Integer = _control.insertaUsuario(TBemail.Text, TBpassw.Text, TBdni.Text)
        Dim lector As Integer = _control.insertaLector(TBemail.Text, TBNombre.Text)

        If usuario <> -1 And lector <> -1 Then
            userOk.Style.Add("display", "block")
        Else
            userNoOk.Style.Add("display", "block")
        End If
    End Sub
End Class