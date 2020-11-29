### Vmware fusion virtual machine management cli(nogui) shortcut script

##### 描述
自用脚本整理，针对linux发型版本，开发者大部分场景只需要启用虚拟机实例子，No GUI运行，且vmware未提供相关管理命令，也无需启动vmware fusion整个应用程序，可以避免反复输入命令行管理实例以及方便地进行实例的启动、挂起、关闭等操作，节省内存占用和方便开发者进行虚拟机测试，方便灵活。可以根据自己需要做成相关任务脚本和开发配置。

相关支持：

- [x] 读取系统或自定义路径所有虚拟机实例列表(支持含空格虚拟主机名称)
- [x] 无界面(No GUI)快捷操作指定的虚拟机实例
- [x] 基于```vmrun```满足list|start|stop|suspend|pause|unpause操作
- [ ] 克隆虚拟机实例自定义网络参数配置，方便开发者低成本创建实例
- [ ] HomeBrew Formula

##### 用法
脚本分为参数和交互式两种方式：

* 1.交互式：
```
./fusion-vmcli.sh
```
![interactive](https://github.com/iotd/vmware-fusion-vmcli-nogui/blob/main/images/sample-01.png)


* 2.参数传递：
```
./fusion-vmcli.sh start 1
```
![parameter](https://github.com/iotd/vmware-fusion-vmcli-nogui/blob/main/images/sample-02.png)