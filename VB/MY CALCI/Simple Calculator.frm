VERSION 5.00
Begin VB.Form Formsim 
   Caption         =   "Simole Calculator"
   ClientHeight    =   5355
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   5955
   LinkTopic       =   "Form3"
   ScaleHeight     =   5355
   ScaleWidth      =   5955
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton percent 
      Caption         =   "%"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      TabIndex        =   18
      ToolTipText     =   "PERCENTAGE"
      Top             =   4080
      Width           =   855
   End
   Begin VB.TextBox scr1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   600
      TabIndex        =   17
      Top             =   0
      Width           =   4695
   End
   Begin VB.CommandButton n1 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      TabIndex        =   16
      ToolTipText     =   "1"
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton n2 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1560
      TabIndex        =   15
      ToolTipText     =   "2"
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton n3 
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   0
      Left            =   2520
      TabIndex        =   14
      ToolTipText     =   "3"
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton n4 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      TabIndex        =   13
      ToolTipText     =   "4"
      Top             =   2160
      Width           =   855
   End
   Begin VB.CommandButton n5 
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1560
      TabIndex        =   12
      ToolTipText     =   "5"
      Top             =   2160
      Width           =   855
   End
   Begin VB.CommandButton n6 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2520
      TabIndex        =   11
      ToolTipText     =   "6"
      Top             =   2160
      Width           =   855
   End
   Begin VB.CommandButton n7 
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      TabIndex        =   10
      ToolTipText     =   "7"
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton n8 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1560
      TabIndex        =   9
      ToolTipText     =   "8"
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton n9 
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2520
      TabIndex        =   8
      ToolTipText     =   "9"
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton n0 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1560
      TabIndex        =   7
      ToolTipText     =   "0"
      Top             =   4080
      Width           =   855
   End
   Begin VB.CommandButton po 
      Caption         =   "."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2520
      TabIndex        =   6
      ToolTipText     =   "DECIMAL POINT"
      Top             =   4080
      Width           =   855
   End
   Begin VB.CommandButton clr 
      Caption         =   "CR"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   4440
      TabIndex        =   5
      ToolTipText     =   "CLEAR"
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton eql 
      Caption         =   "="
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   4440
      TabIndex        =   4
      ToolTipText     =   "EQUAL"
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton addd 
      Caption         =   "+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   3
      ToolTipText     =   "ADD"
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton subt 
      Caption         =   "_"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   2
      ToolTipText     =   "SUBTRACT"
      Top             =   2160
      Width           =   855
   End
   Begin VB.CommandButton multi 
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   1
      ToolTipText     =   "MULTIPLY"
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton divi 
      Caption         =   "/"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   0
      ToolTipText     =   "DIVIDE"
      Top             =   4080
      Width           =   855
   End
   Begin VB.Menu file 
      Caption         =   "&File"
      Begin VB.Menu mode 
         Caption         =   "&Mode"
         Begin VB.Menu scientific 
            Caption         =   "&Scientific"
            Shortcut        =   ^S
         End
         Begin VB.Menu simple 
            Caption         =   "&Simple"
            Shortcut        =   ^N
         End
      End
      Begin VB.Menu colour 
         Caption         =   "&Colour"
         Begin VB.Menu red 
            Caption         =   "&Red"
            Shortcut        =   ^R
         End
         Begin VB.Menu blue 
            Caption         =   "&Blue"
            Shortcut        =   ^B
         End
         Begin VB.Menu green 
            Caption         =   "&Green"
            Shortcut        =   ^G
         End
         Begin VB.Menu violet 
            Caption         =   "&Violet"
            Shortcut        =   ^V
         End
         Begin VB.Menu white 
            Caption         =   "&White"
            Shortcut        =   ^W
         End
      End
   End
   Begin VB.Menu close 
      Caption         =   "Close"
   End
End
Attribute VB_Name = "Formsim"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim a, b, c, d, e, f, g As Double
Dim oper As String
Private Sub addd_Click()
a = Val(scr1.Text)
scr1.Text = " "
oper = "+"
End Sub

Private Sub blue_Click()
formsci.BackColor = &HFF0000
acc.BackColor = &HFF0000
ang.BackColor = &HFF0000
are.BackColor = &HFF0000
cha.BackColor = &HFF0000
cur.BackColor = &HFF0000
den.BackColor = &HFF0000
dis.BackColor = &HFF0000
forc.BackColor = &HFF0000
formcon.BackColor = &HFF0000
Formsim.BackColor = &HFF0000
lum.BackColor = &HFF0000
mag.BackColor = &HFF0000
mas.BackColor = &HFF0000
pow.BackColor = &HFF0000
pre.BackColor = &HFF0000
tem.BackColor = &HFF0000
tim.BackColor = &HFF0000
vel.BackColor = &HFF0000
vol.BackColor = &HFF0000
volt.BackColor = &HFF0000
End Sub

Private Sub close_Click()
End
End Sub

Private Sub clr_Click()
scr1.Text = " "
End Sub

Private Sub Command1_Click()
End
End Sub



