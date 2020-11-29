### Vmware fusion virtual machine management cli(nogui) shortcut script

##### Description
For Linux hairstyle version, developers only need to enable virtual machine instance in most scenarios, no GUI is running, and VMware does not provide relevant management commands, and there is no need to start VMware It is convenient for developers to input and close the application, and it is convenient for developers to input and close the application.

Related support:

- [x] Read the list of all virtual machine instances in the system or custom path (supports virtual host names with spaces)
- [x] Virtual machine instance specified by no interface shortcut
- [x] List|start|stop|suspend|pause|pause|unpause operation is satisfied based on vmrun
- [ ] clone virtual machine instance, customize network parameter configuration, make it convenient for developers to create instances at low cost
- [ ] HomeBrew Formula

##### Useage
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


