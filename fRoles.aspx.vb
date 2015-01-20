Option Explicit Off
Imports System.Data
Imports System.Web.Security
Imports System.Web.UI.WebControls

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
        End If
        'Response.Write(rolUser & " " & us)
    End Sub

    Protected Sub Buscar_Click(sender As Object, e As System.EventArgs) Handles Buscar.Click
        Dim rbBusq As String = ""
        Dim DDLBusq As String
        Dim TEXTBusq As String
        If RB1.Checked Then
            rbBusq = "autores"
        ElseIf RB2.Checked Then
            rbBusq = "titulo"
        ElseIf RB3.Checked Then
            rbBusq = "editoriales"
        End If
        DDLBusq = DDLMaterial.SelectedValue
        TEXTBusq = TBBusq.Text

        Dim miDs As DataSet = _control.obtenerConsulta(DDLBusq, rbBusq, TEXTBusq)

        LVDatos.DataSource = miDs.Tables(0).DefaultView
        LVDatos.DataBind()
        Panel1.Visible = True
    End Sub

End Class
