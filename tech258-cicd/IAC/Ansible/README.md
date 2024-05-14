# Ansible architecture on Ansible controller & Agent node/s 


![](renamed.jpg)

* Ansible is an open-source automation tool used for configuration management, application deployment, and task automation. Its architecture is relatively straightforward:

**What is Ansible's architecture?**
*Ansible's architecture is a system designed for automation, primarily used for configuration management, application deployment, and task automation in IT environments.

**Where does Ansible operate?**
* Ansible operates on a controller node, which is typically a machine where Ansible is installed and from where tasks and playbooks are executed. It interacts with managed nodes, which are the machines or devices that Ansible manages and automates tasks on.

**How does Ansible work?**
* Ansible works by executing tasks and playbooks defined in YAML format on managed nodes via SSH connections. It communicates with the managed nodes to gather information using facts and then executes tasks using modules, which are standalone scripts.

**Why use Ansible's architecture?**
Ansible's architecture provides a simple, agentless, and efficient way to automate IT tasks. It allows for easy scaling, configuration management, and deployment across diverse environments. By using Ansible, organizations can streamline operations, improve consistency, and reduce manual intervention, leading to increased productivity and reliability in IT infrastructure management.




# Configurating managment using Ansible!

![](inside_ansible.png)


1. **Create 3 instances on AWS** You need an instance for you ```app```, your ```databse``` and ```controller```,

2. **SSH into all three instaces and add the following commands** : 

```sudo apt update```
```sudo apt upgrade```

3. **Now add the following commands to the controller instance** 

```sudo apt-get install software-properties-common```
```sudo apt-add-repository ppa:ansible/ansible```
```sudo apt-get install ansible```

 4.  **Now you have isntalled it** make sure to ``cd`` into ansible directory and then the follwoing command ```sudo nano hosts```

5. **This is where we are going to put the public ip adresses of both our app instnace and our db instance** so add the following to this file : 
```
   [app]
 
3.255.104.195 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/tech258.pem
 
[db]
 
3.255.112.50 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/tech258.pem

```

6. **Now run the command** 👍

```
sudo ansible web -m ping
```

* You should see both your app instance and db instance responding to the ping with pong

7. 

