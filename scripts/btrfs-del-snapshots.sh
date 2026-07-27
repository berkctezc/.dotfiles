sudo systemctl disable --now snapper-timeline.timer
sudo systemctl disable --now snapper-cleanup.timer
sudo systemctl disable --now snapper-boot.timer

#/etc/snapper/configs/root TIMELINE_CREATE="no"

sudo btrfs subvolume delete /.snapshots

sudo rm -rf /.snapshots