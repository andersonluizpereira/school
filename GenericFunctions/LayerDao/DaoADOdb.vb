Imports System.Configuration
Imports System.Data
Imports System.Data.OleDb

Public Class DaoADOdb
    Protected cn As OleDbConnection
    Protected cmd As OleDbCommand
    Protected reader As OleDbDataReader
    Protected da As OleDbDataAdapter
    Protected conexao As String = ConfigurationManager.ConnectionStrings("DES").ConnectionString
    Sub DaoADOdb()
        Try
            cn = New OleDbConnection(conexao)
            cmd = New OleDbCommand
            da = New OleDbDataAdapter
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
