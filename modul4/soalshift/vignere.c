#include<stdio.h>
#include<string.h>
#include<stdlib.h>

//ini masukin ke variable global aja
char KEY [] = "SISOP";

char *encrypt_vignere(char *str){
    int i,j;
    int msgLen = strlen(str);
    int keyLen = strlen(KEY);
    char newKey[msgLen];
    char *encryptedMsg = malloc(msgLen);

    if(!strcmp(str,".") || !strcmp(str,"..")) return str;
    //generating new key
    for(i = 0, j = 0; i < msgLen; ++i, ++j){
        if(j == keyLen)
            j = 0;
 
        newKey[i] = KEY[j];
    }
 
    newKey[i] = '\0';

    //encryption
    for(i = 0; i < msgLen; ++i){
        if(str[i]=='.')
        {
            break;
        }
        encryptedMsg[i] = ((str[i] + newKey[i]) % 26) + 'A';
    }

    while (str[i] != '\0'){
	    encryptedMsg[i] = str[i];
    	i++;
    }

    encryptedMsg[i] = '\0';

    return encryptedMsg;

}

char *decrypt_vignere(char *str){
    int i,j;
    int msgLen = strlen(str);
    int keyLen = strlen(KEY);
    char newKey[msgLen];
    char *decryptedMsg= malloc(msgLen); 

    if(!strcmp(str,".") || !strcmp(str,"..")) return str;
    
    //generating new key
    for(i = 0, j = 0; i < msgLen; ++i, ++j){
        if(j == keyLen)
            j = 0;
 
        newKey[i] = KEY[j];
    }
 
    newKey[i] = '\0';

    //decryption
    for(i = 0; i < msgLen; ++i){
        if(str[i]=='.')
        {
            break;
        }
        decryptedMsg[i] = (((str[i] - newKey[i]) + 26) % 26) + 'A';
    }

    while (str[i] != '\0'){
	    decryptedMsg[i] = str[i];
    	i++;
    }
    decryptedMsg[i] = '\0';

    return decryptedMsg;

}


int main(){
    char *msg = "THECRAZYPROGRAMMER.jpg";
    printf("%s\n", encrypt_vignere(msg));
    printf("%s\n", decrypt_vignere(msg));
}