set realname="Wendy Chen"
set from="tilphousia@gmail.com"
set use_from = "yes"
set hostname=gmail.com
unset imap_passive
unset record
set imap_user=tilphousia@gmail.com
set smtp_url="smtp://tilphousia@smtp.gmail.com:587/
set folder=imaps://tilphousia@imap.gmail.com/
set spoolfile = +INBOX
mailboxes = +INBOX
set postponed = +[Gmail]/Drafts
set record=+[Gmail]/Sent
set imap_keepalive=300
set mail_check=300
source $CONFIG_HOME/neomutt/aliases
source "gpg -d $CONFIG_HOME/neomutt/tilphousia@gmail.com.gpg|"
folder-hook .*tilphousia@gmail.com/ 'source $CONFIG_HOME/neomutt/tilphousia@gmail.com'
