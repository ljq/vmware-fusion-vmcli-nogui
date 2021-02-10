### Vmware fusion virtual machine management cli(nogui) shortcut script

##### Description
For Linux hairstyle version, developers only need to enable virtual machine instance in most scenarios, no GUI is running, and VMware does not provide relevant management commands, and there is no need to start VMware It is convenient for developers to input and close the application, and it is convenient for developers to input and close the application.   
You can make relevant task scripts and development configurations according to your own needs.  
  
[简体中文](https://github.com/iotd/vmware-fusion-vmcli-nogui/blob/main/README_CN.md)  
  
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

##### homebrew-tap and install


![homebrew-tap](https://github.com/iotd/vmware-fusion-vmcli-nogui/blob/main/images/homebrew-tap.png)

The tap sources are located under the usrlab@Github organization：

```

brew tap usrlab/tap

brew install vmware-fusion-vmcli-nogui

```

# virtual machines default path，Resources are changed to this path 

###### (a temporary solution：custom，Followed to the configuration file)

```
mkdir -p ~/VmwareFusionPro
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
./fusion-vmcli.sh
```
![interactive](https://github.com/iotd/vmware-fusion-vmcli-nogui/blob/main/images/sample-01.png)

* 2.parameter：
```
./fusion-vmcli.sh start 1
```
![parameter](https://github.com/iotd/vmware-fusion-vmcli-nogui/blob/main/images/sample-02.png)
