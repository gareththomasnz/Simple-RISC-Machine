How to use the Simple RISC Machine Assembler:


1. Install Cygwin by following the "cygwinlab7.pdf"


2. Run Cygwin. If installed correctly, a UNIX style 
   command line environment or terminal will open up.
   The rest of the commands should be typed in the 
   Cygwin terminal.  This step will create the 
   directory you need to copy files to in Step 3.


   "My favorite student feedback of all time was one
   around 2007 complaining that the "instructor makes 
   students use stone age tools!"  You may soon
   sympathize with this person -- should you? 

   Command line environments and UNIX are *cool*. 
   Don't let *anyone* suggest to you Windows is all 
   that Electrical/Computer Engineers need to know.
   Would you hire a photographer that uses a smartphone 
   to take pictures for a family event such as a 
   wedding and pay them $1000? Not likely.  For that 
   kind of money you expect them to use a "real" camera.
   If you want to earn the big bucks, learn to use 
   professional tools."
   
   - CPEN 211 Professor Tor Aamodt


3. Copy the folder "sas" and paste it to 
   C:\cygwin64\home\<username> where <username> is your 
   Windows username. This directory should already 
   exist.  If you installed the 32-bit version of Cygwin 
   it will be C:\cygwin\home\<username>.


4. Type "cd sas".


5. Type "ls" and you should see the following:

    $ ls
    makefile  README.txt  sas.cpp  sas.exe  sas.h  sas.l  sas.y  test.lst  test.s  test.txt


6. [Optional if using 64-bit Cygwin] Type "make" to 
   build assembler.  You should see:

    $ make
    yacc -d -t sas.y
    flex  sas.l
    make: Warning: File 'y.tab.c' has modification time 0.12 s in the future
    g++ -Wno-write-strings -g  sas.cpp y.tab.c lex.yy.c -lfl -lm -o sas
    make: warning:  Clock skew detected.  Your build may be incomplete.

   You may or may not see the "Warning" messages above. 
   If you get *errors* this means you likely did not 
   install all the components of Cygwin specified in 
   the install handout.


7. To run assembler type "./sas.exe <filename>" 
   but replace "<filename>" with a .s file with a name 
   of your choice -- e.g. "./sas.exe test.s"


8. Copy the resulting <filename>.txt file to your 
   Verilog project directory (top level directory). 


9. Set your $readmemb file name to your .txt file. You 
   can do this by overriding the parameter filename in 
   the RAM module in the top-level module "top.v"
