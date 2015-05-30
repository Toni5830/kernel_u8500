all: boot.cpio recovery.cpio
clean:
	rm *.cpio

boot.cpio: boot/*
	cd boot && find . | grep -e ".git" -v | grep -e "[~]$$" -v | cpio -o -H newc > ../boot.cpio

recovery.cpio: recovery/*
	cd recovery && find . | grep -e ".git" -v | grep -e "[~]$$" -v | cpio -o -H newc > ../recovery.cpio
