VERSION 5.00
Begin VB.Form frmtheme2 
   BackColor       =   &H0000FF00&
   Caption         =   "Calculator"
   ClientHeight    =   8550
   ClientLeft      =   705
   ClientTop       =   945
   ClientWidth     =   20250
   LinkTopic       =   "Form1"
   ScaleHeight     =   8550
   ScaleWidth      =   20250
   Begin VB.PictureBox eqclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   10800
      Picture         =   "frmtheme2.frx":0000
      ScaleHeight     =   975
      ScaleWidth      =   6915
      TabIndex        =   44
      Top             =   7680
      Width           =   6910
   End
   Begin VB.PictureBox picequal 
      BackColor       =   &H00423C3C&
      Height          =   975
      Left            =   480
      Picture         =   "frmtheme2.frx":11A5
      ScaleHeight     =   915
      ScaleWidth      =   6855
      TabIndex        =   43
      Top             =   7320
      Width           =   6910
   End
   Begin VB.PictureBox picleftbracket 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   6000
      Picture         =   "frmtheme2.frx":23FF
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   42
      Top             =   4680
      Width           =   1095
   End
   Begin VB.PictureBox picrightbracket 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   6120
      Picture         =   "frmtheme2.frx":2BFD
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   41
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picleftbracketclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   17520
      Picture         =   "frmtheme2.frx":3401
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   40
      Top             =   0
      Width           =   1095
   End
   Begin VB.PictureBox picrightbracketclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13680
      Picture         =   "frmtheme2.frx":3C6D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   39
      Top             =   240
      Width           =   1095
   End
   Begin VB.PictureBox picclickclear 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   8280
      Picture         =   "frmtheme2.frx":44C4
      ScaleHeight     =   2655
      ScaleWidth      =   1095
      TabIndex        =   38
      Top             =   360
      Width           =   1095
   End
   Begin VB.PictureBox picsevenclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   10680
      Picture         =   "frmtheme2.frx":546D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   37
      Top             =   720
      Width           =   1095
   End
   Begin VB.PictureBox picfourclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   10440
      Picture         =   "frmtheme2.frx":5D2A
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   36
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox piconeclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   10800
      Picture         =   "frmtheme2.frx":65AC
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   35
      Top             =   5040
      Width           =   1095
   End
   Begin VB.PictureBox picpercentclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   8760
      Picture         =   "frmtheme2.frx":6DB6
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   34
      Top             =   6360
      Width           =   1095
   End
   Begin VB.PictureBox piceightclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   14160
      Picture         =   "frmtheme2.frx":75D6
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   33
      Top             =   1920
      Width           =   1095
   End
   Begin VB.PictureBox picfiveclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   14280
      Picture         =   "frmtheme2.frx":7E8B
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   32
      Top             =   3600
      Width           =   1095
   End
   Begin VB.PictureBox pictwoclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   12840
      Picture         =   "frmtheme2.frx":86F8
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   31
      Top             =   5040
      Width           =   1095
   End
   Begin VB.PictureBox piczeroclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   12840
      Picture         =   "frmtheme2.frx":8F71
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   30
      Top             =   6240
      Width           =   1095
   End
   Begin VB.PictureBox picnineclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16080
      Picture         =   "frmtheme2.frx":9868
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   29
      Top             =   1560
      Width           =   1095
   End
   Begin VB.PictureBox picsixclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16440
      Picture         =   "frmtheme2.frx":A10D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   28
      Top             =   3120
      Width           =   1095
   End
   Begin VB.PictureBox picthreeclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16200
      Picture         =   "frmtheme2.frx":A9F3
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   27
      Top             =   4920
      Width           =   1095
   End
   Begin VB.PictureBox picpointclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16200
      Picture         =   "frmtheme2.frx":B26E
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   26
      Top             =   6480
      Width           =   1095
   End
   Begin VB.PictureBox picaddclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   18480
      Picture         =   "frmtheme2.frx":BA9C
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   25
      Top             =   1680
      Width           =   1095
   End
   Begin VB.PictureBox picmultiplyclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   18480
      Picture         =   "frmtheme2.frx":C37E
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   24
      Top             =   3360
      Width           =   1095
   End
   Begin VB.PictureBox picminusclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   18120
      Picture         =   "frmtheme2.frx":CBBC
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   23
      Top             =   5280
      Width           =   1095
   End
   Begin VB.PictureBox picdivideclick 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   17880
      Picture         =   "frmtheme2.frx":D3C8
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   22
      Top             =   6720
      Width           =   1095
   End
   Begin VB.PictureBox picclearclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   2655
      Index           =   0
      Left            =   21000
      Picture         =   "frmtheme2.frx":DBBB
      ScaleHeight     =   2655
      ScaleWidth      =   1095
      TabIndex        =   21
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox picequalclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   2655
      Index           =   0
      Left            =   20400
      Picture         =   "frmtheme2.frx":EF12
      ScaleHeight     =   2655
      ScaleWidth      =   1095
      TabIndex        =   20
      Top             =   5520
      Width           =   1095
   End
   Begin VB.TextBox txtInput 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FF00FF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   900
      Left            =   480
      TabIndex        =   18
      Top             =   600
      Width           =   6630
   End
   Begin VB.TextBox txtOutput 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FF00FF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   450
      Left            =   480
      TabIndex        =   17
      Top             =   1440
      Width           =   6630
   End
   Begin VB.PictureBox picadd 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4560
      Picture         =   "frmtheme2.frx":FF12
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   16
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picmultiply 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4560
      Picture         =   "frmtheme2.frx":107B2
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   15
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picminus 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4560
      Picture         =   "frmtheme2.frx":1104F
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   14
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picdivide 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4560
      Picture         =   "frmtheme2.frx":11811
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   13
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picclear 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   6000
      Picture         =   "frmtheme2.frx":12037
      ScaleHeight     =   2655
      ScaleWidth      =   1095
      TabIndex        =   12
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picseven 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   480
      Picture         =   "frmtheme2.frx":1310E
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   11
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox piceight 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   1800
      Picture         =   "frmtheme2.frx":139A7
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   10
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picnine 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3120
      Picture         =   "frmtheme2.frx":142A9
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   9
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picfour 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   480
      Picture         =   "frmtheme2.frx":14B58
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   8
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picone 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   480
      Picture         =   "frmtheme2.frx":153FD
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   7
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picpercent 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   480
      Picture         =   "frmtheme2.frx":15A59
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   6
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picfive 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   1800
      Picture         =   "frmtheme2.frx":162DB
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   5
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox pictwo 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   1800
      Picture         =   "frmtheme2.frx":16BAF
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   4
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox piczero 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   1800
      Picture         =   "frmtheme2.frx":1742D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   3
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picthree 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3120
      Picture         =   "frmtheme2.frx":17D13
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   2
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picsix 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3120
      Picture         =   "frmtheme2.frx":185BE
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   1
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picpoint 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3120
      Picture         =   "frmtheme2.frx":18E92
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   0
      Top             =   6120
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00F35601&
      Height          =   135
      Left            =   480
      TabIndex        =   19
      Top             =   480
      Width           =   6615
   End
   Begin VB.Menu mnufile 
      Caption         =   "&File"
      Begin VB.Menu mnuhistory 
         Caption         =   "&History"
         Shortcut        =   ^H
      End
      Begin VB.Menu mnuclearhistory 
         Caption         =   "&Clear History"
      End
   End
   Begin VB.Menu mnuedit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuundo 
         Caption         =   "&Undo"
         Shortcut        =   ^U
      End
      Begin VB.Menu mnuredo 
         Caption         =   "&Redo"
         Shortcut        =   ^R
      End
   End
   Begin VB.Menu mnutheme 
      Caption         =   "&Theme"
      Begin VB.Menu mnuclassictheme 
         Caption         =   "&Classic Theme"
      End
      Begin VB.Menu mnutheme2 
         Caption         =   "&Theme 2"
      End
      Begin VB.Menu mnublackwhite 
         Caption         =   "&Black-White"
      End
   End
   Begin VB.Menu mnuhelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuuse 
         Caption         =   "&How to USE ?"
      End
      Begin VB.Menu mnuabout 
         Caption         =   "&About"
      End
   End
   Begin VB.Menu mnuexit 
      Caption         =   "&Exit"
   End
