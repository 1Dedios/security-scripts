#!/bin/env bash

echo -e '\n######## - File Encrypter/Decrypter Program - ########'
echo -e '\nChoose your desired action: '
echo -e '\n1. Encrypt\n2. Decrypt\n'
read CHOICE

if [[ "$CHOICE" -eq 1 ]]; 
then
	echo -e '\nEncryption has been chosen'
	echo -e '\nEnter file name you would like to encrypt: '
	read FILENAME

	echo -e '\nCommencing encryption...'
	
	gpg -c $(find ./ -name "$FILENAME" 2> /dev/null)

	echo -e "\nFile - "$FILENAME" - has been encrypted"
	exit 0

elif [[ "$CHOICE" -eq 2 ]]; 
then	
	echo -e '\nDecryption has been chosen'
	echo -e '\nEnter file name you would like to decrypt: '
	read FILENAME
	
	echo -e '\nWould you like to change the filename of the newly decrypted file?'
	echo -e '\ny/n?'
	read FILENAME_CHANGE

	if [[ "$FILENAME_CHANGE" == 'y' ]];
	then
		echo -e '\nEnter new file name: '
		read NEWFILE_NAME
				
		echo -e '\nCommencing decryption...'	

		gpg -o "$NEWFILE_NAME" -d $(find ./ -name "$FILENAME" 2> /dev/null)

		echo -e "\nCheck file - $NEWFILE_NAME for the decrypted message."
		echo -e "\nFile - "$FILENAME" - has been decrypted"
		exit 0

	else
		echo -e '\nCommencing decryption...'	
		echo "The decrypted message is: "
		echo -e "\n"

		gpg -d $(find ./ -name "$FILENAME" 2> /dev/null)

		echo -e "\nFile - "$FILENAME" - has been decrypted"
		exit 0
	fi
	
elif [[ "$CHOICE" -ne 1 && "$CHOICE" -ne 2 ]];
then

	echo -e "\nYou've entered an invalid option."
	echo "The only acceptable options are 1 for Encryption or 2 for Decryption."	
	exit 1
fi
