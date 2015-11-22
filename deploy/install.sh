sudo apt-get install git openjdk-7-jre-headless openjdk-7-jdk tar
cd ~/
mkdir spigot
cd spigot/
curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
java -jar BuildTools.jar 
echo "#/bin/sh" > start.sh
sed -i '$ a\java -Xms512M -Xmx1024M -jar spigot-1.8.8.jar' start.sh
chmod +x start.sh
./start.sh 
sed -i -- 's/false/true/g' eula.txt
cd ..
git clone https://github.com/Takmo/lapis.git
cd lapis/ShutdownManager
cp ~/spigot/Spigot/Spigot-API/target/spigot-api-1.8.8-R0.1-SNAPSHOT.jar ~/lapis/ShutdownManager/spigot.jar
ant jar
cp server/plugins/ShutdownManager.jar ~/spigot/plugins/
cd ~/spigot/
./start.sh
