## Distributed Web Infrastructure

<img src="#">

### Description

This is a distributed web infrastructure that atttempts to reduce the traffic to the primary server by distributing some of the load to a replica server with the aid of a server responsible for balancing the load between the two servers (primary and replica).

### Specific About This Infrastructure

#### For every additional element, why you are adding it:

-   2 servers:
    We add two servers for redundancy and fault tolerance. If one server fails, the other can take over, ensuring continuous operation.

-   1 web server (Nginx):
    The web server is added to handle HTTP requests, serve web pages, and provide a secure and efficient way to deliver web content.

-   1 application server:
    The application server is added to host and run the application code. It processes dynamic content, manages user sessions, and interacts with the database.

-   1 load-balancer (HAproxy):
    The load balancer is introduced to distribute traffic across multiple servers, reducing the load on the primary server and improving scalability and fault tolerance.

-   1 set of application files (your code base):
    The application code is essential for delivering the functionality and features of the website or web application.

-   1 database (MySQL):
    The database is added to store and manage data. It is crucial for handling user data, content, and other information.

#### What distribution algorithm your load balancer is configured with and how it works:

The load balancer, HAProxy, is configured with the Round Robin distribution algorithm. Round Robin distributes requests to each server in a circular order, ensuring that each server gets its turn to process requests. This algorithm helps balance the load evenly among the servers.
<br>
Is your load-balancer enabling an Active-Active or Active-Passive setup, explain the difference between both:
The load balancer is enabling an Active-Active setup. In an Active-Active setup, all nodes share the workload, preventing any single node from getting overloaded. This configuration aims to improve throughput and response times. In contrast, in an Active-Passive setup, not all nodes are active at the same time, and one server is passive or on standby, ready to take over if the active server fails.

#### How a database Primary-Replica (Master-Slave) cluster works:

In a Primary-Replica (Master-Slave) cluster, one server is designated as the Primary (Master), while the other is the Replica (Slave). The Primary server handles both read and write requests, while the Replica server only handles read requests. Data synchronization occurs whenever a write operation takes place on the Primary server, ensuring that the Replica is up-to-date.
<br>
What is the difference between the Primary node and the Replica node in regard to the application:
The Primary node is responsible for handling write operations, which include actions like adding or removing users and making changes to the application's data. On the other hand, the Replica node primarily processes read operations. Separating these roles reduces the read traffic directed at the Primary node, allowing it to focus on write operations and maintaining data consistency.

### Issues with this infrastructure:

-   Single Point of Failure (SPOF):
    The infrastructure is still susceptible to single points of failure. For instance, if the Primary MySQL database server experiences downtime, the site's ability to make changes would be compromised. The absence of redundancy in key components increases the risk of service interruptions.

-   Security Issues:
    The infrastructure still lacks essential security measures. Data transmitted over the network isn't encrypted using an SSL certificate, leaving it vulnerable to eavesdropping. Additionally, there is no firewall installed on any server, which means there is no protection against unauthorized access and attacks.

-   No Monitoring:
    The infrastructure doesn't include server monitoring, which is essential for tracking the status and performance of each server. Monitoring is crucial for identifying issues, responding to failures, and ensuring optimal operation.
