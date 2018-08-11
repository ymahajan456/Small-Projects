VERSION 5.00
Begin VB.Form formcon 
   Caption         =   "Conversions"
   ClientHeight    =   5475
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   7755
   LinkTopic       =   "Form1"
   ScaleHeight     =   5475
   ScaleWidth      =   7755
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton area 
      Caption         =   "Area"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   17
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton mass 
      Caption         =   "Mass"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2040
      TabIndex        =   16
      Top             =   360
      Width           =   1695
   End
   Begin VB.CommandButton temp 
      Caption         =   "Tempreture"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   1695
   End
   Begin VB.CommandButton distance 
      Caption         =   "Distance"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3840
      TabIndex        =   15
      Top             =   360
      Width           =   1695
   End
   Begin VB.CommandButton angle 
      Caption         =   "Angle"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2040
      TabIndex        =   14
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton power 
      Caption         =   "Power"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3840
      TabIndex        =   13
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton pressure 
      Caption         =   "Pressure"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5640
      TabIndex        =   12
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton velocity 
      Caption         =   "Velocity"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5640
      TabIndex        =   11
      Top             =   2280
      Width           =   1695
   End
   Begin VB.CommandButton volume 
      Caption         =   "Volume"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5640
      TabIndex        =   10
      Top             =   360
      Width           =   1695
   End
   Begin VB.CommandButton density 
      Caption         =   "Density"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3840
      TabIndex        =   9
      Top             =   2280
      Width           =   1695
   End
   Begin VB.CommandButton current 
      Caption         =   "Current"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3840
      TabIndex        =   8
      Top             =   3240
      Width           =   1695
   End
   Begin VB.CommandButton voltage 
      Caption         =   "Voltage"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5640
      TabIndex        =   7
      Top             =   3240
      Width           =   1695
   End
   Begin VB.CommandButton force 
      Caption         =   "Force"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2040
      TabIndex        =   6
      Top             =   2280
      Width           =   1695
   End
   Begin VB.CommandButton charge 
      Caption         =   "Charge"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2040
      TabIndex        =   5
      Top             =   3240
      Width           =   1695
   End
   Begin VB.CommandButton lumminance 
      Caption         =   "Luminance"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2040
      TabIndex        =   4
      Top             =   4200
      Width           =   1695
   End
   Begin VB.CommandButton time 
      Caption         =   "Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   3
      Top             =   2280
      Width           =   1695
   End
   Begin VB.CommandButton acceleration 
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
      Height          =   855
      Left            =   240
      TabIndex        =   2
      Top             =   3240
      Width           =   1695
   End
   Begin VB.CommandButton magflux 
      Caption         =   "Magnetic Flux"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   1
      Top             =   4200
      Width           =   1695
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
         Begin VB.Menu Violet 
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
Attribute VB_Name = "formcon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub acceleration_Click()
formcon.Hide
acc.Show 1
End Sub

Private Sub angle_Click()
formcon.Hide
ang.Show 1
End Sub

Private Sub area_Click()
formcon.Hide
are.Show 1
End Sub

Private Sub charge_Click()
formcon.Hide
cha.Show 1
End Sub

Private Sub current_Click()
formcon.Hide
cur.Show 1
End Sub

Private Sub density_Click()
formcon.Hide
den.Show 1
End Sub

Private Sub distance_Click()
formcon.Hide
dis.Show 1
End Sub

Private Sub force_Click()
formcon.Hide
forc.Show 1
End Sub

Private Sub lumminance_Click()
formcon.Hide
lum.Show 1
End Sub

Private Sub magflux_Click()
formcon.Hide
mag.Show 1
End Sub

Private Sub mass_Click()
formcon.Hide
mas.Show 1
End Sub

Private Sub power_Click()
formcon.Hide
pow.Show 1
End Sub

Private Sub pressure_Click()
formcon.Hide
pre.Show 1
End Sub

Private Sub temp_Click()
formcon.Hide
tem.Show 1
End Sub

Private Sub time_Click()
formcon.Hide
tim.Show 1
End Sub

Private Sub velocity_Click()
formcon.Hide
vel.Show 1
End Sub

Private Sub voltage_Click()
formcon.Hide
volt.Show 1
End Sub

Private Sub volume_Click()
formcon.Hide
vol.Show 1
End Sub
