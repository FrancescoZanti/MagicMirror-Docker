## 🇮🇹 Magic Mirror su Docker
<br>

### Cos'è Magic Mirror su Docker?

Durante il mio utilizzo casalingo di MagicMirror (https://magicmirror.builders/), ho deciso di utilizzare una versione di MagicMirror su Docker, per garantire una migliore esperienza di utilizzo e di sviluppo.

Ho cercato di ovviare ad alcuni problemi come aggiornamento di NodeJS, npm, MagicMirror e moduli, garantendo una base comune nel tempo.

La facilità con cui è possibile utilizzare MagicMirror su Docker permette di dedicare maggior tempo allo sviluppo dell'interfaccia utente, preoccupandosi in maniera minore delle dipendenze.

Magic Mirror nasce come un'applicazione server-client (https://github.com/MichMich/MagicMirror/issues/1399), in modo che l'utente possa utilizzare il mirror anche su altri computer: ho quindi mantenuto questa filosofia, anche per essere in grado di portare il client di MagicMirror su dispositivi poco potenti (il target è Raspberry Pi Zero W (prima serie)).
<br>

### Come contribuire

1. Esegui il fork del progetto
2. Crea un ramo per la feature che vuoi implementare (`git checkout -b feature/NomeNuovaFeature`)
3. Esegui il commit del tuo ramo (`git commit -am "Aggiunta feature NomeNuovaFeature"`)
4. Esegui il push del tuo ramo (`git push origin feature/NomeNuovaFeature`)
5. Crea una nuova PR (Pull Request)
<br>

### Preparazione

- Git
- Docker installato sul *device* client ("client")
- Docker installato sul *device* server ("server")
- Docker-compose installato (facoltativo, solo se si sceglie questa [opzione](#docker-compose))


<br>

### Docker 🚀

<br> Da lanciare su server:

```
docker run -d \
-v $PWD/MagicMirrorServer/config:/opt/magic_mirror/config \
-v $PWD/MagicMirrorServer/modules:/opt/magic_mirror/modules \
-v $PWD/MagicMirrorServer/css/custom.css:/opt/magic_mirror/css/custom.css \
-p 8080:8080 \
--name magicmirror-server \
francescozanti/magicmirror-docker:server-latest 
```

<br> Da lanciare su client:

```
docker run -d \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
--link magicmirror-server:magicmirror-server \
-e URL=magicmirror-server:8080 \
-e DISPLAY \
--name magicmirror-client \
francescozanti/magicmirror-docker:server-latest 
```

### Docker-compose 🚀   

```
curl -s 'https://raw.githubusercontent.com/FrancescoZanti/MagicMirror-Docker/master/install/docker-compose-install.sh' -o docker-compose-install.sh && bash docker-compose-install.sh
```

<br>

### Voglio Compilare tutto! 🚀

Clonare questa repo su "server":

<br>

```
git clone git@github.com:FrancescoZanti/MagicMirror-Docker.git
```

<br>

Effettura il build dell'immagine:

```
cd MagicMirror-Docker && docker build -t magicmirror-docker:latest .
```

<br>

Una volta fatto è possibile avviare il container su "server":

<br>

```
docker run -d \
--restart=always \
--name mm01-docker \
-p 8080:8080 \
-v $PWD/config:/opt/magic_mirror/config:rw \
-v $PWD/modules:/opt/magic_mirror/modules:rw \
-v $PWD/css/custom.css:/opt/magic_mirror/css/custom.css:rw \
magicmirror-docker:latest
```

<br>

Verificare che il container si sia avviato correttamente con:

<br>

```
docker logs mm01-docker
```

<br>

Verificare anche tramite browser, andando su http://IPServer:8080/:
se tutto è andato bene, sarà disponibile MagicMirror in configurazione default.

<br>

Ora è il momento di effettuare il build dell'immagine client:

<br>

```
cd ../magicMirrorClient && docker build -t mmclient:latest .
```
<br>

Aggiungere la seguente riga nel file **/etc/profile** (permanente) o eseguirla nel terminale (temporaneo, fino al primo riavvio):

<br>

```
xhost + local:docker
```

<br>



Infine è il momento di avviare il client:

<br>

```
chmod +x run.sh && ./run.sh
```

### ToDo

## 🇬🇧 Magic Mirror on Docker (TODO)

