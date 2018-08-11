VERSION 5.00
Begin VB.Form acc 
   Caption         =   "Acceleration"
   ClientHeight    =   4650
   ClientLeft      =   4740
   ClientTop       =   4020
   ClientWidth     =   7455
   LinkTopic       =   "Form7"
   ScaleHeight     =   4650
   ScaleWidth      =   7455
   Begin VB.OptionButton opms2 
      Caption         =   "m/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   500
      TabIndex        =   28
      Top             =   1560
      Value           =   -1  'True
      Width           =   1815
   End
   Begin VB.OptionButton cms2 
      Caption         =   "cm/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   500
      TabIndex        =   27
      Top             =   2040
      Width           =   1815
   End
   Begin VB.OptionButton opkmh2 
      Caption         =   "Km/H^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   500
      TabIndex        =   26
      Top             =   2520
      Width           =   1815
   End
   Begin VB.OptionButton opins2 
      Caption         =   "in/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   500
      TabIndex        =   25
      Top             =   3000
      Width           =   1815
   End
   Begin VB.OptionButton opfs2 
      Caption         =   "ft/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   500
      TabIndex        =   24
      Top             =   3480
      Width           =   1815
   End
   Begin VB.OptionButton opg 
      Caption         =   "g"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   500
      TabIndex        =   23
      Top             =   3960
      Width           =   1815
   End
   Begin VB.CommandButton Command4 
      Caption         =   "CLOSE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      TabIndex        =   22
      Top             =   360
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   15
      Top             =   360
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "CONVERT"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3240
      TabIndex        =   14
      Top             =   360
      Width           =   1095
   End
   Begin VB.TextBox scracc 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   6
      Top             =   360
      Width           =   2775
   End
   Begin VB.CommandButton c2 
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   7
      Left            =   6720
      Picture         =   "acc.frx":0000
      TabIndex        =   5
      Top             =   1680
      Width           =   495
   End
   Begin VB.CommandButton c3 
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   6
      Left            =   6720
      Picture         =   "acc.frx":2167
      TabIndex        =   4
      Top             =   2160
      Width           =   495
   End
   Begin VB.CommandButton c4 
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   6720
      Picture         =   "acc.frx":42CE
      TabIndex        =   3
      Top             =   2640
      Width           =   495
   End
   Begin VB.CommandButton c5 
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   6720
      Picture         =   "acc.frx":6435
      TabIndex        =   2
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton c6 
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   6720
      Picture         =   "acc.frx":859C
      TabIndex        =   1
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton c1 
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   6720
      Picture         =   "acc.frx":A703
      TabIndex        =   0
      Top             =   1200
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "            INITIAL UNIT"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   29
      Top             =   1080
      Width           =   2535
   End
   Begin VB.Line Line3 
      X1              =   7320
      X2              =   7320
      Y1              =   4440
      Y2              =   0
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   7320
      Y1              =   4440
      Y2              =   4440
   End
   Begin VB.Line Line1 
      X1              =   7320
      X2              =   0
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Line Line2 
      X1              =   3120
      X2              =   3120
      Y1              =   960
      Y2              =   4440
   End
   Begin VB.Label gl 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   21
      Top             =   3720
      Width           =   1815
   End
   Begin VB.Label fs2l 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   20
      Top             =   3240
      Width           =   1815
   End
   Begin VB.Label ins2l 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   19
      Top             =   2760
      Width           =   1815
   End
   Begin VB.Label kmh2l 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   18
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label cms2l 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   17
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Label ms2l 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3360
      TabIndex        =   16
      Top             =   1320
      Width           =   1815
   End
   Begin VB.Label Label3 
      Caption         =   "cm/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   5520
      TabIndex        =   13
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "Km/H^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   5520
      TabIndex        =   12
      Top             =   2280
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "in/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   5520
      TabIndex        =   11
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "ft/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   5520
      TabIndex        =   10
      Top             =   3240
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "g"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   5520
      TabIndex        =   9
      Top             =   3720
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "m/s^2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   5520
      TabIndex        =   8
      Top             =   1320
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "Acceleration"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   120
      Width           =   2775
   End
End
Attribute VB_Name = "acc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim j, k  As Double
Dim l As String
Public z As Double

Private Sub c1_Click(Index As Integer)
z = Val(scracc.Text)
End Sub

Private Sub Command1_Click()
j = Val(scracc.Text)
If opms2 = True Then
k = j
End If
If opcms2 = True Then
k = (j / 100)
End If
If opkmh2 = True Then
k = (j / 3.6)
End If
If opins2 = True Then
k = (j / 39.3701)
End If
If opfs2 = True Then
k = (j / 3.28084)
End If
If opg = True Then
k = (j / 0.101972)
End If
ms2l.Caption = Val(k)
 cms2l.Caption = Val(k * 100)
 kmh2l.Caption = Val(k * 3.6)
ins2l.Caption = Val(k * 39.3701)
fs2l.Caption = Val(k * 3.28084)
 gl.Caption = Val(k * 0.101972)
End Sub
Private Sub Command3_Click()
scracc.Text = ""
End Sub

Private Sub Command4_Click()
acc.Hide
End Sub



