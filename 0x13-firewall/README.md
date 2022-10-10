# Firewall

The objects of this project are:

- Understanding firewalls
- How to secure incoming and outgoing traffics using a firewall
- How to enable port forwarding of request/traffic using firewall
- Linux inbuilt firewall referred to as Uncomplicated Firewall `ufw`

## Tasks

### [0. Block all incoming traffic but](./0-block_all_incoming_traffic_but)
Install the ufw firewall and setup a few rules on web-01.

**Requirements:**
- The requirements below must be applied to web-01 (feel free to do it on lb-01 and web-02, but it won’t be checked)
- Configure ufw so that it blocks all incoming traffic, except the following TCP ports:
	- 22 (SSH)
	- 443 (HTTPS SSL)
	- 80 (HTTP)
- Share the ufw commands that you used in your answer file

### [100-port_forwarding](./100-port_forwarding)
Firewalls can not only filter requests, they can also forward them.

**Requirements:**
- Configure web-01 so that its firewall redirects port 8080/TCP to port 80/TCP.
- Your answer file should be a copy of the ufw configuration file that you modified to make this happen