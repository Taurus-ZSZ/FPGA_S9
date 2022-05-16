# FPGA_S9 工程
## 文件结构
- 00_DOC 
    - 存放主要的文档
- 01_Hardware
    - 存放与硬件相关的文件  
- 02_pl_proj
    - zynq PL端程序  
- 03_ps_proj 
    - ps端的程序  
- 04_linux
    - linux 学习工程 还没有添加  



fpga 工程s9 fpga 板卡  

## git 提交前的相关工作

在使用git 进行版本管理前要做的工作，

1. 导出当前最新的IP 和bd 的tcl文件。具体参考**导出tcl文件**

2. 将工作区的文件添加到暂存区

   ```sh
   git add *
   ```

3. 将暂存区的文件提交到本地仓库

   ```sh
   git commit -m "相关的注释"
   ```

4. 将本地仓库推送到远程仓库

   ```sh
   git push origin master
   ```



### 导出tcl 文件

#### 导出project

 ```tcl
write_project_tcl ./gen_project.tcl
 ```

#### 导出IP 的tcl

```tcl
# 每个ip都导出一个tcl文件
write_ip_tcl -force -multiple_files [get_ips] ../src/02_IP_Core
# all in one
write_ip_tcl -force  [get_ips] ../src/02_IP_Core/gen_ip.tcl
```

#### 导出bd 的tcl

1. 打开bd文件

2. 导出bd.tcl

   ```tcl
   write_bd_tcl -force ../src/02_IP_Core/bd.tcl
   ```

3. 关闭bd

   ```tcl
   close_bd_design [get_bd_designs ]
   ```

   





## 问题
如何之将sdk的源文件上传到github
