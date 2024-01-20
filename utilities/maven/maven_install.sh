# RMIT University Vietnam
#  Course: COSC2767 Systems Deployment and Operations
#  Semester: 2023C
#  Assessment: Assignment 3
#  Author: Kha Nguyen Anh Tran
#  ID: 3750945
#  Created date: January 10, 2024
#  Last modified: January 22, 2024

# First check if Maven is already installed
if command -v mvn >/dev/null 2>&1; then
    echo "Maven is already installed."
else
    echo "Maven is not installed. Downloading and installing..."
    # Fetch the latest version of Maven
    latest_version=$(curl -s https://maven.apache.org/download.cgi | grep -oP 'apache-maven-\d+\.\d+\.\d+' | head -n 1 | grep -oP '\d+\.\d+\.\d+')

    # If the latest version is not empty, download and install it
    if [ -n "$latest_version" ]; then
        echo "Latest version of Apache Maven: $latest_version"
        maven_url="https://dlcdn.apache.org/maven/maven-3/$latest_version/binaries/apache-maven-$latest_version-bin.tar.gz"
        wget "$maven_url"
        
        # Extract and install Maven
        tar -xf "apache-maven-$latest_version-bin.tar.gz" -C /opt
        rm "apache-maven-$latest_version-bin.tar.gz"

        # Create a symbolic link to make it easier to reference
        ln -s "/opt/apache-maven-$latest_version" "/opt/maven"

        echo "Apache Maven $latest_version installed successfully."
    else
        echo "Failed to retrieve the latest version of Apache Maven."
    fi
fi

# Source the updated .bash_profile
# Update .bash_profile
echo 'M2_HOME=/opt/maven' >> /root/.bash_profile
echo 'M2=/opt/maven/bin' >> /root/.bash_profile
JAVA_HOME=$(find /usr/lib/jvm -name 'java-11-openjdk*' -type d)
echo "JAVA_HOME=$JAVA_HOME" >> /root/.bash_profile
echo 'PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2' >> /root/.bash_profile

source /root/.bash_profile
echo "Environment variables updated in .bash_profile."


# Check if maven is properly setup
mvn --version