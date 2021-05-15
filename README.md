# LogSearch

University project which enables user to find text fragment in provided log file.

## Development
Create `.env` file from `.env.example`
```bash
cp .env.example .env
```

## VSCode + Docker
1. Start Docker and open project's dir in VSCode
2. Install `ms-vscode-remote.remote-containers` extension
3. `Ctrl+Shift+P` -> Remote-Containers: Reopen in Container
4. Run app and database server
```bash
npm run serve
```

### Build docker image
```
docker build -t app .
```

### Run docker container (prod) - remember to uncomment in dockerfile
```
docker run -p 8000:80 -it --name app app
```

### Run docker container (dev)
```
docker run -dp 8000:8080 -w /app -v "$(pwd):/app" node:12.18.1-alpine sh -c "npm install && npm run serve"
```
or
```
docker-compose up
```

#### Project setup
```
npm install
```

#### Compiles and hot-reloads for development
```
npm run serve
```

#### Compiles and minifies for production
```
npm run build
```

#### Lints and fixes files
```
npm run lint
```

#### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
