# task-tracker overview
An application that lets the users organize and manage tasks. 


We will build a task tracker that lets the users organize and manage tasks. We need to design a database to store the data, with the following requirements:

## Basic:
We’ll have 6 classes in the UML:
- Task
- List
- Tag
- Subtask
- User
- Comment

There will be many to many relationships (task-tag) and one to many (user- task, list-task, task-comment, task-subtask) relationships between the classes.

## Part 1: task-user-tags: Dongze Li
- Each task has a title, due date, create date, and status. Users can add the URL and a priority to the task. 
- Each user has a userID, first name, last name, and email. Users can create tasks, finish tasks, delete tasks.  
- Users can assign tasks to another user. The default assignee of the task is the creator.
- The task has two kinds of status: todo and done. 
- Each task can have 0 or more tags. Each tag has a name. Each tag can also be added to 0 or more tasks
## Part 2: task-list-subtask-comment: Shuyi Wang
- The assignee can make multiple comments on the task.
- Each Comment has an update time and a content. The task can have 0 or more comments.
- Each List has a name. The tasks can be moved to a list. The list can have 0 or more tasks.
- Each task can have 0 or more subtasks. The subtask has the name and status of either todo or done.
## Others:
- The app will support filters such as the “Unscheduled work tasks”, “Important tasks in the next 2 weeks”, "Older than a month", "assigned to me" and so on, which demands queries contain a join of at least three tables, subquery, and complex search criterion.
- The app will also have a reporting feature to analyze the number of finished tasks grouped by list, or month, which will demand queries using the clause of "GROUP BY", "HAVING" and “PARTITION BY ”.
- [Requirements document](https://github.com/ldgze/task-tracker/blob/main/A.%20Requirements%20Document.pdf)

## UML
![image](https://github.com/ldgze/task-tracker/blob/main/B.%20UML%20-%20Page%201.png)


## ERD
![image](https://github.com/ldgze/task-tracker/blob/main/C.%20ERD%20.png)

## Definition of relational schema with proof that it is in BCNF.
- Tag(tagID, name) 
    - tagID -> name, tagID is a superkey
- Tag_Task(tagID, taskID)
    - {tagID, taskID} -> {tagID, taskID} is a trivial FD
- Task(taskID, listID, title, dueDate, createDate, URL, priority, status) 
    - taskID -> {listID, title, dueDate, createDate, URL, priority, status}, taskID is a superkey
- User(userID, firstName, lastName, email)
    - userID -> {firstName, lastName}, userID is a superkey
    - email -> {firstName, lastName}, email is a superkey
- Creator(userID, taskID)
    - {userID, taskID} -> {userID, taskID} is a trivial FD
- Assignment(userID, taskID)
    - {userID, taskID} -> {userID, taskID} is a trivial FD
- SubtaskID(subtaskID, taskID, title, status)
    - subtaskID -> {taskID, title, status}, subtaskID is a superkey
- ListID(listID, name)
    - listID -> name, listID is a superkey
- Comment(commentID, taskID, content, updateAt)
    - commentID -> {taskID, content, updateAt}, commentID is a superkey


## SQL file (text file) with the table definitions and creation SQL statements that can be executed with SQLite3.
- [E1.db.sql](https://github.com/ldgze/task-tracker/blob/main/E1.db.sql)

## Define and execute at least five queries that show your database.
- [E2.sql](https://github.com/ldgze/task-tracker/blob/main/E2.sql)



# Implementation of the task-tracker nodeExpressSqliteEJS Application
An Application Using Node + Expres + SQlite + EJS implementing a simple task manager

## Using it

1) Clone the repo
2) Install the dependencies

```
npm install
```


3) Start the server

```
npm start
```

4) Point your browser to http://localhost:3000

5) In the browser (Or you can also point your browser to  http://localhost:3000/tasks), you can overview the all listed tasks.

6) You can create a new task on the right column with title, dueDate, URL, and priority by clicking on the create button.

6) To edit, update, or delete the exist task; simply click on the button on exist tasks and enter the information or tags to the tasks at the next browser appear. (tasks and tags are linked)

7) To mark as finishing the task, simply click on finish button on the exist task.

8) You can search the exist tasks, tags, and lists at the search bar of each pages,

9) You can also add/delete tags or lists manually by clicking on the tag or list bar on the top of the browser. (Or you can also point your browser to  http://localhost:3000/tags or http://localhost:3000/lists)


