# 🌐🚀 **Ultimate Tailscale & Netbird Setup in One Docker Container** 🐳✨

## 🎯 **What is this?** 🤔

This repository provides the **easiest** way to install **Tailscale** and **Netbird** in one go, inside a single Docker container. No need for separate setups! Everything is **automated** – run **one command** from your host machine, and you're good to go! 🎉

---

## 💡 **Why Should You Care?**

- 🛠️ **No Manual Installation**: Everything happens automatically inside the container. Just sit back and relax. 😎
- ⚙️ **Tailscale & Netbird in One**: Combines both tools in one container for a powerful networking solution! 💥
- 🚀 **Quick Setup**: All done in **2-5 minutes**, depending on your internet speed.
- 🌍 **Exit Nodes & LAN Access**: Configure exit nodes and access your devices easily across the network! 🚪

---

## 📋 **Prerequisites**

- 🐳 **Docker**: You must have Docker installed on your host machine. [Get it here!](https://docs.docker.com/get-docker/)

---

## 🚀 **How to Install** (Super Simple! 🤩)

Copy and paste this magical command to create the network and run the container:

```bash
docker network create ubuntu-tailscale-netbird && \
docker run -d --name ubuntu-tailscale-netbird --network ubuntu-tailscale-netbird \
--privileged --device /dev/net/tun:/dev/net/tun \
--env PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--tty --interactive zahirrayhanjhon/ubuntu-tailscale-netbird:latest
```
## 🛠️ **This Command Will Do the Following**:

- 🎯 **Create a Docker network** called `ubuntu-tailscale-netbird`
- 🐳 **Run a Docker container** with full access to install and run both **Tailscale** and **Netbird**

---

## 🧑‍💻 **How to Use** (It's Game Time! 🎮)

1. **Access the Container**:

   After running the above command, enter the container with:

```bash
docker exec -it ubuntu-tailscale-netbird /bin/bash
```
## ⏳ **Wait for Setup**:
Once inside the container, **wait for 2-5 minutes** depending on your network speed. The **latest versions** of **Tailscale** and **Netbird** will be installed automatically. 🚀

---

## 🚀 **Start Tailscale & Netbird**:
After everything is set up, run the following commands to bring both networking tools online:

```bash
tailscale up
```
```bash
netbird up
```
If shows **not found** please wait for one minuite and try again . 
You will receive an authorization link for both. Simply open them in your browser and authenticate. ✅

BOOM! You're ready to go! 🎉

## 🌍 Advertise Exit Nodes & Routes 🚪

Want to advertise the container as an exit node for Tailscale? Here’s how:

### For Two Routes (example):

```bash
sudo tailscale up --advertise-exit-node --accept-routes --advertise-routes=192.168.31.0/24,192.168.31.108/32
```
Change **192.168.31.0/24,192.168.31.108/32** with your own routes.

### For One Route:
```bash
sudo tailscale up --advertise-exit-node --accept-routes --advertise-routes=192.168.31.0/24
```
Change **192.168.31.0/24** with your own routes. 
You can find your route from **home lan network** getway -- my getway is **192.168.31.1**

These routes allow you to access all LAN devices seamlessly through Tailscale!

## 🧹 **How to Remove** 🗑️  
When you're done and want to remove the container and the network, use this command:
```bash
docker stop ubuntu-tailscale-netbird && docker rm ubuntu-tailscale-netbird && \
docker network rm ubuntu-tailscale-netbird
```

## 👥 **Contributions Welcome** 💡  
Feel free to open issues or submit pull requests if you have suggestions or find bugs. Let's build something awesome together! 🙌


## 🎉 Now Go Enjoy Your Super-Easy Tailscale & Netbird Setup! 🌍🚀🎮
 
 
 
🚀 **For anyone interested in running additional applications and services as this is Ubuntu 24.04, you can install anything** 🐧, please locate the entry point file at **`/usr/local/bin/entrypoint.sh`**! 📂✨ If you wish to add any service to start on boot, you can easily do so by editing the **`entrypoint.sh`** file. 🛠️💻 Simply install nano and use the command: **`nano /usr/local/bin/entrypoint.sh`** to open the file in a text editor. ✍️📝 After adding your desired commands(you want to run on boot), remember to save your changes and ensure the script is executable! 🔒⚙️ You can set the correct permissions using **`chmod +x /usr/local/bin/entrypoint.sh`**. Now your services will automatically start on boot! 🔄🔥 Happy coding and enjoy customizing your Ubuntu experience! 👨‍💻

