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
* Raspberry Pi Camera Module ¹
* Raspberry Pi LCD Screen (optional)
* Raspberry Pi official font or USB Charger (at least 3A current) and USB Type-A to micro-USB cable (the most common found on smartphones)
* Monitor ²
* HDMI cable ²
* Solenoid Door lock
* 5V Relay module
* 12VDC Power source

>¹Unlike USB webcam, the Camera module is connected directly to the GPU  
²At least for the configuration process

### Raspberry Pi software

* Raspbian Buster or above
* Python 3.6 or above

### Do I need an extra computer or just the Raspberry Pi?

Short answer: Yes, you will do.  
First, to configure Raspbian in Raspberry Pi.  
After that, you will install your hardware in some infrastructure and it's a terrible idea to remove it every time to do configuration changes.
So, it´s not absolutely necessary, but I strongly recommend that you use an extra computer to handle Raspberry Pi remotely.

### Computer Software

* Windows, Linux or Mac OS
* Supported [SSH Client](https://code.visualstudio.com/docs/remote/troubleshooting#_installing-a-supported-ssh-client)
* [VS Code](https://code.visualstudio.com/download)
  * The fantastic plugin: [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)

## Install

On Raspberry Pi connect only the camera module.  
![rasp camera](readme_images/connect-camera.gif)

### Raspbian

![pc](readme_images/pc.png)  
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

>Alternative: Install using NOOBS by following this [video tutorial](https://www.youtube.com/watch?v=jsi50bCo_W4)

#### Remote control with SSH and Raspberry Pi Camera Enable

On your Raspberry Pi, choose Menu > Preferences > Raspberry Pi Configuration.  
Click on Interfaces and set Camera and SSH to Enabled. Click OK. You don’t need to restart your Raspberry Pi, and SSH will be enabled whenever you use that installation of Raspbian from that point on.

![menu](readme_images/pi-configuration-menu.png)
![SSH](readme_images/ssh.jpg)
>more about SSH on Raspberry at [Magpi](https://magpi.raspberrypi.org/articles/ssh-remote-control-raspberry-pi)

Press Ctrl + Shift + T to open the Terminal and use the command bellow to check Raspberry Pi IP address:

```bash
ip a
```

In my case its connected by Wifi, and returns:

![SSH](readme_images/ip.jpg)

>Take note of the address of your connected interface.

Now you can do everything from your computer command line interface!

> Extra tip: You can tranfer files using the SCP command like this example, replacing parameters as appropriate ([more details here](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files)):  

```bash
scp file.txt pi@192.168.0.42:/remote/directory
```

### Integrated Development Enviroment (IDE)

![pc](readme_images/pc.png)  
Please check carefully and install the [Computer Software recomended requirements](#computer-software) above.

#### In VS Code

Open a new terminal and verify you can connect to the SSH host by running the following command replacing IP address as appropriate:

```bash
ssh pi@192.168.0.42
```

Select Remote-SSH: Connect to Host... from the Command Palette (F1) and use the same pi@ipaddress as in last step.

![ssh-user@box](https://code.visualstudio.com/assets/docs/remote/ssh/ssh-user@box.png)

After a moment, VS Code will connect to the SSH server and set itself up.  
After you are connected, you'll be in an empty window. You can always refer to the Status bar to see which host you are connected to.

![ssh-statusbar](https://code.visualstudio.com/assets/docs/remote/ssh/ssh-statusbar.png)

You can then open any folder or workspace on the remote machine using File > Open... or File > Open Workspace... just as you would locally!

![ssh-open-folder](https://code.visualstudio.com/assets/docs/remote/ssh/ssh-open-folder.png)  

Open the VS Code Terminal and run each following command:

```bash
sudo apt update && sudo apt upgrade
```

```bash
sudo apt install git build-essential cmake python3 python3-pip libopenblas-dev liblapack-dev libatlas-base-dev libzbar-dev libzbar0 python3-dev python3-setuptools pipenv
```

```bash
git clone https://github.com/alexandremendoncaalvaro/severinopi.git ~/severinopi && cd ~/severinopi
```

```bash
pipenv install && pipenv shell
```

>Pipenv is a tool that aims to bring the best of all packaging worlds (bundler, composer, npm, cargo, yarn, etc.) to the Python world. It automatically creates and manages a virtualenv for your projects, as well as adds/removes packages from your Pipfile as you install/uninstall packages. It also generates the ever-important Pipfile.lock, which is used to produce deterministic builds.  
To know more access: https://github.com/pypa/pipenv



## Are you a native english speaker?

No, I am not. If you find typos, grammar errors or whatever please feel free to PR or tell me.
