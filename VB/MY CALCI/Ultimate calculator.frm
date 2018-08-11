VERSION 5.00
Begin VB.Form formsci 
   Caption         =   "Scientific Calculator"
   ClientHeight    =   10650
   ClientLeft      =   510
   ClientTop       =   750
   ClientWidth     =   15120
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   13.5
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   -1  'True
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   ScaleHeight     =   10650
   ScaleWidth      =   15120
   WindowState     =   2  'Maximized
   Begin VB.ComboBox conlist 
      Height          =   480
      ItemData        =   "Ultimate calculator.frx":0000
      Left            =   8760
      List            =   "Ultimate calculator.frx":005B
      TabIndex        =   48
      Text            =   "Constants"
      Top             =   3000
      Width           =   3015
   End
   Begin VB.OptionButton grade 
      Caption         =   "Gra"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8760
      TabIndex        =   46
      ToolTipText     =   "ANGLES CONCIDERED IN GRADES"
      Top             =   1560
      Width           =   1215
   End
   Begin VB.OptionButton radian 
      Caption         =   "Rad"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8760
      TabIndex        =   45
      ToolTipText     =   "ANGLES CONCIDERED IN RADIANS"
      Top             =   960
      Width           =   1215
   End
   Begin VB.OptionButton degree 
      Caption         =   "Deg"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8760
      TabIndex        =   44
      ToolTipText     =   "ANGLES CONSIDERED ARE IN DEGREE"
      Top             =   360
      Value           =   -1  'True
      Width           =   1215
   End
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
      Left            =   6240
      TabIndex        =   43
      ToolTipText     =   "PERCENTAGE"
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton antiln 
      Caption         =   "e^x"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1440
      TabIndex        =   42
      ToolTipText     =   "NATURAL LOG INVERSE"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton antilog 
      Caption         =   "10^x"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   41
      ToolTipText     =   "LOG INVERSE"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton div 
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
      Left            =   6720
      TabIndex        =   40
      ToolTipText     =   "DIVIDE"
      Top             =   4440
      Width           =   855
   End
   Begin VB.CommandButton mult 
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
      Left            =   6720
      TabIndex        =   39
      ToolTipText     =   "MULTIPLY"
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton sub 
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
      Left            =   6720
      TabIndex        =   38
      ToolTipText     =   "SUBTRACT"
      Top             =   2520
      Width           =   855
   End
   Begin VB.CommandButton add 
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
      Left            =   6720
      TabIndex        =   37
      ToolTipText     =   "ADD"
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton conversion 
      Caption         =   "conversion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   7440
      TabIndex        =   36
      ToolTipText     =   "SELECT CONVERSION"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton constant 
      Caption         =   "constant"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   6240
      TabIndex        =   35
      ToolTipText     =   "ADD CONSTANT"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton ln 
      Caption         =   "lnX"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1440
      TabIndex        =   34
      ToolTipText     =   "NATURAL LOG"
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton log 
      Caption         =   "logX"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   33
      ToolTipText     =   "LOG"
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton cubrt 
      Caption         =   "X^(1/3)"
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
      Left            =   1440
      TabIndex        =   32
      ToolTipText     =   "CUBE ROOT"
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton sqrt 
      Caption         =   "X^(1/2)"
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
      Left            =   240
      TabIndex        =   31
      ToolTipText     =   "SQUARE ROOT"
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton cube 
      Caption         =   "x^3"
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
      Left            =   1440
      TabIndex        =   30
      ToolTipText     =   "CUBE"
      Top             =   3480
      Width           =   1095
   End
   Begin VB.CommandButton sqr 
      Caption         =   "x^2"
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
      Left            =   240
      TabIndex        =   29
      ToolTipText     =   "SQUARE"
      Top             =   3480
      Width           =   1095
   End
   Begin VB.CommandButton root 
      Caption         =   "x^(1/n)"
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
      Left            =   2640
      TabIndex        =   28
      ToolTipText     =   "Nth ROOT"
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton power 
      Caption         =   "x^n"
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
      Left            =   2640
      TabIndex        =   27
      ToolTipText     =   "POERW"
      Top             =   3480
      Width           =   1095
   End
   Begin VB.CommandButton nfact 
      Caption         =   "n!"
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
      Left            =   5040
      TabIndex        =   26
      ToolTipText     =   "FACTORIAL"
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton sigman3 
      Caption         =   "sigmaN3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5040
      TabIndex        =   25
      ToolTipText     =   "SUM OF CUBES OF FIRST n  NUMBERS"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton sigman2 
      Caption         =   "sigmaN2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3840
      TabIndex        =   24
      ToolTipText     =   "SUM OF SQUARES OF FIRST n NUMBERS"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton sigman 
      Caption         =   "sigmaN"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2640
      TabIndex        =   23
      ToolTipText     =   "SUM OF FIRST n NUMBERS"
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton taninv 
      Caption         =   "tan^-1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2640
      TabIndex        =   22
      ToolTipText     =   "TAN INVERSE"
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CommandButton cosinv 
      Caption         =   "cos^-1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1440
      TabIndex        =   21
      ToolTipText     =   "COS INVERSE"
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CommandButton sininv 
      Caption         =   "sin^-1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   20
      ToolTipText     =   "SIN INVERSE"
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CommandButton tane 
      Caption         =   "tan"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2640
      TabIndex        =   19
      ToolTipText     =   "TAN RATIO"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton cose 
      Caption         =   "cos"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1440
      TabIndex        =   18
      ToolTipText     =   "COS RATIO"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton sine 
      Caption         =   "sin"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      TabIndex        =   17
      ToolTipText     =   "SIN RATIO"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton ncr 
      Caption         =   "nCr"
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
      Left            =   3840
      TabIndex        =   16
      ToolTipText     =   "nCr"
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton npr 
      Caption         =   "nPr"
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
      Left            =   2640
      TabIndex        =   15
      ToolTipText     =   "nPr"
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton equal 
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
      Left            =   7680
      TabIndex        =   14
      ToolTipText     =   "EQUAL TO"
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton cr 
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
      Left            =   7680
      TabIndex        =   13
      ToolTipText     =   "CLEAR"
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton point 
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
      Left            =   5760
      TabIndex        =   12
      ToolTipText     =   "dECIMAL pOINT"
      Top             =   4440
      Width           =   855
   End
   Begin VB.CommandButton no0 
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
      Left            =   4800
      TabIndex        =   11
      ToolTipText     =   "0"
      Top             =   4440
      Width           =   855
   End
   Begin VB.CommandButton pi 
      Caption         =   "Pi"
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
      Left            =   3840
      TabIndex        =   10
      ToolTipText     =   "pi"
      Top             =   4440
      Width           =   855
   End
   Begin VB.CommandButton no9 
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
      Left            =   5760
      TabIndex        =   9
      ToolTipText     =   "9"
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton no8 
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
      Left            =   4800
      TabIndex        =   8
      ToolTipText     =   "8"
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton no7 
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
      Left            =   3840
      TabIndex        =   7
      ToolTipText     =   "7"
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton no6 
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
      Left            =   5760
      TabIndex        =   6
      ToolTipText     =   "6"
      Top             =   2520
      Width           =   855
   End
   Begin VB.CommandButton no5 
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
      Left            =   4800
      TabIndex        =   5
      ToolTipText     =   "5"
      Top             =   2520
      Width           =   855
   End
   Begin VB.CommandButton no4 
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
      Left            =   3840
      TabIndex        =   4
      ToolTipText     =   "4"
      Top             =   2520
      Width           =   855
   End
   Begin VB.CommandButton no3 
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
      Left            =   5760
      TabIndex        =   3
      ToolTipText     =   "3"
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton no2 
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
      Left            =   4800
      TabIndex        =   2
      ToolTipText     =   "2"
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton no1 
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
      Left            =   3840
      TabIndex        =   1
      ToolTipText     =   "1"
      Top             =   1560
      Width           =   855
   End
   Begin VB.TextBox scrsci 
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
      Left            =   240
      TabIndex        =   0
      ToolTipText     =   "SUBTRACT"
      Top             =   360
      Width           =   8175
   End
   Begin VB.Label Label1 
      Caption         =   "Angle"
      Height          =   495
      Left            =   8760
      TabIndex        =   47
      Top             =   2160
      Width           =   1215
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
         Begin VB.Menu custumcolor 
            Caption         =   "custumcolor"
         End
      End
   End
   Begin VB.Menu close 
      Caption         =   "Close"
   End
