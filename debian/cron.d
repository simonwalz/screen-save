##Save and autostart all screen sesssion
@reboot		root	if [ -x /usr/bin/screen-auto-start ]; then /usr/bin/screen-auto-start; fi
*/5 * * * *	root	if [ -x /usr/bin/screen-save-all-sessions ]; then /usr/bin/screen-save-all-sessions -d; fi
