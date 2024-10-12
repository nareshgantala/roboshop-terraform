components={
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }
    payment = {
      name = "payment"
      instance_type = "t3.small"
      password = "roboshop123"
    }    
    user = {
      name = "user"
      instance_type = "t3.micro"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.small"
    }
    shipping = {
      name = "shipping"
      instance_type = "t3.small"
    }
    dispatch = {
      name = "dispatch"
      instance_type = "t3.small"
    }
    redis = {
      name = "redis"
      instance_type = "t3.small"
    }
    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.small"
      password = "roboshop123"
    }
    mysql = {
      name = "mysql"
      instance_type = "t3.small"
      password = "RoboShop@1"
    }
    cart = {
      name = "cart"
      instance_type = "t3.small"
    }
}

env = "dev"