# Title        : IITB Timetable Preprocessing
# Developed by : Yogesh Mahajan (y.mahajan456@gmail.com)    (14D070022 @ IITB EE) 
# Description  : 
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

import datetime
from copy import deepcopy
from IITBtt_GC_API import *
import pickle
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
"""
"""
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
def get_start_dates_for_slots(sem_start_date_str):
    start_date = datetime.datetime.strptime(sem_start_date_str, '%Y-%m-%d')
    weekday = start_date.weekday()
    first_week_dates = [None for i in range(5)]
    num_dates_got = 0
    while (num_dates_got < 5):
        first_week_dates[weekday] = start_date.strftime('%Y-%m-%d')
        if (weekday != 4):
            start_date = start_date + datetime.timedelta(days = 1)
            weekday = weekday+1
        else:
            start_date = start_date + datetime.timedelta(days = 3)
            weekday = 0
        num_dates_got = num_dates_got + 1
    #print(first_week_dates)
    first_week = {"Mon":first_week_dates[0],"Tue":first_week_dates[1],"Wed":first_week_dates[2],"Thu":first_week_dates[3],"Fri":first_week_dates[4]}
    return first_week
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
slot_1A = {"start_time":"08:30:00", "stop_time" : "09:25:00", "day" : "Mon", "previous_taken" : False, "colorId" : "11", "next_slot":"slot_2A"}
slot_1B = {"start_time":"09:30:00", "stop_time" : "10:25:00", "day" : "Tue", "previous_taken" : False, "colorId" : "11", "next_slot":"slot_2B"}
slot_1C = {"start_time":"10:35:00", "stop_time" : "11:30:00", "day" : "Thu", "previous_taken" : False, "colorId" : "11", "next_slot":"slot_2C"}
          
slot_2C = {"start_time":"11:35:00", "stop_time" : "12:30:00", "day" : "Thu", "previous_taken" : False, "colorId" : "6", "next_slot":None}
slot_2A = {"start_time":"09:30:00", "stop_time" : "10:25:00", "day" : "Mon", "previous_taken" : False, "colorId" : "6", "next_slot":"slot_3A"}
slot_2B = {"start_time":"10:35:00", "stop_time" : "11:30:00", "day" : "Tue", "previous_taken" : False, "colorId" : "6", "next_slot":"slot_3B"}
          
slot_3C = {"start_time":"08:30:00", "stop_time" : "09:25:00", "day" : "Thu", "previous_taken" : False, "colorId" : "5", "next_slot":"slot_4C"}
slot_3B = {"start_time":"11:35:00", "stop_time" : "12:30:00", "day" : "Tue", "previous_taken" : False, "colorId" : "5", "next_slot":None}
slot_3A = {"start_time":"10:35:00", "stop_time" : "11:30:00", "day" : "Mon", "previous_taken" : False, "colorId" : "5", "next_slot":"slot_4A"}
          
slot_4B = {"start_time":"08:30:00", "stop_time" : "09:25:00", "day" : "Tue", "previous_taken" : False, "colorId" : "10", "next_slot":"slot_1B"}
slot_4C = {"start_time":"09:30:00", "stop_time" : "10:25:00", "day" : "Thu", "previous_taken" : False, "colorId" : "10", "next_slot":"slot_1C"}
slot_4A = {"start_time":"11:35:00", "stop_time" : "12:30:00", "day" : "Mon", "previous_taken" : False, "colorId" : "10", "next_slot":None}

slot_5A = {"start_time":"09:30:00", "stop_time" : "10:55:00", "day" : "Wed", "previous_taken" : False, "colorId" : "3", "next_slot":"slot_6A"}
slot_5B = {"start_time":"09:30:00", "stop_time" : "10:55:00", "day" : "Fri", "previous_taken" : False, "colorId" : "3", "next_slot":"slot_6B"}
          
slot_6A = {"start_time":"11:05:00", "stop_time" : "12:30:00", "day" : "Wed", "previous_taken" : False, "colorId" : "10", "next_slot":None}
slot_6B = {"start_time":"11:05:00", "stop_time" : "12:30:00", "day" : "Fri", "previous_taken" : False, "colorId" : "10", "next_slot":None}
          
slot_7A = {"start_time":"08:30:00", "stop_time" : "09:25:00", "day" : "Wed", "previous_taken" : False, "colorId" : "8", "next_slot":"slot_5A"}
slot_7B = {"start_time":"08:30:00", "stop_time" : "09:25:00", "day" : "Fri", "previous_taken" : False, "colorId" : "8", "next_slot":"slot_5B"}
          
