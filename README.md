# rock-paper-scissors
This is a recruitment assignment for Exadel.
It's a monolithic app that allows the users to play "Rock Paper Scissors"
game with a "computer" opponent.

## Setup

### With docker
To setup this app in development mode with docker, it's recommended to use Docker v20.
First you need to build the image. From the root directory of the project please run:

````
docker image build --tag rock-paper-scissors .
````
The `--tag` parameter will add the `rock-paper-scissors` associated with the image.

Once you have the image built, you can run:

```
docker container run --name rps -p 3000:3000 -v $(pwd):/rock-paper-scissors -it rock-paper-scissors
```
- `--name` parameter sets name associates the `rps` name with the container, 
- `-v` will setup a bind mount, so all changes in your local working directory will reflect on the container 
  (and the other way around) 
- `-p` forwards port `3000` on the you machine to the `3000` port on the container, 
  you can set the first port to some different number, the app is configured to run rails server on 3000 by default
- `-it` runs container in interactive mode, so you can track the app output

Now, you can open your browser and open `localhost:3000`, to visit the app homepage.

### Without docker
To setup the app in the development mode without docker, you will need ruby 3.2.0 installed on your machine.
To install app dependencies you need to run:

```
bundle install
```

Then you can simply run:

```
bin/dev
```

To run rails server along the tailwind compiler on default `3000` port. 
You can of course run these executables separately with the arguments you choose:

- `rails tailwindcss:watch`
- `rails server`

Once the server is running feel free to visit the app home page under `localhost:3000`.


## Todos
- Add "Waiting for the Curb" modal view
- Extract modals to a layout
- Use (ViewComponent)[https://viewcomponent.org/], for logic-heavy views
- Setup view tests with `capybara-matchers` for the `ViewComponents`
