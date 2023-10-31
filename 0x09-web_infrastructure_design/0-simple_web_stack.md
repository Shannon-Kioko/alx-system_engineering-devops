## Simple Web Infrastructure

<img src="#">

### Description

This is a simple web infrastructure that hosts a website that may be accessed at <a href="#">www.foobar.com</a>. The network of the server is not secured by firewalls or SSL certificates. The resources (CPU, RAM, and SSD) that the server provides must be shared by each component (database, application server).

### Specifics About This Infrastructure

#### What is a server:

A server is a computer or software that provides services to other computers, known as clients. In this web infrastucture, the server hosts a website accessible via <a href="#">www.foobar.com</a>, handling client requests and delivering website content.

#### What is the role of the domain name:

The domain name serves as a human-friendly alias for an IP address. It simplifies how we access websites. Instead of using complex numerical IP addresses, like 91.198.174.192, domain names, such as <a href="#">www.wikipedia.org</a>, make it easier to identify and remember. The DNS system maps these domain names to the actual IP addresses.

#### What type of DNS record www is in <a href="#">www.foobar.com</a>:

The DNS record for <a href="#">www.foobar.com</a> is an A record. This record associates the domain name "<a href="#">www.foobar.com</a>" with its corresponding IPv4 address, allowing users to access the website.

#### What is the role of the web server:

The web server's role is to handle incoming requests via HTTP or HTTPS and responding with the requested web content or error messages. The web server essentially serves the web pages to users.

#### What is the role of the application server:

The application server is responsible for installing, operating, and hosting applications and associated services. It facilitates the hosting and delivery of applications to end users, businesses, or organizations.

#### What is the role of the database:

The database's role is to maintain organized information that can be accessed, managed, and updated efficiently. In this context, it likely stores and manages data related to the website, such as user accounts and content.

#### What is the server using to communicate with the computer of the user requesting the website:

The server communicates with the user's computer over the internet network through the TCP/IP protocol suite, comprising protocols like TCP for reliable data delivery and IP for addressing and routing.

### Issues with this infrastructure:

-   Single Point of Failure (SPOF): The infrastructure has multiple single points of failure. For instance, if the MySQL database server experiences downtime, the entire website becomes inaccessible. The lack of redundancy can lead to service interruptions.

-   Downtime when maintenance needed: When maintenance or updates are required for any component, they must be temporarily taken down or the entire server may need to be shut off. With only one server, this leads to website downtime during maintenance, impacting user experience.

-   Cannot scale with incoming traffic: The infrastructure struggles to handle a sudden increase in incoming traffic. Since all components share resources on a single server, it can quickly run out of resources or slow down when there's a significant surge in requests. Scaling to meet high traffic demands is challenging.
