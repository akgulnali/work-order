# Work Orders

The main goal is to build a small RESTful API that performs CRUD operations. This project is implemented with
Ruby on Rails. PostgreSQL is used as database.

### Prerequisites

These are the versions of the tech stack:

* Ruby version: 2.2.4

* Rails version: 5.0.7.2

* PostgreSQL version: 10.5

You need to install them to run the project. Also you can use the Postman to test the APIs.

### Installing

A step by step series of examples that will tell you how to get a development env running.

Run the following commands on your production server to install RVM:

```
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm `whoami`
```

To install a specific version of Ruby, run:

```
rvm install ruby-2.2.4
rvm --default use ruby-2.2.4
```

To install a specific version of Rails, run:

```
gem install rails -v 5.0.7.2
```

To install a specifi version of PostgreSQL, run:

```
brew install postgresql@10.5
```

You need to install homebrew if you want to install with brew command. 

## Getting Started

To run this project locally, you should unzip the file and go to the directoy which is called work_order in the file
using terminal. For example, I assume you are using macOS and you unzip the files to the desktop. You can follow the
steps below to reach the directory from terminal. First open your terminal and type the below command.

```
cd Desktop/hatchways/work_order/
```

After that you need to run the below command to install dependencies.

```
bundle install
```

After that you can create database with seeds.rb. Simply, you can run the command below.

```
rake db:migrate
rake db:seed
```

Finally you can start the application usin the command below.

```
rails server
```

After you run this command you will see the local server started at the port number 3000.

## Running the tests

To run tests you just need to type below command in the terminal.

```
rspec
```

## Examples

You can test APIs using postman just following the below instructions.

To create a worker you need to select POST method from the dropdown and type the below url into the url bar.

http://localhost:3000/api/v1/workers

In the body part you need to copy and past the parameters below.

{
	"name": "Worker one",
	"company_name": "Company A",
	"email": "sample@mail.com"
}

After that you can create a worker just clicking the send button. You will see the JSON response accordingly.

To delete a wotker you need to select DELETE method from the dropdown and type the below url into the url bar.
You need to give the correct worker id. (Id may varrys.)

http://localhost:3000/api/v1/workers/1

After that you will see the json response.

To assign worker to an order you need to create an order first.

http://localhost:3000/api/v1/orders

In the body part you need to copy and past the parameters below.

{
	"title": "New 10",
	"description": "7th order",
	"deadline": "2019-07-04"
}

After created the order you need to call another API to assing worker to the order.

To assign a wotker you need to select PATCH method from the dropdown and type the below url into the url bar.
You need to give the correct worker id. (Id may varrys.)

http://localhost:3000/api/v1/workers/1/assign

In the body part you need to send the order_id parameter which is the order that you want to assign the worker.

{
	"order_id": "1"
}

When you click send button you will see the response below.

To see all orders you need to select GET method from the dropdown and type the below url into the url bar.

http://localhost:3000/api/v1/orders

The resuls are sorted by deadline in ascending order.

To see the workers which are assigned to an order you to select GET method from the dropdown and type the below url into the url bar.
ou need to give the correct order id to see the assigned workers. (Id may varrys.). A max of 5 workers can work on one
order.

http://localhost:3000/api/v1/orders/1/workers

## Deployment

I was not able to enough time to deploy this project to the Heroku. If I had enough time, I could deploy it.

## Authors

* **Nuh Ali Akgul** - *Full Stack Web Developer* - *nuhaliakgul@hotmail.com*
