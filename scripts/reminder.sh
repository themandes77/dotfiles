#!/bin/bash
REMINDER_FILE="$HOME/dotfiles/.reminders.txt"

touch "$REMINDER_FILE"

case "$1" in
	add)
		echo "$2 - $3" >> "$REMINDER_FILE"
		echo "Reminder added: $2 - $3"
		;;
	list)
		if [ -s "$REMINDER_FILE" ]; then
			cat -n "$REMINDER_FILE"
		else
			echo "No reminders found."
		fi
		;;
	clear)
		> "$REMINDER_FILE"
		echo "All reminders cleared."
		;;
	*)
		echo "Usage: $0 {add|list|clear} [date] [message]"
		echo "Examples:"
		echo "  $0 add \"2024-12-25\" \"Christmas dinner\""
		echo "  $0 list"
		echo "  $0 clear"
		;;
esac
