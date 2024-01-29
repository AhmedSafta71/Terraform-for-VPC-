## Introduction:

Terraform  is:

- IAAC  ⇒  automates infra
- Defines  the  infra state.  (  Terraform takes  the advantage  on   that  cause   other  config  management   tools like  ansible  &  chef &  puppet   automates  os related tasks  or state
- Terraform  has a DSL   ( Domain specific language) like   JSON
- the best  tool  to    keep the state and  automates the infra

## Exercice 1  : launch an  EC2  instance  with terraform

1. Write an  [instance.tf](http://instance.tf) file   (see code  )  
2. launch the EC2 instance 
3. make some changes  to [instance.tf](http://instance.tf)  file 
4. apply  the changes 

### Terraform commands

<aside>
📌 **terraform  init**

</aside>

- Command is used to **initialize a working directory that contains Terraform configuration files**.
- **Plugin installation to interract with  cloud providers  (aws,  Azure… )**
- Backend  config to  **store the state**  of the  infrastructure (creates the tfstate.
- **Download   modules** if the  config uses  modules

<aside>
📌 **terraform  validate**

</aside>

- validates  written code

<aside>
📌 **terraform fmt**

</aside>

- This command is used  to format code

<aside>
📌 **terraform  plan**

</aside>

- This command will give you a preview about what is going to happen if  you apply the  config

<aside>
📌 **terraform  destroy**

</aside>

- Destroys created infrastructure

# mention the  providers details like:
# Access keys and passswords


<aside>
📌 **NB**  : **Terraform maintains  the state in a file called  :  .tfstate  (automatically created)**

</aside>

## Exercice 2  : Add  variable files for dynamic and secret  parameters:

actions   that will be done are   :  

- write [providers.tf](http://providers.tf) file   (Holds the  )
- write  [vars.tf](http://vars.tf)  file   (Holds  the variables )
- write [instance.tf](http://instance.tf) file








## Exercice  3 : Provisionning

## Ecercice lesson

**(understand what is vault)  : open-source    cyber-Sec** 

**What is a provisioner ?** 

- A  provisioner is a  component that is used to perform actions on the managed   ressource 
after its creation   **(remote-exec  provisioners )**  or before  it’s creation    **( create  provisioners )**
- we distinguish three  types of  provisioners
    - **The file  prov:**  used to cop files  or directories
    - **remote-exec  prov**: invokes    a    command / scrit  on remote  ressource
    - **local-exec prov :**  invokes a  local executable after a ressource is  created (local  means from where  u are executing  terraform )
    - **Ansible ,puppet,chef**
    
    **Details ab  Puppet :**
    
    Puppet   installs  agent   on the  remote resource  and  supports   both ssh and winrm connections.
    
    **Details ab  Chef :**
    
    Chef  installs chef  client  on the  remote resource and  supports   both ssh and winrm connections.
    
    **Details ab Ansible:**
    

### Provisioner  connection  (we need at first to connect the  provisioner  )

**Types  of conection**

- **SSH**
- **winrm**

### Exercice 1 steps  :

1. Genrate key-pairs  
2. write script 
3. write [providers.tf](http://providers.tf) 
4. write [vars](http://vars.td).tf  
5. Write [instances.tf](http://instances.tf)  
    1. key_pair ressource   
    2. aws_instance ressource 
        1. provisioners  
            1. file 
            2. remote-exec 
            3. 
6. Apply changes  



## Exercice6 Terraform MultiSource   (about  VPC )

### Resources needed  in a VPC

1. aws_vpc
2. aws_subnet  (Specify    public and private  subnet) 
    - aws_subnet  is   associated  to a vpc ressource ( specify vpc id  )
3. aws_internet_gateway  (route  trafic to the  internet) 
4. **aws *route_table***    (to specify  routes )
    - A route table contains a set of rules (routes) that are used to determine where network traffic is directed
    - Routes  baically will route  trafic to a  gateway   (so we   have to specify the  gateway id ).
5. **aws_route_table_association** (associate a subnet with a specific   route  table   )
    - in  other ord each subnet in   the  VPC  should be associated with routing table  ⇒ we need 3 associations
6. aws_security_groups    
    - As a  best practice we metion security groups  in a  seperate  file (secgrp.tf   for example )