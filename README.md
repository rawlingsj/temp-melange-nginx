# generate a local key to work with

```sh
docker run --rm -v "${PWD}":/work cgr.dev/chainguard/melange keygen local-melange.rsa
```

# prime a local arm apk cache

to prime a local cache of arm apks..

create a local `./packages` folder

```sh
mkdir -p packages
```

use gcloud to sync the GCS bucket apks..

```sh
gcloud alpha storage cp -c --recursive gs://wolfi-production-registry-destination/os/aarch64 ./packages/
```



# rebuild a dependency

Completed APKs live in the ./done folder, to rebuild any of these copy into the repo root folder and run the build script

```sh
./build.sh 10
```


# iterate on nginx

nginx is currently in a very basic form, to iterate ensure `200-nginx.yaml` is in the repo root folder and run

```sh
./build.sh 200
```