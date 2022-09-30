vkb@DESKTOP-NUD4SOC:~/Task4$ docker image ls
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
java-docker              latest    f4cc3f46872e   58 minutes ago   559MB
task4_nginx-service      latest    84b267be9ca8   2 hours ago      23.5MB
vkb_nginx-service        latest    84b267be9ca8   2 hours ago      23.5MB
nginx                    alpine    804f9cebfdc5   7 weeks ago      23.5MB
mysql                    8.0.28    f2ad9f23df82   5 months ago     521MB
docker/getting-started   latest    cb90f98fd791   5 months ago     28.8MB
vkb@DESKTOP-NUD4SOC:~/Task4$

vkb@DESKTOP-NUD4SOC:~/Task4$ docker-compose up -d
Creating network "task4_default" with the default driver
Creating task4_nginx-service_1 ... done
Creating task4_app-db_1        ... done
Creating task4_web-app_1       ... done
vkb@DESKTOP-NUD4SOC:~/Task4$
vkb@DESKTOP-NUD4SOC:~/Task4$ docker ps
CONTAINER ID   IMAGE               COMMAND                  CREATED              STATUS              PORTS                               NAMES
63178932b566   java-docker         "./mvnw spring-boot:…"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp              task4_web-app_1
93b472a436d6   mysql:8.0.28        "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:3306->3306/tcp, 33060/tcp   task4_app-db_1
726bc1c1e988   vkb_nginx-service   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:80->80/tcp                  task4_nginx-service_1
vkb@DESKTOP-NUD4SOC:~/Task4$
vkb@DESKTOP-NUD4SOC:~/Task4$
vkb@DESKTOP-NUD4SOC:~/Task4$ docker-compose down
Stopping task4_web-app_1       ... done
Stopping task4_app-db_1        ... done
Stopping task4_nginx-service_1 ... done
Removing task4_web-app_1       ... done
Removing task4_app-db_1        ... done
Removing task4_nginx-service_1 ... done
Removing network task4_default
vkb@DESKTOP-NUD4SOC:~/Task4$
