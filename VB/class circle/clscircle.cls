VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clscircle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private mrad As Double
Private circum As Double
Private area As Double
Const pi As Double = 3.14159
Public Property Let rad(ByVal rad As Double)
mrad = rad
End Property

Public Property Get maincircum() As Double
maincircum = circum
End Property
Public Property Get mainarea() As Double
mainarea = area
End Property

Public Function calculatearea() As Double
area = pi * mrad * mrad
End Function
Public Function calculatecircum() As Double
circum = pi * mrad * 2
End Function

