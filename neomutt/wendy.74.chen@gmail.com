set realname="Wendy Chen"
set from="wendy.74.chen@gmail.com"
set use_from = "yes"
set hostname=gmail.com
unset imap_passive
unset record
set imap_user=wendy.74.chen@gmail.com
set smtp_url="smtp://wendy.74.chen@smtp.gmail.com:587/
set folder=imaps://wendy.74.chen@imap.gmail.com/
set spoolfile = +INBOX
mailboxes = +INBOX
set postponed = +[Gmail]/Drafts
set record=+[Gmail]/Sent
set imap_keepalive=300
set mail_check=300
source $CONFIG_HOME/neomutt/aliases
source "gpg -d $CONFIG_HOME/neomutt/wendy.74.chen@gmail.com.gpg|"
folder-hook .*wendy.74.chen@gmail.com/ 'source $CONFIG_HOME/neomutt/wendy.74.chen@gmail.com'
