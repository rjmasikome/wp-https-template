# wp-https-template
Docker Compose template for Wordpress to run with https on Let's Encrypt :whale2:

This includes a bash file, that will generate the configuration that is needed for Wordpress to run on the redirection of Let's Encrypt.


## Requirement
1. Elevated User / Root
2. `docker` is installed and the current user is inside docker group
3. `docker-compose` on the latest version is installed

## How to run
1. Make sure you have domain in hand, and have configured it to point it to your VM
2. **IMPORTANT**: Please take a look at `docker-compose.yml` file to check on the username and password of the database
3. Make sure you have root or elevated privileged to run, and you need to pass the url as first param for example
```
$ sudo ./start-wordpress.sh https://rijoma.com
```
4. If you've already had the `wp-config.php` and everything has been set up, you can just simply run
```
sudo ./start-wordpress.sh
```
Or you can also just run `docker-compose`
```
$ docker-compose up -d
```
5. Navigate to `http://localhost:8080` or any port that you defined on the `docker-compose.yml`


## LICENSE
MIT