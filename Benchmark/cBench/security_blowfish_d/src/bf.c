#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "blowfish.h"

int
main(int argc, char *argv[])
{
	BF_KEY key;
	unsigned char ukey[32]; /* FGG changed mistake */
	unsigned char indata[40], outdata[40], ivec[32]={0}; /* FGG changed mistake */
	int num=0; /* FGG changed mistake */
	int by=0,i=0;
	int encordec=-1;
	char *cp,ch;
	FILE *fp,*fp2;

        FILE* loop_wrap=NULL;
        long loop_wrap1, loop_wrap2;

if (argc<3)
{
	fprintf(stderr, "Usage: blowfish {e|d} <intput> <output> key\n");
	exit(EXIT_FAILURE);
}

if (*argv[1]=='e' || *argv[1]=='E')
	encordec = 1;
else if (*argv[1]=='d' || *argv[1]=='D')
	encordec = 0;
else
{
	fprintf(stderr, "Usage: blowfish {e|d} <intput> <output> key\n");
	exit(EXIT_FAILURE);
}
					

/* Read the key */
cp = argv[4];
while(i < 64 && *cp)    /* the maximum key length is 32 bytes and   */
{                       /* hence at most 64 hexadecimal digits      */
	ch = toupper(*cp++);            /* process a hexadecimal digit  */
	if(ch >= '0' && ch <= '9')
		by = (by << 4) + ch - '0';
	else if(ch >= 'A' && ch <= 'F')
		by = (by << 4) + ch - 'A' + 10;
	else                            /* error if not hexadecimal     */
	{
		printf("key must be in hexadecimal notation\n");
		exit(EXIT_FAILURE);
	}

	/* store a key byte for each pair of hexadecimal digits         */
	if(i++ & 1)
		ukey[i / 2 - 1] = by & 0xff;
}

BF_set_key(&key,8,ukey);

if(*cp)
{
	printf("Bad key value.\n");
	exit(EXIT_FAILURE);
}

if ((loop_wrap=fopen("_finfo_dataset","rt"))==NULL)
{
  fprintf(stderr,"\nError: Can't find dataset!\n");
  return 1;
}

fscanf(loop_wrap, "%ld", &loop_wrap2);
fclose(loop_wrap);
			  
/* open the input and output files */
if ((fp = fopen(argv[2],"r"))==0)
{
        fprintf(stderr, "Usage: blowfish {e|d} <intput> <output> key\n");
	exit(EXIT_FAILURE);
};
if ((fp2 = fopen(argv[3],"w"))==0)
{
        fprintf(stderr, "Usage: blowfish {e|d} <intput> <output> key\n");
	exit(EXIT_FAILURE);
};

i=0;
while(!feof(fp))
{
    int           current_num;
    unsigned char current_ivec[32];

	int j;
	while(!feof(fp) && i<40)
		indata[i++]=getc(fp);

    /* backup for multiple loop_wrap run */
    current_num = num;
    memcpy(current_ivec, ivec, 32);

for (loop_wrap1=0; loop_wrap1<loop_wrap2; loop_wrap1++) {
  /* The call to BF_cfb64_encrypt modifies ivec and num. We need to make a
     copy and to restore it before each iteration of the kernel to make sure
     we do not alter the output of the application. */
        num = current_num;
        memcpy(ivec, current_ivec, 32);
	BF_cfb64_encrypt(indata,outdata,i,&key,ivec,&num,encordec);
}

	for(j=0;j<i;j++)
	{
		/*printf("%c",outdata[j]);*/
		fputc(outdata[j],fp2);
	}
	i=0;
}

fclose(fp);
fclose(fp2);

return 0;
}