End
Attribute VB_Name = "frmtheme2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub mnublackwhite_Click()
frmTheme1.Hide
frmtheme2.Hide
frmtheme3.Show
End Sub

Private Sub mnuclassictheme_Click()
frmTheme1.Show
frmtheme2.Hide
frmtheme3.Hide
End Sub

Private Sub mnuexit_Click()
End
End Sub

Private Sub mnutheme2_Click()
frmTheme1.Hide
frmtheme2.Show
frmtheme3.Hide
End Sub

Private Sub picadd_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picadd.Visible = False
picaddclick.Visible = True

End Sub

Private Sub picadd_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picadd.Visible = True
picaddclick.Visible = False
End Sub










Private Sub picclear_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picclear.Visible = False
picclickclear.Visible = True
End Sub

Private Sub picclear_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picclear.Visible = True
picclickclear.Visible = False
End Sub

Private Sub picdivide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picdivide.Visible = False
picdivideclick.Visible = True
End Sub

Private Sub picdivide_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picdivide.Visible = True
picdivideclick.Visible = False
End Sub

Private Sub piceight_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piceight.Visible = False
piceightclick.Visible = True

End Sub

Private Sub piceight_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
piceight.Visible = True
piceightclick.Visible = False
End Sub


Private Sub picequal_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picequal.Visible = False
eqclick.Visible = True
End Sub

