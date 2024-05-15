# Ansible architecture on Ansible controller & Agent node/s 

![](renamed.jpg)

Ansible is an open-source automation tool used for configuration management, application deployment, and task automation. Its architecture is relatively straightforward:

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


1. **Create 3 instances on AWS** You need an instance for you ```app```, your ```database``` and ```controller```,

2. **SSH manually into all three instaces and add the following commands** : 

```sudo apt update```
```sudo apt upgrade```

3. **Now add the following commands to the controller instance** 

```sudo apt-get install software-properties-common```
```sudo apt-add-repository ppa:ansible/ansible```
```sudo apt-get update -y```
```sudo apt-get install ansible -y```
```sudo apt-get install ansible```

4.**Ansible is found in** ```/ect/ansible``` directory.

5. **To check what version you have of ansible** try the following command ```ansible --version```

6. **Now we need to check the controller has access to our app instance and db instance** we can use the module ping from ansible to check 
```sudo ansible -m ping app```

7. **Now you have isntalled it** make sure to ``cd`` into ansible directory and then the following command ```sudo nano hosts```

8. **This is where we are going to put the public ip adresses of both our app instnace and our db instance** so add the following to this file : 
```
   [app]
 
3.255.104.195 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/tech258.pem
 
[db]
 
3.255.112.50 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/tech258.pem

```

![](img_1.png)

9. **We need to now scp our private key from local host to contoller** with the following command 
```scp -i ~/.ssh/tech258.pem ~/.ssh/tech258.pem ubuntu@ip:~/.ssh/```


10. **Then run sudo chmod 400 key_name to make it read only by owner** (necessary step otherwise key could become invalidated)
   

11. **Now run the command** 

```
sudo ansible web -m ping
```

  You should see both your app instance and db instance responding to the ping with pong.

![](image-4.png)

***************

## Adhoc commands 

* We can now run Linux commands from the controller without ansible being installed on the agent(it is agentless) using the following command
```sudo ansible app -a "[command]"```

* You can run a command on all devices with all ```sudo ansible all -a "uname -a"```

* To copy a file from the controller to all agents: ```sudo ansible all -i hosts -m copy -a "src=/home/ubuntu/testing-controller.txt dest=/home/ubuntu/testing-controller.txt```

* You can check this command went through with ```sudo ansible all -a "ls"```

![](image-5.png)


**********************************************************