End
Attribute VB_Name = "formsci"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim a, b, c, d, e, f, g, h, i, j As Double
Dim counter As Integer
Dim oper As String
Dim X As String
Dim k As Double

Private Sub add_Click()
a = Val(scrsci.Text)
oper = "+"
scrsci.Text = " "

End Sub

Private Sub antiln_Click()
a = Val(scrsci.Text)
scrsci.Text = Round(((2.71828182845905) ^ (a)), 6)
End Sub

Private Sub antilog_Click()
a = Val(scrsci.Text)
scrsci.Text = 10 ^ (a)
End Sub


Private Sub Command1_Click()
End
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

Private Sub Command2_Click()
scrscisci.Text = z
End Sub








Private Sub constant_Click()
scrsci.Text = conlist.Text
If scrsci.Text = conlist.List(0) Then
scrsci.Text = 1.67262158 * 10 ^ (-27)
ElseIf scrsci.Text = conlist.List(1) Then
scrsci.Text = 1.67492716 * 10 ^ (-27)
ElseIf scrsci.Text = conlist.List(2) Then
scrsci.Text = 9.10938198 * 10 ^ (-31)
ElseIf scrsci.Text = conlist.List(3) Then
scrsci.Text = 1.8835310981 ^ (-28)
ElseIf scrsci.Text = conlist.List(4) Then
scrsci.Text = 5.291772083 * 10 ^ (-11)
ElseIf scrsci.Text = conlist.List(5) Then
scrsci.Text = 6.62606876 * 10 ^ (-34)
ElseIf scrsci.Text = conlist.List(6) Then
scrsci.Text = 5.05078317 * 10 ^ (-27)
ElseIf scrsci.Text = conlist.List(7) Then
scrsci.Text = 9.27400899 * 10 ^ (-2)
ElseIf scrsci.Text = conlist.List(8) Then
scrsci.Text = 10973731.57
ElseIf scrsci.Text = conlist.List(9) Then
scrsci.Text = 1.66053873 * 10 ^ (-27)
ElseIf scrsci.Text = conlist.List(10) Then
scrsci.Text = 1.410606633 * 10 ^ (-26)
ElseIf scrsci.Text = conlist.List(11) Then
scrsci.Text = -9.28476362 * 10 ^ (-24)
ElseIf scrsci.Text = conlist.List(12) Then
scrsci.Text = -9.662364 * 10 ^ (-27)
ElseIf scrsci.Text = conlist.List(13) Then
scrsci.Text = 1.602176462 * 10 ^ (-19)
ElseIf scrsci.Text = conlist.List(14) Then
scrsci.Text = 6.02214199 * 10 ^ (23)
ElseIf scrsci.Text = conlist.List(15) Then
scrsci.Text = 1.3806503 * 10 ^ (-23)
ElseIf scrsci.Text = conlist.List(16) Then
scrsci.Text = 0.022413996
ElseIf scrsci.Text = conlist.List(17) Then
scrsci.Text = 8.314472
ElseIf scrsci.Text = conlist.List(18) Then
scrsci.Text = 299792458
ElseIf scrsci.Text = conlist.List(19) Then
scrsci.Text = 3.74177107 * 10 ^ (-16)
ElseIf scrsci.Text = conlist.List(20) Then
scrsci.Text = 0.014387752
ElseIf scrsci.Text = conlist.List(21) Then
scrsci.Text = 8.854187817 * 10 ^ (-12)
ElseIf scrsci.Text = conlist.List(22) Then
scrsci.Text = 1.256637061 * 10 ^ (-6)
ElseIf scrsci.Text = conlist.List(23) Then
scrsci.Text = 9.80665
ElseIf scrsci.Text = conlist.List(24) Then
scrsci.Text = 7.748091691 * 10 ^ (-19)
ElseIf scrsci.Text = conlist.List(25) Then
scrsci.Text = 376.7303135
ElseIf scrsci.Text = conlist.List(26) Then
scrsci.Text = 273.15
ElseIf scrsci.Text = conlist.List(27) Then
scrsci.Text = 6.673 * 10 ^ (-11)
ElseIf scrsci.Text = conlist.List(28) Then
scrsci.Text = 1.10325
Else: scrsci.Text = "Invalid Option"
End If
conlist.Text = "Constants"
End Sub

