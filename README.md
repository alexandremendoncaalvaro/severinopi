# Severino Pi

![Severino Pi](readme_images/severinopi.jpg)

Easy setup access control with face recognition for Raspberry Pi.

* MIT License
* LGPDP Brasil Safe (Lei Geral de Proteção de Dados Pessoais)

## Background

It´s a Raspberry Pi port and refactoring from my [Face Access project](https://github.com/alexandremendoncaalvaro/face-access).  
This project is for Makers! People that love the concept of DIY (Do It Yourself). The idea is making a very easy option to put access control with face recognition at your door.  

You can use it private, modify, distribute and even sell.  
Feel free to make a fork and contribute with the project upgrade and maintenance.
It´s MIT License. A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.

So.. Don´t worry, be happy!

## Recomended requirements

### Hardware

* Raspberry Pi 3B+ or above
* Compatible class 10 [SD Card](https://www.raspberrypi.org/documentation/installation/sd-cards.md) with 16GB or above
* Raspberry Pi Camera or USB Webcam
* Raspberry Pi LCD Screen (optional)
* Raspberry Pi official font or USB Charger (at least 3A current) and USB Type-A to micro-USB cable (the most common found on smartphones)
* Monitor *
* HDMI cable *

>*At least for the configuration process

### Raspberry Pi software

* Raspbian Buster or above
* Python 3.6 or above
* Pipenv
* Cmake

### Do I need an extra computer or just the Raspberry Pi?

Short answer: Yes, you will do.  
First, to configure Raspbian in Raspberry Pi.  
After that, you will install your hardware in some infrastructure and it's a terrible idea to remove it every time to do configuration changes.
So, it´s not absolutely necessary, but I strongly recommend that you use an extra computer to handle Raspberry Pi remotely.

### Computer Software

* Windows, Linux or Mac OS
* Supported [SSH Client](https://code.visualstudio.com/docs/remote/troubleshooting#_installing-a-supported-ssh-client)
* [VSCode](https://code.visualstudio.com/download)
  * The fantastic plugin: [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)

## Install

### Raspbian

![rasp](readme_images/pc.png)  
Use Raspberry Pi Imager for an easy way to install Raspbian and other operating systems to an SD card ready to use with your Raspberry Pi:

* [Raspberry Pi Imager for Windows](https://downloads.raspberrypi.org/imager/imager.exe)
* [Raspberry Pi Imager for macOS](https://downloads.raspberrypi.org/imager/imager.dmg)
* [Raspberry Pi Imager for Ubuntu](https://downloads.raspberrypi.org/imager/imager_amd64.deb)

Connect an SD card reader with the SD card inside.  
Open Raspberry Pi Imager and choose the required OS from the list presented.  
Choose the SD card you wish to write your image to.  
Review your selections and click 'WRITE' to begin writing data to the SD card.  
>Note: if using the Raspberry Pi Imager on Windows 10 with Controlled Folder Access enabled, you will need to explicitly allow the Raspberry Pi Imager permission to write the SD card. If this is not done, the Raspberry Pi Imager will fail with a "failed to write" error.

![rasp](readme_images/rasp.png)  
Connect the Raspberry Pi to the monitor using the HDMI cable.
Insert the SD card into the Raspberry Pi and power it up with the micro-USB input.
If you need to manually log in, the default user name is **pi**, with password **raspberry**. Remember the default keyboard layout is set to UK.
You should change the default password straight away to ensure your Raspberry Pi is secure.
Follow the steps on the screen to configure Raspberry Pi for the first use.  
It´s important to configure Wifi or Ethernet in the same network of your computer.

>Alternative: Install using NOOBS by follow this [video tutorial](https://www.youtube.com/watch?v=jsi50bCo_W4)

#### Remote controll with SSH

On your Raspberry Pi, choose Menu > Preferences > Raspberry Pi Configuration. Click on Interfaces and set SSH to Enabled. Click OK. You don’t need to restart your Raspberry Pi, and SSH will be enabled whenever you use that installation of Raspbian from that point on.  
![SSH](https://images.ctfassets.net/tvfg2m04ppj4/4owZNQS99yKFHzxClG7PnA/aa405e22555866c62395c1d6daa4f7b8/SSH.jpg?w=800)
>more about SSH on Raspberry at [Magpi](https://magpi.raspberrypi.org/articles/ssh-remote-control-raspberry-pi)

Now you can do everything from your computer command line interface!

> Extra tip: You can tranfer files using the SCP command like this example ([more details here](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files)):  

```bash
scp file.txt remote_username@10.10.0.2:/remote/directory
```

### Integrated Development Enviroment (IDE)

Please check carefully and install the [Computer Software recomended requirements](#computer-software) above.

## Are you a native english speaker?

No, I am not. If you find typos, grammar errors or whatever please feel free to PR or tell me.
