import os 

#project_type : 
#               vivado 
#               quartus
python_script = r'/opt/data/900-DONE/910_My_LIB/910_FPGA_LIB/Script/03_CMD/FPGA_script/fpga_script.py'
#python_script = r'D:/900-DONE/910_My_LIB/910_FPGA_LIB/Script/03_CMD/FPGA_script/fpga_script.py'
#quartus_path  = r'C:/altera/15.1/quartus/bin64/quartus_sh.exe'
#vivado_path   = r'C:/Xilinx/Vivado/2016.4/bin/vivado'
vivado_path   = r'/opt/Xilinx/Vivado/2018.3/bin/vivado'

#设置工程类型
project_type =r'vivado'
family   = r'Z7'
device   = r'xc7z010clg400-2'
prj_name = r'01_led'
prj_top  = r'S9_top'
filelist = r'../src/filelist.f'
############################################
#######          附加选项         ##########
engui = r'n'                        # 禁止使用gui选择vivado工程目录 #Forbidden to select vivado project directory using GUI
script2workrelpath = r'../../work'  # 设置脚本到FPGA工程的文件夹的相对路径    #Set the relative path of the script to the vivado project folder
program_file_path =r'../../program_debug_file' #设置自动生成烧录文件的输出路径，脚本路径到生成烧录文件夹的相对路径


if project_type == 'vivado' :
    eda_path = vivado_path
    proj_type = '1'
elif project_type == 'quartus' :
    eda_path = quartus_path
    proj_type = '2'
else :
    print('工程类型设置错误！！！！')
    input('Press any key to exit...')
    exit()


cmd = 'python ' + python_script
cmd += ' --eda_path ' + eda_path
cmd += ' --family ' + family
cmd += ' --device ' + device
cmd += ' --prj_name ' + prj_name
cmd += ' --prj_top ' + prj_top
cmd += ' --filelist ' + filelist
cmd += ' --proj_type ' + proj_type
cmd += ' --script2workrelpath ' + script2workrelpath
cmd += ' --program_file_path ' + program_file_path
cmd += ' --engui ' + engui

os.system(cmd)


#################################
## vivado 工程参数设置示例
################################
#   project_type =r'vivado'
#   family   = r'K7'
#   device   = r'xc7k325tffg900-2'
#   prj_name = r'test'
#   prj_top  = r'fpga_top'
#   filelist = r'../src/filelist.f'
#
################################
## quartus 工程参数设置示例
################################
#
#   project_type =r'quartus'
#   family   = r'Stratix_IV'
#   device   = r'EP4SGX230KF40I4'
#   prj_name = r'test'
#   prj_top  = r'CX_KZB_GX230_SXKZ_TOP'
#   filelist = r'../src/filelist.f'




