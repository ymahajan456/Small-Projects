VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3840
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6570
   LinkTopic       =   "Form1"
   ScaleHeight     =   3840
   ScaleWidth      =   6570
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command17 
      Caption         =   "Command17"
      Height          =   2295
      Left            =   5040
      TabIndex        =   17
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton Command16 
      Caption         =   "Command16"
      Height          =   735
      Left            =   3840
      TabIndex        =   16
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton Command15 
      Caption         =   "Command15"
      Height          =   615
      Left            =   3840
      TabIndex        =   15
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command14 
      Caption         =   "Command14"
      Height          =   495
      Left            =   3840
      TabIndex        =   14
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton Command13 
      Caption         =   "Command13"
      Height          =   495
      Left            =   3840
      TabIndex        =   13
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton Command12 
      Caption         =   "Command12"
      Height          =   495
      Left            =   2640
      TabIndex        =   12
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton Command11 
      Caption         =   "Command11"
      Height          =   495
      Left            =   1440
      TabIndex        =   11
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton Command10 
      Caption         =   "Command10"
      Height          =   495
      Left            =   240
      TabIndex        =   10
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Command9"
      Height          =   495
      Left            =   2640
      TabIndex        =   9
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Command8"
      Height          =   495
      Left            =   1440
      TabIndex        =   8
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Command7"
      Height          =   495
      Left            =   240
      TabIndex        =   7
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Command6"
      Height          =   615
      Left            =   2640
      TabIndex        =   6
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Command5"
      Height          =   615
      Left            =   1440
      TabIndex        =   5
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Command4"
      Height          =   615
      Left            =   240
      TabIndex        =   4
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   735
      Left            =   2640
      TabIndex        =   3
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   735
      Left            =   1440
      TabIndex        =   2
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   735
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   1440
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   855
      Left            =   240
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   240
      Width           =   6135
   End
   Begin VB.Label Label1 
      Caption         =   "1"
      Height          =   495
      Left            =   240
      TabIndex        =   18
      Top             =   1560
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x As Double
Dim operand1 As Double, operand2 As Double
Dim clear display As Boolean
Dim operator As String



Private Sub Command1_Click()
Text1.Text = Text1.Text + "1"

End Sub

Private Sub Command10_Click()
Text1.Text = ""
End Sub

Private Sub Command11_Click()
Text1.Text = Text1.Text + "0"
End Sub

Private Sub Command12_Click()
Text1.Text = Text1.Text + "."
End Sub

Private Sub Command13_Click()
operand1 = Val(Tetx1.Text)
operator = "/"
Text1.Text = ""
End Sub

Private Sub Command14_Click()
operand1 = Val(Tetx1.Text)
operator = "*"
Text1.Text = ""
End Sub

Private Sub Command15_Click()
operand1 = Val(Tetx1.Text)
operator = "-"
Text1.Text = ""
End Sub

Private Sub Command16_Click()
operand1 = Val(Tetx1.Text)
operator = "+"
Text1.Text = ""
End Sub

Private Sub Command2_Click()
Text1.Text = Text1.Text + "2"
End Sub

Private Sub Command3_Click()
Text1.Text = Text1.Text + "3"
End Sub

Private Sub Command4_Click()
Text1.Text = Text1.Text + "4"
End Sub

Private Sub Command5_Click()
Text1.Text = Text1.Text + "5"
End Sub

Private Sub Command6_Click()
Text1.Text = Text1.Text + "6"
End Sub

Private Sub Command7_Click()
Text1.Text = Text1.Text + "7"
End Sub

Private Sub Command8_Click()
Text1.Text = Text1.Text + "8"
End Sub

Private Sub Command9_Click()
Text1.Text = Text1.Text + "9"
End Sub