Private Sub conversion_Click()
formcon.Show
End Sub

Private Sub cose_Click()
a = Val(scrsci.Text)
If degree.Value = True Then
scrsci.Text = Round((Cos(a * 3.14159265358979 / 180)), 5)
End If
If radian.Value = True Then
scrsci.Text = Round((Cos(a)), 5)
End If
If grade.Value = True Then
scrsci.Text = Round((Cos(a * 3.14159265358979 / 200)), 5)
End If
End Sub

Private Sub cosinv_Click()
a = Val(scrsci.Text)
d = 1 / ((a ^ 2 + 1) ^ (1 / 2))
b = 1
c = 0
For counter = 1 To 1000 Step 2
c = c + (b * (d ^ counter) / counter)
b = b * (-1)
Next counter
scrsci.Text = c
End Sub

Private Sub cr_Click()
scrsci.Text = ""
End Sub

Private Sub cube_Click()
a = Val(scrsci.Text)
scrsci.Text = a * a * a
End Sub

Private Sub cubrt_Click()
a = Val(scrsci.Text)
scrsci.Text = a ^ (1 / 3)
End Sub

Private Sub custumcolor_Click()
formcolor.Show
End Sub

Private Sub div_Click()
a = Val(scrsci.Text)
scrsci.Text = " "
oper = "/"
End Sub

