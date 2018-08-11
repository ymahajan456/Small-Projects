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
APPLICATION_NAME = 'TestAppName'


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

def main():
    """Shows basic usage of the Google Calendar API.

    Creates a Google Calendar API service object and outputs a list of the next
    10 events on the user's calendar.
    """
    credentials = get_credentials()
    http = credentials.authorize(httplib2.Http())
    service = discovery.build('calendar', 'v3', http=http)

    #now = datetime.datetime.utcnow().isoformat() + 'Z' # 'Z' indicates UTC time
    # now = datetime.datetime.strptime("2016-09-01:08:00:00","%Y-%m-%d:%H:%M:%S").isoformat() + 'Z'
    # print('Getting the upcoming 10 events')
    # eventsResult = service.events().list(
        # calendarId='primary', timeMin=now, maxResults=10, singleEvents=True,
        # orderBy='startTime').execute()
    # events = eventsResult.get('items', [])

    # if not events:
        # print('No upcoming events found.')
    # for event in events:
        # start = event['start'].get('dateTime', event['start'].get('date'))
        # print(start, event['summary'], "COlOR : ", event['colorId'])
        
    # colors = service.colors().get().execute()


    # print("available calendarListEntry colors.")
    # for id, color in colors['calendar'].items():
        # print('colorId: %s' % id)
        # print('  Background: %s' % color['background'])
        # print('  Foreground: %s' % color['foreground'])
    # print("\n\navailable event colors.")
    # for id, color in colors['event'].items():
        # print('colorId: %s' % id)
        # print('  Background: %s' % color['background'])
        # print('  Foreground: %s' % color['foreground'])

    event = {
    'summary': 'Google I/O 2015',
    'location': '800 Howard St., San Francisco, CA 94103',
    'description': 'A chance to hear more about Google\'s developer products.',
    'colorId' : '10',
    'start': {
    'dateTime': "2016-12-29T17:00:00+05:30",
    'timeZone': "Asia/Kolkata",
    },
    'end': {
    'dateTime': "2016-12-29T18:00:00+05:30",
    'timeZone': "Asia/Kolkata",
    },
    'recurrence': [
    'RRULE:FREQ=DAILY;COUNT=2'
    # 'RRULE:FREQ=WEEKLY;UNTIL=20110701T170000Z'
    ],
    'attendees': [
    {'email': 'lpage@example.com'},
    {'email': 'sbrin@example.com'},
    ],
    'reminders': {
    'useDefault': False,
    'overrides': [
      {'method': 'email', 'minutes': 24 * 60},
      {'method': 'popup', 'minutes': 10},
    ],
    },
    }
    
    calendar = {
    "kind": "calendar#calendar",
    #"etag": etag,
    'summary': 'TestSummeryName',       # Display Name
    'timeZone': "Asia/Kolkata",
    #'id': "Test"
    }
    created_calendar = service.calendars().insert(body=calendar).execute()
    print(created_calendar['id'])
 
    event = service.events().insert(calendarId=created_calendar['id'], body=event).execute()
    print('Event created: %s' % (event.get('htmlLink')))
if __name__ == '__main__':
    main()