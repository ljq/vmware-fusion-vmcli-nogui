#!/bin/bash
#
# Vmware Funsion Operate Linux (Mode: No Gui)
# 
# Author: jackliu (Jianqiu Liu)
# Site: https://github.com/iotd
# Blog: https://wdft.com
# Email: stackgo@163.com
# Date: 2020-11-29
# Version: 1.0.0

# virtual machines path (custom)
vm_path="/Users/$(whoami)/VmwareFusionPro"

# custom version
cli_version="1.0.0"
# color green
GREEN_COLOR="\033[32m"
YELLOW_COLOR="\033[43;37m"
GREEN_BG_COLOR="\033[32m"
RES="\033[0m"

# ---------------------- Functions -------------------------

# Show list vm nodes
function show_vms(){
    local vms=($1)
    local total=$2
    local num=1
    echo -e "${GREEN_BG_COLOR}=============== VM List (by Linux distribution) ===============${RES}\n"
    for dirname in ${vms[@]}
    do
        #filter Win
        dirname=${dirname//.vmwarevm/}
        if [[ "${dirname}" =~ "Win" ]]; then
            continue
        else
            # escape filename
            esc_dirname=${dirname//#/\\ }
            echo -e "[${num}] ${esc_dirname}\n"
            ((num=num+1))
        fi
    done
    echo -e "${GREEN_BG_COLOR}[Statistics] linux distribution total：${total} vm nodes.${RES}\n"
    echo -e "${GREEN_BG_COLOR}======================= VM List End ============================${RES}\n"
}

# get vm total number
function vm_nodes_total(){
    local vms=($1)
    local total=0
    for dirname in ${vms[@]}
    do
        #filter Win
        if [[ "${dirname}" =~ "Win" ]]; then
            continue
        else
            ((total=total+1))
        fi
    done
    echo $total
}

# Task exec
function task_exec(){
    # check params
    local operate=$1
    local serial_num=$2
    local vms=($3)
    local vm_path=$4

    if [[ -z $operate || -z $serial_num ]]; then
        echo -e "[error] missing parameter： operate or serial_num.\n"
        exit;
    fi

    local vmrun_params=("start" "stop" "suspend" "pause" "unpause")
    if [[ ${vmrun_params[@]/${operate}/} != ${vmrun_params[@]} ]]; then
        echo -e "${GREEN_COLOR}----------------------------------------------------------${RES}\n"
    else
        echo -e "[error] input invalid parameter: operate.\n"
        exit
    fi

    if [[ $serial_num -le 0 || $serial_num -gt ${#vms[@]} ]]; then
        echo -e "[error] serial_num is not range (1-${#vms[@]})\n"
        exit
    fi
    
    #vm nodes
    local vm_nodes=()
    local num=1
    for dirname in ${vms[@]}
    do
        #filter Win
        dirname=${dirname//.vmwarevm/}
        if [[ "${dirname}" =~ "Win" ]]; then
            continue
        else
            # escape filename
            esc_dirname=${dirname//#/\\ }
            vm_nodes[$num]=$esc_dirname
            ((num=num+1))
        fi
    done
    
    # select node machine
    local vm_num_machine=${vm_nodes[${serial_num}]}
    echo -e "${GREEN_COLOR}VM machine (${vm_num_machine}) $operate Starting ...${RES}\n"
    # task exec
    #echo "$(which vmrun) $operate $vm_path/$vm_num_machine.vmwarevm/$vm_num_machine.vmx nogui"
    "$(which vmrun)" $operate "${vm_path}/${vm_num_machine}.vmwarevm/${vm_num_machine}.vmx" nogui
    echo -e "${GREEN_COLOR}VM machine(${vm_num_machine}) $operate Finished.${RES}\n"
    echo -e "${GREEN_COLOR}----------------------------------------------------------${RES}\n"
}

# Show vm nodes running
function vms_runing(){
    echo -e "${GREEN_BG_COLOR}=============== VM Runing List ===============${RES}\n"
    "$(which vmrun)" list
    echo -e "\n"
    echo -e "${GREEN_BG_COLOR}=============== List End ===============${RES}\n"
}


# ---------------------- Task Process -------------------------

# check vmware fusion installed status
if which vmrun >/dev/null 2>&1; then
    echo -e "vmcli fusion verson: ${cli_version}.\n"
else
    echo -e "${YELLOW_COLOR}[Warning] vmrun is not installd.${RES}\n"
fi

if [ -z "$vm_path" ]; then
    vm_path="/Users/$(whoami)/Documents/Virtual\ Machines.localized"
fi
# list dir and process filename space
list_vms=($(ls $vm_path | tr " " "\#"))
list_total=$(vm_nodes_total "${list_vms[*]}")
# vmrun params exec
if [[ ! -z $1 || ! -z $2 ]]; then
    # direct exec
    task_exec $1 $2 "${list_vms[*]}" $vm_path
    vms_runing
    exit;
else
    # show list
    show_vms "${list_vms[*]}" $list_total
    # interactive exec
    echo -e "${YELLOW_COLOR}[Notice] Please input your vm operate(start|stop|suspend|pause|unpause) and number(1-${list_total})：${RES}\n"
    read operate serial_num 
    # cli interactive
    task_exec $operate $serial_num "${list_vms[*]}" $vm_path
    vms_runing
    exit
fi
exit