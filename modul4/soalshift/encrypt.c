#include<stdio.h>
#include<string.h>


void encrypt (char* str){
    int i=0;

    while(str[i]!='\0')
    {
        if(str[i]=='.')
        {
            break;
        }
        if(!((str[i]>=0&&str[i]<65)||(str[i]>90&&str[i]<97)||(str[i]>122&&str[i]<=127)))
        {
            if(str[i]>='A'&&str[i]<='Z')
                str[i] = 'Z'+'A'-str[i];
            //printf("%c",'Z'+'A'-str[i]);
            if(str[i]>='a'&&str[i]<='z')
                str[i] = 'z'+'a'-str[i];
            //printf("%c",'z'+'a'-str[i]);
        } 
            
        if(((str[i]>=0&&str[i]<65)||(str[i]>90&&str[i]<97)||(str[i]>122&&str[i]<=127)))
        {
            //printf("%c",str[i]);    
        }
            
        i++;
    }
  printf("\n");
}

int main()
{
    char str[1000] = "abcde/ABCDE.jpg";
    printf("Atbash Cipher code\n");
    encrypt(str);
    printf("%s\n", str);
}

