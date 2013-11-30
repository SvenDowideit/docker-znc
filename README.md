docker-znc
==========

### How to use

```bash
# Launch the container
$ CID=$(docker run -name znc svendowideit/znc)

# Find the random public port allocated to your container
$ docker port $CID 6660

# If you want to specify the port mapping
$ docker run -p 36660:6660 -name znc svendowideit/znc 
```

The container will create a default configuration for you.  
Once the container is running, you can go to the znc webadmin at : [http://your-ip:port](http://your-ip:port).  
The default login/password to access it is : admin/admin.

Create a new user and delete the admin user once you made sure you can log in with the newly created one.

SSL is activated by default and znc will generate a certificate in your ~/.znc directory if it doesn't exist already.
