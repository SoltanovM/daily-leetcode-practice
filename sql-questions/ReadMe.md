# Motivation

I am solving all SQL questions on LeetCode because SQL is one of the core skills of a Data Engineer. Daily practice helps me strengthen query writing, improve problem-solving speed, and get more comfortable with the kinds of data manipulation tasks that appear in real-world pipelines, analytics, and technical interviews. This repository is a way to stay consistent, track my progress, and keep sharpening the fundamentals that matter in my career.

## Environment Preparation

To practice the SQL problems locally, I use PostgreSQL in Docker. This keeps the setup simple and makes it easy to reset the database whenever needed.

### Prerequisite

Make sure Docker Desktop is installed and running before starting the database container.

### Start a Local PostgreSQL Database

Run the following command to create and start a PostgreSQL container for practice:

```bash
docker run --name leetcode \
  -p 5433:5432 \
  -e POSTGRES_USER=username \
  -e POSTGRES_PASSWORD=leetcode23 \
  -e POSTGRES_DB=leetcodedb \
  -d postgres:16.0
```

After the container is running, you can create the tables required for each LeetCode question and use the database to write and test your queries locally.
