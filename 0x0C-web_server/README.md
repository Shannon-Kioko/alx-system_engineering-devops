# 0x0C. Web server

**Resources to read or watch**
[How the web works](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)
[Nginx](https://en.wikipedia.org/wiki/Nginx)
[How to Configure Nginx](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
[Child process concept page]
[Root and sub domain](https://landingi.com/help/domains-vs-subdomains/)
[HTTP requests](https://www.tutorialspoint.com/http/http_methods.htm)
[HTTP redirection](https://moz.com/learn/seo/redirection)
[Not found HTTP response code](https://en.wikipedia.org/wiki/HTTP_404)
[Logs files on Linux](https://www.cyberciti.biz/faq/ubuntu-linux-gnome-system-log-viewer/)
**For reference:**

[RFC 7231 (HTTP/1.1)](https://datatracker.ietf.org/doc/html/rfc7231)
[RFC 7540 (HTTP/2)](https://datatracker.ietf.org/doc/html/rfc7540)
**man or help:**

- `scp`
- `curl`

### [0. Transfer a file to your server](0-transfer_file)

Write a Bash script that transfers a file from our client to a server:

Requirements:

- Accepts 4 parameters
  1. The path to the file to be transferred
  2. The IP of the server we want to transfer the file to
  3. The username `scp` connects with
  4. The path to the SSH private key that `scp` uses
- Display `Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY` if less than 3 parameters passed
- `scp` must transfer the file to the user home directory `~/`
- Strict host key checking must be disabled when using `scp`
  Example:

```bash
sylvain@ubuntu$ ./0-transfer_file
Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
sylvain@ubuntu$
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/sylvain 'ls ~/'
afile
sylvain@ubuntu$
sylvain@ubuntu$ touch some_page.html
sylvain@ubuntu$ ./0-transfer_file some_page.html 8.8.8.8 sylvain /vagrant/private_key
some_page.html                                     100%   12     0.1KB/s   00:00
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/private_key 'ls ~/'
afile
some_page.html
sylvain@ubuntu$
```

In this example, I:

- remotely execute the `ls ~/` command via ssh to see what `~/` contains
- create a file named `some_page.html`
- execute my `0-transfer_file` script
- remotely execute the `ls ~/` command via `ssh` to see that the file `some_page.html` has been successfully transferred

That is one way of publishing your website pages to your server.

### [1. Install nginx web server](1-install_nginx_web_server)

Readme:

- [-y on apt-get command](https://askubuntu.com/questions/672892/what-does-y-mean-in-apt-get-y-install-command)
  Web servers are the piece of software generating and serving HTML pages, let’s install one!

Requirements:

- Install nginx on your web-01
  server
- Nginx should be listening on port 80
- When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Hello World!
- As an answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements (this script will be run on the server itself)
- You can’t use systemctl for restarting nginx
  Server terminal:

```bash
root@sy-web-01$ ./1-install_nginx_web_server > /dev/null 2>&1
root@sy-web-01$
root@sy-web-01$ curl localhost
Hello World!
root@sy-web-01$
```

Local terminal:

```bash
sylvain@ubuntu$ curl 34.198.248.145/
Hello World!
sylvain@ubuntu$ curl -sI 34.198.248.145/
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 23:43:22 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
Connection: keep-alive
ETag: "58abea7c-1e"
Accept-Ranges: bytes

sylvain@ubuntu$
```

In this example `34.198.248.145` is the IP of my `web-01` server. If you want to query the Nginx that is locally installed on your server, you can use `curl 127.0.0.1`.

If things are not going as expected, make sure to check out Nginx logs, they can be found in `/var/log/`.

**Maarten’s PRO-tip**: When you use `sudo su` on your web-01 you can become root like this to test your file:

```bash
sylvain@ubuntu$ sudo su
root@ubuntu#
```

### [2. Setup a domain name](2-setup_a_domain_name)

[.TECH Domains](https://get.tech/) is one of the top domain providers. They are known for the stability and quality of their DNS hosting solution. We partnered with .TECH Domains so that you can learn about DNS.

.TECH Domains worked with domain name registrars to give you access to a free domain name for a year. Please get the promo code in your tools space. Feel free to drop a thank you tweet for [.TECH Domains](https://twitter.com/dottechdomains).

Provide the domain name in your answer file.

Requirement:

- provide the domain name only (example: `foobar.tech`), no subdomain (example: `www.foobar.tech`)
- configure your DNS records with an A entry so that your root domain points to your `web-01` IP address **Warning: the propagation of your records can take time (~1-2 hours)**
- go to your profile and enter your domain in the Project website url field

Example:

```bash
sylvain@ubuntu$ cat 2-setup_a_domain_name
myschool.tech
sylvain@ubuntu$
sylvain@ubuntu$ dig myschool.tech

; <<>> DiG 9.10.6 <<>> myschool.tech
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26785
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;myschool.tech.     IN  A

;; ANSWER SECTION:
myschool.tech.  7199    IN  A   184.72.193.201

;; Query time: 65 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Aug 02 09:44:36 PDT 2019
;; MSG SIZE  rcvd: 65

sylvain@ubuntu$
```

When your domain name is setup, please verify the Registrar here: https://whois.whoisxmlapi.com/ and you must see in the JSON response: `"registrarName": "Dotserve Inc"`

3. Redirection

Readme:

[Replace a line with multiple lines with sed](https://stackoverflow.com/questions/26041088/sed-replace-line-with-multiline-variable)
Configure your Nginx server so that `/redirect_me` is redirecting to another page.

Requirements:

- The redirection must be a “301 Moved Permanently”
- You answer file should be a Bash script containing commands to automatically configure a Ubuntu machine to respect above requirements
- Using what you did with `1-install_nginx_web_server`, write `3-redirection` so that it configures a brand new Ubuntu machine to the requirements asked in this task
  Example:

```bash
sylvain@ubuntu$ curl -sI 34.198.248.145/redirect_me/
HTTP/1.1 301 Moved Permanently
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 21:36:04 GMT
Content-Type: text/html
Content-Length: 193
Connection: keep-alive
Location: https://www.youtube.com/watch?v=QH2-TGUlwu4

sylvain@ubuntu$
```

### [4. Not found page 404](4_not_found_page_404)

Configure your Nginx server to have a custom 404 page that contains the string `Ceci n'est pas une page`.

Requirements:

- The page must return an HTTP 404 error code
- The page must contain the string `Ceci n'est pas une page`
- Using what you did with `3-redirection`, write `4-not_found_page_40`4 so that it configures a brand new Ubuntu machine to the requirements asked in this task
  Example:

```bash
sylvain@ubuntu$ curl -sI 34.198.248.145/xyz
HTTP/1.1 404 Not Found
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 21:46:43 GMT
Content-Type: text/html
Content-Length: 26
Connection: keep-alive
ETag: "58acb50e-1a"

sylvain@ubuntu$ curl 34.198.248.145/xyzfoo
Ceci n'est pas une page

sylvain@ubuntu$
```

### [5. Install Nginx web server (w/ Puppet)](7-puppet_install_nginx_web_server.pp)

Time to practice configuring your server with Puppet! Just as you did before, we’d like you to install and configure an Nginx server using Puppet instead of Bash. To save time and effort, you should also include resources in your manifest to perform a 301 redirect when querying /redirect_me.

Requirements:

- Nginx should be listening on port 80
- When querying Nginx at its root `/` with a GET request (requesting a page) using `curl`, it must return a page that contains the string `Hello World!`
- The redirection must be a “301 Moved Permanently”
  Your answer file should be a Puppet manifest containing commands to automatically configure an Ubuntu machine to respect above requirements
