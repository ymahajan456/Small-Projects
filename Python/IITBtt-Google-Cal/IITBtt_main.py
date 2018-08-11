# Title        : IITB Timetable Main
# Developed by : Yogesh Mahajan (y.mahajan456@gmail.com)    (14D070022 @ IITB EE) 
# Description  : 
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

"""
Time table Entry fomat:
------------------------
    "slot" : {"summary":"","location":"","description":"", "colorId" : ""},
    
ColorIDs for Events:
---------------------
    Id    Name     Hex
    1 : Lavender  #a4bdfc
    2 : Sage      #7ae7bf   
    3 : Grape     #dbadff
    4 : Flamingo  #ff887c
    5 : Banana    #fbd75b
    6 : Tangerine #ffb878
    7 : Peacock   #46d6db
    8 : Graphite  #e1e1e1
    9 : Blueberry #5484ed
    10: Basil     #51b749
    11: Tomato    #dc2127
"""
#--------------------------------------------------------------------------------------------------
from IITBtt_preprocessing import *

#--------------------------------------------------------------------------------------------------
time_table  = {
    "slot_1" : {"summary":"EE 719 Mixed Signal VLSI Design","location":"GG 401","description":"M.Shojaei Baghini"},
    #"slot_2" : {"summary":"EE 338 Digital Signal Processign","location":"LH 301","description":"V.M. Gadre"},
    "slot_3" : {"summary":"EE 668 Systems Design","location":"GG 101","description":"Dinesh Sharma, Shalabh Gupta"},
    "slot_4" : {"summary":"EE 709 Testing and Verification","location":"GG 103","description":"Virendra Singh"},
    #"slot_5" : {"summary":"Cs 213 Data Structures and AAlgorithm","location":"CC 103","description":"G.Ramakrishnan","colorId" : "10"},
    #"slot_6" : {"summary":"slot6","location":"l6","description":"test"},
    #"slot_7" : {"summary":"slot7","location":"l7","description":"test"},
    #"slot_8" : {"summary":"slot8","location":"l8","description":"test"},
    "slot_9" : {"summary":"CC 684 Embedded System","location":"CC 103","description":"Kavi Arya"},
    #"slot_10" : {"summary":"slot10","location":"l10","description":"test"},
    #"slot_11" : {"summary":"slot11","location":"l11","description":"test"},
    #"slot_12" : {"summary":"EE 619 RF Microelectronic Chip Design","location":"LH 101","description":"Rajesh Zele"},
    #"slot_13" : {"summary":"EE 769 Introduction to ML","location":"LC 002","description":"Amit Sethi"},
    "slot_14" : {"summary":"EE 619 RF Microelectronic Chip Design","location":"LH 101","description":"Rajesh Zele"},
    #"slot_15" : {"summary":"EE 705 VLSI Design Lab","location":"GG 101","description":"Sachin Patkar"},
    #"slot_L1" : {"summary":"EE 324 Control Systems Lab","location":"WEL","description":"Debraj Chakraborty, M. Belur","colorId" : "8"},
    #"slot_L2" : {"summary":"EE 705 VLSI Design Lab","location":"GG 101","description":"Sachin Patkar"},
    #"slot_L3" : {"summary":"EE 352 Digital Signal Processing Lab","location":"WEL","description":"V Raj Babu"},
    #"slot_L4" : {"summary":"EE 705 VLSI Design Lab","location":"LH 301","description":"Sachin Patkar"},
    #"slot_L5" : {"summary":"EE 324 Control Systems Lab","location":"lL1","description":"test"},
    #"slot_L6" : {"summary":"EE 324 Control Systems Lab","location":"lL1","description":"test"},
    #"slot_X1" : {"summary":"slotX1","location":"lL1","description":"test"},
}
#--------------------------------------------------------------------------------------------------
start_date = "2018-01-04"
end_date = "2018-04-20"
calendar_name = "Semester VIII"
mid_sem_start = "2018-02-24"
mid_sem_end = "2018-03-1"
#--------------------------------------------------------------------------------------------------
do_things(time_table,start_date, end_date, calendar_name, mid_sem_start, mid_sem_end)
#--------------------------------------------------------------------------------------------------
