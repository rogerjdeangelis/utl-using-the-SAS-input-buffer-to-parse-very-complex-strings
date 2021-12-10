%let pgm=utl-using-the-SAS-input-buffer-to-parse-very-complex-strings;

Using the SAS input buffer to parse very complex strings

Github
https://tinyurl.com/2kfpvpe3
https://github.com/rogerjdeangelis/utl-using-the-SAS-input-buffer-to-parse-very-complex-strings

SAS Forum
https://tinyurl.com/572wdzp7
https://communities.sas.com/t5/SAS-Programming/Using-a-delimiter-to-parse-the-string-into-a-new-variable-but/m-p/785380

One of the most poerfull features of SAS is the input buffer an sas options relating to the in put buffer.
ie @, @@, @n, @'txt', @var, delimiter, dsd, delimeter, +n, -n, #(expression), format, informat, _infile_, _file_ ...

Years ago Ian Whitlock turned me on to this.

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

filename tmp temp lrecl=500;

data _null_;

   file tmp;

   REFMATS= compbl('[Type:ADRG, URL :, Version : , Status : , Date : Notes :,[Type:P21 Report, URL :, Version : , Status :
 , Date : Notes :,[Type:eSub Source Data Location, URL :, Version : , Status : , Date :
   Notes :,[Type:eSub Data Package Location, URL :, Version : , Status : , Date : Notes :');

  put refmats;

  putlog refmats=;

run;quit;

LOG total obs=1 10DEC2021:06:43:47

REFMATS=[Type:ADRG, URL :, Version : , Status : , Date : Notes :,[Type:P21 Report, URL :, Version : ,
Status : , Date : Notes :,[Type:eSub Source Data Location, URL :, Ver
sion : , Status : , Date : Notes :,[Type:eSub Data Package Location, URL :, Version : , Status : , Date : Notes :


/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/


Up to 40 obs WORK.WANT total obs=4 10DEC2021:06:49:49

Obs                                         WORD

 1     Type:ADRG, URL :, Version : , Status : , Date : Notes :,
 2     Type:P21 Report, URL :, Version : , Status : , Date : Notes :,
 3     Type:eSub Source Data Location, URL :, Version : , Status : , Date :   Notes :,
 4     Type:eSub Data Package Location, URL :, Version : , Status : , Date : Notes :

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


data want;
  length word $200.;
  infile tmp delimiter='[';
  input word @@;
  output;
run;quit;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
