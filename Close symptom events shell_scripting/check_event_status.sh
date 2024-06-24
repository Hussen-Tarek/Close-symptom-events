#! /bin/bash

read -p "Enter the incident number:" incident_number

incident_status=$(grep "^$incident_number" ticket_status.txt | awk '{print $2}')


if [ -z "$incident_status" ]
then
	echo "the incident is not found"
	exit 1
fi


event_id=$(grep "^$incident_number" events_tickets.txt | awk '{print $2}')

if [ -z "$event_id" ]
then
	echo "event id not found for incident number $incident_number "
	exit 1
fi


if [ "$incident_status" == "closed" ]
then
	echo "$event_id closed" >> Events_status.txt
	echo "the event id: $event_id of the incident: $incident_number is now closed"
else
	echo "the incident: $incident_number is now opened and we working on it"
fi


