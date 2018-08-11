VERSION 5.00
Begin VB.Form frmtheme3 
   BackColor       =   &H8000000E&
   Caption         =   "Calculator"
   ClientHeight    =   8685
   ClientLeft      =   120
   ClientTop       =   750
   ClientWidth     =   19440
   LinkTopic       =   "Form1"
   ScaleHeight     =   8685
   ScaleWidth      =   19440
   StartUpPosition =   3  'Windows Default
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
      Left            =   840
      TabIndex        =   42
      Top             =   360
      Width           =   6630
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
      Left            =   840
      TabIndex        =   41
      Top             =   1200
      Width           =   6630
   End
   Begin VB.PictureBox picequal 
      BackColor       =   &H00423C3C&
      Height          =   975
      Left            =   720
      Picture         =   "frmtheme3.frx":0000
      ScaleHeight     =   915
      ScaleWidth      =   6495
      TabIndex        =   40
      Top             =   7080
      Width           =   6555
   End
   Begin VB.PictureBox picadd 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmtheme3.frx":0C00
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   38
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox picmultiply 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmtheme3.frx":116D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   37
      Top             =   3120
      Width           =   1095
   End
   Begin VB.PictureBox picminus 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmtheme3.frx":17C7
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   36
      Top             =   4440
      Width           =   1095
   End
   Begin VB.PictureBox picdivide 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   4800
      Picture         =   "frmtheme3.frx":1CFD
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   35
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picclear 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   2295
      Left            =   6240
      Picture         =   "frmtheme3.frx":2323
      ScaleHeight     =   2295
      ScaleWidth      =   1095
      TabIndex        =   34
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox picsevenclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   8760
      Picture         =   "frmtheme3.frx":31CA
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   33
      Top             =   960
      Width           =   1095
   End
   Begin VB.PictureBox picfourclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   8880
      Picture         =   "frmtheme3.frx":4C48
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   32
      Top             =   2880
      Width           =   1095
   End
   Begin VB.PictureBox piconeclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9120
      Picture         =   "frmtheme3.frx":6715
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   31
      Top             =   4320
      Width           =   1095
   End
   Begin VB.PictureBox picpercentclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9240
      Picture         =   "frmtheme3.frx":7F33
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   30
      Top             =   5640
      Width           =   1095
   End
   Begin VB.PictureBox piceightclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   11160
      Picture         =   "frmtheme3.frx":99C6
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   29
      Top             =   1320
      Width           =   1095
   End
   Begin VB.PictureBox picfiveclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   11280
      Picture         =   "frmtheme3.frx":B3AB
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   28
      Top             =   3000
      Width           =   1095
   End
   Begin VB.PictureBox pictwoclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   11280
      Picture         =   "frmtheme3.frx":CEDC
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   27
      Top             =   4320
      Width           =   1095
   End
   Begin VB.PictureBox piczeroclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   11280
      Picture         =   "frmtheme3.frx":E82E
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   26
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picnineclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13080
      Picture         =   "frmtheme3.frx":10300
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   25
      Top             =   960
      Width           =   1095
   End
   Begin VB.PictureBox picsixclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13440
      Picture         =   "frmtheme3.frx":11E04
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   24
      Top             =   2520
      Width           =   1095
   End
   Begin VB.PictureBox picthreeclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13200
      Picture         =   "frmtheme3.frx":13763
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   23
      Top             =   4320
      Width           =   1095
   End
   Begin VB.PictureBox picpointclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   13200
      Picture         =   "frmtheme3.frx":150F9
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   22
      Top             =   5880
      Width           =   1095
   End
   Begin VB.PictureBox picseven 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmtheme3.frx":1688C
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   21
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox piceight 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmtheme3.frx":16F31
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   20
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox picnine 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmtheme3.frx":17711
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   19
      Top             =   1800
      Width           =   1095
   End
   Begin VB.PictureBox picfour 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmtheme3.frx":17ED3
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   18
      Top             =   3120
      Width           =   1095
   End
   Begin VB.PictureBox picone 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmtheme3.frx":185A5
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   17
      Top             =   4440
      Width           =   1095
   End
   Begin VB.PictureBox picpercent 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   720
      Picture         =   "frmtheme3.frx":18B36
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   16
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picfive 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmtheme3.frx":19449
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   15
      Top             =   3120
      Width           =   1095
   End
   Begin VB.PictureBox pictwo 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmtheme3.frx":19BF0
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   14
      Top             =   4440
      Width           =   1095
   End
   Begin VB.PictureBox piczero 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   2040
      Picture         =   "frmtheme3.frx":1A31D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   13
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picthree 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmtheme3.frx":1AA5A
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   12
      Top             =   4440
      Width           =   1095
   End
   Begin VB.PictureBox picsix 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmtheme3.frx":1B22D
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   11
      Top             =   3120
      Width           =   1095
   End
   Begin VB.PictureBox picpoint 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   3360
      Picture         =   "frmtheme3.frx":1B9C7
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   10
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picaddclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   15480
      Picture         =   "frmtheme3.frx":1BED5
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   9
      Top             =   1080
      Width           =   1095
   End
   Begin VB.PictureBox picmultiplyclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   15480
      Picture         =   "frmtheme3.frx":1D8BF
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   8
      Top             =   2760
      Width           =   1095
   End
   Begin VB.PictureBox picminusclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   15480
      Picture         =   "frmtheme3.frx":1F139
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   7
      Top             =   4080
      Width           =   1095
   End
   Begin VB.PictureBox picdivideclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   15480
      Picture         =   "frmtheme3.frx":208B4
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   6
      Top             =   5280
      Width           =   1095
   End
   Begin VB.PictureBox picclearclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   2295
      Left            =   18000
      Picture         =   "frmtheme3.frx":22101
      ScaleHeight     =   2295
      ScaleWidth      =   1095
      TabIndex        =   5
      Top             =   1200
      Width           =   1095
   End
   Begin VB.PictureBox picleftbracket 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   6240
      Picture         =   "frmtheme3.frx":2415B
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   4
      Top             =   4440
      Width           =   1095
   End
   Begin VB.PictureBox picrightbracket 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   6240
      Picture         =   "frmtheme3.frx":247DD
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   3
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox picleftbracketclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   17520
      Picture         =   "frmtheme3.frx":24E60
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   2
      Top             =   4200
      Width           =   1095
   End
   Begin VB.PictureBox picrightbracketclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   17760
      Picture         =   "frmtheme3.frx":266DD
      ScaleHeight     =   1095
      ScaleWidth      =   1095
      TabIndex        =   1
      Top             =   5400
      Width           =   1095
   End
   Begin VB.PictureBox picequalclick 
      BackColor       =   &H00423C3C&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   9480
      Picture         =   "frmtheme3.frx":27F4A
      ScaleHeight     =   975
      ScaleWidth      =   6795
      TabIndex        =   0
      Top             =   7080
      Width           =   6795
   End
   Begin VB.Label Label1 
      BackColor       =   &H00F35601&
      Height          =   135
      Left            =   840
      TabIndex        =   39
      Top             =   240
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
      Begin VB.Menu mnuundu 
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
Attribute VB_Name = "frmtheme3"
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

