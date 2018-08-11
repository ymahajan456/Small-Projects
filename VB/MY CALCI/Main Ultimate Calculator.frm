VERSION 5.00
Begin VB.Form formstart 
   Caption         =   "Calculator"
   ClientHeight    =   4155
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5835
   LinkTopic       =   "Form1"
   ScaleHeight     =   4155
   ScaleWidth      =   5835
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command3 
      Caption         =   "CLOSE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   4
      ToolTipText     =   "CLOSE"
      Top             =   3240
      Width           =   2055
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Simple"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2880
      TabIndex        =   2
      ToolTipText     =   "SIMPLE CALCULATOR"
      Top             =   1680
      Width           =   2055
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Scientific"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   480
      TabIndex        =   1
      ToolTipText     =   "SCIENTIFIC CALCULATOR"
      Top             =   1680
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "By Yogesh Mahajan"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2760
      TabIndex        =   3
      Top             =   3480
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Choose Calculator Type Which You Want"
      BeginProperty Font 
         Name            =   "Modern"
         Size            =   14.25
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   480
      TabIndex        =   0
      Top             =   360
      Width           =   4935
   End
End
Attribute VB_Name = "formstart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
formstart.Hide
formsci.Show
End Sub

Private Sub Command2_Click()
formstart.Hide
Formsim.Show
End Sub

Private Sub Command3_Click()
End
End Sub
