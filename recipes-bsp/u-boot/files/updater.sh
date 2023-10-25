#!/bin/bash
# Copyright  2019-2023 NXP

function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

# check if input parameters are correct
case "$#" in
    "1")
        if valid_ip $1; then
            fw_setenv ip_dyn yes
            fw_setenv serverip $1
            fw_setenv bootdelay 0
            fw_setenv bootcmd run flash_linux
            reboot
        elif [ "$1" == "uuu" ]; then
            fw_setenv bootdelay 0
            fw_setenv bootcmd run boot_fastboot_from_linux
            reboot
        else
            echo "Invalid server ip '$1'"
        fi
        ;;
    "2")
        error=0
        if ! $(valid_ip $1); then
            echo "Invalid server ip '$1'"
            error=1
        fi

        if ! $(valid_ip $2); then
            echo "Invalid board ip '$2'"
            error=1
        fi

        if [[ $error == 0 ]]; then
            fw_setenv ip_dyn no
            fw_setenv serverip $1
            fw_setenv ipaddr $2
            fw_setenv bootdelay 0
            fw_setenv bootcmd run flash_linux
            reboot
        fi

        ;;
    *)
        echo "Usage:"
        echo " $0 uuu                         - Reboot the board into UUU fastboot mode"
        echo " $0 <tftp server ip>            - Update the board software via TFTP with DHCP"
        echo " $0 <tftp server ip> <board ip> - Update the board software via TFTP with a static ip"
        ;;
esac
