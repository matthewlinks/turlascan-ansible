turlascan-ansible
=================

a simple proof-of-concept for using ansible to scan using yara for signature like those proposed for turla

Primary references for this

http://arstechnica.com/security/2014/12/powerful-highly-stealthy-linux-trojan-may-have-infected-victims-for-years/
https://securelist.com/blog/research/67962/the-penquin-turla-2/

There are no claims made about whether this is suitable for detecting any forms of the turla on a Linux system. Rather this is a proof-of-principle that shows how Ansible could be used to do such a thing. 

If you are looking to adapt this for use you will need to ensure that you have 
- Ansible
- SSH access to your hosts 
- sudo access is required (only because the example is placing the example files in /root/yara-turla)

Setting up Ansible, SSH and sudo access is an exercise left to the reader. 

As with most Ansible usage you will need to define your inventory of hosts (TurlaHosts below).

Once your inventory is configured you might check that the syntax is ok 

	ansible-playbook -i TurlaHosts turla.yml --syntax-check

Then you might confirm what the tasks that will be run are

	ansible-playbook -i TurlaHosts turla.yml --list-tasks

And if you are sure that you want to run this then you could try 

	ansible-playbook -i TurlaHosts turla.yml

Control of whether the test scan will report a positive / negative detection is determined by the scan play in

	roles/turla-rhel/handlers/main.yml

You should be able to swap out the comments to elicit the positive / negative scanning results. Note that you should remove the /root/yara-turla directory when you want to switch the test case as the notifications are based on the presence of that directory. 

cheers
