# Guacamole on Kubernetes

## General

This deployment assumes, that you have a running Postgres instance. Guacamole can run on MySQL as well, but I haven't covered this within here.

## Manual prerequisites

Sadly there are still some manual doings involved for running Guacamole on Kubernetes. The bootstrapping of a Postgres database is hard to automate because of the way the Guacamole project has decided to implement it.

1. Create Guacamole DB user

```sql
create user guacamole password 'supersecret';
```

2. Create Guacamole database
   
```sql
create database guacamole owner guacamole;
```

You need to initialize the database created above with an initdb script. You can generate the script with a docker container.

```
 docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > initdb.sql
```

Use `psql` to run the sql script against the datbase created above.

```
psql -U guacamole -d guacamole < initdb.sql
```

# Disclaimer

This deployment was inspired by [thomas-illiet/k8s-guacamole](https://github.com/thomas-illiet/k8s-guacamole). He sadly has stopped to further develop his deployment. I broadly cleaned his code and created a Kustomization overlay for it.
