﻿Option Explicit Off
Imports System.Data
Imports System.Web.Security
Imports System.Web.UI.WebControls

Partial Class _fRoles
    Inherits System.Web.UI.Page
    Dim us As String = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        us = Context.User.Identity.Name
        ' Si no esta creada la variable de sesión se redirige a Login puesto que están intentando entrar por la URL directamente sin identificar
        If IsNothing(Session("dUsuario")) Then
            Response.Redirect("login.aspx")
        End If        
        Panel1.Visible = False
    End Sub

    Protected Sub Buscar_Click(sender As Object, e As System.EventArgs) Handles Buscar.Click
        resOk.Style.Add("display", "none")
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

        Panel1.Visible = True

        SqlDataSource1.SelectCommand = "select obras.isbn,obras.titulo,obras.autores,obras.claseMaterial,editoriales.editorial,existencias.disponible from obras join editoriales on obras.idEditorial=editoriales.idEditorial join Existencias on Obras.isbn=Existencias.isbn where claseMaterial='" & DDLBusq & "' and " & rbBusq & " LIKE '%" & TEXTBusq & "%'"
        SqlDataSource1.DataBind()
    End Sub

    Protected Sub LVDatos_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles LVDatos.SelectedIndexChanged
        Panel1.Visible = False

        Dim dt As DataTable = Session("dUsuario")
        Dim nombreUs As String = dt.Rows(0).Item(1).ToString 'Extraemos el nombre de usuario para realizar el préstamo

        'Para realizar la inserción en la tabla préstamos necesitare el idLector, el idEjemplar, y la fecha actual, y FALSE para el campo anulado
        Dim idLector As Integer = _control.obtenId("select idLector from Lectores where email='" & nombreUs & "'", "BibliotecaConnectionString")
        Dim idEjemplar As Integer = _control.obtenId("select TOP 1 idEjemplar from Existencias where isbn='" & LVDatos.SelectedValue & "'", "BibliotecaConnectionString")
        Dim fecha As DateTime = DateTime.Now

        Dim ins As Integer = _control.insertaPrestamo(idLector, idEjemplar, fecha)

        'Ahora, vamos a quitarlo como disponible para reservarlo en la tabla Existencias.
        Dim res As Object = _control.actualizaEx("update Existencias set disponible='false' where idEjemplar=" & idEjemplar)

        'Response.Write(LVDatos.SelectedValue & "-" & nombreUs & "-" & idLector & "-" & idEjemplar & "-" & d)
        If LVDatos.SelectedValue <> "" Then
            resOk.Style.Add("display", "block")
        End If

    End Sub


End Class
