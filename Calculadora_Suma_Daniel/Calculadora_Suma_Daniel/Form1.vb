Public Class BtnSumar
    Dim a As Integer
    Dim b As Integer
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        a = Val(TBoxPrimer.Text)
        b = Val(TBoxSegundo.Text)
        TBoxResultado.Text = a + b

    End Sub

    Private Sub BtnLimpiar_Click(sender As Object, e As EventArgs) Handles BtnLimpiar.Click
        TBoxPrimer.Text = ""
        TBoxSegundo.Text = ""
        TBoxResultado.Text = ""
    End Sub

    Private Sub BtnFInalizar_Click(sender As Object, e As EventArgs) Handles BtnFInalizar.Click
        End
    End Sub
End Class
