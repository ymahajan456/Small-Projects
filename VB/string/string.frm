VERSION 5.00
Begin VB.Form Form1 
   ClientHeight    =   8625
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   15090
   LinkTopic       =   "Form1"
   ScaleHeight     =   8625
   ScaleWidth      =   15090
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lst1 
      Height          =   255
      ItemData        =   "string.frx":0000
      Left            =   10920
      List            =   "string.frx":0002
      TabIndex        =   7
      Top             =   1080
      Width           =   1695
   End
   Begin VB.CommandButton cmd3 
      Caption         =   "Command2"
      Height          =   1095
      Left            =   10440
      TabIndex        =   6
      Top             =   4920
      Width           =   2535
   End
   Begin VB.CommandButton cmd2 
      Caption         =   "Command1"
      Height          =   735
      Left            =   7680
      TabIndex        =   5
      Top             =   5040
      Width           =   1575
   End
   Begin VB.CommandButton cmd1 
      Caption         =   "Command1"
      Height          =   1215
      Left            =   960
      TabIndex        =   4
      Top             =   5280
      Width           =   5415
   End
   Begin VB.TextBox txt4 
      Height          =   975
      Left            =   4440
      TabIndex        =   3
      Top             =   3480
      Width           =   7215
   End
   Begin VB.TextBox txt3 
      Height          =   735
      Left            =   1200
      TabIndex        =   2
      Top             =   3480
      Width           =   2055
   End
   Begin VB.TextBox txt2 
      Height          =   975
      Left            =   960
      TabIndex        =   1
      Top             =   2040
      Width           =   8535
   End
   Begin VB.TextBox txt1 
      Height          =   975
      Left            =   960
      TabIndex        =   0
      Top             =   600
      Width           =   7575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim strlocate As String
Dim strcopy1 As String
Dim strlen As Integer
Dim arraylen, countop As Integer
Dim i, j, k, dumb As Integer
Dim getchar(0 To 100), idchar(0 To 100), tmp, locatechar(0 To 75), strnum(0 To 50) As String






Private Sub cmd2_Click()
strcopy1 = txt1.Text
strlocate = txt1.Text
countop = 1
strlen = Len(strlocate)
arraylen = strlen - 1
locatechar(0) = -1


For i = 0 To arraylen
getchar(i) = Mid(strcopy1, i + 1, 1)
Next i

For j = 0 To arraylen
tmp = getchar(j)
Select Case tmp
Case 0 To 9
idchar(j) = 0
Case Is = "."
idchar(j) = 0
Case Is = "+"
idchar(j) = 6
locatechar(countop) = j
countop = countop + 1
Case Is = "-"
idchar(j) = 6
locatechar(countop) = j
countop = countop + 1
Case Is = "*"
idchar(j) = 3
locatechar(countop) = j
countop = countop + 1

Case Is = "/"
idchar(j) = 4
locatechar(countop) = j
countop = countop + 1

Case Is = "%"
idchar(j) = 5
locatechar(countop) = j
countop = countop + 1

Case Is = "("
idchar(j) = 1
locatechar(countop) = j
countop = countop + 1

Case Is = ")"
idchar(j) = 2
locatechar(countop) = j
countop = countop + 1
End Select
Next j

locatechar(countop) = arraylen

k = 0

For i = 0 To countop
 If locatechar(i) = locatechar(i + 1) Then
    dumb = 1
 ElseIf Val(locatechar(i)) + 1 = Val(locatechar(i + 1)) Then
    dumb = 1
 Else
 For j = Val(locatechar(i)) + 1 To Val(locatechar(i + 1)) - 1
 txt3.Text = txt3.Text & getchar(j)
 Next j
 strnum(k) = txt3.Text
 txt3.Text = ""
 
 k = k + 1
 End If
Next i
 
For Each num In strnum
txt4.Text = txt4.Text & num & "__"
Next num








End Sub