Private Sub picequal_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picequal.Visible = True
eqclick.Visible = False
End Sub






Private Sub picfive_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picfive.Visible = False
picfiveclick.Visible = True
End Sub

Private Sub picfive_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picfive.Visible = True
picfiveclick.Visible = False
End Sub



Private Sub picfour_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picfour.Visible = False
picfourclick.Visible = True
End Sub

Private Sub picfour_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picfour.Visible = True
picfourclick.Visible = False
End Sub




Private Sub picminus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picminus.Visible = False
picminusclick.Visible = True
End Sub

Private Sub picminus_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picminus.Visible = True
picminusclick.Visible = False
End Sub

Private Sub picleftbracket_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picleftbracket.Visible = False
picleftbracketclick.Visible = True
End Sub

Private Sub picleftbracket_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picleftbracket.Visible = True
picleftbracketclick.Visible = False
End Sub


Private Sub picmultiply_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picmultiply.Visible = False
picmultiplyclick.Visible = True
End Sub

Private Sub picmultiply_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picmultiply.Visible = True
picmultiplyclick.Visible = False
End Sub



Private Sub picnine_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picnine.Visible = False
picnineclick.Visible = True
End Sub

Private Sub picnine_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picnine.Visible = True
picnineclick.Visible = False

End Sub




Private Sub picone_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picone.Visible = False
piconeclick.Visible = True
End Sub

Private Sub picone_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picone.Visible = True
piconeclick.Visible = False
End Sub




Private Sub picpercent_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picpercent.Visible = False
picpercentclick.Visible = True
End Sub

Private Sub picpercent_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picpercent.Visible = True
picpercentclick.Visible = False
End Sub



Private Sub picpoint_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picpoint.Visible = False
picpointclick.Visible = True
End Sub

Private Sub picpoint_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picpoint.Visible = True
picpointclick.Visible = False
End Sub

Private Sub picrightbracket_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picrightbracket.Visible = False
picrightbracketclick.Visible = True
End Sub

Private Sub picrightbracket_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picrightbracket.Visible = True
picrightbracketclick.Visible = False
End Sub


Private Sub picseven_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picseven.Visible = False
picsevenclick.Visible = True
End Sub



Private Sub picseven_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picseven.Visible = True
picsevenclick.Visible = False
End Sub



Private Sub picsix_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picsix.Visible = False
picsixclick.Visible = True
End Sub

Private Sub picsix_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picsix.Visible = True
picsixclick.Visible = False
End Sub



Private Sub picthree_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picthree.Visible = False
picthreeclick.Visible = True
End Sub

Private Sub picthree_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picthree.Visible = True
picthreeclick.Visible = False
End Sub



Private Sub pictwo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
pictwo.Visible = False
pictwoclick.Visible = True
End Sub

Private Sub pictwo_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
pictwo.Visible = True
pictwoclick.Visible = False
End Sub



Private Sub piczero_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
piczero.Visible = False
piczeroclick.Visible = True
End Sub

Private Sub piczero_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
piczero.Visible = True
piczeroclick.Visible = False
End Sub

