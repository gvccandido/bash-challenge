# Known Issues
* indent-host-file.pl detects the size of each field automatically and adjust to it. I did this because I found it more flexible to changes and also to adhere with the example given in the second task.

-----------

# Challenge:

:one: Using bash write a script to find and remove duplicated fake IP addresses lines of ["control_file.txt"](/control_file.txt) file and save the output at /tmp/output_1.txt

**Premisses:**

* The script must receive an argument to process, which is the file name (control_file.txt);
* Find duplicated fake IP addresses and keep just the first one. All other duplicated IP addresses must be removed;

**E.g:**
   
Using the lines below as example, the second one must be deleted:

```
540.300.759.124   lnx02csv lnx02csv.02csv.sps     pid=1  ia1=y domain=02csv        myid=2  wsm=PR wid=1 wst=NA,HI,CP,SC,DS # ADM
540.300.759.124   lnx02csv lnx02csv.02csv.sps     pid=1  ia1=y domain=02csv        myid=3  wsm=PR wid=1 wst=NA,HI,CP,SC,DS # ADM
```
The final expected result is:

```
540.300.759.124   lnx02csv lnx02csv.02csv.sps     pid=1  ia1=y domain=02csv        myid=2  wsm=PR wid=1 wst=NA,HI,CP,SC,DS # ADM
```

* All comment lines must be kept on the final output file.

-----------

:two: Using Perl write a script to indent the output file of the bash script (/tmp/output_1.txt) with 3 spaces between the columns except for the first and second columns which are IP address and hostname. For those you must use as much spaces as needed. The result must be saved at /tmp/output_2.txt.

**Premisses:**

* No tabs allowed;
* All comment lines must be kept on the final output file as well.

**E.g:**
   
After processing the final result must be:

``` 
#This is a comment and I need to be on the final file result! :)
a.b.c.d           eeeeeeee   ffffffff.ggggg.hhh   iii=A   jjj=k   llllll=BBmmm   nnnn=CC   ooo=pp   rrr=D   sss=tt,tt,tt,tt,tt,tt   #yyy
aa.bb.cc.dd       eeeeeeee   ffffffff.ggggg.hhh   iii=A   jjj=k   llllll=BBmmm   nnnn=CC   ooo=pp   rrr=D   sss=tt,tt,tt,tt,tt,tt   #yyy
aaa.bbb.ccc.ddd   eeeeeeee   ffffffff.ggggg.hhh   iii=A   jjj=k   llllll=BBmmm   nnnn=CC   ooo=pp   rrr=D   sss=tt,tt,tt,tt,tt,tt   #yyy
```

The scripts must be placed at a public GitHub repository and the link sent to [Andreas Kiefer](mailto:andreas.kiefer@siemens.com?subject=[Challenge]%20SysAdmin).

-----------

:warning: Note: as a suggestion you can commit your development files in a different branch than master and show us your git skills. **It is not mandatory, but it's a bonus.**
