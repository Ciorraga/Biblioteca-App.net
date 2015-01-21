Option Explicit Off
Imports System.Data
Imports System.Web.Security
Imports System.Web.UI.WebControls

Partial Class _fRoles
    Inherits System.Web.UI.Page
    Dim us As String = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        us = Context.User.Identity.Name 'Esto te dice el id con el que estamos trabajando que recogimos antes con  FormsAuthentication.RedirectFromLoginPage(us, CkBpersitente.Checked). Luego lo utilizaremos
        Dim rolUser As String = ""
        ' Si no esta creada la variable de sesión se redirige a Login puesto que están intentando entrar por la URL directamente sin identificar
        If IsNothing(Session("dUsuario")) Then
            Response.Redirect("login.aspx")
        End If
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
