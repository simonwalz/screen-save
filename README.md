# screen-save

A tool to make screen sessions persistent = survive system reboot.

## Save a screen session

The following command saves a screen session to the file `~/.screenrc_{SESSIONAME}`:

```sh
screen-save [-t] SESSIONNAME [SAVE_FILE]
```

##### Options
<table>
  <thead>
  <tr>
    <th>Option</th>
    <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><code>-t</code></td>
    <td>Use the current screen session. Only works inside a screen session.</td>
  </tr>
  <tr>
    <td><code>SESSIONNAME</code></td>
    <td>Name or PID of the screen session to save.</td>
  </tr>
  <tr>
    <td><code>SAVE_FILE</code></td>
    <td>(optional) Save session to file.</td>
  </tr>
  </tbody>
</table>

Start a screen session with <code>screen -S SESSIONNAME</code> or rename an existing session via <code>CTRL + A</code>, <code>:session SESSIONAME</code> 

##### Example

create, reattach and save a session:

```sh
# create session
screen -S mysession
# reattach to session
screen -x
# save session
screen-save mysession
```

## Load a screen session

Use screen:

```sh
screen -c .screenrc_{SESSIONNAME}
```

<table>
  <thead>
  <tr>
    <th>Option</th>
    <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><code>-c</code></td>
    <td>custom screen configuration file</td>
  </tr>
  <tr>
    <td><code>.screenrc_{SESSIONNAME}</code></td>
    <td>Path to the configuration file</td>
  </tr>
  </tbody>
</table>

## Automatically start sessions at system start

To start the saved screen sessions at system start, start crontab via:

```sh
crontab -e
```

and add the script `screen-auto-start`:

```cron
@reboot /full/path/to/screen-auto-start
```

The script `screen-auto-start` is part of this repository.

## Automatically save all my session

To start the saved screen sessions at system start, start crontab via:

```sh
crontab -e
```

and add the script `creen-save-all-sessions` to save all my sessions every day at 3:00am:

```cron
0 3 * * * /full/path/to/screen-save-all-sessions
```

The script `creen-save-all-sessions` is part of this repository.

## Remove a saved session
Just remove the saved screenrc file:

```sh
rm ~/.screenrc-{SESSIONNAME}
```

## Limitations

* Screen Version 4.01 is needed, to support queried commands.
* Does not work on macOS, because there is no /proc filesystem.
* Changing the number of a window is not supported. The window number is read from the environment, which can not be updated by screen.
* Saving window layouts is not jet implemented.