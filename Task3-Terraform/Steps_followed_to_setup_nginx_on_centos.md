## Before this you need td follow below steps as well -
1. Create Nat GW with EIP from public subnet
2. Add a route to the NAT GWs from route table associated with private subnet
3. Update egress rule on centos security group to reach to port 80 and 443 to internet for downloading and installing packages etc.



#! /bin/bash
sudo yum update

sudo yum install -y epel-release

sudo yum install -y nginx

sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
sudo mkdir -p /var/www/$(hostname -i)/html
sudo chown -R $USER:$USER /var/www/$(hostname -i)/html
sudo chmod -R 755 /var/www/$(hostname -i)
echo "Hello World" | sudo tee /var/www/$(hostname -i)/html/index.html
echo `uname -a` >> /var/www/$(hostname -i)/html/index.html
sudo mkdir /etc/nginx/conf.d/sites-available
sudo mkdir /etc/nginx/conf.d/sites-enabled
sudo cd /etc/nginx
sudo sed -i '/sites-available/d' nginx.conf 
sudo sed -i '/for more information./a include /etc/nginx/conf.d/sites-enabled/*.conf;\nserver_names_hash_bucket_size 64;' nginx.conf
echo 'server {
    listen  80;
    server_name localhost;

    location / {
        root  /usr/share/nginx/html;
        index  index.html index.htm;
    }
    
    error_page  500 502 503 504  /50x.html;
    location = /50x.html {
        root  /usr/share/nginx/html;
    }
}' > conf.d/default.conf
sudo sed -ie 's/localhost/'"`hostname -i`"' '"www.`hostname -i`"'/g' /etc/nginx/conf.d/default.conf
sudo sed -i '0,/root/ s@/usr/share/nginx/html@/var/www/'"`hostname -i`"'/html@g' /etc/nginx/conf.d/default.conf
sudo sed -i '/index/a try_files $uri $uri/ =404;' /etc/nginx/conf.d/default.conf
sudo cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/sites-available/$(hostname -i).conf
sudo ln -s /etc/nginx/conf.d/sites-available/$(hostname -i).conf /etc/nginx/sites-enabled/$(hostname -i).conf
sudo restorecon -r /var/www/$(hostname -i)/html
sudo systemctl restart nginx
