

$vmdk_src = "M:\Virtual Machines\Aristaeus\Win10_20H2_French_x64-cl2.vmdk"

$vmdk_dest = "M:\Virtual Machines\Aristaeus\Win10_20H2_French_x64.vmdk"


& "C:\Program Files (x86)\VMware\VMware Workstation\vmware-vdiskmanager.exe" -r $vmdk_src -t 0 $vmdk_dest