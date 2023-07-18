# Raspberry Pi with Pi-hole

Install Raspberry Pi with Pi-hole in Docker.

## Install OS


## Establish SSH Connection

Open MS Terminal and type

```
ssh pi@picloud
```

If this does not work, look for the Raspberry Pi IP within your router under network information.

## Install Samba, Docker, Pi-hole

```
sudo apt-get install -y git
```
```
git clone https://github.com/neko-js/rpihole.git
```
```
cd rpihole
```
```
sudo bash ./install.sh
```
You have to type your password during installation once and retype it again.

## Post Installation Steps

You must set the DNS on your devices to the IP address of the Raspberry Pi.

You will be able to access Pi-hole under the displayed address or under http://picloud.local/admin

## Home Folder Access

You can also access the home folder within your network. The network connection is:
```
\\picloud\picloud-home
```
E.g. go to "This PC" on MS Windows and right click anywhere to create a network connection with this connection.
