## Secured and monitored web infrastructure

### Description:
This is a 3-server web infrastructure designed to be secure, monitored, and to serve encrypted traffic. It is built to protect against unauthorized access, ensure privacy through encryption, and continuously monitor the servers and network for performance and security.

![9ExiESl](https://github.com/Shannon-Kioko/alx-system_engineering-devops/assets/79745456/eb24648f-e5d3-4094-a5c6-ed419ad84ca1)

### Specifics About This Infrastructure:
#### The purpose of the firewalls:
The firewalls serve as a protective barrier for the network, particularly the web servers, by acting as intermediaries between the internal and external networks. They play a crucial role in blocking incoming traffic that matches criteria for being unwanted and unauthorized. This protection helps safeguard the network from potential threats and cyberattacks.

#### The purpose of the SSL certificate:
The SSL certificate is used for encrypting the traffic between the web servers and the external network. Its primary goal is to prevent man-in-the-middle attacks (MITM) and network sniffing. The SSL certificate ensures the privacy, integrity, and identification of data being transmitted. It guarantees that sensitive information remains confidential and secure during communication.

#### The purpose of the monitoring clients:
Monitoring clients are essential for keeping a close watch on the servers and the external network. They analyze server performance and operations, providing insights into the overall health of the infrastructure. These monitoring tools are designed to alert administrators if the servers are not performing as expected. They automatically test server accessibility, measure response times, and detect various issues, such as corrupt or missing files, security vulnerabilities, and other problems.

### Issues with this infrastructure:

1. Terminating SSL at the load balancer level: While the SSL termination at the load balancer level enhances security, it leaves the traffic between the load balancer and the web servers unencrypted. This can be a potential security concern if there is a need to secure the entire data path. Sensitive information may still be vulnerable in this segment of the network.
2. Single MySQL server: The infrastructure's reliance on a single MySQL server is problematic in terms of scalability and fault tolerance. It acts as a single point of failure, meaning that if the MySQL server goes down, the web infrastructure could become inaccessible. To address this issue, a more robust and scalable database setup is needed.
3. Uniform servers: All the servers in this infrastructure have the same components, which can result in resource contention (CPU, memory, I/O, etc.). This contention can lead to poor performance and make it challenging to identify the source of problems. A setup like this isn't easily scalable and might not efficiently utilize resources. To optimize performance and scalability, server resources should be allocated based on the specific roles and demands of each component.