slot_8A = {"start_time":"14:00:00", "stop_time" : "15:25:00", "day" : "Mon", "previous_taken" : False, "colorId" : "9", "next_slot":"slot_9A"}
slot_8B = {"start_time":"14:00:00", "stop_time" : "15:25:00", "day" : "Thu", "previous_taken" : False, "colorId" : "9", "next_slot":"slot_9B"}
          
slot_9A = {"start_time":"15:30:00", "stop_time" : "16:55:00", "day" : "Mon", "previous_taken" : False, "colorId" : "7", "next_slot":"slot_12A"}
slot_9B = {"start_time":"15:30:00", "stop_time" : "16:55:00", "day" : "Thu", "previous_taken" : False, "colorId" : "7", "next_slot":"slot_12B"}
          
slot_10A = {"start_time":"14:00:00", "stop_time" : "15:25:00", "day" : "Tue", "previous_taken" : False, "colorId" : "8", "next_slot":"slot_11A"}
slot_10B = {"start_time":"14:00:00", "stop_time" : "15:25:00", "day" : "Fri", "previous_taken" : False, "colorId" : "8", "next_slot":"slot_11B"}
          
slot_11A = {"start_time":"15:30:00", "stop_time" : "16:55:00", "day" : "Tue", "previous_taken" : False, "colorId" : "1", "next_slot":"slot_14A"}
slot_11B = {"start_time":"15:30:00", "stop_time" : "16:55:00", "day" : "Fri", "previous_taken" : False, "colorId" : "1", "next_slot":"slot_14B"}
          
slot_12A = {"start_time":"17:30:00", "stop_time" : "18:55:00", "day" : "Mon", "previous_taken" : False, "colorId" : "11", "next_slot":"slot_13A"}
slot_12B = {"start_time":"17:30:00", "stop_time" : "18:55:00", "day" : "Thu", "previous_taken" : False, "colorId" : "11", "next_slot":"slot_13B"}
          
slot_13A = {"start_time":"19:00:00", "stop_time" : "20:25:00", "day" : "Mon", "previous_taken" : False, "colorId" : "5", "next_slot":None}
slot_13B = {"start_time":"19:00:00", "stop_time" : "20:25:00", "day" : "Thu", "previous_taken" : False, "colorId" : "5", "next_slot":None}
          
slot_14A = {"start_time":"17:30:00", "stop_time" : "18:55:00", "day" : "Tue", "previous_taken" : False, "colorId" : "6", "next_slot":"slot_15A"}
slot_14B = {"start_time":"17:30:00", "stop_time" : "18:55:00", "day" : "Fri", "previous_taken" : False, "colorId" : "6", "next_slot":"slot_15B"}
          
slot_15A = {"start_time":"19:00:00", "stop_time" : "20:25:00", "day" : "Tue", "previous_taken" : False, "colorId" : "10", "next_slot":None}
slot_15B = {"start_time":"19:00:00", "stop_time" : "20:25:00", "day" : "Fri", "previous_taken" : False, "colorId" : "10", "next_slot":None}

slot_L1 = {"start_time":"14:00:00", "stop_time" : "16:55:00", "day" : "Mon", "previous_taken" : False, "colorId" : "3", "next_slot":"slot_12A"}
slot_L2 = {"start_time":"14:00:00", "stop_time" : "16:55:00", "day" : "Tue", "previous_taken" : False, "colorId" : "3", "next_slot":"slot_14A"}
slot_L3 = {"start_time":"14:00:00", "stop_time" : "16:55:00", "day" : "Thu", "previous_taken" : False, "colorId" : "3", "next_slot":"slot_12B"}
slot_L4 = {"start_time":"14:00:00", "stop_time" : "16:55:00", "day" : "Fri", "previous_taken" : False, "colorId" : "3", "next_slot":"slot_14B"}
slot_L5 = {"start_time":"09:30:00", "stop_time" : "12:30:00", "day" : "Wed", "previous_taken" : False, "colorId" : "3", "next_slot":None}
slot_L6 = {"start_time":"09:30:00", "stop_time" : "12:30:00", "day" : "Fri", "previous_taken" : False, "colorId" : "3", "next_slot":None}

slot_X1 = {"start_time":"14:00:00", "stop_time" : "14:55:00", "day" : "Wed", "previous_taken" : False, "colorId" : "2", "next_slot":"slot_X2"}
slot_X2 = {"start_time":"15:00:00", "stop_time" : "15:55:00", "day" : "Wed", "previous_taken" : False, "colorId" : "2", "next_slot":"slot_X3"}
slot_X3 = {"start_time":"16:00:00", "stop_time" : "16:55:00", "day" : "Wed", "previous_taken" : False, "colorId" : "2", "next_slot":"slot_XC"}
slot_XC = {"start_time":"17:30:00", "stop_time" : "18:55:00", "day" : "Wed", "previous_taken" : False, "colorId" : "2", "next_slot":"slot_XD"}
slot_XD = {"start_time":"19:00:00", "stop_time" : "20:25:00", "day" : "Wed", "previous_taken" : False, "colorId" : "2", "next_slot":None}
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

