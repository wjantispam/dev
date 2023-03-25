Normal Mode: "<Register Key>
Insert Mode: Ctrl+r <Register Key>


use + register to copy to other programs

FROM 
Description,Hostname,IPAddress,FQDN
"OCP Mastee Node 1",ocpmaster01,192.168.0.20,ocpmaster01.home.ca
"OCP Master Node 2",ocpmaster02,192.168.0.21,ocpmaster02.home.ca
"OCP Master Node 3",ocpmaster03,192.168.0.22,ocpmaster03.home.ca
"OCP Worker Node 1",ocpnode01,192.168.0.30,ocpnode01.home.ca
"OCP Worker Node 2",ocpnode02,192.168.0.31,ocpnode02.home.ca
"OCP Worker Node 3",ocpnode03,192.168.0.32,ocpnode03.home.ca
"Ansible Host 1",ansibleh01,192.168.0.144,ansibleh01.home.ca
"Ansible Host 2",ansibleh02,192.168.0.145,ansibleh02.home.ca

TO
192.168.0.20    ocpmaster01.home.ca    ocpmaster01    #OCP Master Node 1
192.168.0.21    ocpmaster02.home.ca    ocpmaster02    #OCP Master Node 2
192.168.0.22    ocpmaster03.home.ca    ocpmaster03    #OCP Master Node 3
192.168.0.30    ocpnode01.home.ca    ocpnode01    #OCP Worker Node 1
192.168.0.31    ocpnode02.home.ca    ocpnode02    #OCP Worker Node 2
192.168.0.32    ocpnode03.home.ca    ocpnode03    #OCP Worker Node 3
192.168.0.144    ansibleh01.home.ca    ansibleh01    #Ansible Host 1
192.168.0.145    ansibleh02.home.ca    ansibleh02    #Ansible Host 2



