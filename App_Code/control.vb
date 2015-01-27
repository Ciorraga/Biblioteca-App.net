Imports System.Configuration
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
        Dim sentencia As String = "select * from Usuarios where email=@email and passw=@passw and estado='A'"
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

    Public Shared Function insertaLector(ByVal usuario As String, ByVal nombre As String) As Integer
        Dim filas As Integer
        Dim conexion As String = ConfigurationManager.ConnectionStrings("BibliotecaConnectionString").ToString
        Dim sentencia As String = "insert into Lectores (nombre,email) Values ('" & nombre & "','" & usuario & "')"
        Dim miCnx As New SqlConnection(conexion)
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCnx.Open()
            filas = miCmd.ExecuteNonQuery()
        Catch
            filas = -1
        Finally
            miCnx.Close()
            miCnx.Dispose()
        End Try

        Return filas
    End Function

    Public Shared Function insertaUsuario(ByVal usuario As String, ByVal pass As String, ByVal dni As String) As Integer
        Dim ultId As Integer = obtenId("select idUsuario from usuarios order by idUsuario DESC", "AdmConnectionString") 'Llamamos a esta funcion que nos dará el ID del ultimo usuario registrado
        ultId += 1 ' Sumamos el ultimo ID de usuario + 1, que sera el nuevo id del usuario que vamos a introducir

        Dim filas As Integer
        Dim conexion As String = ConfigurationManager.ConnectionStrings("AdmConnectionString").ToString
        Dim sentencia As String = "insert into usuarios VALUES (" & ultId & ",'" & usuario & "' , '" & pass & "' , '" & dni & "', 'A') "
        Dim miCnx As New SqlConnection(conexion)
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCnx.Open()
            filas = miCmd.ExecuteNonQuery()
        Catch
            filas = -1
        Finally
            miCnx.Close()
            miCnx.Dispose()
        End Try

        Return filas
    End Function

    Public Shared Function insertaPrestamo(ByVal idLector As Integer, ByVal idEjemplar As Integer, ByVal fecha As DateTime) As Integer
        Dim filas As Integer
        Dim conexion As String = ConfigurationManager.ConnectionStrings("BibliotecaConnectionString").ToString
        Dim sentencia As String = "insert into Prestamos (idEjemplar,fechaPrestamo,idLector,anulado) Values ('" & idEjemplar & "','" & fecha & "','" & idLector & "','false')"
        Dim miCnx As New SqlConnection(conexion)
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCnx.Open()
            filas = miCmd.ExecuteNonQuery()
        Catch
            filas = -1
        Finally
            miCnx.Close()
            miCnx.Dispose()
        End Try

        Return filas
    End Function

    Public Shared Function obtenId(ByVal sentencia As String, ByVal connect As String) As Integer
        Dim res As Integer
        Dim conexion As String = ConfigurationManager.ConnectionStrings(connect).ToString
        Dim miCnx As New SqlConnection(conexion)
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCnx.Open()
            res = miCmd.ExecuteScalar()
        Catch
            res = -1
        Finally
            miCnx.Close()
            miCnx.Dispose()
        End Try

        Return res
    End Function

    Public Shared Function actualizaEx(ByVal sentencia As String) As Integer
        Dim res As Integer

        Dim conexion As String = ConfigurationManager.ConnectionStrings("BibliotecaConnectionString").ToString
        Dim miCnx As New SqlConnection(conexion)
        Try
            Dim miCmd As New SqlCommand(sentencia, miCnx)
            miCnx.Open()
            res = miCmd.ExecuteNonQuery()
        Catch
            res = -1
        Finally
            miCnx.Close()
            miCnx.Dispose()
        End Try

        Return res
    End Function
End Class
