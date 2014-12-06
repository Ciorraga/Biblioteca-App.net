Option Explicit Off
Imports System.Data
Imports System.Web.Security
Partial Class _fRoles
    Inherits System.Web.UI.Page
    Dim us As String = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        us = Context.User.Identity.Name 'Esto te dice el id con el que estamos trabajando que recogimos antes con  FormsAuthentication.RedirectFromLoginPage(us, CkBpersitente.Checked) 
        Dim rolUser As String = ""
        If Roles.GetRolesForUser(us).Count = 0 Then
            For Each fila As DataRow In Session("dUsuario").Rows
                'Guardamos en una variable de sesión el Rol para habilitar el boton de reservar o no segun su rol
                rolUser = fila("Rol")
            Next
        Else
            Response.Redirect(_control.Redireccion(Roles.GetRolesForUser(us)(0)))
        End If
        'Response.Write(rolUser & " " & us)
    End Sub

    Protected Sub uscar_Click(sender As Object, e As System.EventArgs) Handles uscar.Click
        Dim rbBusq As String = ""
        Dim DDLBusq As String
        Dim TEXTBusq As String
        If RB1.Checked Then
            rbBusq = RB1.Text
        ElseIf RB2.Checked Then
            rbBusq = RB2.Text
        ElseIf RB3.Checked Then
            rbBusq = RB3.Text
        End If
        DDLBusq = DDLMaterial.SelectedValue
        TEXTBusq = TBBusq.Text



        Response.Write(rbBusq & "," & DDLBusq & "," & TEXTBusq)
    End Sub
End Class
