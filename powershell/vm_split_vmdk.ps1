# Note: There are several available disk types:
# 0: A growable virtual disk contained in a single file (called "monolithic sparse").
# 1: A growable virtual disk split into 2GB files (called "split sparse").
# 2: A preallocated virtual disk contained in a single file (called "monolithic flat").
# 3: A preallocated virtual disk split into 2GB files (called "split flat").

cd "D:\Temp\"

$vmdk_src = "M:\Virtual Machines\Aristaeus\Win10_20H2_French_x64.vmdk"

$vmdk_dest = "M:\Virtual Machines\Aristaeus\Aristaeus-1.vmdk"

& "D:\Program Files (x86)\VMware\VMware Workstation\vmware-vdiskmanager.exe" -r $vmdk_src -t 1 $vmdk_dest
