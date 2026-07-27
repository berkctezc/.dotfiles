# append intel_iommu=on or amd_iommu=on to line GRUB_CMDLINE_LINUX_DEFAULT
# OR append intel_iommu=on or amd_iommu=on to first line
nano /etc/default/grub
# run grub update
update-grup
# put these to etc modules
printf "vfio\nvfio_iommu_type1\nvfio_pci\nvfio_virqfd" >> /etc/modules
# black list drivers and other configurations
echo "options vfio_iommu_type1 allow_unsafe_interrupts=1" > /etc/modprobe.d/iommu_unsafe_interrupts.conf
echo "options kvm ignore_msrs=1" > /etc/modprobe.d/kvm.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf

# for gpus
# find your pci device
lspci
# replace 01:00 with your device id and get hash of the device
lspci -n -s 01:00 -v
# replace 10de:139a with your id
echo "options vfio-pci ids=10de:139a disable_vga=1"> /etc/modprobe.d/vfio.conf
# update initram fs
update-initramfs -u -k all
# reboot and enjoy :) 🐧