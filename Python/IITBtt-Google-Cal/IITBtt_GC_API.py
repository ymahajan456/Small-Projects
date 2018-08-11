# Title        : IITB Timetable Preprocessing
# Developed by : Yogesh Mahajan (y.mahajan456@gmail.com)    (14D070022 @ IITB EE) 
# Description  : 
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

"""
ColorIDs for Events
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

from __future__ import print_function
import httplib2
import os

from apiclient import discovery
from oauth2client import client
from oauth2client import tools
from oauth2client.file import Storage

import datetime

try:
    import argparse
    flags = argparse.ArgumentParser(parents=[tools.argparser]).parse_args()
except ImportError:
    flags = None

# If modifying these scopes, delete your previously saved credentials
# at ~/.credentials/calendar-python-quickstart.json
SCOPES = 'https://www.googleapis.com/auth/calendar'
CLIENT_SECRET_FILE = 'client_secret.json'
APPLICATION_NAME = 'IITBtt-GC'


event_body = {
    'summary': 'Event_Display_Name',
    'location': 'Google_Maps_Will_search_this',
    'description': 'Describe_event',
    'colorId' : '10',           # colorIDs are specified above
    'start': {
        #'date': "2016-12-29",
        'dateTime': "2016-12-29T17:00:00+05:30",
        'timeZone': "Asia/Kolkata"},
    'end': {
        #'date': "2016-12-29",
        'dateTime': "2016-12-29T18:00:00+05:30",
        'timeZone': "Asia/Kolkata"},
    'recurrence': [
        #'RRULE:FREQ=DAILY;COUNT=2'
        'RRULE:FREQ=WEEKLY;UNTIL=20170701T170000Z'],
    # 'attendees': [
    # {'email': 'lpage@example.com'},
    # {'email': 'sbrin@example.com'}],
    'reminders': {
        'useDefault': False,
        'overrides': [
            {'method': 'popup', 'minutes': 30},
            #{'method': 'email', 'minutes': 24 * 60},
            ]}
}

def get_credentials():
    """Gets valid user credentials from storage.

    If nothing has been stored, or if the stored credentials are invalid,
    the OAuth2 flow is completed to obtain the new credentials.

    Returns:
        Credentials, the obtained credential.
    """
    home_dir = os.path.expanduser('~')
    credential_dir = os.path.join(home_dir, '.credentials')
    if not os.path.exists(credential_dir):
        os.makedirs(credential_dir)
    credential_path = os.path.join(credential_dir,
                                   'calendar-python-quickstart.json')

    store = Storage(credential_path)
    credentials = store.get()
    if not credentials or credentials.invalid:
        flow = client.flow_from_clientsecrets(CLIENT_SECRET_FILE, SCOPES)
        flow.user_agent = APPLICATION_NAME
        if flags:
            credentials = tools.run_flow(flow, store, flags)
        else: # Needed only for compatibility with Python 2.6
            credentials = tools.run(flow, store)
        print('Storing credentials to ' + credential_path)
    return credentials

calendar_body = {
    "kind": "calendar#calendar",
    #"etag": etag,
    'summary': 'CalendarName',       # Display Name
    'timeZone': "Asia/Kolkata",
    #'id': "Test"
}

def create_calendar(calendar_name, service):
    new_calendar = {key : value for key,value in calendar_body.items()}
    new_calendar["summary"] = calendar_name
    created_calander = service.calendars().insert(body=new_calendar).execute()
    return created_calander['id']
    
    



