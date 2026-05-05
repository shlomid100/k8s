#Vi Editor
```
The default editor that comes with the Linux/UNIX operating system is called vi (visual editor), It is a command-line editor, meaning that all commands are executed through the command line, rather than through a graphical user interface

The best way to learn Vi is to create a new file and try it out for yourself
$ vi — Open or edit a file.
i — Switch to Insert mode.
Esc — Switch to Command mode.
:w — Save and continue editing.
:wq or ZZ — Save and quit/exit vi.
:q! — Quit vi and do not save changes.
yy — Yank (copy) a line of text.
p — Paste a line of yanked text below the current line.
o — Open a new line under the current line.
O — Open a new line above the current line.
A — Append to the end of the line.
a — Append after the cursor’s current position.
I — Insert text at the beginning of the current line.
b — Go to the beginning of the word.
e — Go to the end of the word.
x — Delete a single character.
dd — Delete an entire line.
Xdd — Delete X number of lines.
Xyy — Yank X number of lines.
G — Go to the last line in a file.
XG — Go to line X in a file.
gg — Go to the first line in a file.
:num — Display the current line’s line number.
h — Move left one character.
j — Move down one line.
k — Move up one line.
l — Move right one character.
Let's exercise hands-on Lab-02
Open the /var/syslog file with via Vi Editor​

Switch to insert mode​
Switch to last line file mode​
Switch to first line in a file​
Switch to command mode and Quit vi and do not save changes​

```
Duplicate the first line ​
Back to vi mode and go to the last line and then delete the month and save the file ​
For sulotion - go to lab-01-basic-commands.sh under section lab-02
