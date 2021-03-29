<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class BtnSumar
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.BtnLimpiar = New System.Windows.Forms.Button()
        Me.BtnFInalizar = New System.Windows.Forms.Button()
        Me.LblPrimer = New System.Windows.Forms.Label()
        Me.LblSegundo = New System.Windows.Forms.Label()
        Me.LblResultado = New System.Windows.Forms.Label()
        Me.TBoxPrimer = New System.Windows.Forms.TextBox()
        Me.TBoxSegundo = New System.Windows.Forms.TextBox()
        Me.TBoxResultado = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(91, 210)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Sumar"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'BtnLimpiar
        '
        Me.BtnLimpiar.Location = New System.Drawing.Point(172, 210)
        Me.BtnLimpiar.Name = "BtnLimpiar"
        Me.BtnLimpiar.Size = New System.Drawing.Size(75, 23)
        Me.BtnLimpiar.TabIndex = 1
        Me.BtnLimpiar.Text = "Limpiar"
        Me.BtnLimpiar.UseVisualStyleBackColor = True
        '
        'BtnFInalizar
        '
        Me.BtnFInalizar.Location = New System.Drawing.Point(253, 210)
        Me.BtnFInalizar.Name = "BtnFInalizar"
        Me.BtnFInalizar.Size = New System.Drawing.Size(75, 23)
        Me.BtnFInalizar.TabIndex = 2
        Me.BtnFInalizar.Text = "Finalizar"
        Me.BtnFInalizar.UseVisualStyleBackColor = True
        '
        'LblPrimer
        '
        Me.LblPrimer.AutoSize = True
        Me.LblPrimer.Location = New System.Drawing.Point(88, 55)
        Me.LblPrimer.Name = "LblPrimer"
        Me.LblPrimer.Size = New System.Drawing.Size(122, 13)
        Me.LblPrimer.TabIndex = 3
        Me.LblPrimer.Text = "Ingrese el primer numero"
        '
        'LblSegundo
        '
        Me.LblSegundo.AutoSize = True
        Me.LblSegundo.Location = New System.Drawing.Point(88, 90)
        Me.LblSegundo.Name = "LblSegundo"
        Me.LblSegundo.Size = New System.Drawing.Size(135, 13)
        Me.LblSegundo.TabIndex = 4
        Me.LblSegundo.Text = "Ingrese el segundo numero"
        '
        'LblResultado
        '
        Me.LblResultado.AutoSize = True
        Me.LblResultado.Location = New System.Drawing.Point(88, 125)
        Me.LblResultado.Name = "LblResultado"
        Me.LblResultado.Size = New System.Drawing.Size(55, 13)
        Me.LblResultado.TabIndex = 5
        Me.LblResultado.Text = "Resultado"
        '
        'TBoxPrimer
        '
        Me.TBoxPrimer.Location = New System.Drawing.Point(253, 52)
        Me.TBoxPrimer.Name = "TBoxPrimer"
        Me.TBoxPrimer.Size = New System.Drawing.Size(100, 20)
        Me.TBoxPrimer.TabIndex = 6
        '
        'TBoxSegundo
        '
        Me.TBoxSegundo.Location = New System.Drawing.Point(253, 83)
        Me.TBoxSegundo.Name = "TBoxSegundo"
        Me.TBoxSegundo.Size = New System.Drawing.Size(100, 20)
        Me.TBoxSegundo.TabIndex = 7
        '
        'TBoxResultado
        '
        Me.TBoxResultado.Location = New System.Drawing.Point(253, 118)
        Me.TBoxResultado.Name = "TBoxResultado"
        Me.TBoxResultado.Size = New System.Drawing.Size(100, 20)
        Me.TBoxResultado.TabIndex = 8
        '
        'BtnSumar
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(585, 450)
        Me.Controls.Add(Me.TBoxResultado)
        Me.Controls.Add(Me.TBoxSegundo)
        Me.Controls.Add(Me.TBoxPrimer)
        Me.Controls.Add(Me.LblResultado)
        Me.Controls.Add(Me.LblSegundo)
        Me.Controls.Add(Me.LblPrimer)
        Me.Controls.Add(Me.BtnFInalizar)
        Me.Controls.Add(Me.BtnLimpiar)
        Me.Controls.Add(Me.Button1)
        Me.Name = "BtnSumar"
        Me.Text = "Calculadora de dos valores"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Button1 As Button
    Friend WithEvents BtnLimpiar As Button
    Friend WithEvents BtnFInalizar As Button
    Friend WithEvents LblPrimer As Label
    Friend WithEvents LblSegundo As Label
    Friend WithEvents LblResultado As Label
    Friend WithEvents TBoxPrimer As TextBox
    Friend WithEvents TBoxSegundo As TextBox
    Friend WithEvents TBoxResultado As TextBox
End Class
