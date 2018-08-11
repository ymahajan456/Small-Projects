VERSION 5.00
Begin VB.Form frmTheme1 
   BackColor       =   &H80000007&
   Caption         =   "Calculator"
   ClientHeight    =   8730
   ClientLeft      =   510
   ClientTop       =   750
   ClientWidth     =   20235
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form1"
   Picture         =   "frmTheme1.frx":0000
   ScaleHeight     =   8730
   ScaleWidth      =   20235
   Begin VB.PictureBox picequalclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   10200
      Picture         =   "frmTheme1.frx":4C89
      ScaleHeight     =   975
      ScaleWidth      =   6915
      TabIndex        =   42
      Top             =   7560
      Width           =   6910
   End
   Begin VB.PictureBox picrightbracketclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   18480
      Picture         =   "frmTheme1.frx":6562
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   41
      Top             =   5880
      Width           =   1095
   End
   Begin VB.PictureBox picleftbracketclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   18240
      Picture         =   "frmTheme1.frx":6E2E
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   40
      Top             =   4680
      Width           =   1095
   End
   Begin VB.PictureBox picrightbracket 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   6240
      Picture         =   "frmTheme1.frx":7715
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   39
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picleftbracket 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   6240
      Picture         =   "frmTheme1.frx":83BA
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   38
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picequal 
      BackColor       =   &H00423C3C&
      Height          =   975
      Left            =   600
      Picture         =   "frmTheme1.frx":9066
      ScaleHeight     =   915
      ScaleWidth      =   6855
      TabIndex        =   37
      Top             =   7320
      Width           =   6915
   End
   Begin VB.PictureBox picclearclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   18720
      Picture         =   "frmTheme1.frx":B2DF
      ScaleHeight     =   2655
      ScaleWidth      =   1095
      TabIndex        =   35
      Top             =   1680
      Width           =   1095
   End
   Begin VB.PictureBox picdivideclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16200
      Picture         =   "frmTheme1.frx":C636
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   34
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picminusclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16200
      Picture         =   "frmTheme1.frx":D163
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   33
      Top             =   4560
      Width           =   1095
   End
   Begin VB.PictureBox picmultiplyclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16200
      Picture         =   "frmTheme1.frx":DBB3
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   32
      Top             =   3240
      Width           =   1095
   End
   Begin VB.PictureBox picaddclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   16200
      Picture         =   "frmTheme1.frx":E6F9
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   31
      Top             =   1560
      Width           =   1095
   End
   Begin VB.PictureBox picpoint 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmTheme1.frx":F1E4
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   30
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picsix 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmTheme1.frx":FDB6
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   29
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picthree 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmTheme1.frx":10B5B
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   28
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox piczero 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmTheme1.frx":118C7
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   27
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox pictwo 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmTheme1.frx":1268E
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   26
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picfive 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmTheme1.frx":133C8
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   25
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picpercent 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmTheme1.frx":140EE
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   24
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picone 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmTheme1.frx":14FF7
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   23
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picfour 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmTheme1.frx":15CC3
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   22
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picnine 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmTheme1.frx":16A2A
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   21
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox piceight 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmTheme1.frx":177C6
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   20
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picseven 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmTheme1.frx":1858D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   19
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picpointclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13920
      Picture         =   "frmTheme1.frx":19253
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   18
      Top             =   6360
      Width           =   1095
   End
   Begin VB.PictureBox picthreeclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13920
      Picture         =   "frmTheme1.frx":19CC4
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   17
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picsixclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   14160
      Picture         =   "frmTheme1.frx":1A875
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   16
      Top             =   3000
      Width           =   1095
   End
   Begin VB.PictureBox picnineclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13800
      Picture         =   "frmTheme1.frx":1B440
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   15
      Top             =   1440
      Width           =   1095
   End
   Begin VB.PictureBox piczeroclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   12000
      Picture         =   "frmTheme1.frx":1C015
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   14
      Top             =   6240
      Width           =   1095
   End
   Begin VB.PictureBox pictwoclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   12000
      Picture         =   "frmTheme1.frx":1CC07
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   13
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picfiveclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   12000
      Picture         =   "frmTheme1.frx":1D7BE
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   12
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox piceightclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   11880
      Picture         =   "frmTheme1.frx":1E342
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   11
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox picpercentclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9960
      Picture         =   "frmTheme1.frx":1EF32
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   10
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox piconeclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9840
      Picture         =   "frmTheme1.frx":1FC2B
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   9
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picfourclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9600
      Picture         =   "frmTheme1.frx":20792
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   8
      Top             =   3360
      Width           =   1095
   End
   Begin VB.PictureBox picsevenclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9480
      Picture         =   "frmTheme1.frx":21339
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   7
      Top             =   1440
      Width           =   1095
   End
   Begin VB.PictureBox picclear 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   6240
      Picture         =   "frmTheme1.frx":21E92
      ScaleHeight     =   2655
      ScaleWidth      =   1095
      TabIndex        =   6
      Top             =   2160
      Width           =   1095
   End
   Begin VB.PictureBox picdivide 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmTheme1.frx":2357D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   5
      Top             =   6120
      Width           =   1095
   End
   Begin VB.PictureBox picminus 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmTheme1.frx":2422F
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   4
      Top             =   4800
      Width           =   1095
   End
   Begin VB.PictureBox picmultiply 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmTheme1.frx":24DCB
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   3
      Top             =   3480
      Width           =   1095
   End
   Begin VB.PictureBox picadd 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmTheme1.frx":25AA3
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   2
      Top             =   2160
      Width           =   1095
   End
   Begin VB.TextBox txtOutput 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00F4E3A8&
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
      Height          =   450
      Left            =   720
      TabIndex        =   1
      Top             =   1440
      Width           =   6630
   End
   Begin VB.TextBox txtInput 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00F4E3A8&
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
      ForeColor       =   &H00000000&
      Height          =   900
      Left            =   720
      TabIndex        =   0
      Top             =   600
      Width           =   6630
   End
   Begin VB.Label Label1 
      BackColor       =   &H00F35601&
      Height          =   135
      Left            =   720
      TabIndex        =   36
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
         Caption         =   "&Black & White"
      End
   End
   Begin VB.Menu mnuhelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuuse 
         Caption         =   "&How to USE?"
      End
      Begin VB.Menu mnuabout 
         Caption         =   "&About"
      End
   End
   Begin VB.Menu mnuexit 
      Caption         =   "&Exit"
   End
End
Attribute VB_Name = "frmTheme1"
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
picclearclick.Visible = True
End Sub

Private Sub picclear_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picclear.Visible = True
picclearclick.Visible = False
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
picequalclick.Visible = True
End Sub

Private Sub picequal_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picequal.Visible = True
picequalclick.Visible = False
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





Private Sub picleftbracket_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picleftbracket.Visible = False
picleftbracketclick.Visible = True
End Sub

Private Sub picleftbracket_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picleftbracket.Visible = True
picleftbracketclick.Visible = False
End Sub

Private Sub picminus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picminus.Visible = False
picminusclick.Visible = True
End Sub

Private Sub picminus_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picminus.Visible = True
picminusclick.Visible = False
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
