config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
  mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
  rm $NEW
  fi
}

config etc/neomutt/Muttrc.new
config etc/neomutt/mime.types.new

# Update the desktop database:
if [ -x usr/bin/update-desktop-database ]; then
  chroot . /usr/bin/update-desktop-database -q /usr/share/applications > /dev/null 2>&1
fi
