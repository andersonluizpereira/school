Imports System.Data
Imports System.Data.Common
Imports System.Collections.Generic
Public Class AcessGenericDB


    Public Shared Function CreateCommand(tipoAcesso As String, comandoTexto As String, comandoTipo As CommandType, listaParametros As List(Of DbParameter)) As DbCommand
        'Public Shared Function CriarComando(comandoTexto As String, comandoTipo As CommandType, listaParametros As List(Of DbParameter)) As DbCommand

        ConnectDB.getAcesso(tipoAcesso)

        Try
            'O processo de obter DbProviderFactory envolve passar informações sobre um provedor de dados
            'para a classe DbProviderFactories. Com base nessas informações, o método GetFactory cria uma 
            'fábrica de provedor fortemente tipada.
            Dim oFactory = DbProviderFactories.GetFactory(ConnectDB.ProviderName)
            'Cria um objeto derivado de DbConnection
            Dim oConn = oFactory.CreateConnection

            oConn.ConnectionString = ConnectDB.ConnectionString

            ' Cria um objeto Command derivado de DBCommand.
            Dim oCmd = oConn.CreateCommand

            'define o tipo de comando 
            oCmd.CommandText = comandoTexto
            oCmd.CommandType = comandoTipo

            'verifica se existem parâmetros
            If Not IsNothing(listaParametros) Then
                For Each oParam In listaParametros
                    oCmd.Parameters.Add(oParam)
                Next
            End If

            'retorna o comando
            Return oCmd

        Catch ex As Exception
            Throw ex
        End Try

    End Function

    Public Shared Function CreateParameteR(nomeParametro As String, tipoParametro As DbType, valorParametro As Object) As DbParameter

        Try
            'O processo de obter DbProviderFactory envolve passar informações sobre um provedor de dados
            'para a classe DbProviderFactories. Com base nessas informações, o método GetFactory cria uma 
            'fábrica de provedor fortemente tipada.
            Dim oFactory = DbProviderFactories.GetFactory(ConnectDB.ProviderName)

            'cria o parâmetro
            Dim oParam = oFactory.CreateParameter()

            'atribui o nome, tipo e valor do parâmetro
            If Not IsNothing(oParam) Then
                oParam.ParameterName = nomeParametro
                oParam.DbType = tipoParametro
                oParam.Value = valorParametro
            End If

            'retorna o parâmetro
            Return oParam

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function ExecuteCommand(tipoAcesso As String, comandoTexto As String, comandoTipo As CommandType, listaParametros As List(Of DbParameter), tipoComando As TipoDeComando) As Object
        'Public Shared Function ExecutarComando(comandoTexto As String, comandoTipo As CommandType, listaParametros As List(Of DbParameter), tipoComando As TipoDeComando) As Object

        Dim command = CreateCommand(tipoAcesso, comandoTexto, comandoTipo, listaParametros)
        Dim retorno As Object = Nothing
        Dim fugen As New FunctionsGen

        Try
            command.Connection.Open()

            Select Case tipoComando
                Case TipoDeComando.ExecuteNonQuery
                    retorno = command.ExecuteNonQuery
                Case TipoDeComando.ExecuteReader
                    retorno = command.ExecuteReader
                Case TipoDeComando.ExecuteScalar
                    retorno = command.ExecuteScalar
                Case TipoDeComando.ExecuteDataTable
                    Dim table = New DataTable
                    Dim reader = command.ExecuteReader
                    table.Load(reader)
                    reader.Close()
                    retorno = table
                Case TipoDeComando.ExecuteDataSet
                    Dim oFactory = DbProviderFactories.GetFactory(ConnectDB.ProviderName)
                    Dim da As DbDataAdapter = oFactory.CreateDataAdapter
                    command.CommandText = comandoTexto
                    command.CommandType = comandoTipo
                    da.SelectCommand = command
                    Dim ds As New DataSet
                    da.Fill(ds)
                    retorno = ds
            End Select
        Catch ex As Exception
            Throw ex
        Finally
            If Not tipoComando = TipoDeComando.ExecuteReader Then
                If command.Connection.State = ConnectionState.Open Then
                    command.Connection.Close()
                End If
                command.Connection.Dispose()
            End If
        End Try
        Return retorno

    End Function

    Public Enum TipoDeComando
        ExecuteNonQuery
        ExecuteReader
        ExecuteScalar
        ExecuteDataTable
        ExecuteDataSet
    End Enum


End Class