Private Sub divi_Click()
a = Val(scr1.Text)
scr1.Text = " "
oper = "/"
End Sub
Private Sub eql_Click()
b = Val(scr1.Text)
If oper = "+" Then
scr1.Text = Val(a + b)
End If
If oper = "-" Then
scr1.Text = Val(a - b)
End If
If oper = "*" Then
scr1.Text = Val(a * b)
End If
If oper = "/" And Val(b) <> "0" Then
scr1.Text = Val(a / b)
End If
If oper = "/" And Val(b) = "0" Then
scr1.Text = "MATHS ERROR"
End If
If oper = "%" Then
scr1.Text = (b / 100 * a)
End If
End Sub



Private Sub frmbl_Click(Index As Integer)
Formsim.BackColor = &HFFFF00
End Sub
Private Sub frmg_Click(Index As Integer)
Formsim.BackColor = &HFF00&
End Sub


Private Sub frmw_Click(Index As Integer)
Formsim.BackColor = &H8000000F
End Sub

Private Sub green_Click()
formsci.BackColor = &HC000&
acc.BackColor = &HC000&
ang.BackColor = &HC000&
are.BackColor = &HC000&
cha.BackColor = &HC000&
cur.BackColor = &HC000&
den.BackColor = &HC000&
dis.BackColor = &HC000&
forc.BackColor = &HC000&
formcon.BackColor = &HC000&
Formsim.BackColor = &HC000&
lum.BackColor = &HC000&
mag.BackColor = &HC000&
mas.BackColor = &HC000&
pow.BackColor = &HC000&
pre.BackColor = &HC000&
tem.BackColor = &HC000&
tim.BackColor = &HC000&
vel.BackColor = &HC000&
vol.BackColor = &HC000&
volt.BackColor = &HC000&
End Sub

Private Sub n1_Click()
scr1.Text = scr1.Text + "1"
End Sub
Private Sub n2_Click()
scr1.Text = scr1.Text + "2"
End Sub

Private Sub n3_Click(Index As Integer)
scr1.Text = scr1.Text + "3"
End Sub

Private Sub n4_Click()
scr1.Text = scr1.Text + "4"
End Sub
Private Sub n5_Click()
scr1.Text = scr1.Text + "5"
End Sub
Private Sub n6_Click()
scr1.Text = scr1.Text + "6"
End Sub
Private Sub n7_Click()
scr1.Text = scr1.Text + "7"
End Sub
Private Sub n8_Click()
scr1.Text = scr1.Text + "8"
End Sub
Private Sub n9_Click()
scr1.Text = scr1.Text + "9"
End Sub
Private Sub n0_Click()
scr1.Text = scr1.Text + "0"
End Sub

Private Sub percent_Click()
a = Val(scr1.Text)
scr1.Text = ""
oper = "%"
End Sub

Private Sub po_Click()
scr1.Text = scr1.Text + "."
End Sub

Private Sub red_Click()
formsci.BackColor = &HFF&
acc.BackColor = &HFF&
ang.BackColor = &HFF&
are.BackColor = &HFF&
cha.BackColor = &HFF&
cur.BackColor = &HFF&
den.BackColor = &HFF&
dis.BackColor = &HFF&
forc.BackColor = &HFF&
formcon.BackColor = &HFF&
Formsim.BackColor = &HFF&
lum.BackColor = &HFF&
mag.BackColor = &HFF&
mas.BackColor = &HFF&
pow.BackColor = &HFF&
pre.BackColor = &HFF&
tem.BackColor = &HFF&
tim.BackColor = &HFF&
vel.BackColor = &HFF&
vol.BackColor = &HFF&
volt.BackColor = &HFF&
End Sub

Private Sub scientific_Click()
Formsim.Hide
formsci.Show
End Sub

Private Sub subt_Click()
a = Val(scr1.Text)
scr1.Text = " "
oper = "-"
End Sub
Private Sub multi_Click()
a = Val(scr1.Text)
scr1.Text = " "
oper = "*"
End Sub

Private Sub violet_Click()
formsci.BackColor = &HFF8080
acc.BackColor = &HFF8080
ang.BackColor = &HFF8080
are.BackColor = &HFF8080
cha.BackColor = &HFF8080
cur.BackColor = &HFF8080
den.BackColor = &HFF8080
dis.BackColor = &HFF8080
forc.BackColor = &HFF8080
formcon.BackColor = &HFF8080
Formsim.BackColor = &HFF8080
lum.BackColor = &HFF8080
mag.BackColor = &HFF8080
mas.BackColor = &HFF8080
pow.BackColor = &HFF8080
pre.BackColor = &HFF8080
tem.BackColor = &HFF8080
tim.BackColor = &HFF8080
vel.BackColor = &HFF8080
vol.BackColor = &HFF8080
volt.BackColor = &HFF8080
End Sub

Private Sub white_Click()
formsci.BackColor = &H8000000F
acc.BackColor = &H8000000F
ang.BackColor = &H8000000F
are.BackColor = &H8000000F
cha.BackColor = &H8000000F
cur.BackColor = &H8000000F
den.BackColor = &H8000000F
dis.BackColor = &H8000000F
forc.BackColor = &H8000000F
formcon.BackColor = &H8000000F
Formsim.BackColor = &H8000000F
lum.BackColor = &H8000000F
mag.BackColor = &H8000000F
mas.BackColor = &H8000000F
pow.BackColor = &H8000000F
pre.BackColor = &H8000000F
tem.BackColor = &H8000000F
tim.BackColor = &H8000000F
vel.BackColor = &H8000000F
vol.BackColor = &H8000000F
volt.BackColor = &H8000000F
End Sub
