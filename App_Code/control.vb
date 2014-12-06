﻿Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Security
Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.ApplicationServices

Public Class _control

    Public Shared Function ObtenerDatosUsuario(ByVal usuario As String, ByVal clave As String) As DataTable
        ' Devuelve un DataTable con el id, el nif y las funciones que tiene asignadas un determinado usuario.
        ' Si este DataTable contine filas, se supone que el usuario está registrado.

        Dim conexion As String = ConfigurationManager.ConnectionStrings("AdmConnectionString").ToString
        Dim sentencia As String = "select Usuarios.idUsuario,nif,Rol " & _
                                  "from (Usuarios join Asignacion on Usuarios.idUsuario=Asignacion.idUsuario) " & _
                                  "join Roles on Asignacion.idRol=Roles.idRol " & _
                                  "where email=@email and passw=@passw and estado='A'"
        Dim miCnx As New SqlConnection(conexion)
        Dim miDT As New DataTable
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCmd.Parameters.Add("@email", SqlDbType.VarChar, 90).Value = usuario
            miCmd.Parameters.Add("@passw", SqlDbType.Char, 15).Value = clave
            Dim miAdt As New SqlDataAdapter(miCmd)
            miAdt.Fill(miDT)
        Catch ex As SystemException
            Throw New System.Exception(ex.Message)
        End Try
        Return miDT
    End Function

    Public Shared Function CargarFunciones() As Boolean
        ' Se llama desde el Global.asax, al comenzar la aplicación.
        ' Carga las funciones disponibles desde la base de datos Administracion a la base de datos aspnetdb.

        Dim conexion As String = ConfigurationManager.ConnectionStrings("AdmConnectionString").ToString
        Dim sentencia As String = "select rol from Roles"
        Dim miCnx As New SqlConnection(conexion)
        Dim miDR As SqlDataReader
        Dim ok As Boolean = False
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCnx.Open()
            miDR = miCmd.ExecuteReader()
            While miDR.Read
                If Not Roles.RoleExists(miDR.GetString(0)) Then Roles.CreateRole(miDR.GetString(0)) 'Se añaden los roles a la bbdd aspnet si no existen ya
            End While
            ok = True
        Catch ex As SystemException
            Throw New System.Exception(ex.Message)
        Finally
            miCnx.Close()
            miCnx.Dispose()
        End Try
        Return ok
    End Function

    Public Shared Function AddUsuario(ByVal usuario As Integer, ByVal funcion As String) As Boolean
        ' Añade un usuario a una función.
        Dim ok As Boolean = True
        Try
            If Not My.User.IsInRole(funcion) Then Roles.AddUserToRole(usuario, funcion) 'Esto apunta el rol que tiene el usuario con el que nos logueamos
        Catch ex As Exception
            ok = False
        End Try
        Return ok
    End Function

    Public Shared Function RemoveUsuarioyRoles(ByVal usuario As Integer, ByVal funciones() As String) As Boolean
        ' Se suprimen todos los roles de un determinado usuario, y a la vez, se suprime como tal usuario 
        ' de la BBDD aspnetdb.
        Dim ok As Boolean = True
        Try
            Roles.RemoveUserFromRoles(usuario, funciones)
            Membership.DeleteUser(usuario)
        Catch ex As Exception
            ok = False
        End Try
        Return ok
    End Function

    Public Shared Function Redireccion(ByVal funcion As String) As String
        ' Se proporciona la página de inicio de cada función específica.
        Dim pagina As String = Nothing
        Select Case funcion
            Case "Administrador"
                pagina = "contenidos" & "/" & "administrador" & "/" & "inicioAd.aspx"
            Case "Alumnado"
                pagina = "contenidos" & "/" & "alumnos" & "/" & "inicioAl.aspx"
            Case "Dirección"
                pagina = "contenidos" & "/" & "direccion" & "/" & "inicioDi.aspx"
            Case "Empresa"
                pagina = "contenidos" & "/" & "empresa" & "/" & "inicioEm.aspx"
            Case "Jefatura de Departamento"
                pagina = "contenidos" & "/" & "jd" & "/" & "inicioJd.aspx"
            Case "Tutoría Docente"
                pagina = "contenidos" & "/" & "tutord" & "/" & "inicioTd.aspx"
            Case "Tutoría Laboral"
                pagina = "contenidos" & "/" & "tutorl" & "/" & "inicioTl.aspx"
            Case "Tutoría de Grupo"
                pagina = "contenidos" & "/" & "tutorg" & "/" & "inicioTg.aspx"
        End Select
        Return pagina
    End Function

    Public Shared Sub CerrarSesion(ByVal usuario As String) ' Se ejecuta al cerrar sesión (Global.asax)
        ' Se elimina el usuario y todos sus roles.
        _control.RemoveUsuarioyRoles(usuario, Roles.GetRolesForUser(usuario))
        ' Se logout y se redirecciona a la página de login (login.aspx)
        FormsAuthentication.SignOut()
        FormsAuthentication.RedirectToLoginPage()
    End Sub

End Class
