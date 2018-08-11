VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5040
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10905
   LinkTopic       =   "Form1"
   ScaleHeight     =   5040
   ScaleWidth      =   10905
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdcalculate 
      Caption         =   "calcuate"
      Height          =   975
      Left            =   5160
      TabIndex        =   1
      Top             =   840
      Width           =   1575
   End
   Begin VB.TextBox txtradius 
      Height          =   615
      Left            =   1320
      TabIndex        =   0
      Top             =   720
      Width           =   1935
   End
   Begin VB.Label lblarea 
      Height          =   375
      Left            =   4800
      TabIndex        =   3
      Top             =   3480
      Width           =   2295
   End
   Begin VB.Label lblcircum 
      Height          =   375
      Left            =   4800
      TabIndex        =   2
      Top             =   2640
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdcalculate_Click()
Dim objcircle As New clscircle
objcircle.rad = Val(txtradius)
objcircle.calculatearea
objcircle.calculatecircum
lblarea.Caption = objcircle.mainarea
lblcircum.Caption = objcircle.maincircum
End Sub
