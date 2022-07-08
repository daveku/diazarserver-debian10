# Install docker and deploy container on Diazar server with Debian 10

The script will uninstall any previously installed docker, install docker and run a container named "diazarserver".

This container uses the latest image [davidkudev/server-diazar](https://hub.docker.com/r/davidkudev/server-diazar) and will be deployed to the port 3306. The container shares the directory `/var/lib/mysql` with the host at `~/backupDB`.

The image [davidkudev/server-diazar](https://hub.docker.com/r/davidkudev/server-diazar) has the following features:

## Features

- O.S: Debian 10
- Database: MySQL 5.7 _user: root, password: merida_
- No-IP - ready to configure with credentials.
- Expose port: 3306

## Instructions

1. Confirm you are in your user directory `cd ~`
2. Clone this repository.

   ```bash
    git clone https://github.com/daveku/diazarserver-debian10.git
   ```

3. Access the repository.

   ```bash
    cd diazarserver-debian10
   ```

4. Run the following command to install docker in diazarserver.

   ```bash
   ./deploy_docker.sh
   ```