Private Sub equal_Click()
b = Val(scrsci.Text)
If oper = "+" Then
scrsci.Text = Val(a + b)
End If
If oper = "-" Then
scrsci.Text = Val(a - b)
End If
If oper = "*" Then
scrsci.Text = Val(a * b)
End If
If oper = "/" And Val(b) <> "0" Then
scrsci.Text = Val(a / b)
End If
If oper = "/" And Val(b) = "0" Then
scrsci.Text = "MATHS ERROR"
End If
c = 1
If oper = "power" Then
scrsci.Text = a ^ b
 End If
 If oper = "npr" Then
 e = (a - b)
 counter = 1
 d = 1
For counter = 1 To e
  d = counter * d
 Next
 h = Val(d)
 f = (g / h)
 scrsci.Text = Val(f)
 End If
 If oper = "ncr" Then
 e = (a - b)
 counter = 1
 d = 1
For counter = 1 To e
  d = counter * d
 Next
 h = Val(d)
 i = 1
 For counter = 1 To b
  i = counter * i
 Next
 j = Val(i)
 f = (g / (h * i))
 scrsci.Text = Val(f)
 End If
 If oper = "root" Then
 scrsci.Text = a ^ (1 / b)
 End If
If oper = "%" Then
scrsci.Text = (b / 100 * a)
End If
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

Private Sub ln_Click()
a = Val(scrsci.Text)
scrsci.Text = Math.log(a)
End Sub

Private Sub log_Click()
a = Val(scrsci.Text)
scrsci.Text = (Math.log(a)) / (Math.log(10))
End Sub

Private Sub mult_Click()
a = Val(scrsci.Text)
scrsci.Text = " "
oper = "*"
End Sub

Private Sub ncr_Click()
counter = 1
a = Val(scrsci.Text)
c = 1
For counter = 1 To a
  c = counter * c
 Next
 g = Val(c)
 scrsci.Text = ""
 oper = "ncr"
End Sub

Private Sub nfact_Click()
counter = 1
a = Val(scrsci.Text)
b = 1
For counter = 1 To a
  b = counter * b
 Next
scrsci.Text = Val(b)
End Sub

Private Sub no1_Click()
scrsci.Text = scrsci.Text + "1"
End Sub
Private Sub no2_Click()
scrsci.Text = scrsci.Text + "2"
End Sub
Private Sub no3_Click()
scrsci.Text = scrsci.Text + "3"
End Sub
Private Sub no4_Click()
scrsci.Text = scrsci.Text + "4"
End Sub
Private Sub no5_Click()
scrsci.Text = scrsci.Text + "5"
End Sub
Private Sub no6_Click()
scrsci.Text = scrsci.Text + "6"
End Sub
Private Sub no7_Click()
scrsci.Text = scrsci.Text + "7"
End Sub
Private Sub no8_Click()
scrsci.Text = scrsci.Text + "8"
End Sub
Private Sub no9_Click()
scrsci.Text = scrsci.Text + "9"
End Sub
Private Sub no0_Click()
scrsci.Text = scrsci.Text + "0"
End Sub

