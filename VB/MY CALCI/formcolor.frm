VERSION 5.00
Begin VB.Form formcolor 
   Caption         =   "Form1"
   ClientHeight    =   2250
   ClientLeft      =   4545
   ClientTop       =   5220
   ClientWidth     =   5715
   LinkTopic       =   "Form1"
   ScaleHeight     =   2250
   ScaleWidth      =   5715
   Begin VB.HScrollBar hscrblue 
      Height          =   375
      Left            =   480
      Max             =   255
      TabIndex        =   2
      Top             =   1440
      Width           =   4815
   End
   Begin VB.HScrollBar hscrgreen 
      Height          =   375
      Left            =   480
      Max             =   255
      TabIndex        =   1
      Top             =   840
      Width           =   4815
   End
   Begin VB.HScrollBar hscrred 
      Height          =   375
      Left            =   480
      Max             =   255
      TabIndex        =   0
      Top             =   240
      Width           =   4815
   End
End
Attribute VB_Name = "formcolor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub hscrblue_Change()
formsci.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
acc.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
ang.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
are.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
cha.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
cur.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
den.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
dis.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
forc.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
formcon.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
Formsim.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
lum.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
mag.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
mas.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
pow.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
pre.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
tem.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
tim.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
vel.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
vol.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
volt.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
formcolor.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)


End Sub

Private Sub hscrgreen_Change()
formsci.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
acc.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
ang.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
are.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
cha.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
cur.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
den.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
dis.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
forc.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
formcon.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
Formsim.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
lum.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
mag.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
mas.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
pow.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
pre.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
tem.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
tim.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
vel.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
vol.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
volt.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
formcolor.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
End Sub

Private Sub hscrred_Scroll()
formsci.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
acc.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
ang.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
are.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
cha.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
cur.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
den.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
dis.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
forc.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
formcon.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
Formsim.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
lum.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
mag.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
mas.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
pow.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
pre.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
tem.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
tim.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
vel.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
vol.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
volt.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
formcolor.BackColor = RGB(hscrred.Value, hscrgreen.Value, hscrblue.Value)
End Sub


