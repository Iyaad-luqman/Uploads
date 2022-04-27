import os
digit = input('Enter the last 2 digit of the ip addres >>')
f = open("/etc/netplan/00-installer-config.yaml", "w")
f.write(
'''
# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s5:
      dhcp4: no
      addresses:
        - 192.168.1.'''+ digit +'''/24
      gateway4: 192.168.1.1
      nameservers:
          addresses: [8.8.8.8, 1.1.1.1]
  version: 2

''')

f.close()
print('Ip address is succesfully changed, You may have to ssh again with the new IP')
os.system('sudo netplan apply')
