### Vmware fusion virtual machine management cli(nogui) shortcut script

##### Description
For Linux release version, developers only need to enable virtual machine instance in most scenarios, no GUI is running, and VMware does not provide relevant management commands, and there is no need to start VMware It is convenient for developers to input and close the application, and it is convenient for developers to input and close the application.   
You can make relevant task scripts and development configurations according to your own needs.  
  
[简体中文](https://github.com/ljq/vmware-fusion-vmcli-nogui/blob/main/README.zh-CN.md)  
  
Related support:
  
- [x] Read the list of all virtual machine instances in the system or custom path (supports virtual host names with spaces)
- [x] Virtual machine instance specified by no interface shortcut
- [x] List|start|stop|suspend|pause|pause|unpause operation is satisfied based on vmrun
- [x] homebrew-tap Formula(usrlab/tap)
- [x] Configuration file support
- [ ] Disk space collection based on Linux hairstyle instance
- [ ] Multipath support
- [ ] clone virtual machine instance, customize network parameter configuration, make it convenient for developers to create instances at low cost
- [ ] HomeBrew Formula

![fusion-fwk](images/fusion-fwk.png)

```mermaid
graph LR
    A[fusion-vmcli] 
    A -->B[install]
    A -->C[config]
    A -->D[command]

    B --> B1( brew tap usrlab/tap <br /> brew install vmware-fusion-vmcli-nogui )

    C --> C1> /usr/local/etc/fusion-vmcli.conf ]

    D --> D1( Help Document )


```

##### homebrew-tap and install

System application default path:
```
~/Documents/Virtual\ Machines.localized
```

![homebrew-tap](https://github.com/ljq/vmware-fusion-vmcli-nogui/blob/main/images/homebrew-tap.png)

The tap sources are located under the usrlab@Github organization：

```

brew tap usrlab/tap

brew install vmware-fusion-vmcli-nogui

```

or

```
brew install usrlab/tap/vmware-fusion-vmcli-nogui
```


```
mkdir -p ~/VmwareFusionPro

vim /usr/local/etc/fusion-vmcli.conf
```

##### Useage

The command line：

```
fusion-vmcli -h
```

```
[usage]: [-l | list] [start|stop|suspend|pause|unpause <number>] [-h | -help | --help] [-v | -V | --version]

[helptext]
    -h|help : Show help info.
    -l|list : default[None parameters] show VMs list and VMs status.
    start|stop|suspend|pause|unpause [number] : 
        Start the corresponding virtual machine [Linux based distribution only].
    
    Notice: default show VMs list.

```

There are two ways of script: parameter and interactive

* 1.interactive：
```
fusion-vmcli
```
![interactive](https://github.com/ljq/vmware-fusion-vmcli-nogui/blob/main/images/sample-01.png)

* 2.parameter：
```
fusion-vmcli start 1
```
![parameter](https://github.com/ljq/vmware-fusion-vmcli-nogui/blob/main/images/sample-02.png)
