Public Class FunctionsGen

    Public Enum DayOfWeek
        Sunday
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
    End Enum
    ' Retorna o nome do dia da semana..
    Public Function DiaDaSemanaVal(ByVal pstr_data As String) As String


        Dim DiaDaSemana As String = vbNull

        Select Case Weekday(pstr_data)

            Case 1  ' Domingo
                DiaDaSemana = "Domingo"

            Case 2  ' Segunda
                DiaDaSemana = "Segunda"

            Case 3  ' Terça
                DiaDaSemana = "Terça"

            Case 4  ' Quarta
                DiaDaSemana = "Quarta"

            Case 5  ' Quinta
                DiaDaSemana = "Quinta"

            Case 6  ' Sexta
                DiaDaSemana = "Sexta"

            Case 7  ' Sábado
                DiaDaSemana = "Sábado"

        End Select

        Return DiaDaSemana

    End Function
    ' Retorna o nome do dia da semana.
    Public Function DescricaoMesVal(ByVal pstr_Mes As String) As String

        Dim DescricaoMes As String = vbNull

        Select Case CInt(pstr_Mes)

            Case 1  ' Janeiro
                DescricaoMes = "Janeiro"

            Case 2  ' Fevereiro
                DescricaoMes = "Fevereiro"

            Case 3  ' Março
                DescricaoMes = "Março"

            Case 4  ' Abril
                DescricaoMes = "Abril"

            Case 5  ' Maio
                DescricaoMes = "Maio"

            Case 6  ' Junho
                DescricaoMes = "Junho"

            Case 7  ' Julho
                DescricaoMes = "Julho"

            Case 8  ' Agosto
                DescricaoMes = "Agosto"

            Case 9  ' Setembro
                DescricaoMes = "Setembro"

            Case 10  ' Outubro
                DescricaoMes = "Outubro"

            Case 11  ' Novembro
                DescricaoMes = "Novembro"

            Case 12  ' Dezembro
                DescricaoMes = "Dezembro"

        End Select

        Return DescricaoMes

    End Function
    Public Function converterDataParaSQLVal(ByVal Data As String) As String
        Dim converterDataParaSQL As String = vbNull

        ' Declaração de variáveis auxiliares
        ' para conseguir a data de retorno.
        Dim vstr_Dia As Integer
        Dim vstr_Mes As Integer
        Dim vstr_Ano As Integer

        ' Conseguindo os valores que serão concatenados
        ' para o retorno da função

        'vstr_Dia = Mid(Data, 1, 2)
        'vstr_Mes = Mid(Data, 4, 2)
        'vstr_Ano = Mid(Data, 7, 4)
        If Not Trim(Data) = "" Then

            vstr_Dia = Day(Data)
            vstr_Mes = Month(Data)
            vstr_Ano = DatePart("yyyy", Data)

            If Len(vstr_Dia) = 1 Then

                vstr_Dia = "0" & vstr_Dia
            End If

            If Len(vstr_Mes) = 1 Then

                vstr_Mes = "0" & vstr_Mes
            End If

            ' Retornando a data formatada
            ' para a função.
            converterDataParaSQL = vstr_Ano & "/" & vstr_Mes & "/" & vstr_Dia
        Else

            converterDataParaSQL = ""
        End If
        Return converterDataParaSQL
    End Function
    Public Function converterHoraParaSQLVal(ByVal Hora As String) As String
        Dim converterHoraParaSQL As String

        Dim vstr_Hora As String
        Dim vstr_Minuto As String
        Dim vint_Cont As String

        vstr_Hora = CStr(Hour(Hora))
        vstr_Minuto = CStr(Minute(Hora))

        If Len(vstr_Hora) = 1 Then

            vstr_Hora = "0" & vstr_Hora
        End If

        If Len(vstr_Minuto) = 1 Then

            vstr_Minuto = "0" & vstr_Minuto
        End If

        converterHoraParaSQL = vstr_Hora & ":" & vstr_Minuto

        Return converterHoraParaSQL
    End Function
    Public Function converterDataParaHtmlVal(ByVal Data) As String

        ' Declaração de variáveis auxiliares
        ' para conseguir a data de retorno.
        Dim converterDataParaHtml As String = vbNull
        Dim vstr_Dia As Integer
        Dim vstr_Mes As Integer
        Dim vstr_Ano As Integer

        If Not Data = "" Then

            ' Conseguindo os valores que serão concatenados
            ' para o retorno da função
            vstr_Dia = Day(Data)
            vstr_Mes = Month(Data)
            vstr_Ano = DatePart("yyyy", Data)

            If Len(vstr_Dia) = 1 Then

                vstr_Dia = "0" & vstr_Dia
            End If

            If Len(vstr_Mes) = 1 Then

                vstr_Mes = "0" & vstr_Mes
            End If


            ' Retornando a data formatada
            ' para a função.
            converterDataParaHtml = vstr_Dia & "/" & vstr_Mes & "/" & vstr_Ano
        Else

            converterDataParaHtml = ""
        End If
        Return converterDataParaHtml
    End Function
    Public Function IIF(pboo_ExpressaoBooleana, pstr_ValorTrue, pstr_ValorFalse) As Boolean


        ' Verifica se a expressão booleana passado
        ' como parametro para está função é verdadeira.
        If pboo_ExpressaoBooleana Then

            ' ... neste caso devolve o valor positivo
            ' para a função.
            IIF = pstr_ValorTrue
        Else

            ' ... neste caso devolve o valor negativo
            ' para a função.
            IIF = pstr_ValorFalse
        End If
    End Function
    Public Function GetData() As String

        ' Declaração de variáveis locais.
        Dim vstr_Dia As Integer
        Dim vstr_Mes As Integer
        Dim vstr_Ano As Integer

        ' Conseguindo os valores da data atual.
        vstr_Dia = Date.Today.Day
        vstr_Mes = Date.Today.Month
        vstr_Ano = Date.Today.Year

        ' Formatando os valores para retorno.
        If Len(vstr_Dia) = 1 Then vstr_Dia = "0" & vstr_Dia
        If Len(vstr_Mes) = 1 Then vstr_Mes = "0" & vstr_Mes
        If Len(vstr_Ano) = 2 Then vstr_Ano = "20" & vstr_Ano

        ' Devolvendo o valor formatado para
        ' a chamada da função.
        GetData = vstr_Dia & "/" & vstr_Mes & "/" & vstr_Ano
    End Function
    Public Function retiraCaracterInvalido(ByVal pstr_Registro As String) As String

        pstr_Registro = LCase(pstr_Registro)

        pstr_Registro = Replace(pstr_Registro, "â", "a")
        pstr_Registro = Replace(pstr_Registro, "á", "a")
        pstr_Registro = Replace(pstr_Registro, "à", "a")
        pstr_Registro = Replace(pstr_Registro, "ã", "a")
        pstr_Registro = Replace(pstr_Registro, "é", "e")
        pstr_Registro = Replace(pstr_Registro, "è", "e")
        pstr_Registro = Replace(pstr_Registro, "ê", "e")
        pstr_Registro = Replace(pstr_Registro, "í", "i")
        pstr_Registro = Replace(pstr_Registro, "ì", "i")
        pstr_Registro = Replace(pstr_Registro, "î", "i")
        pstr_Registro = Replace(pstr_Registro, "ô", "o")
        pstr_Registro = Replace(pstr_Registro, "ó", "o")
        pstr_Registro = Replace(pstr_Registro, "ò", "o")
        pstr_Registro = Replace(pstr_Registro, "õ", "o")
        pstr_Registro = Replace(pstr_Registro, "ú", "u")
        pstr_Registro = Replace(pstr_Registro, "ù", "u")
        pstr_Registro = Replace(pstr_Registro, "û", "u")
        pstr_Registro = Replace(pstr_Registro, "(", "_")
        pstr_Registro = Replace(pstr_Registro, ")", "_")
        pstr_Registro = Replace(pstr_Registro, "´", "")
        pstr_Registro = Replace(pstr_Registro, "`", "")
        pstr_Registro = Replace(pstr_Registro, "~", "")
        pstr_Registro = Replace(pstr_Registro, "^", "")
        pstr_Registro = Replace(pstr_Registro, "*", "")
        pstr_Registro = Replace(pstr_Registro, "%", "")
        pstr_Registro = Replace(pstr_Registro, "$", "")
        pstr_Registro = Replace(pstr_Registro, "!", "")
        pstr_Registro = Replace(pstr_Registro, "@", "")
        pstr_Registro = Replace(pstr_Registro, "#", "")
        pstr_Registro = Replace(pstr_Registro, "¨", "")
        pstr_Registro = Replace(pstr_Registro, "+", "")
        pstr_Registro = Replace(pstr_Registro, "º", "")
        pstr_Registro = Replace(pstr_Registro, ";", "")
        pstr_Registro = Replace(pstr_Registro, ":", "")
        pstr_Registro = Replace(pstr_Registro, "-", "")
        pstr_Registro = Replace(pstr_Registro, " ", "_")

        retiraCaracterInvalido = pstr_Registro

    End Function
    Public Function EncriptaString(ByVal pValor As String) As String

        Dim strRet
        Dim i

        ' =======================================================
        ' Monta string com a diferença entre o maior possivel 255
        ' e o valor asc do caracter e inverte os caracteres
        ' =======================================================
        strRet = ""
        If IsDBNull(pValor) Then
            pValor = ""
        End If

        If Not (pValor = "") Then

            For i = 1 To Len(pValor)
                strRet = Chr(255 - Asc(Mid(pValor, i, 1))) & strRet
            Next

        Else

            strRet = "0"
        End If

        EncriptaString = strRet

    End Function
    Public Function DesencriptaString(ByVal pValor As String) As String

        DesencriptaString = EncriptaString(pValor)

    End Function
    Public Function ConverterMinutoParaHora(ByVal pint_Minuto As String) As String

        Dim vint_Minuto As Integer
        Dim vint_Hora As Integer

        vint_Hora = (CInt(pint_Minuto) \ 60)
        vint_Minuto = CInt(pint_Minuto) Mod 60

        If Len(vint_Hora) = 1 Then

            vint_Hora = "0" & CStr(vint_Hora)

        End If

        If Len(vint_Minuto) = 1 Then

            vint_Minuto = "0" & CStr(vint_Minuto)

        End If

        ConverterMinutoParaHora = vint_Hora & ":" & vint_Minuto

    End Function
    Public Function GetUltimoDiaMes(ByVal Mes As String, ByVal Ano As String) As String
        Select Case Mes
            Case 1, 3, 5, 7, 8, 10, 12 : GetUltimoDiaMes = 31
            Case 4, 6, 9, 11 : GetUltimoDiaMes = 30
            Case Else
                If Ano Mod 4 = 0 And (Ano Mod 100 <> 0 Or Ano Mod 400 = 0) Then
                    GetUltimoDiaMes = 29
                Else
                    GetUltimoDiaMes = 28
                End If
        End Select
    End Function
    Public Function GetEnvironmentVariableServer(ByVal strAmbDevelopmentVal As String) As String

        Dim strAmbDevelopment As String
        strAmbDevelopment = Environment.GetEnvironmentVariable(strAmbDevelopmentVal)
        Return strAmbDevelopment
    End Function
    Public Shared Function GetEnvironmentVariableServerPre() As String

        Dim strAmbDevelopment As String
        strAmbDevelopment = Environment.GetEnvironmentVariable("AMBDEVELOPMENT")
        Return strAmbDevelopment
    End Function

    'Cria um novo arquivo texto informando o local. O true indica que é para acrescentar
    Public Sub GravaLog(ByVal Message As String)
        Dim ambiente As String = GetEnvironmentVariableServerPre()
        Dim local As String = "C:\Projetos\School\print"

        Dim GravaMes As New System.IO.StreamWriter(local + "\Log.txt", True)

        'Grava no arquivo uma linha com a data e hora atual
        GravaMes.WriteLine("Log do dia :" + DateTime.Now.ToString())
        GravaMes.WriteLine("Ambiente :" + ambiente.ToString())
        GravaMes.WriteLine("Mensagem  :" + Message.ToString())
        GravaMes.Close()

    End Sub

End Class
