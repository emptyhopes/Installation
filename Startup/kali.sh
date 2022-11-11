#! /bin/bash

sudo apt-get update --yes

sudo apt-get install kali-desktop-core gdm3 gnome-session gnome-shell gnome-shell-extensions gnome-shell-extension-appindicator gnome-shell-extension-dashtodock gnome-shell-extension-desktop-icons-ng gnome-terminal gnome-tweaks nautilus gnome-text-editor gnome-calculator gnome-bluetooth --yes
sudo apt-get install curl fonts-firacode --yes

sudo apt-get purge --autoremove kali-desktop-xfce xfce4 xfce4-* lightdm kali-tools-top10 --yes
sudo apt-get purge --autoremove qterminal qterminal-* cherrytree bully bulk-extractor aircrack-ng arping arp-scan cewl chntpw cherrytree commix crunch clang clang-* dmitry dirb dirbuster dns2tcp dnschef dnsenum enum4linux evil-winrm crackmapexec dbd dnsrecon exe2hexbat faraday faraday-* ffuf fierce fping gparted gparted-* hydra hydra-* hashdeep sbd samdump2 rsmangler responder responder recon-ng recordmydesktop rebind radare2 pwnat ptunnel tcpreplay sslh sslscan sslsplit sslyze swaks theharvester weevely wfuzz whatweb wireshark wireshark-* wordlists binwalk autopsy davtest cutycapt cadaver guymager hashid laudanum lbd macchanger king-phisher kismet minicom mimikatz miredo mitmproxy wpscan voiphopper wafw00f wpscan udptunnel thc-* stunnel4 ssldump sqlmap sqlitebrowser spooftooph spike spiderfoot snmpcheck smbmap skipfish hping3 hash-identifier ike-scan iodine msfpc nasm nbtscan ncrack netdiscover netmask netsniff-ng nikto nmap onboard onboard-* onesixtyone ophcrack ophcrack-* patator pdfid pdf-parser pipal pixiewps powershell powershell-empire powersploit proxychains4 proxytunnel scalpel pulseaudio-utils pulseaudio pulseaudio-module-bluetooth scrounge-ntfs atril atril-common john john-* masscan magicrescue unix-privesc-check yelp yelp-xsl sleuthkit --yes

sudo service gdm3 start
