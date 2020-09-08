#
# disassemble sau7 domain_os
#
D=~/src/domainos-archeology

load_addr=0x0
dis_addr=$1

offset=$(node -e "console.log(${dis_addr} - ${load_addr})")

dd if=${D}/roms/dn3500/3500_BOOT_12191_7.bin of=/tmp/3500_BOOT_12191_7.bin bs=${offset} skip=1 > /dev/null 2>&1
${D}/binutils-gdb/binutils/objdump -D --adjust-vma=${dis_addr} -b binary -mm68k:68030 /tmp/3500_BOOT_12191_7.bin
