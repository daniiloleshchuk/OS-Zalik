export DEBIAN_FRONTEND=noninteractive
export TZ=Europe/Minsk

/etc/init.d/mysql start
git clone -b dev https://github.com/daniiloleshchuk/OS-Zalik-App /app
cd /app
mvn install 
mvn package -Dmaven.test.skip=true

export MYSQL_PWD=password
/usr/bin/mysql -u root -e "FLUSH PRIVILEGES;"
mvn spring-boot:run

