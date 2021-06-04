#include<stdio.h>
#include<string.h>
#include<stdlib.h>


char *rot13(char *str)
{
    int i =0;
    if(str == NULL){
      return NULL;
    }
    if(!strcmp(str,".") || !strcmp(str,"..")) return str;
    
    char* result = malloc(strlen(str));
    strcpy(result, str);
    if(result != NULL){      
        while(str[i] != '\0'){
            if(str[i] =='.')
            {
                break;
            }
            //Only increment alphabet characters
            if((str[i] >= 97 && str[i] <= 122) || (str[i] >= 65 && str[i] <= 90)){
                if(str[i] > 109 || (str[i] > 77 && str[i] < 91)){
                    //Characters that wrap around to the start of the alphabet
                    result[i] -= 13;
                }else{
                    //Characters that can be safely incremented
                    result[i] += 13;
                }
            }
            i++;
        }
        while (str[i] != '\0'){
            result[i] = str[i];
            i++;
        }
    }
    result[i] = '\0';
    return result;
}

int main(){
    char *msg = "aha.jpg";
    printf("%s\n", rot13(msg));
}