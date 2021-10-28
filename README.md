# task-tracker
An application that lets the users organize and manage tasks. 


We will build a task tracker that lets the users organize and manage tasks. We need to design a database to store the data, with the following requirements:

Basic:
We’ll have 6 classes in the UML:
Task
List
Tag
Subtask
User
Comment
There will be many to many relationships (task-tag) and one to many (user- task, list-task, task-comment, task-subtask) relationships between the classes.

Part 1: task-user-tags: Tim Li
Each task has a title, due date, create date, and status. Users can add the URL and a priority to the task. 
Each user has a userID, first name, last name, and email. Users can create tasks, finish tasks, delete tasks.  
Users can assign tasks to another user. The default assignee of the task is the creator.
The task has two kinds of status: todo and done. 
Each task can have 0 or more tags. Each tag has a name. Each tag can also be added to 0 or more tasks
Part 2: task-list-subtask-comment shuyichicken@gmail.com
The assignee can make multiple comments on the task.
Each Comment has an update time and a content. The task can have 0 or more comments.
Each List has a name. The tasks can be moved to a list. The list can have 0 or more tasks.
Each task can have 0 or more subtasks. The subtask has the name and status of either todo or done.
Others:
The app will support filters such as the “Unscheduled work tasks”, “Important tasks in the next 2 weeks”, "Older than a month", "assigned to me" and so on, which demands queries contain a join of at least three tables, subquery, and complex search criterion.
The app will also have a reporting feature to analyze the number of finished tasks grouped by list, or month, which will demand queries using the clause of "GROUP BY", "HAVING" and “PARTITION BY ”.
