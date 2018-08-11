VERSION 5.00
Begin VB.Form are 
   Caption         =   "Area"
   ClientHeight    =   8400
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13755
   LinkTopic       =   "Form13"
   ScaleHeight     =   8400
   ScaleWidth      =   13755
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fmarea 
      Caption         =   "INITIAL UNIT"
      Height          =   7335
      Left            =   120
      TabIndex        =   23
      Top             =   480
      Width           =   3615
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         Height          =   375
         Index           =   1
         Left            =   240
         TabIndex        =   25
         Top             =   1080
         Width           =   2655
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   24
         Top             =   600
         Width           =   2655
      End
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
      Left            =   8400
      TabIndex        =   9
      Top             =   600
      Width           =   2775
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
      Left            =   12000
      TabIndex        =   8
      Top             =   480
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
      Left            =   4200
      TabIndex        =   7
      Top             =   240
      Width           =   1095
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
      Left            =   5400
      TabIndex        =   6
      Top             =   240
      Width           =   1095
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
      Left            =   11400
      Picture         =   "are.frx":0000
      TabIndex        =   5
      Top             =   1440
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
      Left            =   11400
      Picture         =   "are.frx":2167
      TabIndex        =   4
      Top             =   3840
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
      Left            =   11400
      Picture         =   "are.frx":42CE
      TabIndex        =   3
      Top             =   3360
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
      Left            =   11400
      Picture         =   "are.frx":6435
      TabIndex        =   2
      Top             =   2880
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
      Left            =   11400
      Picture         =   "are.frx":859C
      TabIndex        =   1
      Top             =   2400
      Width           =   495
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
      Left            =   11400
      Picture         =   "are.frx":A703
      TabIndex        =   0
      Top             =   1920
      Width           =   495
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      X1              =   3960
      X2              =   3960
      Y1              =   0
      Y2              =   8400
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
      Left            =   6120
      TabIndex        =   22
      Top             =   1440
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
      Left            =   6240
      TabIndex        =   21
      Top             =   5760
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
      Left            =   6240
      TabIndex        =   20
      Top             =   4800
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
      Left            =   6240
      TabIndex        =   19
      Top             =   4080
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
      Left            =   6120
      TabIndex        =   18
      Top             =   3120
      Width           =   1095
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
      Left            =   6840
      TabIndex        =   17
      Top             =   2160
      Width           =   1095
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
      Left            =   4200
      TabIndex        =   16
      Top             =   2640
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
      Left            =   4200
      TabIndex        =   15
      Top             =   1920
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
      Left            =   3960
      TabIndex        =   14
      Top             =   3720
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
      Left            =   3960
      TabIndex        =   13
      Top             =   4200
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
      Left            =   3960
      TabIndex        =   12
      Top             =   4680
      Width           =   1815
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
      Left            =   3960
      TabIndex        =   11
      Top             =   5160
      Width           =   1815
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
      Left            =   8400
      TabIndex        =   10
      Top             =   120
      Width           =   2775
   End
End
Attribute VB_Name = "are"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
