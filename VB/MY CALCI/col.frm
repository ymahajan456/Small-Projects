VERSION 5.00
Begin VB.Form col 
   ClientHeight    =   7530
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   7530
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   840
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   6120
      Width           =   855
   End
   Begin VB.VScrollBar VScrollb 
      Height          =   4095
      Index           =   2
      Left            =   2520
      Max             =   255
      TabIndex        =   2
      Top             =   1320
      Width           =   855
   End
   Begin VB.VScrollBar VScrollg 
      Height          =   4095
      Index           =   1
      Left            =   1560
      Max             =   255
      TabIndex        =   1
      Top             =   1320
      Width           =   855
   End
   Begin VB.VScrollBar VScrollr 
      DragMode        =   1  'Automatic
      Height          =   4095
      Index           =   0
      Left            =   600
      Max             =   255
      TabIndex        =   0
      Top             =   255
      Width           =   855
   End
End
Attribute VB_Name = "col"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub VScrollr_Change(Index As Integer)
Text1.Text = VScrollr.Value
End Sub
