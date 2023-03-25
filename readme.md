# Embedded Linux Docker

## Start

Docker 설치

1. [Windows](https://docs.docker.com/desktop/install/windows-install/)
2. [Linux](https://docs.docker.com/engine/install/ubuntu/)
3. [MacOS](https://docs.docker.com/desktop/install/mac-install/)

Docker를 설치한 후 아래 방법을 참고해주세요.

- - -

1. `mkdir files`를 생성한다.
2. 리눅스 프로그래밍 Classroom에 들어가서 `bootloader.tar.gz` `filesystem.tar.bz2` `gcc-linaro-4.9.4.tar.xz` `kernel.tar.gz`를 다운로드 후 `files`에 넣는다.
3. 아래 명령을 실행한다.

- - -

```sh
chmod +x ./init.sh
```

```sh
./init.sh
```

Docker 실행

```sh
docker exec -it embedded_linux /bin/bash
```

- - -