weekdays = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]

def update_dates(sem_end_date, mid_sem_start, mid_sem_end):
    ms_start_date = datetime.datetime.strptime(mid_sem_start, "%Y-%m-%d")
    ms_end_date = datetime.datetime.strptime(mid_sem_end, "%Y-%m-%d")
    except_dates = {day : [] for day in weekdays}
    dt = ms_end_date - ms_start_date
    for i in range(dt.days + 1):
        curr_day = ms_start_date + datetime.timedelta(days = i)
        day_name = curr_day.strftime('%a')
        except_dates[day_name].append(curr_day.strftime("%Y%m%d"))
    event_body['recurrence'] = ['RRULE:FREQ=WEEKLY;UNTIL='+ sem_end_date.replace("-","") + 'T190000Z']
    return except_dates
    
def get_taken_slots_data(user_input):
    taken_slots = []
    for slot_name in user_input.keys():
        if(slot_name[5] not in ["L","X"]):
            slot_number = int(slot_name[5:7])
            taken_slots.append(slot_name + "B")
            globals()[slot_name + "B"].update(user_input[slot_name])
            globals()[slot_name + "A"].update(user_input[slot_name])
            taken_slots.append(slot_name + "A")
            if(slot_number < 5):
                # A,B,C
                taken_slots.append(slot_name + "C")
                globals()[slot_name + "C"].update(user_input[slot_name])
        else:
            # only one event
            taken_slots.append(slot_name)
            globals()[slot_name].update(user_input[slot_name])
    return taken_slots

def update_taken_data(taken_slots):
    for slot in taken_slots:
        next_slot = globals()[slot]["next_slot"]
        if next_slot != None :
            globals()[next_slot]["previous_taken"] = True
    

def create_event_body(slot_name, first_week_dates, except_dates):
    slot_data = globals()[slot_name]
    new_event_body = deepcopy(event_body)
    new_event_body["summary"] = slot_data["summary"]
    new_event_body["location"] = slot_data["location"]
    new_event_body["description"] = slot_data["description"]
    new_event_body["colorId"] = slot_data["colorId"]
    new_event_body["start"]['dateTime'] = first_week_dates[slot_data['day']] + 'T' + slot_data['start_time'] + '+05:30'
    #new_event_body["start"]['date'] = first_week_dates[slot_data['day']]
    new_event_body["end"]['dateTime'] = first_week_dates[slot_data['day']] + 'T' + slot_data['stop_time'] + '+05:30'
    #new_event_body["end"]['date'] = first_week_dates[slot_data['day']]
    new_event_body['recurrence'].append(get_execept_string(slot_data['start_time'], except_dates[slot_data['day']]))
    if slot_data['previous_taken']:
        new_event_body['reminders']['overrides'][0]['minutes'] = 10
    return new_event_body

def get_execept_string(event_time, except_dates_d):
    except_string = "EXDATE;TZID=Asia/Kolkata:"
    for date in except_dates_d:
        except_string = except_string + date + "T" + event_time.replace(":","") + ","
    except_string = except_string[:-1]
    return except_string
    
def do_things(user_input, sem_start_date, sem_end_date, calendar_name, mid_sem_start, mid_sem_end):
    first_week = get_start_dates_for_slots(sem_start_date)
    #print(first_week)
    except_dates = update_dates(sem_end_date, mid_sem_start, mid_sem_end)
    taken_slots = get_taken_slots_data(user_input)
    #print(taken_slots)
    update_taken_data(taken_slots)
    
    credentials = get_credentials()
    print("credential obtained\n")

    http = credentials.authorize(httplib2.Http())
    service = discovery.build('calendar', 'v3', http=http)
    new_calendarId = create_calendar(calendar_name, service)
    # f = open("calendarId.yo",'rb')
    # new_calendarId = pickle.load(f)
    # f.close()
    
    print("CalendatID loaded", new_calendarId)

    print(taken_slots)
    for slot_name in taken_slots:
        new_body = create_event_body(slot_name, first_week, except_dates)
        print(new_body)
        event = service.events().insert(calendarId=new_calendarId, body=new_body).execute()
        print("Event " + slot_name + " added.")
        
        
