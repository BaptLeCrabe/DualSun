# ![alt text](logo.png) DualSun Fullstack RoR/Angular Hiring Test


## Infos


**Frontend:**

- Language : Typescript
- Framework : Vue3 + Vuetify
- Node version : 18.14.2 (.nvmrc for NVM included)

**Backend:**

- Language: Ruby (2.7.0)
- Framework : Rails
- Database : PostgreSQL


## Setup

**Script:**

```
sh setup.sh
```

Will setup run rails server in background and setup and run vue


And to easly kill the rails server in backgorund 

```
kill -9 $(lsof -i tcp:3000 -t)
```

**Frontend:**

- Language : Typescript
- Framework : Vue3 + Vuetify

```
yarn
```

```
yarn dev
```


**Backend:**

```
bundle
```

```
rails db:setup
```

```
rails s
```