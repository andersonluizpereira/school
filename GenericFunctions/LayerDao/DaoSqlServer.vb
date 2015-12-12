Imports System.Data.SqlClient
Imports System
Imports System.Configuration
Public Class DaoSqlServer

    Protected cn As SqlConnection
    Protected cmd As SqlCommand
    Protected reader As SqlDataReader
    Protected da As SqlDataAdapter
    Protected conexao As String = ConfigurationManager.ConnectionStrings("SchoolDb").ConnectionString

    Sub DaoSqlServer()
        Try
            cn = New SqlConnection(conexao)
            cmd = New SqlCommand
            da = New SqlDataAdapter
        Catch ex As Exception
            Throw ex
        End Try
        
    End Sub

    Public Sub OpenConnection()
        Try
            cn.Open()
            cmd.Connection = cn
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub ClosedConnection()
        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If

    End Sub


End Class


