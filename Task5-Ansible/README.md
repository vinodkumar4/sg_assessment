virajvinodkumar@DESKTOP-NUD4SOC:~/Task5$ ansible-playbook install-docker.yaml

PLAY [all] **********************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server3]
ok: [server2]

TASK [Install aptitude] *********************************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server2]
ok: [server3]

TASK [Install required system packages] *****************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server2]
ok: [server3]

TASK [Add Docker GPG apt Key] ***************************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server3]
ok: [server2]

TASK [Add Docker Repository] ****************************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server2]
ok: [server3]

TASK [Update apt and install docker-ce] *****************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server2]
ok: [server3]

TASK [Install Docker Module for Python] *****************************************************************************************************************************************************************************************************
ok: [server1]
ok: [server3]
ok: [server2]

TASK [Pull httpd docker image] **************************************************************************************************************************************************************************************************************
ok: [server3]
ok: [server2]
ok: [server1]

TASK [Launch httpd docker container] ********************************************************************************************************************************************************************************************************
changed: [server3]
changed: [server2]
changed: [server1]

TASK [Pull php docker image] ****************************************************************************************************************************************************************************************************************
ok: [server2]
ok: [server3]
ok: [server1]

TASK [Launch php docker container] **********************************************************************************************************************************************************************************************************
changed: [server2]
changed: [server3]
changed: [server1]

TASK [Pull mysql docker image] **************************************************************************************************************************************************************************************************************
changed: [server3]
changed: [server2]
changed: [server1]

TASK [Launch php docker container] **********************************************************************************************************************************************************************************************************
changed: [server1]
changed: [server3]
changed: [server2]

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
server1                    : ok=13   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server2                    : ok=13   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
server3                    : ok=13   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

virajvinodkumar@DESKTOP-NUD4SOC:~/Task5$ ssh -i ~/.ssh/pc_vvk.pem ubuntu@100.24.34.153
Welcome to Ubuntu 22.04.1 LTS (GNU/Linux 5.15.0-1020-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Fri Sep 30 12:16:47 UTC 2022

  System load:                      0.5380859375
  Usage of /:                       61.9% of 7.57GB
  Memory usage:                     70%
  Swap usage:                       0%
  Processes:                        123
  Users logged in:                  0
  IPv4 address for br-577696da3213: 172.19.0.1
  IPv4 address for docker0:         172.17.0.1
  IPv4 address for eth0:            172.31.82.35

 * Ubuntu Pro delivers the most comprehensive open source security and
   compliance features.

   https://ubuntu.com/aws/pro

15 updates can be applied immediately.
To see these additional updates run: apt list --upgradable


Last login: Fri Sep 30 12:15:47 2022 from 122.161.84.235
ubuntu@ip-172-31-82-35:~$ 
ubuntu@ip-172-31-82-35:~$ sudo docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS              PORTS                               NAMES
47b1f33d5084   mysql:8                 "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:3306->3306/tcp, 33060/tcp   MySQL-DB
f56be1ab72b3   phpmyadmin/phpmyadmin   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:3333->80/tcp                PHPContainer
c72143783de0   httpd                   "httpd-foreground"       38 minutes ago       Up 2 minutes        0.0.0.0:8880->80/tcp                Dockerwebserver
ubuntu@ip-172-31-82-35:~$



ubuntu@ip-172-31-82-35:~$ curl localhost:8880
<html><body><h1>It works!</h1></body></html>
ubuntu@ip-172-31-82-35:~$



ubuntu@ip-172-31-82-35:~$ curl localhost:3333
<!doctype html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="referrer" content="no-referrer">
  <meta name="robots" content="noindex,nofollow">
  <style id="cfs-style">html{display: none;}</style>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
  <link rel="stylesheet" type="text/css" href="./themes/pmahomme/jquery/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="js/vendor/codemirror/lib/codemirror.css?v=5.2.0">
  <link rel="stylesheet" type="text/css" href="js/vendor/codemirror/addon/hint/show-hint.css?v=5.2.0">
  <link rel="stylesheet" type="text/css" href="js/vendor/codemirror/addon/lint/lint.css?v=5.2.0">
  <link rel="stylesheet" type="text/css" href="./themes/pmahomme/css/theme.css?v=5.2.0">
  <title>phpMyAdmin</title>
  .
  .
  .
  .
  .  
  </div>
</form>


</div>



  </div>
  </body>
</html>
ubuntu@ip-172-31-82-35:~$
