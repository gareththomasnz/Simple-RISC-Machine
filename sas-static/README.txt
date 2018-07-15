Instructions for use:


1. Open a Windows command window in the directory 
   containing this file by pressing shift and right 
   clicking in Windows explorer, then selecting 
   “Open command window here”.  


7. To run assembler type "./sas.exe <filename>" 
   but replace "<filename>" with a .s file with a name 
   of your choice -- e.g. "./sas.exe test.s"


8. Copy the resulting <filename>.txt file to your 
   Verilog project directory (top level directory). 


9. Set your $readmemb file name to your .txt file. You 
   can do this by overriding the parameter filename in 
   the RAM module in the top-level module "top.v"