Private Sub npr_Click()
counter = 1
a = Val(scrsci.Text)
c = 1
For counter = 1 To a
  c = counter * c
 Next
 g = Val(c)
 scrsci.Text = ""
 oper = "npr"
End Sub

Private Sub percent_Click()
a = Val(scrsci.Text)
scrsci.Text = ""
oper = "%"
End Sub

Private Sub point_Click()
scrsci.Text = scrsci.Text + "."
End Sub
Private Sub pi_Click()
scrsci.Text = scrsci.Text + "3.1415926535897932384626433832795"
End Sub

Private Sub power_Click()
a = Val(scrsci.Text)
scrsci.Text = ""
oper = "power"
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

Private Sub root_Click()
a = Val(scrsci.Text)
scrsci.Text = " "
oper = "root"
End Sub
Private Sub sigman_Click()
a = Val(scrsci.Text)
scrsci.Text = ((a * (a + 1)) / 2)
End Sub

Private Sub sigman2_Click()
a = Val(scrsci.Text)
scrsci.Text = ((a * (a + 1) * (2 * a + 1)) / 6)
End Sub

Private Sub sigman3_Click()
a = Val(scrsci.Text)
scrsci.Text = (((a * (a + 1)) / 2) * ((a * (a + 1)) / 2))
End Sub

Private Sub simple_Click()
formsci.Hide
Formsim.Show
End Sub

Private Sub sine_Click()
a = Val(scrsci.Text)
If degree.Value = True Then
scrsci.Text = Round((Sin(a * 3.14159265358979 / 180)), 5)
End If
If radian.Value = True Then
scrsci.Text = Round((Sin(a)), 5)
End If
If grade.Value = True Then
scrsci.Text = Round((Sin(a * 3.14159265358979 / 200)), 5)
End If
End Sub





Private Sub sininv_Click()
a = Val(scrsci.Text)
d = a / ((a ^ 2 + 1) ^ (1 / 2))
b = 1
c = 0
For counter = 1 To 1000 Step 2
c = c + (b * (d ^ counter) / counter)
b = b * (-1)
Next counter
scrsci.Text = c
End Sub

Private Sub sqr_Click()
a = Val(scrsci.Text)
scrsci.Text = a * a
End Sub

Private Sub sqrt_Click()
a = Val(scrsci.Text)
scrsci.Text = a ^ 0.5

End Sub

Private Sub sub_Click()
a = Val(scrsci.Text)
scrsci.Text = " "
oper = "-"
End Sub

Private Sub tane_Click()
anina = Val(scrsci.Text)
If degree.Value = True Then
If Val(a) Mod 180 = 0 Then
scrsci.Text = 0
ElseIf Val(a) Mod 90 = 0 Then
MsgBox "Value of tan of 90 Degree & its multiples is NOT DEFINED", 48, "Not Defined"
Else: scrsci.Text = Round((Tan(a * 3.14159265358979 / 180)), 5)
End If
End If
If radian.Value = True Then
If Val(a) Mod 3.14159265358979 = 0 Then
scrsci.Text = 0
ElseIf Val(a) Mod 1.5707963267949 = 0 Then
MsgBox "Value of tan of Pi Radians & its multiples is NOT DEFINED", 48, "Not Defined"
Else: scrsci.Text = Round((Tan(a)), 5)
End If
End If
If grade.Value = True Then
If Val(a) Mod 200 = 0 Then
scrsci.Text = 0
ElseIf Val(a) Mod 100 = 0 Then
MsgBox "Value of tan of 100 Grades & its multiples is NOT DEFINED", 48, "Not Defined"
Else: scrsci.Text = Round((Tan(a * 3.14159265358979 / 200)), 5)
End If
End If
End Sub



Private Sub taninv_Click()
a = Val(scrsci.Text)
b = 1
c = 0
For counter = 1 To 1000 Step 2
c = c + (b * (a ^ counter) / counter)
b = b * (-1)
Next counter
scrsci.Text = c

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
